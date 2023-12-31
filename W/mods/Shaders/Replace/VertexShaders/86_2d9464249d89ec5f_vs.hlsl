// ---- FNV Hash 2d9464249d89ec5f

// ---- Created with 3Dmigoto v1.3.16 on Sat Nov  4 12:47:49 2023

cbuffer rage_matrices : register(b1)
{
  row_major float4x4 gWorld : packoffset(c0);
  row_major float4x4 gWorldView : packoffset(c4);
  row_major float4x4 gWorldViewProj : packoffset(c8);
  row_major float4x4 gViewInverse : packoffset(c12);
  row_major float4x4 gWorldViewProjUnjittered : packoffset(c16);
  row_major float4x4 gWorldViewProjUnjitteredPrev : packoffset(c20);
}

cbuffer grassglobals : register(b4)
{
  bool bVehColl0Enabled : packoffset(c0);
  bool bVehColl1Enabled : packoffset(c0.y);
  bool bVehColl2Enabled : packoffset(c0.z);
  bool bVehColl3Enabled : packoffset(c0.w);
  float4 depthValueBias : packoffset(c1);
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

cbuffer grassinstances : register(b5)
{
  float4 instanceData[1280] : packoffset(c0);
}



// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : POSITION0,
  float3 v1 : NORMAL0,
  float4 v2 : COLOR0,
  float4 v3 : COLOR1,
  float2 v4 : TEXCOORD0,
  uint v5 : SV_InstanceID0,
  out float4 o0 : SV_Position0,
  out float4 o1 : TEXCOORD0,
  out float4 o2 : TEXCOORD1,
  out float4 o3 : TEXCOORD2,
  out float4 o4 : TEXCOORD3,
  out float4 o5 : TEXCOORD5,
  out float4 pos : POSITION0)
{

  pos.xyzw = float4(v0.xyz, 1);
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v0.xyz
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v1.xyz
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v2.xyz
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v3.xz
// Needs manual fix for instruction:
// unknown dcl_: dcl_input v4.xy
// Needs manual fix for instruction:
// unknown dcl_: dcl_input_sgv v5.x, instance_id
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = -0.25 + _vecVehColl0R.w;
  r1.w = 1;
  r0.y = 6.28318501 * v2.y;
  r2.xyzw = mad((int4)v5.xxxx, int4(5,5,5,5), int4(1,2,3,4));
  r0.yzw = fadeAlphaDistUmTimer.zzz * instanceData[r2.w].zzw + r0.yyy;
  r0.yzw = sin(r0.yzw);
  r3.x = 1 + -v2.z;
  r3.z = instanceData[r2.w].y * r3.x;
  r3.xy = instanceData[r2.w].xx * v2.xx;
  r1.xyz = r0.yzw * r3.xyz + v0.xyz;
  r0.y = (int)v5.x * 5;
  r3.x = instanceData[r0.y].x;
  r3.y = instanceData[r2.x].x;
  r3.z = instanceData[r2.y].x;
  r3.w = instanceData[r2.z].x;
  r3.x = dot(r1.xyzw, r3.xyzw);
  r4.x = instanceData[r0.y].y;
  r4.y = instanceData[r2.x].y;
  r4.z = instanceData[r2.y].y;
  r4.w = instanceData[r2.z].y;
  r3.y = dot(r1.xyzw, r4.xyzw);
  r4.x = instanceData[r0.y].z;
  r4.y = instanceData[r2.x].z;
  r4.z = instanceData[r2.y].z;
  r4.w = instanceData[r2.z].z;
  r3.z = dot(r1.xyzw, r4.xyzw);
  r1.xyz = -vecPlayerPos.xyz + r3.xyz;
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = instanceData[r2.y].w + -r0.z;
  r0.z = saturate(instanceData[r2.z].w * r0.z);
  r0.z = 0.5 * r0.z;
  r0.zw = r0.zz * r1.xy;
  r1.xy = r0.zw * v3.zz + r3.xy;
  o3.xyz = r3.xyz;
  r0.zw = -_vecVehColl0B.xy + r1.xy;
  r0.z = dot(_vecVehColl0M.xy, r0.zw);
  r0.z = saturate(_vecVehColl0M.w * r0.z);
  r0.zw = r0.zz * _vecVehColl0M.xy + _vecVehColl0B.xy;
  r0.zw = r1.xy + -r0.zw;
  r1.w = dot(r0.zw, r0.zw);
  r2.z = _vecVehColl0R.y + -r1.w;
  r2.z = saturate(_vecVehColl0R.z * r2.z);
  r2.w = _vecVehColl0R.w + -r3.z;
  r2.w = r2.z * r2.w + r3.z;
  r2.z = _vecVehColl0R.x * r2.z;
  r3.x = 0.5 * _vecVehColl0R.x;
  r3.x = r3.x * r3.x;
  r3.x = cmp(r1.w < r3.x);
  r1.w = rsqrt(r1.w);
  r0.zw = r1.ww * r0.zw;
  r0.zw = r2.zz * r0.zw;
  r4.xy = r0.zw * v3.zz + r1.xy;
  r4.z = r3.x ? r0.x : r2.w;
  r0.x = -_vecVehColl0R.w + r3.z;
  r1.z = r3.z;
  r0.x = cmp(2 >= abs(r0.x));
  r0.xzw = r0.xxx ? r4.xyz : r1.xyz;
  r0.xzw = bVehColl0Enabled ? r0.xzw : r1.xyz;
  r1.x = _vecVehColl1R.w + -r0.w;
  r1.yz = -_vecVehColl1B.xy + r0.xz;
  r1.y = dot(_vecVehColl1M.xy, r1.yz);
  r1.y = saturate(_vecVehColl1M.w * r1.y);
  r1.yz = r1.yy * _vecVehColl1M.xy + _vecVehColl1B.xy;
  r1.yz = -r1.yz + r0.xz;
  r1.w = dot(r1.yz, r1.yz);
  r2.z = _vecVehColl1R.y + -r1.w;
  r2.z = saturate(_vecVehColl1R.z * r2.z);
  r1.x = r2.z * r1.x + r0.w;
  r2.z = _vecVehColl1R.x * r2.z;
  r2.w = 0.5 * _vecVehColl1R.x;
  r2.w = r2.w * r2.w;
  r2.w = cmp(r1.w < r2.w);
  r1.w = rsqrt(r1.w);
  r1.yz = r1.yz * r1.ww;
  r1.yz = r2.zz * r1.yz;
  r3.xy = r1.yz * v3.zz + r0.xz;
  r1.y = -0.25 + _vecVehColl1R.w;
  r3.z = r2.w ? r1.y : r1.x;
  r1.x = -_vecVehColl1R.w + r0.w;
  r1.x = cmp(2 >= abs(r1.x));
  r1.xyz = r1.xxx ? r3.xyz : r0.xzw;
  r0.xzw = bVehColl1Enabled ? r1.xyz : r0.xzw;
  r1.x = _vecVehColl2R.w + -r0.w;
  r1.yz = -_vecVehColl2B.xy + r0.xz;
  r1.y = dot(_vecVehColl2M.xy, r1.yz);
  r1.y = saturate(_vecVehColl2M.w * r1.y);
  r1.yz = r1.yy * _vecVehColl2M.xy + _vecVehColl2B.xy;
  r1.yz = -r1.yz + r0.xz;
  r1.w = dot(r1.yz, r1.yz);
  r2.z = _vecVehColl2R.y + -r1.w;
  r2.z = saturate(_vecVehColl2R.z * r2.z);
  r1.x = r2.z * r1.x + r0.w;
  r2.z = _vecVehColl2R.x * r2.z;
  r2.w = 0.5 * _vecVehColl2R.x;
  r2.w = r2.w * r2.w;
  r2.w = cmp(r1.w < r2.w);
  r1.w = rsqrt(r1.w);
  r1.yz = r1.yz * r1.ww;
  r1.yz = r2.zz * r1.yz;
  r3.xy = r1.yz * v3.zz + r0.xz;
  r1.y = -0.25 + _vecVehColl2R.w;
  r3.z = r2.w ? r1.y : r1.x;
  r1.x = -_vecVehColl2R.w + r0.w;
  r1.x = cmp(2 >= abs(r1.x));
  r1.xyz = r1.xxx ? r3.xyz : r0.xzw;
  r0.xzw = bVehColl2Enabled ? r1.xyz : r0.xzw;
  r1.x = _vecVehColl3R.w + -r0.w;
  r1.yz = -_vecVehColl3B.xy + r0.xz;
  r1.y = dot(_vecVehColl3M.xy, r1.yz);
  r1.y = saturate(_vecVehColl3M.w * r1.y);
  r1.yz = r1.yy * _vecVehColl3M.xy + _vecVehColl3B.xy;
  r1.yz = -r1.yz + r0.xz;
  r1.w = dot(r1.yz, r1.yz);
  r2.z = _vecVehColl3R.y + -r1.w;
  r2.z = saturate(_vecVehColl3R.z * r2.z);
  r1.x = r2.z * r1.x + r0.w;
  r2.z = _vecVehColl3R.x * r2.z;
  r2.w = 0.5 * _vecVehColl3R.x;
  r2.w = r2.w * r2.w;
  r2.w = cmp(r1.w < r2.w);
  r1.w = rsqrt(r1.w);
  r1.yz = r1.yz * r1.ww;
  r1.yz = r2.zz * r1.yz;
  r3.xy = r1.yz * v3.zz + r0.xz;
  r1.y = -0.25 + _vecVehColl3R.w;
  r3.z = r2.w ? r1.y : r1.x;
  r1.x = -_vecVehColl3R.w + r0.w;
  r1.x = cmp(2 >= abs(r1.x));
  r1.xyz = r1.xxx ? r3.xyz : r0.xzw;
  r0.xzw = bVehColl3Enabled ? r1.xyz : r0.xzw;
  r1.xyzw = gWorldViewProj._m10_m11_m12_m13 * r0.zzzz;
  r1.xyzw = r0.xxxx * gWorldViewProj._m00_m01_m02_m03 + r1.xyzw;
  r1.xyzw = r0.wwww * gWorldViewProj._m20_m21_m22_m23 + r1.xyzw;
  r0.xz = -vecCameraPos.xy + r0.xz;
  r0.x = dot(r0.xz, r0.xz);
  r0.x = saturate(r0.x * fadeAlphaDistUmTimer.y + fadeAlphaDistUmTimer.x);
  o0.xyzw = gWorldViewProj._m30_m31_m32_m33 + r1.xyzw;
  r1.x = (uint)instanceData[r0.y].w >> 16;
  r1.y = (uint)instanceData[r0.y].w >> 8;
  r0.zw = (int2)r1.xy & int2(255,255);
  r1.xy = (uint2)r0.zw;
  r0.z = 255 & (int)instanceData[r0.y].w;
  r1.z = (uint)r0.z;
  r0.z = (uint)instanceData[r0.y].w >> 24;
  r1.w = (uint)r0.z;
  r1.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * r1.xyzw;
  o1.xyz = r1.xyz;
  r0.x = r1.w * r0.x;
  o1.w = gAlphaToCoverageScale * r0.x;
  r0.xzw = instanceData[r2.x].xyz * v1.yyy;
  r0.xyz = v1.xxx * instanceData[r0.y].xyz + r0.xzw;
  r0.xyz = v1.zzz * instanceData[r2.y].xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = rsqrt(r0.w);
  o2.xyz = r0.xyz * r0.www;
  o2.w = v4.x;
  o3.w = v4.y;
  r0.x = (uint)instanceData[r2.x].w >> 16;
  r0.y = (uint)instanceData[r2.x].w >> 8;
  r0.xy = (int2)r0.xy & int2(255,255);
  r0.xy = (uint2)r0.xy;
  r1.x = 255 & (int)instanceData[r2.x].w;
  r1.y = (uint)instanceData[r2.x].w >> 24;
  r0.zw = (uint2)r1.xy;
  r0.xyzw = float4(0.00392156886,0.00392156886,0.00392156886,0.00392156886) * r0.xyzw;
  o4.xyz = r0.xyz;
  o5.x = r0.w;
  o4.w = v3.x;
  o5.yzw = float3(0,0,0);
  return;
}