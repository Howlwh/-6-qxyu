// ---- FNV Hash 2294d33e148c1079

// ---- Created with 3Dmigoto v1.3.16 on Mon Nov 13 01:20:59 2023

cbuffer rage_matrices : register(b1)
{
  row_major float4x4 gWorld : packoffset(c0);
  row_major float4x4 gWorldView : packoffset(c4);
  row_major float4x4 gWorldViewProj : packoffset(c8);
  row_major float4x4 gViewInverse : packoffset(c12);
  row_major float4x4 gWorldViewProjUnjittered : packoffset(c16);
  row_major float4x4 gWorldViewProjUnjitteredPrev : packoffset(c20);
}

SamplerState gDeferredLightSampler0P_s : register(s2);
SamplerState PointSampler2_s : register(s6);
Texture2D<float4> gDeferredLightSampler0P : register(t2);
Texture2D<float4> PointSampler2 : register(t6);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  float4 pos : POSITION0,
  out float4 o0 : SV_Target0,
  out float2 motionVectors : SV_Target4)
{

  float4 posCurr = mul(pos.xyzw, gWorldViewProjUnjittered);
  float4 posPrev = mul(pos.xyzw, gWorldViewProjUnjitteredPrev);
  posCurr.xy = posCurr.xy/posCurr.ww;
  posPrev.xy = posPrev.xy/posPrev.ww;
  motionVectors.xy = (posPrev.xy-posCurr.xy) * float2(0.5, -0.5);
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = gDeferredLightSampler0P.Sample(gDeferredLightSampler0P_s, v1.xy).xyzw;
  o0.x = r0.x;
  r0.xyzw = PointSampler2.Sample(PointSampler2_s, v1.xy).xyzw;
  o0.y = r0.x;
  o0.zw = float2(0,0);
  return;
}