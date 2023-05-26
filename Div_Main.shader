// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VoyVivika/DivorceShaders/Divorce Main"
{
	Properties
	{
		[Enum(Standard,0,Flat Lit,1,Flat Shade,2)]_LightingType("Lighting Type", Float) = 0
		[Header(Flat Light Settings)]_MaxFlatLightDistance("Max Flat Light Distance", Float) = 8
		_FlatLightStrength("Flat Light Strength", Range( 0 , 1)) = 1
		_Albedo("Albedo", 2D) = "black" {}
		_NormalMap("Normal Map", 2D) = "bump" {}
		_MultiMap("MultiMap", 2D) = "black" {}
		[ToggleUI]_EnableAudioLink("Enable AudioLink", Range( 0 , 1)) = 0
		_AL_Mask("AL_Mask", 2D) = "black" {}
		_ALTimeScale("AL Time Scale", Float) = 0
		_Emission("Emission", 2D) = "black" {}
		_EmissionStrength("Emission Strength", Range( 0 , 1)) = 0
		[ToggleUI]_EnableRimLighting("Enable Rim Lighting", Range( 0 , 1)) = 1
		_RimNormalMap("Rim Normal Map", 2D) = "bump" {}
		_RimPower("Rim Power", Range( 0 , 10)) = 2.07
		_RimEnergy("Rim Energy", Range( 0 , 1)) = 0.345
		_RimBaseColorStrength("Rim Base Color Strength", Range( 0 , 1)) = 1
		[Header(UV Tile Discard)][ToggleUI]_DiscardUVTile00("Discard UV Tile 0,0", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile01("Discard UV Tile 0,1", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile02("Discard UV Tile 0,2", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile03("Discard UV Tile 0,3", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile10("Discard UV Tile 1,0", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile11("Discard UV Tile 1,1", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile12("Discard UV Tile 1,2", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile13("Discard UV Tile 1,3", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile20("Discard UV Tile 2,0", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile21("Discard UV Tile 2,1", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile22("Discard UV Tile 2,2", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile23("Discard UV Tile 2,3", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile31("Discard UV Tile 3,1", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile30("Discard UV Tile 3,0", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile32("Discard UV Tile 3,2", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile33("Discard UV Tile 3,3", Range( 0 , 1)) = 0
		[Header(UV Range Discard)][Header(X and Y are Start UVs)][Header(Z and W are End UVs)][ToggleUI]_UVRangeDiscard1("UV Range Discard 1", Range( 0 , 1)) = 0
		[ToggleUI]_UVRangeDiscard3("UV Range Discard 3", Range( 0 , 1)) = 0
		[ToggleUI]_UVRangeDiscard2("UV Range Discard 2", Range( 0 , 1)) = 0
		_UVRangeDiscard1Range("UV Range Discard 1 Range", Vector) = (0,0,1,1)
		_UVRangeDiscard2Range("UV Range Discard 2 Range", Vector) = (0,0,1,1)
		_UVRangeDiscard3Range("UV Range Discard 3 Range", Vector) = (0,0,1,1)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#include "Assets/AudioLink/Shaders/AudioLink.cginc"
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float2 uv_texcoord;
			float3 viewDir;
			INTERNAL_DATA
			float3 worldNormal;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform float _UVRangeDiscard1;
		uniform float4 _UVRangeDiscard1Range;
		uniform float _UVRangeDiscard2;
		uniform float4 _UVRangeDiscard2Range;
		uniform float _UVRangeDiscard3;
		uniform float4 _UVRangeDiscard3Range;
		uniform float _DiscardUVTile00;
		uniform float _DiscardUVTile01;
		uniform float _DiscardUVTile02;
		uniform float _DiscardUVTile03;
		uniform float _DiscardUVTile10;
		uniform float _DiscardUVTile11;
		uniform float _DiscardUVTile12;
		uniform float _DiscardUVTile13;
		uniform float _DiscardUVTile20;
		uniform float _DiscardUVTile21;
		uniform float _DiscardUVTile22;
		uniform float _DiscardUVTile23;
		uniform float _DiscardUVTile30;
		uniform float _DiscardUVTile31;
		uniform float _DiscardUVTile32;
		uniform float _DiscardUVTile33;
		uniform sampler2D _Albedo;
		uniform float4 _Albedo_ST;
		uniform half _EnableAudioLink;
		uniform sampler2D _AL_Mask;
		uniform float4 _AL_Mask_ST;
		uniform float _ALTimeScale;
		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;
		uniform float _EmissionStrength;
		uniform half _EnableRimLighting;
		uniform sampler2D _RimNormalMap;
		uniform float _RimPower;
		uniform float _RimEnergy;
		uniform float _RimBaseColorStrength;
		uniform float _LightingType;
		uniform half _MaxFlatLightDistance;
		uniform float _FlatLightStrength;
		uniform sampler2D _NormalMap;
		uniform float4 _NormalMap_ST;
		uniform sampler2D _MultiMap;
		uniform float4 _MultiMap_ST;


		float IfAudioLinkv2Exists1_g14(  )
		{
			int w = 0; 
			int h; 
			int res = 0;
			#ifndef SHADER_TARGET_SURFACE_ANALYSIS
			_AudioTexture.GetDimensions(w, h); 
			#endif
			if (w == 128) res = 1;
			return res;
		}


		float3 HSVToRGB( float3 c )
		{
			float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
			float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
			return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
		}


		float3 RGBToHSV(float3 c)
		{
			float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
			float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
			float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
			float d = q.x - min( q.w, q.y );
			float e = 1.0e-10;
			return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
		}

		inline float AudioLinkData3_g4( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		inline float AudioLinkData3_g60( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		inline float AudioLinkData3_g12( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		inline float AudioLinkData3_g11( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 DiscardUV200 = v.texcoord1.xy;
			float2 break9_g250 = DiscardUV200;
			float4 break245 = _UVRangeDiscard1Range;
			float2 appendResult247 = (float2(break245.x , break245.y));
			float2 break11_g250 = appendResult247;
			float2 appendResult248 = (float2(break245.z , break245.w));
			float2 break13_g250 = appendResult248;
			float2 break9_g251 = DiscardUV200;
			float4 break252 = _UVRangeDiscard2Range;
			float2 appendResult253 = (float2(break252.x , break252.y));
			float2 break11_g251 = appendResult253;
			float2 appendResult254 = (float2(break252.z , break252.w));
			float2 break13_g251 = appendResult254;
			float2 break9_g252 = DiscardUV200;
			float4 break259 = _UVRangeDiscard3Range;
			float2 appendResult260 = (float2(break259.x , break259.y));
			float2 break11_g252 = appendResult260;
			float2 appendResult261 = (float2(break259.z , break259.w));
			float2 break13_g252 = appendResult261;
			float UVRangeDiscard267 = ( ( _UVRangeDiscard1 == 1.0 ? (( break9_g250.y >= break11_g250.y && break9_g250.y <= break13_g250.y ) ? (( break9_g250.x >= break11_g250.x && break9_g250.x <= break13_g250.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _UVRangeDiscard2 == 1.0 ? (( break9_g251.y >= break11_g251.y && break9_g251.y <= break13_g251.y ) ? (( break9_g251.x >= break11_g251.x && break9_g251.x <= break13_g251.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _UVRangeDiscard3 == 1.0 ? (( break9_g252.y >= break11_g252.y && break9_g252.y <= break13_g252.y ) ? (( break9_g252.x >= break11_g252.x && break9_g252.x <= break13_g252.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) );
			float2 break9_g288 = DiscardUV200;
			float2 temp_output_24_0_g288 = floor( float2( 0,0 ) );
			float2 break11_g288 = temp_output_24_0_g288;
			float2 break13_g288 = ( temp_output_24_0_g288 + float2( 1,1 ) );
			float2 break9_g276 = DiscardUV200;
			float2 temp_output_24_0_g276 = floor( float2( 0,1 ) );
			float2 break11_g276 = temp_output_24_0_g276;
			float2 break13_g276 = ( temp_output_24_0_g276 + float2( 1,1 ) );
			float2 break9_g277 = DiscardUV200;
			float2 temp_output_24_0_g277 = floor( float2( 0,2 ) );
			float2 break11_g277 = temp_output_24_0_g277;
			float2 break13_g277 = ( temp_output_24_0_g277 + float2( 1,1 ) );
			float2 break9_g278 = DiscardUV200;
			float2 temp_output_24_0_g278 = floor( float2( 0,3 ) );
			float2 break11_g278 = temp_output_24_0_g278;
			float2 break13_g278 = ( temp_output_24_0_g278 + float2( 1,1 ) );
			float2 break9_g274 = DiscardUV200;
			float2 temp_output_24_0_g274 = floor( float2( 1,0 ) );
			float2 break11_g274 = temp_output_24_0_g274;
			float2 break13_g274 = ( temp_output_24_0_g274 + float2( 1,1 ) );
			float2 break9_g279 = DiscardUV200;
			float2 temp_output_24_0_g279 = floor( float2( 1,1 ) );
			float2 break11_g279 = temp_output_24_0_g279;
			float2 break13_g279 = ( temp_output_24_0_g279 + float2( 1,1 ) );
			float2 break9_g286 = DiscardUV200;
			float2 temp_output_24_0_g286 = floor( float2( 1,2 ) );
			float2 break11_g286 = temp_output_24_0_g286;
			float2 break13_g286 = ( temp_output_24_0_g286 + float2( 1,1 ) );
			float2 break9_g287 = DiscardUV200;
			float2 temp_output_24_0_g287 = floor( float2( 1,3 ) );
			float2 break11_g287 = temp_output_24_0_g287;
			float2 break13_g287 = ( temp_output_24_0_g287 + float2( 1,1 ) );
			float2 break9_g275 = DiscardUV200;
			float2 temp_output_24_0_g275 = floor( float2( 2,0 ) );
			float2 break11_g275 = temp_output_24_0_g275;
			float2 break13_g275 = ( temp_output_24_0_g275 + float2( 1,1 ) );
			float2 break9_g283 = DiscardUV200;
			float2 temp_output_24_0_g283 = floor( float2( 2,1 ) );
			float2 break11_g283 = temp_output_24_0_g283;
			float2 break13_g283 = ( temp_output_24_0_g283 + float2( 1,1 ) );
			float2 break9_g284 = DiscardUV200;
			float2 temp_output_24_0_g284 = floor( float2( 2,2 ) );
			float2 break11_g284 = temp_output_24_0_g284;
			float2 break13_g284 = ( temp_output_24_0_g284 + float2( 1,1 ) );
			float2 break9_g285 = DiscardUV200;
			float2 temp_output_24_0_g285 = floor( float2( 2,3 ) );
			float2 break11_g285 = temp_output_24_0_g285;
			float2 break13_g285 = ( temp_output_24_0_g285 + float2( 1,1 ) );
			float2 break9_g289 = DiscardUV200;
			float2 temp_output_24_0_g289 = floor( float2( 3,0 ) );
			float2 break11_g289 = temp_output_24_0_g289;
			float2 break13_g289 = ( temp_output_24_0_g289 + float2( 1,1 ) );
			float2 break9_g280 = DiscardUV200;
			float2 temp_output_24_0_g280 = floor( float2( 3,1 ) );
			float2 break11_g280 = temp_output_24_0_g280;
			float2 break13_g280 = ( temp_output_24_0_g280 + float2( 1,1 ) );
			float2 break9_g281 = DiscardUV200;
			float2 temp_output_24_0_g281 = floor( float2( 3,2 ) );
			float2 break11_g281 = temp_output_24_0_g281;
			float2 break13_g281 = ( temp_output_24_0_g281 + float2( 1,1 ) );
			float2 break9_g282 = DiscardUV200;
			float2 temp_output_24_0_g282 = floor( float2( 3,3 ) );
			float2 break11_g282 = temp_output_24_0_g282;
			float2 break13_g282 = ( temp_output_24_0_g282 + float2( 1,1 ) );
			float UVTileDiscard192 = ( ( ( _DiscardUVTile00 == 1.0 ? (( break9_g288.y >= break11_g288.y && break9_g288.y <= break13_g288.y ) ? (( break9_g288.x >= break11_g288.x && break9_g288.x <= break13_g288.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _DiscardUVTile01 == 1.0 ? (( break9_g276.y >= break11_g276.y && break9_g276.y <= break13_g276.y ) ? (( break9_g276.x >= break11_g276.x && break9_g276.x <= break13_g276.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _DiscardUVTile02 == 1.0 ? (( break9_g277.y >= break11_g277.y && break9_g277.y <= break13_g277.y ) ? (( break9_g277.x >= break11_g277.x && break9_g277.x <= break13_g277.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _DiscardUVTile03 == 1.0 ? (( break9_g278.y >= break11_g278.y && break9_g278.y <= break13_g278.y ) ? (( break9_g278.x >= break11_g278.x && break9_g278.x <= break13_g278.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) ) + ( ( _DiscardUVTile10 == 1.0 ? (( break9_g274.y >= break11_g274.y && break9_g274.y <= break13_g274.y ) ? (( break9_g274.x >= break11_g274.x && break9_g274.x <= break13_g274.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _DiscardUVTile11 == 1.0 ? (( break9_g279.y >= break11_g279.y && break9_g279.y <= break13_g279.y ) ? (( break9_g279.x >= break11_g279.x && break9_g279.x <= break13_g279.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _DiscardUVTile12 == 1.0 ? (( break9_g286.y >= break11_g286.y && break9_g286.y <= break13_g286.y ) ? (( break9_g286.x >= break11_g286.x && break9_g286.x <= break13_g286.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _DiscardUVTile13 == 1.0 ? (( break9_g287.y >= break11_g287.y && break9_g287.y <= break13_g287.y ) ? (( break9_g287.x >= break11_g287.x && break9_g287.x <= break13_g287.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) ) + ( ( _DiscardUVTile20 == 1.0 ? (( break9_g275.y >= break11_g275.y && break9_g275.y <= break13_g275.y ) ? (( break9_g275.x >= break11_g275.x && break9_g275.x <= break13_g275.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _DiscardUVTile21 == 1.0 ? (( break9_g283.y >= break11_g283.y && break9_g283.y <= break13_g283.y ) ? (( break9_g283.x >= break11_g283.x && break9_g283.x <= break13_g283.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _DiscardUVTile22 == 1.0 ? (( break9_g284.y >= break11_g284.y && break9_g284.y <= break13_g284.y ) ? (( break9_g284.x >= break11_g284.x && break9_g284.x <= break13_g284.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _DiscardUVTile23 == 1.0 ? (( break9_g285.y >= break11_g285.y && break9_g285.y <= break13_g285.y ) ? (( break9_g285.x >= break11_g285.x && break9_g285.x <= break13_g285.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) ) + ( ( _DiscardUVTile30 == 1.0 ? (( break9_g289.y >= break11_g289.y && break9_g289.y <= break13_g289.y ) ? (( break9_g289.x >= break11_g289.x && break9_g289.x <= break13_g289.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _DiscardUVTile31 == 1.0 ? (( break9_g280.y >= break11_g280.y && break9_g280.y <= break13_g280.y ) ? (( break9_g280.x >= break11_g280.x && break9_g280.x <= break13_g280.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _DiscardUVTile32 == 1.0 ? (( break9_g281.y >= break11_g281.y && break9_g281.y <= break13_g281.y ) ? (( break9_g281.x >= break11_g281.x && break9_g281.x <= break13_g281.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) + ( _DiscardUVTile33 == 1.0 ? (( break9_g282.y >= break11_g282.y && break9_g282.y <= break13_g282.y ) ? (( break9_g282.x >= break11_g282.x && break9_g282.x <= break13_g282.x ) ? ( 0.0 / 0.0 ) :  0.0 ) :  0.0 ) : 0.0 ) ) );
			float UVDiscard730 = ( UVRangeDiscard267 + UVTileDiscard192 );
			float3 temp_cast_0 = (UVDiscard730).xxx;
			v.vertex.xyz += temp_cast_0;
			v.vertex.w = 1;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			#ifdef UNITY_PASS_FORWARDBASE
			float ase_lightAtten = data.atten;
			if( _LightColor0.a == 0)
			ase_lightAtten = 0;
			#else
			float3 ase_lightAttenRGB = gi.light.color / ( ( _LightColor0.rgb ) + 0.000001 );
			float ase_lightAtten = max( max( ase_lightAttenRGB.r, ase_lightAttenRGB.g ), ase_lightAttenRGB.b );
			#endif
			#if defined(HANDLE_SHADOWS_BLENDING_IN_GI)
			half bakedAtten = UnitySampleBakedOcclusion(data.lightmapUV.xy, data.worldPos);
			float zDist = dot(_WorldSpaceCameraPos - data.worldPos, UNITY_MATRIX_V[2].xyz);
			float fadeDist = UnityComputeShadowFadeDistance(data.worldPos, zDist);
			ase_lightAtten = UnityMixRealtimeAndBakedShadows(data.atten, bakedAtten, UnityComputeShadowFade(fadeDist));
			#endif
			float LightType793 = _LightingType;
			float clampResult799 = clamp( ase_lightAtten , 0.0 , 1.0 );
			float3 objToWorld389 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
			float clampResult783 = clamp( ( 1.0 - (0.0 + (distance( objToWorld389 , _WorldSpaceLightPos0.xyz ) - 0.0) * (1.0 - 0.0) / (_MaxFlatLightDistance - 0.0)) ) , 0.0 , 10000.0 );
			float _FlatLightModel789 = ( _WorldSpaceLightPos0.w == 1.0 ? clampResult783 : 1.0 );
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float4 temp_cast_10 = (( ase_lightColor.a * ( 1.0 - _FlatLightStrength ) )).xxxx;
			float4 FlatLightColor414 = ( ase_lightColor - temp_cast_10 );
			float4 clampResult761 = clamp( ( ( LightType793 == 2.0 ? clampResult799 : _FlatLightModel789 ) * FlatLightColor414 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float2 uv_NormalMap = i.uv_texcoord * _NormalMap_ST.xy + _NormalMap_ST.zw;
			float3 normalMap35 = UnpackNormal( tex2D( _NormalMap, uv_NormalMap ) );
			UnityGI gi400 = gi;
			float3 diffNorm400 = normalMap35;
			gi400 = UnityGI_Base( data, 1, diffNorm400 );
			float3 indirectDiffuse400 = gi400.indirect.diffuse + diffNorm400 * 0.0001;
			float4 _FlatLightResult424 = ( clampResult761 + unity_AmbientSky + float4( indirectDiffuse400 , 0.0 ) );
			float2 uv_Albedo = i.uv_texcoord * _Albedo_ST.xy + _Albedo_ST.zw;
			float4 mainTex26 = tex2D( _Albedo, uv_Albedo );
			float4 mainTexClamped354 = (float4( 0.01,0.01,0.01,0 ) + (mainTex26 - float4( 0,0,0,0 )) * (float4( 1,1,1,1 ) - float4( 0.01,0.01,0.01,0 )) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
			float2 uv_MultiMap = i.uv_texcoord * _MultiMap_ST.xy + _MultiMap_ST.zw;
			float4 multiMap90 = tex2D( _MultiMap, uv_MultiMap );
			float4 break404 = multiMap90;
			float3 indirectNormal405 = normalize( WorldNormalVector( i , normalMap35 ) );
			Unity_GlossyEnvironmentData g405 = UnityGlossyEnvironmentSetup( break404.g, data.worldViewDir, indirectNormal405, float3(0,0,0));
			float3 indirectSpecular405 = UnityGI_IndirectSpecular( data, 1.0, indirectNormal405, g405 );
			float4 Lighting_Flat411 = ( ( _FlatLightResult424 * mainTexClamped354 ) + ( break404.r * float4( indirectSpecular405 , 0.0 ) * _FlatLightResult424 ) );
			SurfaceOutputStandard s303 = (SurfaceOutputStandard ) 0;
			s303.Albedo = mainTex26.rgb;
			s303.Normal = normalize( WorldNormalVector( i , normalMap35 ) );
			float2 uv_AL_Mask = i.uv_texcoord * _AL_Mask_ST.xy + _AL_Mask_ST.zw;
			float4 ALMask39 = tex2D( _AL_Mask, uv_AL_Mask );
			float localIfAudioLinkv2Exists1_g14 = IfAudioLinkv2Exists1_g14();
			float4 color42 = IsGammaSpace() ? float4(1,0,0,1) : float4(1,0,0,1);
			float3 hsvTorgb4_g36 = RGBToHSV( color42.rgb );
			float mulTime48 = _Time.y * _ALTimeScale;
			float Time50 = frac( mulTime48 );
			float3 hsvTorgb8_g36 = HSVToRGB( float3(( hsvTorgb4_g36.x + Time50 ),( hsvTorgb4_g36.y + 0.0 ),( hsvTorgb4_g36.z + 0.0 )) );
			float3 temp_output_194_0 = saturate( hsvTorgb8_g36 );
			int Band3_g4 = 0;
			int Delay3_g4 = 0;
			float localAudioLinkData3_g4 = AudioLinkData3_g4( Band3_g4 , Delay3_g4 );
			float3 ALC_Bass61 = ( localIfAudioLinkv2Exists1_g14 == 1.0 ? ( temp_output_194_0 * localAudioLinkData3_g4 ) : temp_output_194_0 );
			float4 color44 = IsGammaSpace() ? float4(0,0.8196079,0,1) : float4(0,0.637597,0,1);
			float3 hsvTorgb4_g59 = RGBToHSV( color44.rgb );
			float3 hsvTorgb8_g59 = HSVToRGB( float3(( hsvTorgb4_g59.x + Time50 ),( hsvTorgb4_g59.y + 0.0 ),( hsvTorgb4_g59.z + 0.0 )) );
			int Band3_g60 = 2;
			int Delay3_g60 = 0;
			float localAudioLinkData3_g60 = AudioLinkData3_g60( Band3_g60 , Delay3_g60 );
			float3 ALC_HighMid67 = ( saturate( hsvTorgb8_g59 ) * localAudioLinkData3_g60 );
			float4 color43 = IsGammaSpace() ? float4(1,0.9294118,0,1) : float4(1,0.8468735,0,1);
			float3 hsvTorgb4_g38 = RGBToHSV( color43.rgb );
			float3 hsvTorgb8_g38 = HSVToRGB( float3(( hsvTorgb4_g38.x + Time50 ),( hsvTorgb4_g38.y + 0.0 ),( hsvTorgb4_g38.z + 0.0 )) );
			int Band3_g12 = 1;
			int Delay3_g12 = 0;
			float localAudioLinkData3_g12 = AudioLinkData3_g12( Band3_g12 , Delay3_g12 );
			float3 ALC_LowMid64 = ( saturate( hsvTorgb8_g38 ) * localAudioLinkData3_g12 );
			float4 color45 = IsGammaSpace() ? float4(0,0,1,1) : float4(0,0,1,1);
			float3 hsvTorgb4_g37 = RGBToHSV( color45.rgb );
			float3 hsvTorgb8_g37 = HSVToRGB( float3(( hsvTorgb4_g37.x + Time50 ),( hsvTorgb4_g37.y + 0.0 ),( hsvTorgb4_g37.z + 0.0 )) );
			int Band3_g11 = 3;
			int Delay3_g11 = 0;
			float localAudioLinkData3_g11 = AudioLinkData3_g11( Band3_g11 , Delay3_g11 );
			float3 ALC_Treble70 = ( saturate( hsvTorgb8_g37 ) * localAudioLinkData3_g11 );
			float4 AL_Final85 = ( _EnableAudioLink * ( ( ALMask39 * float4( ALC_Bass61 , 0.0 ) ) + ( ALMask39 * float4( ALC_HighMid67 , 0.0 ) ) + ( ALMask39 * float4( ALC_LowMid64 , 0.0 ) ) + ( ALMask39 * float4( ALC_Treble70 , 0.0 ) ) ) );
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 Emission119 = ( tex2D( _Emission, uv_Emission ) * _EmissionStrength );
			float3 normalizeResult9 = normalize( i.viewDir );
			float dotResult10 = dot( UnpackNormal( tex2D( _RimNormalMap, i.uv_texcoord ) ) , normalizeResult9 );
			float Rim16 = ( pow( ( 1.0 - saturate( dotResult10 ) ) , ( 10.0 - _RimPower ) ) * _RimEnergy );
			float4 lerpResult114 = lerp( float4( 1,1,1,0 ) , mainTex26 , _RimBaseColorStrength);
			float4 Rim116 = ( _EnableRimLighting * ( Rim16 * lerpResult114 ) );
			float4 EmissionFinal29 = ( AL_Final85 + Emission119 + Rim116 );
			s303.Emission = EmissionFinal29.rgb;
			float4 break307 = multiMap90;
			s303.Metallic = break307.r;
			s303.Smoothness = break307.g;
			s303.Occlusion = 1.0;

			data.light = gi.light;

			UnityGI gi303 = gi;
			#ifdef UNITY_PASS_FORWARDBASE
			Unity_GlossyEnvironmentData g303 = UnityGlossyEnvironmentSetup( s303.Smoothness, data.worldViewDir, s303.Normal, float3(0,0,0));
			gi303 = UnityGlobalIllumination( data, s303.Occlusion, s303.Normal, g303 );
			#endif

			float3 surfResult303 = LightingStandard ( s303, viewDir, gi303 ).rgb;
			surfResult303 += s303.Emission;

			#ifdef UNITY_PASS_FORWARDADD//303
			surfResult303 -= s303.Emission;
			#endif//303
			float3 Lighting_Standard309 = surfResult303;
			float4 LightingFinal330 = (( _LightingType >= 1.0 && _LightingType <= 2.0 ) ? Lighting_Flat411 :  float4( Lighting_Standard309 , 0.0 ) );
			c.rgb = LightingFinal330.rgb;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			o.Normal = float3(0,0,1);
			float2 uv_Albedo = i.uv_texcoord * _Albedo_ST.xy + _Albedo_ST.zw;
			float4 mainTex26 = tex2D( _Albedo, uv_Albedo );
			o.Albedo = mainTex26.rgb;
			float2 uv_AL_Mask = i.uv_texcoord * _AL_Mask_ST.xy + _AL_Mask_ST.zw;
			float4 ALMask39 = tex2D( _AL_Mask, uv_AL_Mask );
			float localIfAudioLinkv2Exists1_g14 = IfAudioLinkv2Exists1_g14();
			float4 color42 = IsGammaSpace() ? float4(1,0,0,1) : float4(1,0,0,1);
			float3 hsvTorgb4_g36 = RGBToHSV( color42.rgb );
			float mulTime48 = _Time.y * _ALTimeScale;
			float Time50 = frac( mulTime48 );
			float3 hsvTorgb8_g36 = HSVToRGB( float3(( hsvTorgb4_g36.x + Time50 ),( hsvTorgb4_g36.y + 0.0 ),( hsvTorgb4_g36.z + 0.0 )) );
			float3 temp_output_194_0 = saturate( hsvTorgb8_g36 );
			int Band3_g4 = 0;
			int Delay3_g4 = 0;
			float localAudioLinkData3_g4 = AudioLinkData3_g4( Band3_g4 , Delay3_g4 );
			float3 ALC_Bass61 = ( localIfAudioLinkv2Exists1_g14 == 1.0 ? ( temp_output_194_0 * localAudioLinkData3_g4 ) : temp_output_194_0 );
			float4 color44 = IsGammaSpace() ? float4(0,0.8196079,0,1) : float4(0,0.637597,0,1);
			float3 hsvTorgb4_g59 = RGBToHSV( color44.rgb );
			float3 hsvTorgb8_g59 = HSVToRGB( float3(( hsvTorgb4_g59.x + Time50 ),( hsvTorgb4_g59.y + 0.0 ),( hsvTorgb4_g59.z + 0.0 )) );
			int Band3_g60 = 2;
			int Delay3_g60 = 0;
			float localAudioLinkData3_g60 = AudioLinkData3_g60( Band3_g60 , Delay3_g60 );
			float3 ALC_HighMid67 = ( saturate( hsvTorgb8_g59 ) * localAudioLinkData3_g60 );
			float4 color43 = IsGammaSpace() ? float4(1,0.9294118,0,1) : float4(1,0.8468735,0,1);
			float3 hsvTorgb4_g38 = RGBToHSV( color43.rgb );
			float3 hsvTorgb8_g38 = HSVToRGB( float3(( hsvTorgb4_g38.x + Time50 ),( hsvTorgb4_g38.y + 0.0 ),( hsvTorgb4_g38.z + 0.0 )) );
			int Band3_g12 = 1;
			int Delay3_g12 = 0;
			float localAudioLinkData3_g12 = AudioLinkData3_g12( Band3_g12 , Delay3_g12 );
			float3 ALC_LowMid64 = ( saturate( hsvTorgb8_g38 ) * localAudioLinkData3_g12 );
			float4 color45 = IsGammaSpace() ? float4(0,0,1,1) : float4(0,0,1,1);
			float3 hsvTorgb4_g37 = RGBToHSV( color45.rgb );
			float3 hsvTorgb8_g37 = HSVToRGB( float3(( hsvTorgb4_g37.x + Time50 ),( hsvTorgb4_g37.y + 0.0 ),( hsvTorgb4_g37.z + 0.0 )) );
			int Band3_g11 = 3;
			int Delay3_g11 = 0;
			float localAudioLinkData3_g11 = AudioLinkData3_g11( Band3_g11 , Delay3_g11 );
			float3 ALC_Treble70 = ( saturate( hsvTorgb8_g37 ) * localAudioLinkData3_g11 );
			float4 AL_Final85 = ( _EnableAudioLink * ( ( ALMask39 * float4( ALC_Bass61 , 0.0 ) ) + ( ALMask39 * float4( ALC_HighMid67 , 0.0 ) ) + ( ALMask39 * float4( ALC_LowMid64 , 0.0 ) ) + ( ALMask39 * float4( ALC_Treble70 , 0.0 ) ) ) );
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 Emission119 = ( tex2D( _Emission, uv_Emission ) * _EmissionStrength );
			float3 normalizeResult9 = normalize( i.viewDir );
			float dotResult10 = dot( UnpackNormal( tex2D( _RimNormalMap, i.uv_texcoord ) ) , normalizeResult9 );
			float Rim16 = ( pow( ( 1.0 - saturate( dotResult10 ) ) , ( 10.0 - _RimPower ) ) * _RimEnergy );
			float4 lerpResult114 = lerp( float4( 1,1,1,0 ) , mainTex26 , _RimBaseColorStrength);
			float4 Rim116 = ( _EnableRimLighting * ( Rim16 * lerpResult114 ) );
			float4 EmissionFinal29 = ( AL_Final85 + Emission119 + Rim116 );
			o.Emission = EmissionFinal29.rgb;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float4 tSpace0 : TEXCOORD2;
				float4 tSpace1 : TEXCOORD3;
				float4 tSpace2 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.viewDir = IN.tSpace0.xyz * worldViewDir.x + IN.tSpace1.xyz * worldViewDir.y + IN.tSpace2.xyz * worldViewDir.z;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.CommentaryNode;382;135.1143,-8052.112;Inherit;False;1855.357;1582.021;Comment;47;791;799;788;761;398;794;783;798;789;391;396;400;401;393;787;786;784;785;384;385;383;390;399;424;755;753;754;749;403;738;411;428;427;406;439;437;438;387;402;410;425;397;426;409;405;404;389;Flat Lighting;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;732;4078.449,-1883.351;Inherit;False;626.3779;265.5669;Comment;4;728;729;731;730;Combine UV Discards;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;220;2051.233,-3370.865;Inherit;False;962.8354;715.8684;Comment;8;0;33;36;32;95;92;193;332;Output;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;201;-55.94421,-697.3302;Inherit;False;503.0845;214.413;Comment;2;200;199;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;107;-23.66935,-4536.875;Inherit;False;1258.848;948.373;Comment;16;85;84;83;82;81;80;79;78;76;77;75;74;73;71;415;416;AudioLink Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;106;-112.9787,-5381.73;Inherit;False;1183.572;355.2229;Comment;5;57;69;68;70;45;AudioLink Treble;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;105;-86.35403,-5893.254;Inherit;False;1188.215;403.241;Comment;6;67;65;66;56;44;197;AudioLink HighMid;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;104;-1337.905,-5407.259;Inherit;False;1137.62;367.6456;Comment;5;64;63;62;55;43;AudioLink LowMid;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;103;-1337.02,-5897.206;Inherit;False;1176.516;390.1733;Comment;7;42;61;41;124;58;51;417;AudioLink Bass;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;72;-1818.04,-4819.045;Inherit;False;712.9634;194.3457;Comment;4;243;48;49;50;Time;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-7417.041,-1620.861;Inherit;False;859.9141;343.3768;Comment;3;737;34;35;Normal Map;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;31;-636.0011,-1983.635;Inherit;False;737.2792;402.4306;Comment;5;29;86;28;30;122;Emission Combination;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;27;-7513.137,-3602.244;Inherit;False;914.3999;338.0557;Comment;3;736;25;26;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1;-3015.296,-577.5867;Inherit;False;2619.73;1242.488;Comment;20;333;114;4;116;113;112;115;87;8;9;10;88;16;12;7;15;14;13;11;334;Rim;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;38;-1849.337,-3502.624;Inherit;False;604.8932;280;Comment;2;40;39;AL Emission Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;50;-1329.076,-4762.699;Inherit;False;Time;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;89;-813.4411,-2813.33;Inherit;False;604.8932;280;R = Metalic, G = Smoothness;2;91;90;MultiMap;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;90;-424.5481,-2761.528;Inherit;False;multiMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;57;134.7981,-5172.021;Inherit;False;50;Time;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;637.4441,-5280.506;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;70;846.5929,-5305.182;Inherit;False;ALC_Treble;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;45;-62.97868,-5253.461;Inherit;False;Constant;_AL_Treble;AL_Treble;6;0;Create;True;0;0;0;False;0;False;0,0,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;71;26.79314,-4486.875;Inherit;False;39;ALMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;73;26.33066,-4372.526;Inherit;False;61;ALC_Bass;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;74;211.3306,-4443.526;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;75;42.57924,-4245.578;Inherit;False;39;ALMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;77;227.1167,-4202.23;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;76;42.11675,-4131.23;Inherit;False;67;ALC_HighMid;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;78;67.26691,-4009.6;Inherit;False;39;ALMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;251.8044,-3966.252;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;80;67.80442,-3895.252;Inherit;False;64;ALC_LowMid;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;81;76.93356,-3805.6;Inherit;False;39;ALMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;82;261.471,-3762.253;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;83;77.47105,-3691.253;Inherit;False;70;ALC_Treble;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;84;534.6252,-4158.036;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;-1471.095,-3451.473;Inherit;False;ALMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;117;-1853.104,-2983.999;Inherit;False;791.7242;362.8555;Comment;4;120;119;118;121;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;119;-1276.658,-2924.725;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;120;-1771.553,-2723.966;Inherit;False;Property;_EmissionStrength;Emission Strength;10;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;121;-1444.109,-2847.282;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;11;-2179.434,-304.2606;Inherit;False;1;0;FLOAT;1.23;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;13;-2010.431,-261.9613;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;14;-2234.424,-176.6531;Inherit;False;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;15;-1817.633,-238.5608;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;7;-2780.132,-251.9605;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;12;-2650.262,-92.36382;Float;False;Property;_RimPower;Rim Power;13;0;Create;True;0;0;0;False;0;False;2.07;3.39;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;16;-1406.557,-282.4929;Float;True;Rim;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;88;-1609.907,-202.9594;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;10;-2398.068,-404.9769;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;9;-2568.881,-243.393;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;8;-2720.214,-488.9528;Inherit;True;Property;_RimNormalMap;Rim Normal Map;12;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;87;-1893.711,-79.22301;Inherit;False;Property;_RimEnergy;Rim Energy;14;0;Create;True;0;0;0;False;0;False;0.345;0.25;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;115;-1179.027,-112.8811;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;112;-1645.213,99.48186;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;113;-1765.622,197.6751;Inherit;False;Property;_RimBaseColorStrength;Rim Base Color Strength;15;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;4;-2957.279,-460.7114;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;114;-1441.166,47.19511;Inherit;True;3;0;COLOR;1,1,1,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;40;-1793.337,-3445.624;Inherit;True;Property;_AL_Mask;AL_Mask;7;0;Create;True;0;0;0;False;0;False;-1;83f90c05f51ea5c469ceb2c4218b09a7;83f90c05f51ea5c469ceb2c4218b09a7;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;51;-1247.875,-5610.916;Inherit;False;50;Time;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;58;-735.7633,-5741.359;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;41;-1052.972,-5786.569;Inherit;False;4BandAmplitude;-1;;4;f5073bb9076c4e24481a28578c80bed5;0;2;2;INT;0;False;4;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;61;-367.5052,-5782.771;Inherit;False;ALC_Bass;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;42;-1312.543,-5798.206;Inherit;False;Constant;_AL_Bass;AL_Bass;6;0;Create;True;0;0;0;False;0;False;1,0,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;68;343.0645,-5166.744;Inherit;False;4BandAmplitude;-1;;11;f5073bb9076c4e24481a28578c80bed5;0;2;2;INT;3;False;4;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;43;-1294.715,-5338.324;Inherit;False;Constant;_AL_LowMid;AL_LowMid;6;0;Create;True;0;0;0;False;0;False;1,0.9294118,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;55;-1102.38,-5249.526;Inherit;False;50;Time;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;62;-919.6196,-5182.47;Inherit;False;4BandAmplitude;-1;;12;f5073bb9076c4e24481a28578c80bed5;0;2;2;INT;1;False;4;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;-644.6395,-5299.407;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;64;-415.1543,-5306.091;Inherit;False;ALC_LowMid;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;44;-54.51395,-5792.144;Inherit;False;Constant;_AL_HighMid;AL_HighMid;6;0;Create;True;0;0;0;False;0;False;0,0.8196079,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;56;141.1703,-5704.85;Inherit;False;50;Time;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;66;665.2375,-5831.361;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;67;879.6917,-5819.153;Inherit;False;ALC_HighMid;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;124;-747.4884,-5834.831;Inherit;False;IsAudioLink;-1;;14;e83fef6181013ba4bacf30a3d9a31d37;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;138;1465.541,-1401.771;Inherit;False;3237.51;1806.072;Comment;61;191;192;222;802;801;768;208;636;635;207;767;640;773;212;772;639;211;771;210;638;637;213;641;644;777;216;643;776;215;642;214;775;774;770;209;766;634;206;765;270;764;204;632;763;631;203;762;633;630;629;198;224;223;225;205;202;180;167;154;149;819;UV Tile Discard;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;194;-1058.552,-5678.013;Inherit;False;HueShift;-1;;36;09c7357f8ce789c46a405a6704ca8341;0;4;14;COLOR;0,0,0,0;False;15;FLOAT;0;False;16;FLOAT;0;False;17;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;195;343.6559,-5323.875;Inherit;False;HueShift;-1;;37;09c7357f8ce789c46a405a6704ca8341;0;4;14;COLOR;0,0,0,0;False;15;FLOAT;0;False;16;FLOAT;0;False;17;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;196;-907.4175,-5335.405;Inherit;False;HueShift;-1;;38;09c7357f8ce789c46a405a6704ca8341;0;4;14;COLOR;0,0,0,0;False;15;FLOAT;0;False;16;FLOAT;0;False;17;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;217;4137.307,-4147.085;Inherit;False;420.8079;185;Comment;2;219;218;Declare NaN;1,1,1,1;0;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2759.068,-3220.523;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;VoyVivika/DivorceShaders/Divorce Main;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;1;Include;Assets/AudioLink/Shaders/AudioLink.cginc;False;;Custom;False;0;0;;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.GetLocalVarNode;36;2297.222,-3237.719;Inherit;False;35;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;32;2301.754,-3145.94;Inherit;False;29;EmissionFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;95;2282.518,-3022.374;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RegisterLocalVarNode;200;223.1403,-647.3302;Inherit;False;DiscardUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;199;-5.944214,-641.9172;Inherit;False;1;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;92;2101.233,-3026.873;Inherit;False;90;multiMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;118;-1797.104,-2926.999;Inherit;True;Property;_Emission;Emission;9;0;Create;True;0;0;0;False;0;False;-1;83f90c05f51ea5c469ceb2c4218b09a7;83f90c05f51ea5c469ceb2c4218b09a7;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FractNode;49;-1440.809,-4759.045;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;48;-1600.04,-4757.258;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;243;-1786.835,-4764.416;Inherit;False;Property;_ALTimeScale;AL Time Scale;8;0;Create;True;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;244;4931.741,-1214.173;Inherit;False;1373.246;1423.229;Comment;23;267;779;778;466;246;711;710;709;266;264;262;261;260;259;258;255;254;253;252;249;248;247;245;UV Range Discard;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;302;-1094.992,-8769.079;Inherit;False;1151.4;546.5259;Comment;7;309;308;307;306;305;304;303;Standard Lighting;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;326;1801.181,-5722.331;Inherit;False;1369.996;727.8779;Comment;6;328;331;330;329;793;800;Pick Lighting Type;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;116;-655.0269,-125.8811;Float;True;Rim;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;334;-851.8262,-135.8871;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;333;-1167.852,-280.5502;Half;False;Property;_EnableRimLighting;Enable Rim Lighting;11;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;328;1856.181,-5467.046;Inherit;False;309;Lighting_Standard;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;351;2639.066,-6869.548;Inherit;False;753.479;304;Comment;3;354;353;352;MainTexClamped;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;329;1887.181,-5556.046;Inherit;False;411;Lighting_Flat;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;412;1032.46,-8782.894;Inherit;False;1054.539;478.8659;Comment;6;435;445;413;434;443;414;Flat Light Color (Clamp Toggle);1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;85;992.705,-4166.425;Inherit;False;AL_Final;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;416;787.8911,-4176.061;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;417;-539.5048,-5751.281;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;197;368.8238,-5818.455;Inherit;False;HueShift;-1;;59;09c7357f8ce789c46a405a6704ca8341;0;4;14;COLOR;0,0,0,0;False;15;FLOAT;0;False;16;FLOAT;0;False;17;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;65;362.9142,-5666.229;Inherit;False;4BandAmplitude;-1;;60;f5073bb9076c4e24481a28578c80bed5;0;2;2;INT;2;False;4;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;415;478.4037,-4285.905;Half;False;Property;_EnableAudioLink;Enable AudioLink;6;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;91;-795.4411,-2748.33;Inherit;True;Property;_MultiMap;MultiMap;5;0;Create;True;0;0;0;False;0;False;-1;01e8d4996fddd0a448744957657de587;01e8d4996fddd0a448744957657de587;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;86;-594.7267,-1906.872;Inherit;False;85;AL_Final;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;-339.5763,-1838.825;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;29;-114.9731,-1846.543;Inherit;False;EmissionFinal;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;122;-593.0291,-1816.919;Inherit;False;119;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;28;-594.8048,-1719.686;Inherit;False;116;Rim;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;26;-6840.288,-3509.053;Inherit;False;mainTex;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;35;-6772.686,-1513.261;Inherit;False;normalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;193;2351.81,-2859.997;Inherit;False;730;UVDiscard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;25;-7141.458,-3513.226;Inherit;True;Property;_AlbedoSample;Albedo Sample;3;0;Create;True;0;0;0;False;0;False;-1;0db631ddb1a2c1443b81c6ac5ce43d11;0db631ddb1a2c1443b81c6ac5ce43d11;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;34;-7090.542,-1509.947;Inherit;True;Property;_NMSample;NM Sample;4;0;Create;True;0;0;0;False;0;False;-1;13ce54de7ec2bdd45a3ceb8a5e5e4cad;1f3982b36e89bca46b80f47660759b39;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;737;-7386.651,-1509.456;Inherit;True;Property;_NormalMap;Normal Map;4;0;Create;True;0;0;0;False;0;False;0f9978e19d98bb04b8f2ce5197640506;0f9978e19d98bb04b8f2ce5197640506;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;736;-7467.361,-3512.755;Inherit;True;Property;_Albedo;Albedo;3;0;Create;True;0;0;0;False;0;False;0db631ddb1a2c1443b81c6ac5ce43d11;0db631ddb1a2c1443b81c6ac5ce43d11;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleDivideOpNode;218;4187.307,-4097.085;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;219;4334.115,-4095.47;Inherit;False;NaN;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;793;2164.258,-5350.884;Inherit;False;LightType;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;2286.262,-3320.865;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;332;2519.215,-2995.611;Inherit;False;330;LightingFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;330;2513.206,-5627.539;Inherit;False;LightingFinal;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;149;2103.135,-435.5835;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;154;2890.493,-401.2814;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;167;3686.68,-527.5339;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;180;4481.771,-529.569;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;202;1533.318,-660.1951;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;205;2294.606,-865.7911;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;225;2205.348,-1117.688;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;223;3826.804,-1027.133;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;224;3041,-1077.105;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;198;1542.344,-979.7899;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;629;1539.432,-901.3254;Inherit;False;Constant;_Vector0;Vector 0;38;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;630;1538.705,-578.879;Inherit;False;Constant;_Vector1;Vector 0;38;0;Create;True;0;0;0;False;0;False;0,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;633;2324.538,-773.1622;Inherit;False;Constant;_Vector4;Vector 0;38;0;Create;True;0;0;0;False;0;False;1,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;762;1499.583,-759.6893;Inherit;False;Property;_DiscardUVTile01;Discard UV Tile 0,1;17;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;203;1536.018,-316.3951;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;631;1566.422,-217.064;Inherit;False;Constant;_Vector2;Vector 0;38;0;Create;True;0;0;0;False;0;False;0,2;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;763;1496.973,-427.7367;Inherit;False;Property;_DiscardUVTile02;Discard UV Tile 0,2;18;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;632;1594.787,113.182;Inherit;False;Constant;_Vector3;Vector 0;38;0;Create;True;0;0;0;False;0;False;0,3;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;204;1570.418,24.20495;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;764;1518.973,-60.73669;Inherit;False;Property;_DiscardUVTile03;Discard UV Tile 0,3;19;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;270;1495.07,-1079.585;Inherit;False;Property;_DiscardUVTile00;Discard UV Tile 0,0;16;2;[Header];[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;765;2249.126,-963.5736;Inherit;False;Property;_DiscardUVTile10;Discard UV Tile 1,0;20;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;206;2357.974,-536.9484;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;634;2385.538,-462.1622;Inherit;False;Constant;_Vector5;Vector 0;38;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;766;2259.126,-613.5735;Inherit;False;Property;_DiscardUVTile11;Discard UV Tile 1,1;21;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;209;3140.744,-871.4884;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;770;3041.102,-947.6624;Inherit;False;Property;_DiscardUVTile20;Discard UV Tile 2,0;24;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;774;3842.005,-910.9678;Inherit;False;Property;_DiscardUVTile30;Discard UV Tile 3,0;29;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;775;3839.91,-560.7627;Inherit;False;Property;_DiscardUVTile31;Discard UV Tile 3,1;28;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;214;3904.62,-483.9957;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;642;3933.447,-413.097;Inherit;False;Constant;_Vector13;Vector 0;38;0;Create;True;0;0;0;False;0;False;3,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;215;3912.915,-182.604;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;776;3813.138,-254.3136;Inherit;False;Property;_DiscardUVTile32;Discard UV Tile 3,2;30;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;643;3940.676,-112.648;Inherit;False;Constant;_Vector14;Vector 0;38;0;Create;True;0;0;0;False;0;False;3,2;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;216;3914.689,128.2034;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;777;3814.721,53.09606;Inherit;False;Property;_DiscardUVTile33;Discard UV Tile 3,3;31;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;644;3945.259,200.7619;Inherit;False;Constant;_Vector15;Vector 0;38;0;Create;True;0;0;0;False;0;False;3,3;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;641;3964.222,-753.2794;Inherit;False;Constant;_Vector12;Vector 0;38;0;Create;True;0;0;0;False;0;False;3,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;213;3933.363,-828.7961;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;637;3166.819,-795.8944;Inherit;False;Constant;_Vector8;Vector 0;38;0;Create;True;0;0;0;False;0;False;2,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;638;3179.013,-479.2932;Inherit;False;Constant;_Vector9;Vector 0;38;0;Create;True;0;0;0;False;0;False;2,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;210;3150.812,-564.5684;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;771;3055.927,-642.5212;Inherit;False;Property;_DiscardUVTile21;Discard UV Tile 2,1;25;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;211;3164.474,-249.9562;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;639;3189.3,-170.453;Inherit;False;Constant;_Vector10;Vector 0;38;0;Create;True;0;0;0;False;0;False;2,2;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;772;3061.227,-323.6906;Inherit;False;Property;_DiscardUVTile22;Discard UV Tile 2,2;26;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;212;3166.697,60.64629;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;773;3067.304,-14.54724;Inherit;False;Property;_DiscardUVTile23;Discard UV Tile 2,3;27;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;640;3192.601,137.0375;Inherit;False;Constant;_Vector11;Vector 0;38;0;Create;True;0;0;0;False;0;False;2,3;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;767;2251.573,-307.925;Inherit;False;Property;_DiscardUVTile12;Discard UV Tile 1,2;22;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;207;2353.001,-233.3764;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;635;2382.081,-156.652;Inherit;False;Constant;_Vector6;Vector 0;38;0;Create;True;0;0;0;False;0;False;1,2;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;636;2388.87,155.4928;Inherit;False;Constant;_Vector7;Vector 0;38;0;Create;True;0;0;0;False;0;False;1,3;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;208;2361.729,79.19774;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;768;2260.751,5.167598;Inherit;False;Property;_DiscardUVTile13;Discard UV Tile 1,3;23;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;801;4579.42,-570.3809;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;802;4497.627,-688.764;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;222;4161.278,-1049.713;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;192;4390.601,-1188.976;Inherit;False;UVTileDiscard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;191;4249.063,-1173.994;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;245;5241.74,-922.281;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;247;5375.179,-946.2517;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;248;5375.179,-850.2518;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;249;5333.789,-1021.623;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;252;5271.327,-472.0491;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;253;5404.764,-496.0198;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;254;5404.764,-400.0198;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;255;5363.374,-571.3915;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;258;5011.327,-475.0491;Inherit;False;Property;_UVRangeDiscard2Range;UV Range Discard 2 Range;36;0;Create;True;0;0;0;False;0;False;0,0,1,1;0,0,1,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;259;5334.241,14.65262;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;260;5467.679,-9.317484;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;261;5467.679,86.68251;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;262;5426.288,-84.68938;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;264;5074.242,11.65262;Inherit;False;Property;_UVRangeDiscard3Range;UV Range Discard 3 Range;37;0;Create;True;0;0;0;False;0;False;0,0,1,1;0,0,1,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;266;5958.68,-614.4764;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;709;5558.698,-1045.453;Inherit;False;UV Range Discard;-1;;250;59eaa82e4bf18fa44b47aa07cd25b8a2;0;4;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;12;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;710;5588.283,-595.2204;Inherit;False;UV Range Discard;-1;;251;59eaa82e4bf18fa44b47aa07cd25b8a2;0;4;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;12;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;711;5651.197,-108.5184;Inherit;False;UV Range Discard;-1;;252;59eaa82e4bf18fa44b47aa07cd25b8a2;0;4;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;12;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;246;4981.741,-925.281;Inherit;False;Property;_UVRangeDiscard1Range;UV Range Discard 1 Range;35;0;Create;True;3;UV Range Discard;X and Y are Start UVs;Z and W are End UVs;0;0;False;0;False;0,0,1,1;0,0,1,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;466;5261.058,-1129.487;Inherit;False;Property;_UVRangeDiscard1;UV Range Discard 1;32;2;[Header];[ToggleUI];Create;True;3;UV Range Discard;X and Y are Start UVs;Z and W are End UVs;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;778;5250.409,-696.8858;Inherit;False;Property;_UVRangeDiscard2;UV Range Discard 2;34;1;[ToggleUI];Create;True;3;UV Range Discard;X and Y are Start UVs;Z and W are End UVs;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;779;5313.231,-188.0279;Inherit;False;Property;_UVRangeDiscard3;UV Range Discard 3;33;1;[ToggleUI];Create;True;3;UV Range Discard;X and Y are Start UVs;Z and W are End UVs;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;267;6089.752,-618.9073;Inherit;False;UVRangeDiscard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;728;4128.448,-1833.351;Inherit;False;267;UVRangeDiscard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;729;4130.826,-1733.785;Inherit;False;192;UVTileDiscard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;731;4354.827,-1783.785;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;730;4480.827,-1793.785;Inherit;False;UVDiscard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;804;2566.127,-818.3905;Inherit;False;UV Tile Discard;-1;;274;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;805;3347.481,-781.8707;Inherit;False;UV Tile Discard;-1;;275;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;806;1803.251,-596.9982;Inherit;False;UV Tile Discard;-1;;276;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;807;1785.751,-378.5684;Inherit;False;UV Tile Discard;-1;;277;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;808;1793.151,-18.96954;Inherit;False;UV Tile Discard;-1;;278;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;809;2535.103,-558.2587;Inherit;False;UV Tile Discard;-1;;279;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;810;4111.194,-549.4994;Inherit;False;UV Tile Discard;-1;;280;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;811;4146.207,-244.9378;Inherit;False;UV Tile Discard;-1;;281;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;812;4104.421,78.95988;Inherit;False;UV Tile Discard;-1;;282;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;813;3330.537,-609.8447;Inherit;False;UV Tile Discard;-1;;283;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;814;3352.062,-280.4475;Inherit;False;UV Tile Discard;-1;;284;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;815;3339.263,55.05388;Inherit;False;UV Tile Discard;-1;;285;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;816;2536.623,-252.0813;Inherit;False;UV Tile Discard;-1;;286;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;817;2532.193,51.46117;Inherit;False;UV Tile Discard;-1;;287;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;818;1813.015,-855.9457;Inherit;False;UV Tile Discard;-1;;288;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformPositionNode;389;752.4302,-8004.112;Inherit;False;Object;World;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BreakToComponentsNode;404;997.5742,-7044.284;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.IndirectSpecularLight;405;1187.337,-7042.669;Inherit;False;Tangent;3;0;FLOAT3;0,0,1;False;1;FLOAT;0.5;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;409;960.5154,-7150.911;Inherit;False;35;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;426;1225.776,-6915.087;Inherit;False;424;_FlatLightResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;397;1175.172,-7182.358;Inherit;False;354;mainTexClamped;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;425;1183.919,-7258.461;Inherit;False;424;_FlatLightResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;410;1404.297,-7222.531;Inherit;False;2;2;0;COLOR;1,1,1,0;False;1;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;402;1591.416,-7135.366;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;387;1007.652,-7899.333;Half;False;Property;_MaxFlatLightDistance;Max Flat Light Distance;1;1;[Header];Create;True;1;Flat Light Settings;0;0;False;0;False;8;8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FogAndAmbientColorsNode;438;1058.947,-6827.33;Inherit;False;unity_FogColor;0;1;COLOR;0
Node;AmplifyShaderEditor.FogParamsNode;437;1062.668,-6747.122;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;439;1349.947,-6776.33;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;406;1434.051,-7065.175;Inherit;False;3;3;0;FLOAT;1;False;1;FLOAT3;0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;427;1164.1,-7082.048;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;428;1371.1,-7075.048;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;414;1867.325,-8682.774;Inherit;False;FlatLightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;443;1729.772,-8676.031;Inherit;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;434;1558.217,-8610.41;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;411;1752.106,-7137.271;Inherit;False;Lighting_Flat;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;445;1368.858,-8539.796;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;435;1077.118,-8536.489;Inherit;False;Property;_FlatLightStrength;Flat Light Strength;2;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;413;1373.774,-8683.731;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;738;839.6492,-7748.976;Inherit;False;Constant;_Constant1;Constant 1;38;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;403;824.8152,-7041.998;Inherit;False;90;multiMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;749;229.0901,-6881.071;Inherit;False;90;multiMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;754;424.319,-6876.584;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RegisterLocalVarNode;753;555.5934,-6924.832;Inherit;False;_Metalic;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;755;564.5695,-6822.729;Inherit;False;_Smoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;424;1606.256,-7588.432;Inherit;False;_FlatLightResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;399;1316.353,-7576.651;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;390;744.4302,-7843.2;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.DistanceOpNode;383;1008.43,-8004.112;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;385;1621.506,-8000.854;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;384;1289.408,-8006.284;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;5;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;785;1761.492,-7930.549;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;784;1524.739,-7926.204;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;786;1040.369,-7825.202;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;787;1669.181,-7768.732;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;393;1062.964,-7797.667;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;401;750.1711,-7318.008;Inherit;False;35;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IndirectDiffuseLighting;400;920.5493,-7297.232;Inherit;False;World;1;0;FLOAT3;0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FogAndAmbientColorsNode;396;924.7703,-7379.309;Inherit;False;unity_AmbientSky;0;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;391;493.05,-7536.4;Inherit;False;414;FlatLightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;789;1259.961,-7775.623;Inherit;False;_FlatLightModel;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;798;424.9152,-7625.68;Inherit;False;789;_FlatLightModel;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;783;1538.653,-7884.126;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;10000;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;794;449.014,-7834.354;Inherit;False;793;LightType;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;398;855.7283,-7607.893;Inherit;False;2;2;0;FLOAT;1;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;761;983.3992,-7603.577;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightAttenuation;788;268.4642,-7722.41;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;799;479.6798,-7748.928;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;791;671.9133,-7701.873;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;2;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomStandardSurface;303;-534.9931,-8657.079;Inherit;False;Metallic;Tangent;6;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,1;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;304;-838.9915,-8721.079;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;305;-838.9915,-8561.079;Inherit;False;29;EmissionFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;306;-822.9915,-8641.079;Inherit;False;35;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;307;-838.9915,-8481.079;Inherit;True;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;308;-1046.992,-8561.079;Inherit;False;90;multiMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;309;-246.9931,-8657.079;Inherit;False;Lighting_Standard;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;353;2689.066,-6776.666;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;354;3154.545,-6802.529;Inherit;False;mainTexClamped;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;352;2862.476,-6819.548;Inherit;True;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;3;COLOR;0.01,0.01,0.01,0;False;4;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;819;4142.573,-783.9061;Inherit;False;UV Tile Discard;-1;;289;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;331;1986.247,-5673.675;Inherit;False;Property;_LightingType;Lighting Type;0;1;[Enum];Create;True;0;3;Standard;0;Flat Lit;1;Flat Shade;2;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareWithRange;800;2230.054,-5651.813;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;2;False;3;COLOR;0,0,0,0;False;4;FLOAT3;0,0,0;False;1;COLOR;0
WireConnection;50;0;49;0
WireConnection;90;0;91;0
WireConnection;69;0;195;0
WireConnection;69;1;68;0
WireConnection;70;0;69;0
WireConnection;74;0;71;0
WireConnection;74;1;73;0
WireConnection;77;0;75;0
WireConnection;77;1;76;0
WireConnection;79;0;78;0
WireConnection;79;1;80;0
WireConnection;82;0;81;0
WireConnection;82;1;83;0
WireConnection;84;0;74;0
WireConnection;84;1;77;0
WireConnection;84;2;79;0
WireConnection;84;3;82;0
WireConnection;39;0;40;0
WireConnection;119;0;121;0
WireConnection;121;0;118;0
WireConnection;121;1;120;0
WireConnection;11;0;10;0
WireConnection;13;0;11;0
WireConnection;14;1;12;0
WireConnection;15;0;13;0
WireConnection;15;1;14;0
WireConnection;16;0;88;0
WireConnection;88;0;15;0
WireConnection;88;1;87;0
WireConnection;10;0;8;0
WireConnection;10;1;9;0
WireConnection;9;0;7;0
WireConnection;8;1;4;0
WireConnection;115;0;16;0
WireConnection;115;1;114;0
WireConnection;114;1;112;0
WireConnection;114;2;113;0
WireConnection;58;0;194;0
WireConnection;58;1;41;0
WireConnection;61;0;417;0
WireConnection;63;0;196;0
WireConnection;63;1;62;0
WireConnection;64;0;63;0
WireConnection;66;0;197;0
WireConnection;66;1;65;0
WireConnection;67;0;66;0
WireConnection;194;14;42;0
WireConnection;194;15;51;0
WireConnection;195;14;45;0
WireConnection;195;15;57;0
WireConnection;196;14;43;0
WireConnection;196;15;55;0
WireConnection;0;0;33;0
WireConnection;0;2;32;0
WireConnection;0;13;332;0
WireConnection;0;11;193;0
WireConnection;95;0;92;0
WireConnection;200;0;199;0
WireConnection;49;0;48;0
WireConnection;48;0;243;0
WireConnection;116;0;334;0
WireConnection;334;0;333;0
WireConnection;334;1;115;0
WireConnection;85;0;416;0
WireConnection;416;0;415;0
WireConnection;416;1;84;0
WireConnection;417;0;124;0
WireConnection;417;2;58;0
WireConnection;417;3;194;0
WireConnection;197;14;44;0
WireConnection;197;15;56;0
WireConnection;30;0;86;0
WireConnection;30;1;122;0
WireConnection;30;2;28;0
WireConnection;29;0;30;0
WireConnection;26;0;25;0
WireConnection;35;0;34;0
WireConnection;25;0;736;0
WireConnection;34;0;737;0
WireConnection;219;0;218;0
WireConnection;793;0;331;0
WireConnection;330;0;800;0
WireConnection;149;0;818;0
WireConnection;149;1;806;0
WireConnection;149;2;807;0
WireConnection;149;3;808;0
WireConnection;154;0;804;0
WireConnection;154;1;809;0
WireConnection;154;2;816;0
WireConnection;154;3;817;0
WireConnection;167;0;805;0
WireConnection;167;1;813;0
WireConnection;167;2;814;0
WireConnection;167;3;815;0
WireConnection;180;0;819;0
WireConnection;180;1;810;0
WireConnection;180;2;811;0
WireConnection;180;3;812;0
WireConnection;225;0;149;0
WireConnection;223;0;167;0
WireConnection;224;0;154;0
WireConnection;801;0;180;0
WireConnection;802;0;801;0
WireConnection;222;0;802;0
WireConnection;192;0;191;0
WireConnection;191;0;225;0
WireConnection;191;1;224;0
WireConnection;191;2;223;0
WireConnection;191;3;222;0
WireConnection;245;0;246;0
WireConnection;247;0;245;0
WireConnection;247;1;245;1
WireConnection;248;0;245;2
WireConnection;248;1;245;3
WireConnection;252;0;258;0
WireConnection;253;0;252;0
WireConnection;253;1;252;1
WireConnection;254;0;252;2
WireConnection;254;1;252;3
WireConnection;259;0;264;0
WireConnection;260;0;259;0
WireConnection;260;1;259;1
WireConnection;261;0;259;2
WireConnection;261;1;259;3
WireConnection;266;0;709;0
WireConnection;266;1;710;0
WireConnection;266;2;711;0
WireConnection;709;21;466;0
WireConnection;709;6;249;0
WireConnection;709;10;247;0
WireConnection;709;12;248;0
WireConnection;710;21;778;0
WireConnection;710;6;255;0
WireConnection;710;10;253;0
WireConnection;710;12;254;0
WireConnection;711;21;779;0
WireConnection;711;6;262;0
WireConnection;711;10;260;0
WireConnection;711;12;261;0
WireConnection;267;0;266;0
WireConnection;731;0;728;0
WireConnection;731;1;729;0
WireConnection;730;0;731;0
WireConnection;804;21;765;0
WireConnection;804;6;205;0
WireConnection;804;10;633;0
WireConnection;805;21;770;0
WireConnection;805;6;209;0
WireConnection;805;10;637;0
WireConnection;806;21;762;0
WireConnection;806;6;202;0
WireConnection;806;10;630;0
WireConnection;807;21;763;0
WireConnection;807;6;203;0
WireConnection;807;10;631;0
WireConnection;808;21;764;0
WireConnection;808;6;204;0
WireConnection;808;10;632;0
WireConnection;809;21;766;0
WireConnection;809;6;206;0
WireConnection;809;10;634;0
WireConnection;810;21;775;0
WireConnection;810;6;214;0
WireConnection;810;10;642;0
WireConnection;811;21;776;0
WireConnection;811;6;215;0
WireConnection;811;10;643;0
WireConnection;812;21;777;0
WireConnection;812;6;216;0
WireConnection;812;10;644;0
WireConnection;813;21;771;0
WireConnection;813;6;210;0
WireConnection;813;10;638;0
WireConnection;814;21;772;0
WireConnection;814;6;211;0
WireConnection;814;10;639;0
WireConnection;815;21;773;0
WireConnection;815;6;212;0
WireConnection;815;10;640;0
WireConnection;816;21;767;0
WireConnection;816;6;207;0
WireConnection;816;10;635;0
WireConnection;817;21;768;0
WireConnection;817;6;208;0
WireConnection;817;10;636;0
WireConnection;818;21;270;0
WireConnection;818;6;198;0
WireConnection;818;10;629;0
WireConnection;404;0;403;0
WireConnection;405;0;409;0
WireConnection;405;1;404;1
WireConnection;410;0;425;0
WireConnection;410;1;397;0
WireConnection;402;0;410;0
WireConnection;402;1;406;0
WireConnection;439;0;437;4
WireConnection;439;1;438;0
WireConnection;406;0;428;0
WireConnection;406;1;405;0
WireConnection;406;2;426;0
WireConnection;427;0;404;0
WireConnection;428;0;427;0
WireConnection;414;0;443;0
WireConnection;443;0;413;0
WireConnection;443;1;434;0
WireConnection;434;0;413;2
WireConnection;434;1;445;0
WireConnection;411;0;402;0
WireConnection;445;0;435;0
WireConnection;754;0;749;0
WireConnection;753;0;754;0
WireConnection;755;0;754;1
WireConnection;424;0;399;0
WireConnection;399;0;761;0
WireConnection;399;1;396;0
WireConnection;399;2;400;0
WireConnection;383;0;389;0
WireConnection;383;1;390;1
WireConnection;385;0;384;0
WireConnection;384;0;383;0
WireConnection;384;2;387;0
WireConnection;785;0;385;0
WireConnection;784;0;785;0
WireConnection;786;0;787;0
WireConnection;787;0;783;0
WireConnection;393;0;390;2
WireConnection;393;1;738;0
WireConnection;393;2;786;0
WireConnection;393;3;738;0
WireConnection;400;0;401;0
WireConnection;789;0;393;0
WireConnection;783;0;784;0
WireConnection;398;0;791;0
WireConnection;398;1;391;0
WireConnection;761;0;398;0
WireConnection;799;0;788;0
WireConnection;791;0;794;0
WireConnection;791;2;799;0
WireConnection;791;3;798;0
WireConnection;303;0;304;0
WireConnection;303;1;306;0
WireConnection;303;2;305;0
WireConnection;303;3;307;0
WireConnection;303;4;307;1
WireConnection;307;0;308;0
WireConnection;309;0;303;0
WireConnection;354;0;352;0
WireConnection;352;0;353;0
WireConnection;819;21;774;0
WireConnection;819;6;213;0
WireConnection;819;10;641;0
WireConnection;800;0;331;0
WireConnection;800;3;329;0
WireConnection;800;4;328;0
ASEEND*/
//CHKSM=3AD00D196C5F42FEC54291FA53ECF6D939B20810