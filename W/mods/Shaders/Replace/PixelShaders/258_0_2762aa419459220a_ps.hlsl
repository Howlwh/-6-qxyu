// ---- FNV Hash 2762aa419459220a

// ---- Created with 3Dmigoto v1.3.16 on Mon Nov 20 02:47:58 2023
Texture2D<float4> t12 : register(t12);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

SamplerState s12_s : register(s12);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

cbuffer cb8 : register(b8)
{
  float4 cb8[5];
}

cbuffer cb9 : register(b9)
{
  float4 cb9[6];
}

cbuffer cb5 : register(b5)
{
  float4 cb5[2];
}

cbuffer cb2 : register(b2)
{
  float4 cb2[20];
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



// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : TEXCOORD0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  nointerpolation float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD5,
  nointerpolation float4 v5 : TEXCOORD6,
  float4 v6 : TEXCOORD7,
  float4 v7 : TEXCOORD8,
  float4 v8 : TEXCOORD9,
  float4 v9 : TEXCOORD10,
  float4 v10 : TEXCOORD11,
  float4 v11 : SV_Position0,
  float4 v12 : SV_ClipDistance0,
  float4 pos : POSITION0,
  out float4 o0 : SV_Target0,
  out float o1 : SV_Target1,
  out float o2 : SV_Target2,
  out float2 motionVectors : SV_Target4)
{

  float4 posCurr = mul(pos.xyzw, gWorldViewProjUnjittered);
  float4 posPrev = mul(pos.xyzw, gWorldViewProjUnjitteredPrev);
  posCurr.xy = posCurr.xy/posCurr.ww;
  posPrev.xy = posPrev.xy/posPrev.ww;
  motionVectors.xy = (posPrev.xy-posCurr.xy) * float2(0.5, -0.5);
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t5.Sample(s5_s, v1.xy).xyzw;
  r1.xyzw = t5.Sample(s5_s, v1.zw).xyzw;
  r2.x = r1.w + r0.w;
  r2.x = cmp(r2.x < 0.00499999989);
  if (r2.x != 0) discard;
  r0.xyz = r0.xyz * r0.xyz;
  r1.xyz = r1.xyz * r1.xyz;
  r1.xyzw = r1.xyzw + -r0.xyzw;
  r0.xyzw = v3.xxxx * r1.xyzw + r0.xyzw;
  r1.xyz = v9.xyz * v7.zzz + v0.xyz;
  r2.xy = cb5[1].xy * v11.xy;
  r3.xyzw = t12.Sample(s12_s, r2.xy).xyzw;
  r1.w = 1 + -r3.x;
  r2.zw = cmp(float2(0,0) != cb9[5].zw);
  r3.x = 1 + -r1.w;
  r1.w = r2.z ? r3.x : r1.w;
  r1.w = 1 + -r1.w;
  r1.w = r1.w * cb5[0].z + cb5[0].w;
  r1.w = 1 / r1.w;
  r1.w = -v7.w + r1.w;
  r1.w = r1.w * r1.w + -v7.x;
  r2.z = saturate(v5.x * r1.w);
  r2.z = v0.w * r2.z;
  r1.w = -cb8[4].w + r1.w;
  r1.w = saturate(v5.x * r1.w);
  r3.x = 1 + -r1.w;
  r3.y = 1 + -cb8[4].z;
  r1.w = r3.x * r3.y + r1.w;
  r1.xyz = r1.xyz * r1.www;
  r3.x = saturate(20 * v12.x);
  r2.w = r2.w ? r3.x : 1;
  r1.w = r2.z * r2.w;
  r1.xyzw = r1.xyzw * r0.xyzw;
  r0.xyz = v5.yzw * r0.xyz;
  r0.w = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.w = saturate(-0.0500000007 + r0.w);
  r0.w = v3.y * r0.w;
  r0.xyz = r0.xyz * r0.www + r1.xyz;
  r0.w = cmp(0 < cb2[19].y);
  if (r0.w != 0) {
    r2.xyzw = t4.Sample(s4_s, r2.xy).xyzw;
    r0.w = -1 + r2.x;
    r0.w = saturate(cb2[19].y * r0.w + 1);
    r0.w = v4.w * r0.w;
  } else {
    r0.w = v4.w;
  }
  r1.w = saturate(r1.w);
  r1.xyz = v4.xyz + -r0.xyz;
  r0.xyz = r0.www * r1.xyz + r0.xyz;
  o0.xyz = cb2[14].zzz * r0.xyz;
  r0.x = cb2[19].x * r1.w;
  o0.w = r1.w;
  r0.y = v7.w;
  o1.x = r0.y;
  o2.x = r0.x;
  return;
}