// ---- FNV Hash 85aab2e403ff0423

// ---- Created with 3Dmigoto v1.3.16 on Sat Nov  4 12:47:49 2023

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



// 3Dmigoto declarations
#define cmp -


void main(
  float3 v0 : POSITION0,
  float4 v1 : BLENDWEIGHT0,
  float4 v2 : BLENDINDICES0,
  float2 v3 : TEXCOORD0,
  float3 v4 : NORMAL0,
  float4 v5 : COLOR0,
  uint v6 : SV_InstanceID0,
  out float4 o0 : SV_Position0,
  out float4 o1 : COLOR0,
  out float4 o2 : TEXCOORD0,
  out float3 o3 : TEXCOORD1,
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
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 0.200000003 * gWorld._m30;
  r0.y = cmp(r0.x >= -r0.x);
  r0.x = frac(abs(r0.x));
  r0.x = r0.y ? r0.x : -r0.x;
  r0.x = 5 * r0.x;
  r0.x = globalScalars2.x * 2.5 + r0.x;
  r0.x = sin(r0.x);
  r0.x = cmp(0.300000012 < abs(r0.x));
  r0.y = cmp(globalScalars2.y < 0.00600000005);
  r0.x = r0.y ? r0.x : -1;
  r0.y = cmp(0 >= globalScalars2.y);
  r0.x = r0.y ? 0 : r0.x;
  r0.y = r0.y ? 0 : 1;
  r1.xyzw = float4(255.001953,255.001953,255.001953,255.001953) * v2.xyzw;
  r1.xyzw = (int4)r1.xyzw;
  r1.xyzw = (int4)r1.xyzw * int4(3,3,3,3);
  r2.xyzw = gBoneMtx[r1.y/3]._m10_m11_m12_m13 * v1.yyyy;
  r2.xyzw = gBoneMtx[r1.x/3]._m10_m11_m12_m13 * v1.xxxx + r2.xyzw;
  r2.xyzw = gBoneMtx[r1.z/3]._m10_m11_m12_m13 * v1.zzzz + r2.xyzw;
  r2.xyzw = gBoneMtx[r1.w/3]._m10_m11_m12_m13 * v1.wwww + r2.xyzw;
  r3.xyz = v0.xyz;
  r3.w = 1;
  r0.z = dot(r2.xyzw, r3.xyzw);
  r0.w = dot(r2.xyz, v4.xyz);
  r2.xyz = gWorld._m10_m11_m12 * r0.www;
  float3 temp;
  temp.y = r0.z;
  r4.xyzw = gWorldViewProj._m10_m11_m12_m13 * r0.zzzz;
  r5.xyz = gWorld._m10_m11_m12 * r0.zzz;
  r6.xyzw = gBoneMtx[r1.y/3]._m00_m01_m02_m03 * v1.yyyy;
  r6.xyzw = gBoneMtx[r1.x/3]._m00_m01_m02_m03 * v1.xxxx + r6.xyzw;
  r6.xyzw = gBoneMtx[r1.z/3]._m00_m01_m02_m03 * v1.zzzz + r6.xyzw;
  r6.xyzw = gBoneMtx[r1.w/3]._m00_m01_m02_m03 * v1.wwww + r6.xyzw;
  r0.z = dot(r6.xyzw, r3.xyzw);
  r0.w = dot(r6.xyz, v4.xyz);
  r2.xyz = r0.www * gWorld._m00_m01_m02 + r2.xyz;
  temp.x = r0.z;
  r4.xyzw = r0.zzzz * gWorldViewProj._m00_m01_m02_m03 + r4.xyzw;
  r5.xyz = r0.zzz * gWorld._m00_m01_m02 + r5.xyz;
  r6.xyzw = gBoneMtx[r1.y/3]._m20_m21_m22_m23 * v1.yyyy;
  r6.xyzw = gBoneMtx[r1.x/3]._m20_m21_m22_m23 * v1.xxxx + r6.xyzw;
  r6.xyzw = gBoneMtx[r1.z/3]._m20_m21_m22_m23 * v1.zzzz + r6.xyzw;
  r1.xyzw = gBoneMtx[r1.w/3]._m20_m21_m22_m23 * v1.wwww + r6.xyzw;
  r0.z = dot(r1.xyzw, r3.xyzw);
  r0.w = dot(r1.xyz, v4.xyz);
  o3.xyz = r0.www * gWorld._m20_m21_m22 + r2.xyz;
  temp.z = r0.z;
  r1.xyzw = r0.zzzz * gWorldViewProj._m20_m21_m22_m23 + r4.xyzw;
  r2.xyz = r0.zzz * gWorld._m20_m21_m22 + r5.xyz;
  r2.xyz = gWorld._m30_m31_m32 + r2.xyz;
  r2.xyz = gViewInverse._m30_m31_m32 + -r2.xyz;
  r0.z = dot(r2.xyz, r2.xyz);
  r0.z = 3.99999999e-06 * r0.z;
  r2.x = min(1, r0.z);
  r1.xyzw = gWorldViewProj._m30_m31_m32_m33 + r1.xyzw;
  r0.z = r0.y * r1.z + 9.99999975e-06;
  r1.xyw = r1.xyw * r0.yyy;
  r1.z = r0.y * r0.z;
  pos.xyzw = float4(temp.xyz, 1);
  o0.xyzw = (int4)r0.xxxx & (int4)r1.xyzw;
  r2.y = 1 + -r2.x;
  r0.xy = saturate(-globalScalars2.zz + r2.xy);
  r0.z = -1 + gDirectionalAmbientColour.w;
  r0.xy = r0.xy * r0.zz + float2(1,1);
  o1.xy = saturate(v5.xy * r0.xy);
  o1.zw = v5.zw;
  o2.xy = v3.xy;
  return;
}