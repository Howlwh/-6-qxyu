// ---- FNV Hash 1d8459e79d55b3d3

// ---- Created with 3Dmigoto v1.3.16 on Mon Nov 13 01:20:59 2023

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

cbuffer rage_SoftParticleBuffer : register(b5)
{
  float4 NearFarPlane : packoffset(c0);
  float4 gInvScreenSize : packoffset(c1);
}

cbuffer ptfx_common_locals : register(b10)
{
  float4 deferredLightScreenSize : packoffset(c0);
  float4 deferredProjectionParams : packoffset(c1);
  float3 deferredPerspectiveShearParams0 : packoffset(c2);
  float3 deferredPerspectiveShearParams1 : packoffset(c3);
  float3 deferredPerspectiveShearParams2 : packoffset(c4);
  float4 postProcess_FlipDepth_NearPlaneFade_Params : packoffset(c5);
  float4 waterfogPtfxParams : packoffset(c6);
  float4 activeShadowCascades : packoffset(c7);
  float4 numActiveShadowCascades : packoffset(c8);
}

cbuffer ptxgpu_render_locals : register(b8)
{
  float gLightIntensityMult : packoffset(c0);
  float4 gTextureRowsColsStartEnd : packoffset(c1);
  float4 gTextureAnimRateScaleOverLifeStart2End2 : packoffset(c2);
  float4 gSizeMinRange : packoffset(c3);
  float4 gColour : packoffset(c4);
  float2 gFadeInOut : packoffset(c5);
  float2 gRotSpeedMinRange : packoffset(c5.z);
  float3 gDirectionalZOffsetMinRange : packoffset(c6);
  float2 gFadeNearFar : packoffset(c7);
  float3 gFadeZBaseLoHi : packoffset(c8);
  float3 gDirectionalVelocityAdd : packoffset(c9);
  float gEdgeSoftness : packoffset(c9.w);
  float gMaxLife : packoffset(c10);
  float3 gRefParticlePos : packoffset(c10.y);
  float gParticleColorPercentage : packoffset(c11);
  float gBackgroundDistortionVisibilityPercentage : packoffset(c11.y);
  float gBackgroundDistortionAlphaBooster : packoffset(c11.z);
  float gBackgroundDistortionAmount : packoffset(c11.w);
  float gDirectionalLightShadowAmount : packoffset(c12);
  float gLocalLightsMultiplier : packoffset(c12.y);
  float4 gCamAngleLimits : packoffset(c13);
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

SamplerState DiffuseSampler_s : register(s7);
SamplerState DepthMapTexSampler_s : register(s12);
Texture2D<float4> DiffuseSampler : register(t7);
Texture2D<float4> DepthMapTexSampler : register(t12);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  nointerpolation float4 v3 : TEXCOORD4,
  float4 v4 : TEXCOORD5,
  nointerpolation float2 v5 : TEXCOORD6,
  float4 v6 : SV_Position0,
  float4 v7 : SV_ClipDistance0,
  float4 pos : POSITION0,
  out float4 o0 : SV_Target0,
  out float2 motionVectors : SV_Target4)
{

  float4 posCurr = mul(pos.xyzw, gWorldViewProjUnjittered);
  float4 posPrev = mul(pos.xyzw, gWorldViewProjUnjitteredPrev);
  posCurr.xy = posCurr.xy/posCurr.ww;
  posPrev.xy = posPrev.xy/posPrev.ww;
  motionVectors.xy = (posPrev.xy-posCurr.xy) * float2(0.5, -0.5);
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = gInvScreenSize.xy * v6.xy;
  r0.xyzw = DepthMapTexSampler.Sample(DepthMapTexSampler_s, r0.xy).xyzw;
  r0.x = 1 + -r0.x;
  r0.y = 1 + -r0.x;
  r0.z = cmp(0 != postProcess_FlipDepth_NearPlaneFade_Params.z);
  r0.x = r0.z ? r0.y : r0.x;
  r0.x = 1 + -r0.x;
  r0.x = r0.x * NearFarPlane.z + NearFarPlane.w;
  r0.x = 1 / r0.x;
  r0.x = -v4.w + r0.x;
  r0.x = r0.x * r0.x;
  r0.x = saturate(gEdgeSoftness * r0.x);
  r1.xyzw = DiffuseSampler.Sample(DiffuseSampler_s, v1.zw).xyzw;
  r2.xyzw = DiffuseSampler.Sample(DiffuseSampler_s, v2.xy).xyzw;
  r0.y = -r2.w + r1.w;
  r0.y = v2.z * r0.y + r2.w;
  r0.y = v5.y * r0.y;
  r1.xyzw = DiffuseSampler.Sample(DiffuseSampler_s, v1.xy).xyzw;
  r2.xyzw = DiffuseSampler.Sample(DiffuseSampler_s, v0.xy).xyzw;
  r0.z = -r2.w + r1.w;
  r0.z = v0.z * r0.z + r2.w;
  r0.y = r0.z * v5.x + r0.y;
  r0.y = v3.w * r0.y;
  o0.w = r0.y * r0.x;
  r0.xyz = v4.xyz * v3.xyz;
  o0.xyz = globalScalars3.zzz * r0.xyz;
  return;
}