#version 330
#extension GL_ARB_separate_shader_objects : require

#ifdef GLINT
#include <minecraft:globals.glsl>
#endif
#include <minecraft:fog.glsl>
#include <minecraft:dynamictransforms.glsl>
#include <minecraft:oit.glsl>

uniform sampler2D Sampler0;

#ifdef DISSOLVE
uniform sampler2D DissolveMaskSampler;
#endif

#ifdef GLINT
uniform sampler2D GlintSampler;
#endif

layout(location = 0) in float sphericalVertexDistance;
layout(location = 1) in float cylindricalVertexDistance;
#ifdef PER_FACE_LIGHTING
layout(location = 2) in vec4 vertexPerFaceColorBack;
layout(location = 3) in vec4 vertexPerFaceColorFront;
#else
layout(location = 2) in vec4 vertexColor;
#endif

#ifndef EMISSIVE
layout(location = 4) in vec4 lightMapColor;
#endif

#ifndef NO_OVERLAY
layout(location = 5) in vec4 overlayColor;
#endif

layout(location = 6) in vec2 texCoord0;
#ifdef GLINT
layout(location = 7) in vec2 texCoordGlint;
#endif

#ifndef OIT_ALPHA_ONLY
layout(location = 0) out vec4 fragColor;
#endif

vec4 calculateFinalColor(vec4 color) {
    #ifndef NO_OVERLAY
    color.rgb = mix(overlayColor.rgb, color.rgb, overlayColor.a);
    #endif

    #ifndef EMISSIVE
    color *= lightMapColor;
    #endif

    #ifdef GLINT
    vec4 glintColor = GlintAlpha * texture(GlintSampler, texCoordGlint);
    // Matches BlendFuntion.GLINT
    color.rgb += glintColor.rgb * glintColor.rgb;
    #endif

    #ifdef OIT_ACCUMULATE
    color = sampleColorForAccumulation(color);
    vec4 fogColor = vec4(FogColor.rgb * color.a, FogColor.a);
    #else
    vec4 fogColor = FogColor;
    #endif

    return apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, fogColor);
}

#ifdef ALPHA_CUTOUT
#include <minecraft:projection.glsl>

#include <minecraft:globals.glsl>
layout(location=8) in vec3 awOriginal;
layout(location=9) in vec3 awProxy;
layout(location=10) flat in vec3 awNormal;
layout(location=11) flat in int awWing;

// Recover the native wing's animated axes from its unmodified UVs and positions.
vec4 traceAngelWing(vec2 uv, vec3 original, vec3 proxy, vec3 faceNormal, out vec3 hitEye) {
    vec2 st=(uv*vec2(64,32)-vec2(32,20))/vec2(8,12);
    vec2 a=dFdx(st), b=dFdy(st);
    vec3 ax=dFdx(original), ay=dFdy(original);
    float det=a.x*b.y-a.y*b.x;
    if(abs(det)<1e-14) discard;
    vec3 ex=(ax*b.y-ay*a.y)/det, ey=(ay*a.x-ax*b.x)/det;
    if(any(lessThan(st,vec2(0))) || any(greaterThan(st,vec2(1))) || abs(det)<1e-14) discard;
    int pose=(awWing-1)/2;
    float side=(awWing%2==1) ? 1.0 : -1.0;
    vec3 x=normalize(ex)*side, y=normalize(ey), z=normalize(faceNormal);
    float unit=length(ex)/10.0;
    vec3 base=original-ex*st.x-ey*st.y;
    bool traveling=(pose==2 || pose==3);
    vec3 root=base+ex*(.5+.38*side)+ey*(traveling?.36:.22)+z*unit*.65;
    float ticks=GameTime*24000.0;
    float tuck=pose==0 ? 24.0 : (pose==5 ? -8.0 : 4.0);
    float sweep=pose==0 ? 33.0 : (pose==5 ? 16.0 : 10.0);
    bool activeStroke=pose==1 || pose==4 || pose==2;
    float cycle=pose==2 ? mod(ticks,52.0)/20.0 : fract(ticks/(pose==4?12.0:32.0));
    float envelope=pose==2 ? (cycle<1.0 ? pow(sin(3.141593*cycle),2.0) : 0.0) : 1.0;
    float phase=6.2831853*cycle;
    float shoulder=sin(phase)*envelope;
    if(activeStroke) {tuck+=4.5*shoulder; sweep+=7.0*shoulder;}
    if(pose==6) { tuck=side>0.0?39.0:30.0; sweep=22.0; }
    float angle=radians(tuck), w=radians(sweep);
    vec3 outAxis=x*cos(angle)+y*sin(angle);
    vec3 spanX=-unit*(pose==5?23.0:20.5)*(outAxis*cos(w)+z*sin(w));
    vec3 spanY=unit*(pose==5?17.0:24.0)*(-x*sin(angle)+y*cos(angle));
    vec3 spanZ=unit*3.2*(z*cos(w)-outAxis*sin(w));
    vec3 origin=root-spanX*.95-spanY*.20-spanZ*.49;
    bool ortho=abs(ProjMat[3][3])>.5;
    vec3 ray=ortho ? vec3(0,0,-1) : normalize(proxy);
    vec3 eye=ortho ? proxy-ray*(length(proxy-origin)+length(spanY)*4.0) : vec3(0);
    // Continuous sections share a wrist and two outer feather joints. Intersect every
    // bent section, retaining the closest occupied voxel when sections overlap in view.
    int sections=(activeStroke && envelope>.0001) || pose==6 ? 4 : 1;
    float best=1e20;
    vec4 result=vec4(0);
    vec3 offset=vec3(0);
    for(int j=0;j<4;j++) {
        if(j>=sections) break;
        float lower=float(j)/float(sections), upper=float(j+1)/float(sections);
        float outer=1.0-lower;
        float lagged=sin(phase-1.25*outer);
        float recovery=.5+.5*cos(phase-0.8*outer);
        float power=pose==4 ? 1.18 : 1.0;
        vec3 farOffset=(y*(7.2*lagged)+z*(9.2*lagged+2.6*recovery)-x*3.8*recovery)*unit*outer*outer*power*envelope;
        if(pose==6) farOffset=(y*(side>0.0?11.0:8.0)+z*4.2)*unit*max(0.0,outer-.42);
        if(sections==1) farOffset=vec3(0);
        // Walk from tip to shoulder; evaluate the same deformation at both boundaries.
        float innerDist=1.0-upper;
        float innerWave=sin(phase-1.25*innerDist);
        float innerRecovery=.5+.5*cos(phase-.8*innerDist);
        vec3 nearOffset=(y*(7.2*innerWave)+z*(9.2*innerWave+2.6*innerRecovery)-x*3.8*innerRecovery)*unit*innerDist*innerDist*power*envelope;
        if(pose==6) nearOffset=(y*(side>0.0?11.0:8.0)+z*4.2)*unit*max(0.0,innerDist-.42);
        if(sections==1) nearOffset=vec3(0);
        offset=farOffset;
        vec3 slope=(nearOffset-farOffset)/(upper-lower);
    mat3 inverseBasis=inverse(mat3(spanX+slope,spanY,spanZ));
    vec3 ro=inverseBasis*(eye-origin-offset+slope*lower), rd=inverseBasis*ray;
    vec3 safe=vec3(rd.x<0?-1:1,rd.y<0?-1:1,rd.z<0?-1:1)*max(abs(rd),vec3(1e-8));
    vec3 lo=(vec3(lower,0,0)-ro)/safe, hi=(vec3(upper,1,1)-ro)/safe;
    vec3 entry=min(lo,hi), leave=max(lo,hi);
    float nearT=max(0.0,max(entry.x,max(entry.y,entry.z)));
    float farT=min(leave.x,min(leave.y,leave.z));
    if(farT<nearT || nearT>=best) continue;
    const ivec3 dims=ivec3(48,80,20);
    vec3 start=clamp((ro+rd*nearT)*vec3(dims),vec3(lower*48.0+.0001,.0001,.0001),vec3(upper*48.0,80,20)-.0001);
    ivec3 cell=ivec3(start), stride=ivec3(sign(safe));
    vec3 dt=1.0/(abs(safe)*vec3(dims));
    vec3 next=mix(fract(start),1.0-fract(start),step(vec3(0),safe))*dt;
    float t=0.0;
    for(int i=0;i<151;++i) {
        vec4 material=texelFetch(Sampler0,ivec2(cell.x+48*cell.z,384+cell.y),0);
        if(material.a>.5) { if(nearT+t<best){ best=nearT+t; result=material; } break; }
        if(next.x<next.y && next.x<next.z){t=next.x;cell.x+=stride.x;next.x+=dt.x;}
        else if(next.y<next.z){t=next.y;cell.y+=stride.y;next.y+=dt.y;}
        else {t=next.z;cell.z+=stride.z;next.z+=dt.z;}
        if(nearT+t>farT || nearT+t>=best || any(lessThan(cell,ivec3(0))) || any(greaterThanEqual(cell,dims))) break;
    }
    }
    if(result.a>.5){ hitEye=eye+ray*best;return result; }
    discard;
    return vec4(0);
}

#endif
void main() {
    vec4 color = texture(Sampler0, texCoord0);
    #ifdef ALPHA_CUTOUT
    gl_FragDepth=gl_FragCoord.z;
    if(awWing!=0) {
        vec3 hit;
        color=traceAngelWing(texCoord0,awOriginal,awProxy,awNormal,hit);
        vec4 clip=ProjMat*vec4(hit,1);
        float depth=clip.z/clip.w;
        #ifndef RENDERPEARL_DEPTH_IS_ZERO_TO_ONE
        depth=depth*.5+.5;
        #endif
        gl_FragDepth=clamp(depth,0.0,1.0);
    }
    #endif

    #ifdef OIT_ADDITIVE
    color.a = min(0.99, color.a);
    #endif

    #ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
    #endif

    #ifdef PER_FACE_LIGHTING
    vec4 faceVertexColor = gl_FrontFacing ? vertexPerFaceColorFront : vertexPerFaceColorBack;
    #else
    vec4 faceVertexColor = vertexColor;
    #endif

    #ifdef DISSOLVE
    if (faceVertexColor.a < texture(DissolveMaskSampler, texCoord0).a) {
        discard;
    }
    // The dissolve effect entirely replaces translucency
    faceVertexColor.a = 1.0;
    #endif

    color *= faceVertexColor * ColorModulator;

    #ifdef GLINT
    color.a = max(color.a, GlintAlpha);
    #endif

    #ifdef OIT_ALPHA_ONLY
    executeAlphaOnlyPhase(gl_FragCoord.z, color.a);
    #else
    fragColor = calculateFinalColor(color);
    #endif
}
