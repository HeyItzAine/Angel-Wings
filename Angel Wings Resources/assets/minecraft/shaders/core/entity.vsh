#version 330
#extension GL_ARB_separate_shader_objects : require

#if defined(PER_FACE_LIGHTING) || !defined(NO_CARDINAL_LIGHTING)
#include <minecraft:light.glsl>
#endif
#include <minecraft:fog.glsl>
#include <minecraft:dynamictransforms.glsl>
#include <minecraft:projection.glsl>
#include <minecraft:sample_lightmap.glsl>

layout(location = 0) in vec3 Position;
layout(location = 1) in vec4 Color;
layout(location = 2) in vec2 UV0;
layout(location = 3) in ivec2 UV1;
layout(location = 4) in ivec2 UV2;
layout(location = 5) in vec3 Normal;

#if !defined(NO_OVERLAY) && !defined(OIT_ALPHA_ONLY)
uniform sampler2D Sampler1;
#endif

#if !defined(EMISSIVE) && !defined(OIT_ALPHA_ONLY)
uniform sampler2D Sampler2;
#endif

layout(location = 0) out float sphericalVertexDistance;
layout(location = 1) out float cylindricalVertexDistance;

#ifdef PER_FACE_LIGHTING
layout(location = 2) out vec4 vertexPerFaceColorBack;
layout(location = 3) out vec4 vertexPerFaceColorFront;
#else
layout(location = 2) out vec4 vertexColor;
#endif

#ifndef EMISSIVE
layout(location = 4) out vec4 lightMapColor;
#endif

#ifndef NO_OVERLAY
layout(location = 5) out vec4 overlayColor;
#endif

layout(location = 6) out vec2 texCoord0;
#ifdef GLINT
layout(location = 7) out vec2 texCoordGlint;
#endif


#ifdef ALPHA_CUTOUT
uniform sampler2D Sampler0;
layout(location=8) out vec3 awOriginal;
layout(location=9) out vec3 awProxy;
layout(location=10) flat out vec3 awNormal;
layout(location=11) flat out int awWing;
#endif

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);


    #ifdef ALPHA_CUTOUT
    awWing=0;
    awOriginal=(ModelViewMat*vec4(Position,1.0)).xyz;
    awProxy=awOriginal;
    awNormal=normalize(mat3(ModelViewMat)*Normal);
    if(all(equal(textureSize(Sampler0,0),ivec2(1024,512)))) {
        vec3 signature=texelFetch(Sampler0,ivec2(0),0).rgb;
        int id=int(round(signature.b*255.0))-160;
        if (all(lessThan(abs(signature.rg-vec2(63,177)/255.0),vec2(.001))) && id>=1 && id<=14) {
            awWing=id;
            vec2 face=(UV0*vec2(64,32)-vec2(32,20))/vec2(8,12);
            // Size in camera space; the regular player renderer uses blocks here.
            float cover=3.2;
            if(abs(ProjMat[3][3])>.5) cover=max(cover,0.20/max(abs(ProjMat[0][0]),0.0001));
            awProxy.xy+=vec2(face.x-.5,.5-face.y)*2.0*cover;
            gl_Position=ProjMat*vec4(awProxy,1.0);
        }
    }
    #endif

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);

#ifdef PER_FACE_LIGHTING
    vec2 light = minecraft_compute_light(Light0_Direction, Light1_Direction, Normal);
    vertexPerFaceColorBack = minecraft_mix_light_separate(-light, Color);
    vertexPerFaceColorFront = minecraft_mix_light_separate(light, Color);
#elif defined(NO_CARDINAL_LIGHTING)
    vertexColor = Color;
#else
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color);
#endif

#if !defined(EMISSIVE) && !defined(OIT_ALPHA_ONLY)
    lightMapColor = sample_lightmap(Sampler2, UV2);
#endif

#if !defined(NO_OVERLAY) && !defined(OIT_ALPHA_ONLY)
    overlayColor = texelFetch(Sampler1, UV1, 0);
#endif

    texCoord0 = UV0;

#ifdef APPLY_TEXTURE_MATRIX
    texCoord0 = (TextureMat * vec4(UV0, 0.0, 1.0)).xy;
#endif

#ifdef GLINT
    texCoordGlint = (TextureMat * vec4(UV0, 0.0, 1.0)).xy;
#endif
}
