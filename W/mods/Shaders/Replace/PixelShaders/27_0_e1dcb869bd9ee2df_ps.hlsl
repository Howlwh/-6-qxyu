// ---- FNV Hash e1dcb869bd9ee2df

// ---- Created with 3Dmigoto v1.3.16 on Fri Nov 17 03:04:57 2023

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

cbuffer more_stuff : register(b5)
{
  float4 gEntitySelectColor[2] : packoffset(c0);
  float4 gAmbientOcclusionEffect : packoffset(c2);
  float4 gDynamicBakesAndWetness : packoffset(c3);
  float4 gAlphaRefVec0 : packoffset(c4);
  float4 gAlphaRefVec1 : packoffset(c5);
  float gAlphaTestRef : packoffset(c6);
  bool gTreesUseDiscard : packoffset(c6.y);
  float gReflectionMipCount : packoffset(c6.z);
  float gTransparencyAASamples : packoffset(c6.w);
  bool gUseFogRay : packoffset(c7);
}

cbuffer ped_common_shared_locals : register(b13)
{
  float4 matWetClothesData : packoffset(c0);
  float4 umPedGlobalOverrideParams : packoffset(c1);
  float4 envEffFatSweatScale : packoffset(c2);
  float paletteSelector : packoffset(c3);
  float2 StubbleGrowth : packoffset(c3.y);
  float4 _matMaterialColorScale[2] : packoffset(c4);
  float4 PedDamageColors[3] : packoffset(c6);
  float4 envEffColorModCpvAdd : packoffset(c9);
  float4 wrinkleMaskStrengths0 : packoffset(c10);
  float4 wrinkleMaskStrengths1 : packoffset(c11);
  float4 wrinkleMaskStrengths2 : packoffset(c12);
  float4 wrinkleMaskStrengths3 : packoffset(c13);
  float4 wrinkleMaskStrengths4 : packoffset(c14);
  float4 wrinkleMaskStrengths5 : packoffset(c15);
  float4 PedDamageData : packoffset(c16);
  float4 wetnessAdjust : packoffset(c17);
  float alphaToCoverageScale : packoffset(c18);
}

cbuffer ped_common_locals2 : register(b10)
{
  float2 anisotropicSpecularIntensity : packoffset(c0);
  float2 anisotropicSpecularExponent : packoffset(c0.z);
  float4 anisotropicSpecularColour : packoffset(c1);
  float4 specularNoiseMapUVScaleFactor : packoffset(c2);
  float bumpiness : packoffset(c3);
  float specularFresnel : packoffset(c3.y);
  float specularFalloffMult : packoffset(c3.z);
  float specularIntensityMult : packoffset(c3.w);
  float orderNumber : packoffset(c4);
}

cbuffer pedmisclocals : register(b8)
{
  float AnisotropicAlphaBias : packoffset(c0);
  float4 umGlobalParams : packoffset(c1);
}

SamplerState DiffuseSampler_s : register(s0);
SamplerState AnisoNoiseSpecSampler_s : register(s3);
SamplerState BumpSampler_s : register(s4);
SamplerState SpecSampler_s : register(s5);
Texture2D<float4> DiffuseSampler : register(t0);
Texture2D<float4> AnisoNoiseSpecSampler : register(t3);
Texture2D<float4> BumpSampler : register(t4);
Texture2D<float4> SpecSampler : register(t5);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD3,
  float4 v4 : TEXCOORD4,
  float4 v5 : TEXCOORD5,
  float4 v6 : TEXCOORD6,
  float3 v7 : TEXCOORD2,
  float4 pos : POSITION0,
  uint v8 : SV_IsFrontFace0,
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
  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = (uint2)v0.xy;
  bitmask.y = ((~(-1 << (uint)1)) << (uint)1) & 0xffffffff;  r0.y = (((uint)r0.y << (uint)1) & bitmask.y) | ((uint)0 & ~bitmask.y);
  bitmask.x = ((~(-1 << (uint)1)) << (uint)0) & 0xffffffff;  r0.x = (((uint)r0.x << (uint)0) & bitmask.x) | ((uint)r0.y & ~bitmask.x);
  r0.x = dot(globalFade.xyzw, icb[r0.x+0].xyzw);
  r0.x = cmp(r0.x < 1);
  if (r0.x != 0) discard;
  r0.xyzw = DiffuseSampler.Sample(DiffuseSampler_s, v1.xy).xyzw;
  r1.xy = specularNoiseMapUVScaleFactor.xy * v1.xy;
  r1.xy = float2(0.5,0.5) * r1.xy;
  r1.xy = AnisoNoiseSpecSampler.Sample(AnisoNoiseSpecSampler_s, r1.xy).xw;
  r1.y = saturate(r1.y * 2 + AnisotropicAlphaBias);
  r0.w = r1.y * r0.w;
  r0.w = globalScalars.x * r0.w;
  r1.y = dot(v0.xy, float2(0.5,0.5));
  r1.y = frac(r1.y);
  r1.y = cmp(r1.y < 0.5);
  r1.zw = cmp(float2(0.949999988,0.501960814) >= r0.ww);
  r1.y = r1.z ? r1.y : 0;
  r1.y = (int)r1.w | (int)r1.y;
  if (r1.y != 0) discard;
  r1.yz = BumpSampler.Sample(BumpSampler_s, v1.xy).xy;
  r1.yz = r1.yz * float2(2,2) + float2(-1,-1);
  r1.w = dot(r1.yz, r1.yz);
  r1.w = 1 + -r1.w;
  r1.w = sqrt(abs(r1.w));
  r2.x = max(0.00100000005, bumpiness);
  r1.yz = r2.xx * r1.yz;
  r2.xyz = v6.xyz * r1.zzz;
  r2.xyz = r1.yyy * v5.xyz + r2.xyz;
  r1.yzw = r1.www * v2.xyz + r2.xyz;
  r2.x = dot(r1.yzw, r1.yzw);
  r2.x = rsqrt(r2.x);
  r2.yzw = r2.xxx * r1.yzw;
  r3.xyz = SpecSampler.Sample(SpecSampler_s, v1.xy).xyz;
  r1.yz = r3.yx * r3.yx;
  r3.x = cmp(r3.z >= 0.8125);
  o1.w = saturate(v2.z * 128 + -127);
  r3.yw = globalScalars.zy * v3.xx;
  r4.x = r2.w * 0.5 + 0.5;
  r4.y = r4.x * gDynamicBakesAndWetness.y + gDynamicBakesAndWetness.x;
  r4.x = 0.300000012 + r4.x;
  r3.w = r4.x * r3.w;
  r4.xz = float2(0,-0.75) + v1.zz;
  r4.xz = saturate(float2(4,4) * r4.xz);
  r4.w = cmp((int)r3.x == 0);
  r5.xyz = wetnessAdjust.xxx * r0.xyz;
  r5.xyz = r5.xyz * r4.xxx;
  r5.xyz = r4.www ? r5.xyz : 0;
  r0.xyz = -r5.xyz + r0.xyz;
  r4.xz = wetnessAdjust.yz * r4.zz;
  r1.yz = r1.yz * float2(specularFalloffMult, specularIntensityMult) + r4.xz;
  r0.xyz = _matMaterialColorScale[0].xxx * r0.xyz;
  r4.x = r3.x ? 0.010000 : 0;
  r3.x = r3.x ? -0.00999999978 : -0;
  r1.z = r3.x + r1.z;
  r1.z = _matMaterialColorScale[0].z * r1.z + r4.x;
  r3.x = dot(v4.xyz, v4.xyz);
  r3.x = rsqrt(r3.x);
  r4.xzw = v4.xyz * r3.xxx;
  r3.x = saturate(dot(r4.xzw, r2.yzw));
  r3.x = 1 + -r3.x;
  r3.x = r3.x * 0.400000006 + 0.5;
  r1.w = r1.w * r2.x + 1;
  r1.w = saturate(r1.w * 0.5 + -0.300000012);
  r1.w = 1.42857146 * r1.w;
  r2.x = saturate(v7.x);
  r2.x = r3.x * r2.x;
  r1.w = r2.x * r1.w;
  r5.xyz = r1.www * r0.xyz;
  r0.xyz = r5.xyz * _matMaterialColorScale[0].yyy + r0.xyz;
  r1.w = dot(v6.xyz, v6.xyz);
  r1.w = rsqrt(r1.w);
  r5.xyz = v6.xyz * r1.www;
  r6.xy = specularNoiseMapUVScaleFactor.zw * v1.xy;
  r6.xy = float2(0.5,0.5) * r6.xy;
  r6.xy = AnisoNoiseSpecSampler.Sample(AnisoNoiseSpecSampler_s, r6.xy).xy;
  r6.xy = r6.xy * float2(2,2) + float2(-1,-1);
  r6.xy = float2(0.100000001,0.100000001) * r6.xy;
  r6.xzw = v2.xyz * r6.xxx + r5.xyz;
  r1.w = dot(r6.xzw, r6.xzw);
  r1.w = rsqrt(r1.w);
  r6.xzw = r6.xzw * r1.www;
  r1.w = dot(r4.xzw, r6.xzw);
  r2.x = dot(gViewInverse._m20_m21_m22, r6.xzw);
  r5.xyz = v2.xyz * r6.yyy + r5.xyz;
  r3.x = dot(r5.xyz, r5.xyz);
  r3.x = rsqrt(r3.x);
  r5.xyz = r5.xyz * r3.xxx;
  r3.x = dot(r4.xzw, r5.xyz);
  r4.x = dot(gViewInverse._m20_m21_m22, r5.xyz);
  r4.z = -r1.w * r1.w + 1;
  r4.w = -r2.x * r2.x + 1;
  r4.zw = sqrt(r4.zw);
  r1.w = r2.x * r1.w;
  r1.w = r4.z * r4.w + -r1.w;
  r2.x = -r3.x * r3.x + 1;
  r2.x = sqrt(r2.x);
  r4.z = -r4.x * r4.x + 1;
  r4.z = sqrt(r4.z);
  r3.x = r4.x * r3.x;
  r2.x = r2.x * r4.z + -r3.x;
  r4.xz = float2(8,16) + anisotropicSpecularExponent.xy;
  r1.w = log2(abs(r1.w));
  r1.w = r4.x * r1.w;
  r1.w = exp2(r1.w);
  r2.x = log2(abs(r2.x));
  r2.x = r4.z * r2.x;
  r2.x = exp2(r2.x);
  r3.x = anisotropicSpecularIntensity.y * r2.x;
  r1.w = r1.w * anisotropicSpecularIntensity.x + r3.x;
  r3.x = cmp(r3.z < 0.03125);
  r3.z = r3.x ? 1.000000 : 0;
  r1.x = r1.w * r1.x;
  r1.x = r3.x ? r1.x : 1;
  r1.x = r1.z * r1.x;
  r4.xzw = anisotropicSpecularColour.xyz * r2.xxx;
  r4.xzw = r4.xzw * r3.zzz;
  o0.xyz = r4.xzw * float3(0.5,0.5,0.5) + r0.xyz;
  r0.x = saturate(gDirectionalAmbientColour.w + globalScalars2.z);
  r0.y = r3.w * r0.x;
  o1.xyz = r2.yzw * float3(0.5,0.5,0.5) + float3(0.5,0.5,0.5);
  r0.z = 0.001953125 * r1.y;
  r0.x = r4.y * r3.y + gLightArtificialIntAmbient0.w;
  r0.xy = float2(0.5,0.5) * r0.xy;
  o3.xy = sqrt(r0.xy);
  o2.x = sqrt(r1.x);
  o2.y = sqrt(r0.z);
  r0.x = r0.w * 1.33000004 + -0.501960814;
  o0.w = saturate(r0.x * 2.23194742 + 0.00784313772);
  o2.z = specularFresnel;
  o2.w = 1;
  o3.zw = float2(0,1.00188386);
  return;
}