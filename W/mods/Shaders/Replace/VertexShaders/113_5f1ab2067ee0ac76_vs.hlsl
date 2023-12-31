// ---- FNV Hash 5f1ab2067ee0ac76

// ---- Created with 3Dmigoto v1.3.16 on Sat Nov  4 21:49:46 2023

cbuffer rage_bonemtx : register(b4)
{
  row_major float3x4 gBoneMtx[255] : packoffset(c0);
}

cbuffer rage_matrices : register(b1)
{
  row_major float4x4 gWorld : packoffset(c0);
  row_major float4x4 gWorldView : packoffset(c4);
  row_major float4x4 gWorldViewProj : packoffset(c8);
  row_major float4x4 gViewInverse : packoffset(c12);
  row_major float4x4 gWorldViewProjUnjittered : packoffset(c16);
  row_major float4x4 gWorldViewProjUnjitteredPrev : packoffset(c20);
}

cbuffer misc_globals : register(b2)
{
  float4 globalFade : packoffset(c0);
  float globalHeightScale : packoffset(c1);
  float globalShaderQuality : packoffset(c1.y);
  float globalReuseMe00001 : packoffset(c1.z);
  float globalReuseMe00002 : packoffset(c1.w);
  float4 POMFlags : packoffset(c2);
  float4 g_Rage_Tessellation_CameraPosition : packoffset(c3);
  float4 g_Rage_Tessellation_CameraZAxis : packoffset(c4);
  float4 g_Rage_Tessellation_ScreenSpaceErrorParams : packoffset(c5);
  float4 g_Rage_Tessellation_LinearScale : packoffset(c6);
  float4 g_Rage_Tessellation_Frustum[4] : packoffset(c7);
  float4 g_Rage_Tessellation_Epsilons : packoffset(c11);
  float4 globalScalars : packoffset(c12);
  float4 globalScalars2 : packoffset(c13);
  float4 globalScalars3 : packoffset(c14);
  float4 globalScreenSize : packoffset(c15);
  uint4 gTargetAAParams : packoffset(c16);
  float4 colorize : packoffset(c17);
  float4 gGlobalParticleShadowBias : packoffset(c18);
  float gGlobalParticleDofAlphaScale : packoffset(c19);
  float gGlobalFogIntensity : packoffset(c19.y);
  float4 gPlayerLFootPos : packoffset(c20);
  float4 gPlayerRFootPos : packoffset(c21);
}

cbuffer lighting_globals : register(b3)
{
  float4 gDirectionalLight : packoffset(c0);
  float4 gDirectionalColour : packoffset(c1);
  int gNumForwardLights : packoffset(c2);
  float4 gLightPositionAndInvDistSqr[8] : packoffset(c3);
  float4 gLightDirectionAndFalloffExponent[8] : packoffset(c11);
  float4 gLightColourAndCapsuleExtent[8] : packoffset(c19);
  float gLightConeScale[8] : packoffset(c27);
  float gLightConeOffset[8] : packoffset(c35);
  float4 gLightNaturalAmbient0 : packoffset(c43);
  float4 gLightNaturalAmbient1 : packoffset(c44);
  float4 gLightArtificialIntAmbient0 : packoffset(c45);
  float4 gLightArtificialIntAmbient1 : packoffset(c46);
  float4 gLightArtificialExtAmbient0 : packoffset(c47);
  float4 gLightArtificialExtAmbient1 : packoffset(c48);
  float4 gDirectionalAmbientColour : packoffset(c49);
  float4 globalFogParams[5] : packoffset(c50);
  float4 globalFogColor : packoffset(c55);
  float4 globalFogColorE : packoffset(c56);
  float4 globalFogColorN : packoffset(c57);
  float4 globalFogColorMoon : packoffset(c58);
  float4 gReflectionTweaks : packoffset(c59);
}

cbuffer common_locals : register(b13)
{
  float4 umGlobalParams : packoffset(c0);
  float4 umGlobalOverrideParams : packoffset(c1);
}



// 3Dmigoto declarations
#define cmp -


void main(
  float3 v0 : POSITION0,
  float4 v1 : BLENDWEIGHT0,
  float4 v2 : BLENDINDICES0,
  float2 v3 : TEXCOORD0,
  float3 v4 : NORMAL0,
  float4 v5 : TANGENT0,
  float4 v6 : COLOR0,
  float4 v7 : COLOR1,
  uint v8 : SV_InstanceID0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD0,
  out float4 o3 : TEXCOORD1,
  out float4 o4 : TEXCOORD4,
  out float3 o5 : TEXCOORD5,
  out float4 pos : POSITION0)
{
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v0.xyz
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v1.xyzw
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v2.xyzw
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v3.xy
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v4.xyz
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v5.xyzw
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v6.xyzw
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v7.xyz
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 6.28318501 * v7.y;
  r0.yzw = umGlobalOverrideParams.zzw * umGlobalParams.zzw;
  r0.xyz = globalScalars2.xxx * r0.yzw + r0.xxx;
  r0.xyz = sin(r0.xyz);
  r1.xyz = umGlobalParams.xxy * v7.xxz;
  r1.xyz = umGlobalOverrideParams.xxy * r1.xyz;
  r2.xyzw = float4(255.001953,255.001953,255.001953,255.001953) * v2.xyzw;
  r2.xyzw = (int4)r2.xyzw;
  r2.xyzw = (int4)r2.xyzw * int4(3,3,3,3);
  r3.xyzw = gBoneMtx[r2.y/3]._m00_m01_m02_m03 * v1.yyyy;
  r3.xyzw = gBoneMtx[r2.x/3]._m00_m01_m02_m03 * v1.xxxx + r3.xyzw;
  r3.xyzw = gBoneMtx[r2.z/3]._m00_m01_m02_m03 * v1.zzzz + r3.xyzw;
  r3.xyzw = gBoneMtx[r2.w/3]._m00_m01_m02_m03 * v1.wwww + r3.xyzw;
  r4.xyz = v0.xyz;
  r4.w = 1;
  r5.x = dot(r3.xyzw, r4.xyzw);
  r6.xyzw = gBoneMtx[r2.y/3]._m10_m11_m12_m13 * v1.yyyy;
  r6.xyzw = gBoneMtx[r2.x/3]._m10_m11_m12_m13 * v1.xxxx + r6.xyzw;
  r6.xyzw = gBoneMtx[r2.z/3]._m10_m11_m12_m13 * v1.zzzz + r6.xyzw;
  r6.xyzw = gBoneMtx[r2.w/3]._m10_m11_m12_m13 * v1.wwww + r6.xyzw;
  r5.y = dot(r6.xyzw, r4.xyzw);
  r7.xyzw = gBoneMtx[r2.y/3]._m20_m21_m22_m23 * v1.yyyy;
  r7.xyzw = gBoneMtx[r2.x/3]._m20_m21_m22_m23 * v1.xxxx + r7.xyzw;
  r7.xyzw = gBoneMtx[r2.z/3]._m20_m21_m22_m23 * v1.zzzz + r7.xyzw;
  r2.xyzw = gBoneMtx[r2.w/3]._m20_m21_m22_m23 * v1.wwww + r7.xyzw;
  r5.z = dot(r2.xyzw, r4.xyzw);
  r0.xyz = r0.xyz * r1.xyz + r5.xyz;
  r1.xyz = gWorld._m10_m11_m12 * r5.yyy;
  r1.xyz = r5.xxx * gWorld._m00_m01_m02 + r1.xyz;
  r1.xyz = r5.zzz * gWorld._m20_m21_m22 + r1.xyz;
  r1.xyz = gWorld._m30_m31_m32 + r1.xyz;
  r1.xyz = gViewInverse._m30_m31_m32 + -r1.xyz;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = 3.99999999e-06 * r0.w;
  r1.x = min(1, r0.w);
  pos.xyzw = float4(r0.xyz, 1);
  r4.xyzw = gWorldViewProj._m10_m11_m12_m13 * r0.yyyy;
  r4.xyzw = r0.xxxx * gWorldViewProj._m00_m01_m02_m03 + r4.xyzw;
  r0.xyzw = r0.zzzz * gWorldViewProj._m20_m21_m22_m23 + r4.xyzw;
  o0.xyzw = gWorldViewProj._m30_m31_m32_m33 + r0.xyzw;
  r1.y = 1 + -r1.x;
  r0.xy = saturate(-globalScalars2.zz + r1.xy);
  r0.z = -1 + gDirectionalAmbientColour.w;
  r0.xy = r0.xy * r0.zz + float2(1,1);
  o1.xy = saturate(v6.xy * r0.xy);
  o1.zw = v6.zw;
  o2.xy = v3.xy;
  r0.x = dot(r6.xyz, v4.xyz);
  r0.y = dot(r6.xyz, v5.xyz);
  r0.yzw = gWorld._m10_m11_m12 * r0.yyy;
  r1.xyz = gWorld._m10_m11_m12 * r0.xxx;
  r0.x = dot(r3.xyz, v4.xyz);
  r1.w = dot(r3.xyz, v5.xyz);
  r0.yzw = r1.www * gWorld._m00_m01_m02 + r0.yzw;
  r1.xyz = r0.xxx * gWorld._m00_m01_m02 + r1.xyz;
  r0.x = dot(r2.xyz, v4.xyz);
  r1.w = dot(r2.xyz, v5.xyz);
  r0.yzw = r1.www * gWorld._m20_m21_m22 + r0.yzw;
  r1.xyz = r0.xxx * gWorld._m20_m21_m22 + r1.xyz;
  o3.xyz = r1.xyz;
  o4.xyz = r0.yzw;
  r2.xyz = r1.yzx * r0.wyz;
  r0.xyz = r0.zwy * r1.zxy + -r2.xyz;
  o5.xyz = v5.www * r0.xyz;
  return;
}