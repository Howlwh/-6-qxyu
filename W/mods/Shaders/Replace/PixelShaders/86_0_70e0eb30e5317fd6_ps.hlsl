// ---- FNV Hash 70e0eb30e5317fd6

// ---- Created with 3Dmigoto v1.3.16 on Sat Nov  4 12:47:21 2023

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

cbuffer grasslocals : register(b10)
{
  float3 vecCameraPos : packoffset(c0);
  float3 vecPlayerPos : packoffset(c1);
  float4 _dimensionLOD2 : packoffset(c2);
  float2 _vecCollParams : packoffset(c3);
  float4 _vecVehColl0B : packoffset(c4);
  float4 _vecVehColl0M : packoffset(c5);
  float4 _vecVehColl0R : packoffset(c6);
  float4 _vecVehColl1B : packoffset(c7);
  float4 _vecVehColl1M : packoffset(c8);
  float4 _vecVehColl1R : packoffset(c9);
  float4 _vecVehColl2B : packoffset(c10);
  float4 _vecVehColl2M : packoffset(c11);
  float4 _vecVehColl2R : packoffset(c12);
  float4 _vecVehColl3B : packoffset(c13);
  float4 _vecVehColl3M : packoffset(c14);
  float4 _vecVehColl3R : packoffset(c15);
  float4 fadeAlphaDistUmTimer : packoffset(c16);
  float4 fadeAlphaLOD1Dist : packoffset(c17);
  float4 fadeAlphaLOD2Dist : packoffset(c18);
  float4 fadeAlphaLOD2DistFar0 : packoffset(c19);
  float4 uMovementParams : packoffset(c20);
  float4 _fakedGrassNormal : packoffset(c21);
  float AlphaScale : packoffset(c22);
  float AlphaTest : packoffset(c22.y);
  float ShadowFalloff : packoffset(c22.z);
  float gAlphaToCoverageScale : packoffset(c22.w);
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

SamplerState TextureGrassSampler_s : register(s2);
Texture2D<float4> TextureGrassSampler : register(t2);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD5,
  float4 pos : POSITION0,
  out float4 o0 : SV_Target0,
  out float4 o1 : SV_Target1,
  out float4 o2 : SV_Target2,
  out float4 o3 : SV_Target3,
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

  r0.x = v2.w;
  r0.y = v3.w;
  r0.xyzw = TextureGrassSampler.Sample(TextureGrassSampler_s, r0.xy).xyzw;
  r0.w = v1.w * r0.w;
  r0.w = AlphaScale * r0.w;
  r0.w = gAlphaToCoverageScale * r0.w;
  r1.x = cmp(AlphaTest >= r0.w);
  if (r1.x != 0) discard;
  r1.x = dot(v2.xyz, v2.xyz);
  r1.x = rsqrt(r1.x);
  r1.xyz = v2.xyz * r1.xxx;
  r0.xyz = v1.xyz * r0.xyz;
  r2.xyz = r0.xyz * v4.xyz + -r0.xyz;
  o0.xyz = v4.www * r2.xyz + r0.xyz;
  o1.xyz = r1.xyz * float3(0.5,0.5,0.5) + float3(0.5,0.5,0.5);
  r0.x = gLightArtificialIntAmbient0.w + v5.x;
  r0.x = 0.5 * r0.x;
  r0.y = 0;
  o3.xy = sqrt(r0.xy);
  o0.w = r0.w;
  o1.w = 1;
  o2.xyzw = float4(0,0,0.980000019,1);
  o3.z = 0;
  o3.w = 0.496078432 * ShadowFalloff;
  return;
}