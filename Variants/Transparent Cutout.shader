// Made with Amplify Shader Editor v1.9.9
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VoyVivika/VivikaShader/Vivika Shader Transparent Cutout"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		[Enum(Off,0,Front,1,Back,2)] _CullMode( "Cull Mode", Float ) = 0
		[SingleLineTexture] _MainTex( "Albedo", 2D ) = "white" {}
		_Color( "Color", Color ) = ( 1, 1, 1, 0 )
		[SingleLineTexture] _BumpMap( "Normal Map", 2D ) = "bump" {}
		_Emission( "Emission", 2D ) = "black" {}
		_EmissionColor( "Emission Color", Color ) = ( 0, 0, 0, 0 )
		_MinBrightness( "Min Brightness", Range( 0, 1 ) ) = 0
		_IndirectDiffuseOffset( "Indirect Light Min", Range( 0, 1 ) ) = 0
		_IndirectDiffuseOffsetMax( "Indirect Light Max", Range( 0, 1 ) ) = 0
		[ToggleUI] _IndirLightUseMinforMax( "Use Min for Max", Float ) = 1
		[ToggleUI] _ClampRealtimeLighting( "Relative Clamp Realtime Lighting", Float ) = 0
		_RealtimeLightMax( "Relative Real Light Max", Range( 0, 1 ) ) = 0
		_RealtimeLightMin( "Relative Real Light Min", Range( 0, 1 ) ) = 0
		[Enum(Clamp,0,Remap,1)] _IndirectLimiterMode( "Indirect Limiter Mode", Float ) = 0
		_WrappedShadingValue( "Wrapped Shading Value", Float ) = 1
		_WrapIndirScale( "Indirect Light Scale", Float ) = 3
		[SingleLineTexture] _MetallicGlossMap( "Metallic Smoothness", 2D ) = "black" {}
		[Enum(Alpha,0,Green,1)] _SmoothnessChannel( "Smoothness Channel", Float ) = 0
		[ToggleUI] _MetallicReflectionMode( "Fresnel Metallics (Experimental)", Float ) = 0
		_AmbientOcclusion( "Ambient Occlusion", 2D ) = "white" {}
		_AOStrength( "AO Strength", Range( 0, 1 ) ) = 1
		[ToggleUI] _RealAO( "Real AO", Float ) = 0
		[Header(AudioLink)][ToggleUI] _EnableAudioLink( "Enable AudioLink", Range( 0, 1 ) ) = 0
		[ToggleUI] _ALEmitifInactive( "AL Emit if Inactive", Float ) = 0
		_AL_Mask( "AudioLink Mask", 2D ) = "black" {}
		[SingleLineTexture] _ALDelayMap( "AudioLink Delay Tex Map", 2D ) = "black" {}
		[Enum(UV0,0,UV1,1,UV2,2,UV3,3,Screen Space,8)] _ALDelayUVMap( "AL Delay UV Map", Float ) = 2
		_ALUVDelayMaxDelay( "AL UV Delay Max Delay", Range( 0, 127 ) ) = 0
		_ALTimeScale( "AL HueShift Time Scale", Float ) = 0
		[ToggleUI] _EnableRimLighting( "Enable Rim Lighting", Range( 0, 1 ) ) = 1
		_RimPower( "Rim Power", Range( 0, 10 ) ) = 2.07
		_RimEnergy( "Rim Energy", Range( 0, 1 ) ) = 0.345
		_RimBaseColorStrength( "Rim Base Color Strength", Range( 0, 1 ) ) = 1
		[Header(UV Tile Discarding)][Enum(UV0,0,UV1,1,UV2,2,UV3,3)] _DiscardUVMap( "Discard UV Map", Float ) = 1
		[ToggleUI] _UDIMDiscardRow0_0( "Discard UV Row 0,0", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow1_0( "Discard UV Row 1,0", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow2_0( "Discard UV Row 2,0", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow3_0( "Discard UV Row 3,0", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow0_1( "Discard UV Row 0,1", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow1_1( "Discard UV Row 1,1", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow2_1( "Discard UV Row 2,1", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow3_1( "Discard UV Row 3,1", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow0_2( "Discard UV Row 0,2", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow1_2( "Discard UV Row 1,2", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow2_2( "Discard UV Row 2,2", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow3_2( "Discard UV Row 3,2", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow0_3( "Discard UV Row 0,3", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow1_3( "Discard UV Row 1,3", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow2_3( "Discard UV Tile 2,3", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardRow3_3( "Discard UV Row 3,3", Range( 0, 1 ) ) = 0
		[ToggleUI] _UDIMDiscardAll( "Discard All", Float ) = 0
		[SingleLineTexture] _EmissionMap( "Fallback Emission Map", 2D ) = "white" {}
		[ToggleUI] _DontRenderInSocialVRCameras( "Don't Render in Social VR Cameras", Float ) = 0
		[ToggleUI] _DontRenderinSocialVRMirrors( "Don't Render in Social VR Mirrors", Float ) = 0
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord4( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  "VRCFallback"="DoubleSided" }
		Cull [_CullMode]
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#define ASE_VERSION 19900
		#include "..\Libs\AudioLink\AudioLink.cginc"
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
			float2 uv2_texcoord2;
			float2 uv3_texcoord3;
			float2 uv4_texcoord4;
			float4 screenPosition;
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
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

		uniform float _CullMode;
		uniform sampler2D _EmissionMap;
		uniform float _UDIMDiscardRow0_0;
		uniform float _DiscardUVMap;
		uniform float _UDIMDiscardRow1_0;
		uniform float _UDIMDiscardRow2_0;
		uniform float _UDIMDiscardRow3_0;
		uniform float _UDIMDiscardRow0_1;
		uniform float _UDIMDiscardRow1_1;
		uniform float _UDIMDiscardRow2_1;
		uniform float _UDIMDiscardRow3_1;
		uniform float _UDIMDiscardRow0_2;
		uniform float _UDIMDiscardRow1_2;
		uniform float _UDIMDiscardRow2_2;
		uniform float _UDIMDiscardRow3_2;
		uniform float _UDIMDiscardRow0_3;
		uniform float _UDIMDiscardRow1_3;
		uniform float _UDIMDiscardRow2_3;
		uniform float _UDIMDiscardRow3_3;
		uniform float _VRChatCameraMode;
		uniform float CVRRenderingCam;
		uniform float _DontRenderInSocialVRCameras;
		uniform float _VRChatMirrorMode;
		uniform float _DontRenderinSocialVRMirrors;
		uniform float _UDIMDiscardAll;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform sampler2D _AmbientOcclusion;
		uniform float4 _AmbientOcclusion_ST;
		uniform float _AOStrength;
		uniform float _RealAO;
		uniform float4 _Color;
		uniform half _EnableAudioLink;
		uniform sampler2D _AL_Mask;
		uniform float4 _AL_Mask_ST;
		uniform float _ALTimeScale;
		uniform sampler2D _ALDelayMap;
		uniform float _ALDelayUVMap;
		uniform float _ALUVDelayMaxDelay;
		uniform float _ALEmitifInactive;
		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;
		uniform float4 _EmissionColor;
		uniform half _EnableRimLighting;
		uniform sampler2D _BumpMap;
		uniform float4 _BumpMap_ST;
		uniform float _RimPower;
		uniform float _RimEnergy;
		uniform float _RimBaseColorStrength;
		uniform float _IndirectDiffuseOffsetMax;
		uniform float _IndirectDiffuseOffset;
		uniform float _IndirLightUseMinforMax;
		uniform float _WrappedShadingValue;
		uniform float _RealtimeLightMin;
		uniform float _RealtimeLightMax;
		uniform float _ClampRealtimeLighting;
		uniform float _IndirectLimiterMode;
		uniform float _WrapIndirScale;
		uniform float _MinBrightness;
		uniform sampler2D _MetallicGlossMap;
		uniform float4 _MetallicGlossMap_ST;
		uniform float _SmoothnessChannel;
		uniform float _MetallicReflectionMode;
		uniform float _Cutoff = 0.5;


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

		inline float AudioLinkData3_g1396( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1398(  )
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


		inline float AudioLinkData3_g1380( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1382(  )
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


		inline float AudioLinkData3_g1385( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1387(  )
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


		inline float AudioLinkData3_g1390( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1392(  )
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


		float IfAudioLinkv2Exists1_g1393(  )
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


		float3 ShadeSH97_g1357( float4 Normal )
		{
			return ShadeSH9(Normal);
		}


		float4 ASEScreenPositionNormalizedToPixel( float4 screenPosNorm, float4 screenParams )
		{
			float4 screenPosPixel = screenPosNorm * float4( screenParams.xy, 1, 1 );
			#if UNITY_UV_STARTS_AT_TOP
				screenPosPixel.xy = float2( screenPosPixel.x, ( _ProjectionParams.x < 0 ) ? screenParams.y - screenPosPixel.y : screenPosPixel.y );
			#else
				screenPosPixel.xy = float2( screenPosPixel.x, ( _ProjectionParams.x > 0 ) ? screenParams.y - screenPosPixel.y : screenPosPixel.y );
			#endif
			return screenPosPixel;
		}


		inline float Dither4x4Bayer( int x, int y )
		{
			const float dither[ 16 ] = {
			     1,  9,  3, 11,
			    13,  5, 15,  7,
			     4, 12,  2, 10,
			    16,  8, 14,  6 };
			int r = y * 4 + x;
			return dither[ r ] / 16; // same # of instructions as pre-dividing due to compiler magic
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 break63_g1506 = floor( float2( 0,0 ) );
			float temp_output_8_0_g1352 = 0.0;
			float temp_output_26_0_g1348 = _DiscardUVMap;
			float temp_output_7_0_g1352 = temp_output_26_0_g1348;
			float2 lerpResult6_g1352 = lerp( float2( 0,0 ) , v.texcoord.xy , ( step( temp_output_8_0_g1352 , temp_output_7_0_g1352 ) * step( temp_output_7_0_g1352 , temp_output_8_0_g1352 ) ));
			float temp_output_8_0_g1349 = 1.0;
			float temp_output_7_0_g1349 = temp_output_26_0_g1348;
			float2 lerpResult6_g1349 = lerp( float2( 0,0 ) , v.texcoord1.xy , ( step( temp_output_8_0_g1349 , temp_output_7_0_g1349 ) * step( temp_output_7_0_g1349 , temp_output_8_0_g1349 ) ));
			float temp_output_8_0_g1350 = 2.0;
			float temp_output_7_0_g1350 = temp_output_26_0_g1348;
			float2 lerpResult6_g1350 = lerp( float2( 0,0 ) , v.texcoord2.xy , ( step( temp_output_8_0_g1350 , temp_output_7_0_g1350 ) * step( temp_output_7_0_g1350 , temp_output_8_0_g1350 ) ));
			float temp_output_8_0_g1351 = 3.0;
			float temp_output_7_0_g1351 = temp_output_26_0_g1348;
			float2 lerpResult6_g1351 = lerp( float2( 0,0 ) , v.texcoord3.xy , ( step( temp_output_8_0_g1351 , temp_output_7_0_g1351 ) * step( temp_output_7_0_g1351 , temp_output_8_0_g1351 ) ));
			float2 DiscardUV200 = ( lerpResult6_g1352 + lerpResult6_g1349 + lerpResult6_g1350 + lerpResult6_g1351 );
			float2 temp_output_99_0_g1490 = DiscardUV200;
			float2 break61_g1506 = temp_output_99_0_g1490;
			float2 break63_g1504 = floor( float2( 0,1 ) );
			float2 break61_g1504 = temp_output_99_0_g1490;
			float2 break63_g1502 = floor( float2( 0,2 ) );
			float2 break61_g1502 = temp_output_99_0_g1490;
			float2 break63_g1505 = floor( float2( 0,3 ) );
			float2 break61_g1505 = temp_output_99_0_g1490;
			float2 break63_g1503 = floor( float2( 1,0 ) );
			float2 break61_g1503 = temp_output_99_0_g1490;
			float2 break63_g1499 = floor( float2( 1,1 ) );
			float2 break61_g1499 = temp_output_99_0_g1490;
			float2 break63_g1500 = floor( float2( 1,2 ) );
			float2 break61_g1500 = temp_output_99_0_g1490;
			float2 break63_g1501 = floor( float2( 1,3 ) );
			float2 break61_g1501 = temp_output_99_0_g1490;
			float2 break63_g1498 = floor( float2( 2,0 ) );
			float2 break61_g1498 = temp_output_99_0_g1490;
			float2 break63_g1497 = floor( float2( 2,1 ) );
			float2 break61_g1497 = temp_output_99_0_g1490;
			float2 break63_g1496 = floor( float2( 2,2 ) );
			float2 break61_g1496 = temp_output_99_0_g1490;
			float2 break63_g1495 = floor( float2( 2,3 ) );
			float2 break61_g1495 = temp_output_99_0_g1490;
			float2 break63_g1491 = floor( float2( 3,0 ) );
			float2 break61_g1491 = temp_output_99_0_g1490;
			float2 break63_g1492 = floor( float2( 3,1 ) );
			float2 break61_g1492 = temp_output_99_0_g1490;
			float2 break63_g1493 = floor( float2( 3,2 ) );
			float2 break61_g1493 = temp_output_99_0_g1490;
			float2 break63_g1494 = floor( float2( 3,3 ) );
			float2 break61_g1494 = temp_output_99_0_g1490;
			float UVTileDiscard2691 = step( 1.0 , ( ( ( saturate( _UDIMDiscardRow0_0 ) * saturate( ( step( break63_g1506.x , break61_g1506.x ) * step( break61_g1506.x , ( break63_g1506.x + 0.9999999 ) ) * step( break63_g1506.y , break61_g1506.y ) * step( break61_g1506.y , ( break63_g1506.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_0 ) * saturate( ( step( break63_g1504.x , break61_g1504.x ) * step( break61_g1504.x , ( break63_g1504.x + 0.9999999 ) ) * step( break63_g1504.y , break61_g1504.y ) * step( break61_g1504.y , ( break63_g1504.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_0 ) * saturate( ( step( break63_g1502.x , break61_g1502.x ) * step( break61_g1502.x , ( break63_g1502.x + 0.9999999 ) ) * step( break63_g1502.y , break61_g1502.y ) * step( break61_g1502.y , ( break63_g1502.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_0 ) * saturate( ( step( break63_g1505.x , break61_g1505.x ) * step( break61_g1505.x , ( break63_g1505.x + 0.9999999 ) ) * step( break63_g1505.y , break61_g1505.y ) * step( break61_g1505.y , ( break63_g1505.y + 0.9999999 ) ) ) ) ) ) + ( ( saturate( _UDIMDiscardRow0_1 ) * saturate( ( step( break63_g1503.x , break61_g1503.x ) * step( break61_g1503.x , ( break63_g1503.x + 0.9999999 ) ) * step( break63_g1503.y , break61_g1503.y ) * step( break61_g1503.y , ( break63_g1503.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_1 ) * saturate( ( step( break63_g1499.x , break61_g1499.x ) * step( break61_g1499.x , ( break63_g1499.x + 0.9999999 ) ) * step( break63_g1499.y , break61_g1499.y ) * step( break61_g1499.y , ( break63_g1499.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_1 ) * saturate( ( step( break63_g1500.x , break61_g1500.x ) * step( break61_g1500.x , ( break63_g1500.x + 0.9999999 ) ) * step( break63_g1500.y , break61_g1500.y ) * step( break61_g1500.y , ( break63_g1500.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_1 ) * saturate( ( step( break63_g1501.x , break61_g1501.x ) * step( break61_g1501.x , ( break63_g1501.x + 0.9999999 ) ) * step( break63_g1501.y , break61_g1501.y ) * step( break61_g1501.y , ( break63_g1501.y + 0.9999999 ) ) ) ) ) ) + ( ( saturate( _UDIMDiscardRow0_2 ) * saturate( ( step( break63_g1498.x , break61_g1498.x ) * step( break61_g1498.x , ( break63_g1498.x + 0.9999999 ) ) * step( break63_g1498.y , break61_g1498.y ) * step( break61_g1498.y , ( break63_g1498.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_2 ) * saturate( ( step( break63_g1497.x , break61_g1497.x ) * step( break61_g1497.x , ( break63_g1497.x + 0.9999999 ) ) * step( break63_g1497.y , break61_g1497.y ) * step( break61_g1497.y , ( break63_g1497.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_2 ) * saturate( ( step( break63_g1496.x , break61_g1496.x ) * step( break61_g1496.x , ( break63_g1496.x + 0.9999999 ) ) * step( break63_g1496.y , break61_g1496.y ) * step( break61_g1496.y , ( break63_g1496.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_2 ) * saturate( ( step( break63_g1495.x , break61_g1495.x ) * step( break61_g1495.x , ( break63_g1495.x + 0.9999999 ) ) * step( break63_g1495.y , break61_g1495.y ) * step( break61_g1495.y , ( break63_g1495.y + 0.9999999 ) ) ) ) ) ) + ( ( saturate( _UDIMDiscardRow0_3 ) * saturate( ( step( break63_g1491.x , break61_g1491.x ) * step( break61_g1491.x , ( break63_g1491.x + 0.9999999 ) ) * step( break63_g1491.y , break61_g1491.y ) * step( break61_g1491.y , ( break63_g1491.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_3 ) * saturate( ( step( break63_g1492.x , break61_g1492.x ) * step( break61_g1492.x , ( break63_g1492.x + 0.9999999 ) ) * step( break63_g1492.y , break61_g1492.y ) * step( break61_g1492.y , ( break63_g1492.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_3 ) * saturate( ( step( break63_g1493.x , break61_g1493.x ) * step( break61_g1493.x , ( break63_g1493.x + 0.9999999 ) ) * step( break63_g1493.y , break61_g1493.y ) * step( break61_g1493.y , ( break63_g1493.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_3 ) * saturate( ( step( break63_g1494.x , break61_g1494.x ) * step( break61_g1494.x , ( break63_g1494.x + 0.9999999 ) ) * step( break63_g1494.y , break61_g1494.y ) * step( break61_g1494.y , ( break63_g1494.y + 0.9999999 ) ) ) ) ) ) ) );
			float vrc_camera2658 = _VRChatCameraMode;
			float temp_output_8_0_g1260 = 1.0;
			float cvr_camera2649 = CVRRenderingCam;
			float temp_output_7_0_g1260 = cvr_camera2649;
			float lerpResult6_g1260 = lerp( 0.0 , 1.0 , ( step( temp_output_8_0_g1260 , temp_output_7_0_g1260 ) * step( temp_output_7_0_g1260 , temp_output_8_0_g1260 ) ));
			float Dont_Render_in_Social_VR_Camera_Result2674 = ( step( 1.0 , ( vrc_camera2658 + lerpResult6_g1260 ) ) * _DontRenderInSocialVRCameras );
			float vrc_mirror2659 = _VRChatMirrorMode;
			float temp_output_8_0_g1300 = 2.0;
			float temp_output_7_0_g1300 = cvr_camera2649;
			float lerpResult6_g1300 = lerp( 0.0 , 1.0 , ( step( temp_output_8_0_g1300 , temp_output_7_0_g1300 ) * step( temp_output_7_0_g1300 , temp_output_8_0_g1300 ) ));
			float Dont_Render_in_Social_VR_Mirror_Result2675 = ( step( 1.0 , ( vrc_mirror2659 + lerpResult6_g1300 ) ) * _DontRenderinSocialVRMirrors );
			float3 temp_cast_0 = (( 0.0 / 0.0 )).xxx;
			float3 ase_positionOS = v.vertex.xyz;
			float3 Vertex_Position2646 = ase_positionOS;
			float3 Discard_Vertex2687 = ( saturate( ( UVTileDiscard2691 + Dont_Render_in_Social_VR_Camera_Result2674 + Dont_Render_in_Social_VR_Mirror_Result2675 + _UDIMDiscardAll ) ) == 1.0 ? temp_cast_0 : Vertex_Position2646 );
			v.vertex.xyz += Discard_Vertex2687;
			v.vertex.w = 1;
			float4 ase_positionSS = ComputeScreenPos( UnityObjectToClipPos( v.vertex ) );
			o.screenPosition = ase_positionSS;
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
			float4 ase_positionSS = i.screenPosition;
			float4 ase_positionSSNorm = ase_positionSS / ase_positionSS.w;
			ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
			float4 ase_positionSS_Pixel = ASEScreenPositionNormalizedToPixel( ase_positionSSNorm, _ScreenParams );
			float dither2637 = Dither4x4Bayer( fmod( ase_positionSS_Pixel.x, 4 ), fmod( ase_positionSS_Pixel.y, 4 ) );
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 tex2DNode25 = tex2D( _MainTex, uv_MainTex );
			float alpha2635 = tex2DNode25.a;
			dither2637 = step( dither2637, saturate( alpha2635 * 1.00001 ) );
			float3 ase_positionWS = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_lightDirWS = 0;
			#else //aseld
			float3 ase_lightDirWS = normalize( UnityWorldSpaceLightDir( ase_positionWS ) );
			#endif //aseld
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 normalMap1002 = UnpackNormal( tex2D( _BumpMap, uv_BumpMap ) );
			float3 temp_output_11_0_g1353 = normalMap1002;
			float3 temp_output_2_0_g1354 = temp_output_11_0_g1353;
			float dotResult3_g1356 = dot( ase_lightDirWS , (WorldNormalVector( i , temp_output_2_0_g1354 )) );
			float temp_output_5_0_g1355 = _WrappedShadingValue;
			float temp_output_15_0_g1354 = saturate( saturate( ase_lightAtten ) );
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float4 temp_output_43_0_g1354 = saturate( ase_lightColor );
			float4 temp_output_23_0_g1354 = saturate( ( temp_output_43_0_g1354 * temp_output_15_0_g1354 ) );
			float4 temp_output_78_0_g1354 = saturate( temp_output_43_0_g1354 );
			float4 temp_cast_16 = (_RealtimeLightMin).xxxx;
			float4 clampResult66_g1354 = clamp( temp_output_23_0_g1354 , ( temp_output_78_0_g1354 - temp_cast_16 ) , ( temp_output_78_0_g1354 + _RealtimeLightMax ) );
			float4 lerpResult72_g1354 = lerp( temp_output_23_0_g1354 , clampResult66_g1354 , _ClampRealtimeLighting);
			float3 temp_output_1_0_g1357 = temp_output_2_0_g1354;
			UnityGI gi2_g1357 = gi;
			float3 diffNorm2_g1357 = normalize( WorldNormalVector( i , temp_output_1_0_g1357 ) );
			gi2_g1357 = UnityGI_Base( data, 1, diffNorm2_g1357 );
			float3 indirectDiffuse2_g1357 = gi2_g1357.indirect.diffuse + diffNorm2_g1357 * 0.0001;
			float3 temp_output_34_0_g1357 = saturate( indirectDiffuse2_g1357 );
			float4 appendResult6_g1357 = (float4(( temp_output_1_0_g1357 * 0.3 ) , 1.0));
			float4 Normal7_g1357 = appendResult6_g1357;
			float3 localShadeSH97_g1357 = ShadeSH97_g1357( Normal7_g1357 );
			float temp_output_9_0_g1357 = _IndirectDiffuseOffset;
			float3 temp_cast_18 = (temp_output_9_0_g1357).xxx;
			float3 temp_output_15_0_g1357 = saturate( ( localShadeSH97_g1357 - temp_cast_18 ) );
			float temp_output_8_0_g1358 = 1.0;
			float temp_output_7_0_g1358 = _IndirLightUseMinforMax;
			float lerpResult6_g1358 = lerp( _IndirectDiffuseOffsetMax , temp_output_9_0_g1357 , ( step( temp_output_8_0_g1358 , temp_output_7_0_g1358 ) * step( temp_output_7_0_g1358 , temp_output_8_0_g1358 ) ));
			float temp_output_8_0_g1357 = lerpResult6_g1358;
			float3 temp_output_16_0_g1357 = saturate( ( localShadeSH97_g1357 + temp_output_8_0_g1357 ) );
			float3 clampResult17_g1357 = clamp( temp_output_34_0_g1357 , temp_output_15_0_g1357 , temp_output_16_0_g1357 );
			float3 lerpResult20_g1357 = lerp( clampResult17_g1357 ,  (temp_output_15_0_g1357 + ( temp_output_34_0_g1357 - float3( 0,0,0 ) ) * ( temp_output_16_0_g1357 - temp_output_15_0_g1357 ) / ( float3( 1,1,1 ) - float3( 0,0,0 ) ) ) , _IndirectLimiterMode);
			float4 color4_g1354 = IsGammaSpace() ? float4( 1, 1, 1, 0 ) : float4( 1, 1, 1, 0 );
			float4 temp_cast_20 = (1.0).xxxx;
			float4 temp_cast_21 = (_MinBrightness).xxxx;
			float4 color40_g1354 = IsGammaSpace() ? float4( 1, 1, 1, 1 ) : float4( 1, 1, 1, 1 );
			float4 clampResult37_g1354 = clamp( saturate( ( saturate( ( saturate( exp2( ( ( dotResult3_g1356 + temp_output_5_0_g1355 ) / ( 1.0 + temp_output_5_0_g1355 ) ) ) ) + saturate( exp2( temp_output_15_0_g1354 ) ) ) ) * saturate( ( lerpResult72_g1354 + saturate( (saturate( ( exp2( saturate( ( float4( lerpResult20_g1357 , 0.0 ) * color4_g1354 ) ) ) - temp_cast_20 ) )*_WrapIndirScale + 0.0) ) ) ) ) ) , temp_cast_21 , color40_g1354 );
			float4 color8_g891 = IsGammaSpace() ? float4( 1, 1, 1, 1 ) : float4( 1, 1, 1, 1 );
			float2 uv_AmbientOcclusion = i.uv_texcoord * _AmbientOcclusion_ST.xy + _AmbientOcclusion_ST.zw;
			float4 temp_output_3_0_g891 = ( 1.0 - ( ( 1.0 - tex2D( _AmbientOcclusion, uv_AmbientOcclusion ) ) * _AOStrength ) );
			float temp_output_9_0_g891 = _RealAO;
			float4 lerpResult5_g891 = lerp( color8_g891 , temp_output_3_0_g891 , temp_output_9_0_g891);
			float4 mainTex26 = ( tex2DNode25 * lerpResult5_g891 * _Color );
			float3 indirectNormal4_g1359 = normalize( WorldNormalVector( i , temp_output_11_0_g1353 ) );
			float2 uv_MetallicGlossMap = i.uv_texcoord * _MetallicGlossMap_ST.xy + _MetallicGlossMap_ST.zw;
			float4 tex2DNode1017 = tex2D( _MetallicGlossMap, uv_MetallicGlossMap );
			float lerpResult2718 = lerp( tex2DNode1017.a , tex2DNode1017.g , _SmoothnessChannel);
			float _Smoothness2716 = lerpResult2718;
			float temp_output_5_0_g1359 = _Smoothness2716;
			Unity_GlossyEnvironmentData g4_g1359 = UnityGlossyEnvironmentSetup( temp_output_5_0_g1359, data.worldViewDir, indirectNormal4_g1359, float3(0,0,0));
			float3 indirectSpecular4_g1359 = UnityGI_IndirectSpecular( data, 1.0, indirectNormal4_g1359, g4_g1359 );
			float _Metalic2715 = tex2DNode1017.r;
			float temp_output_10_0_g1359 = _Metalic2715;
			float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_positionWS );
			float3 ase_viewDirWS = normalize( ase_viewVectorWS );
			float3 ase_normalWS = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_normalWSNorm = normalize( ase_normalWS );
			float fresnelNdotV22_g1359 = dot( ase_normalWSNorm, ase_viewDirWS );
			float fresnelNode22_g1359 = ( temp_output_10_0_g1359 + ( temp_output_5_0_g1359 * 1.0 ) * pow( max( 1.0 - fresnelNdotV22_g1359 , 0.0001 ), 1.0 ) );
			float lerpResult35_g1359 = lerp( temp_output_10_0_g1359 , ( temp_output_5_0_g1359 * saturate( fresnelNode22_g1359 ) ) , _MetallicReflectionMode);
			float4 lerpResult21_g1359 = lerp( mainTex26 , float4( indirectSpecular4_g1359 , 0.0 ) , lerpResult35_g1359);
			float4 Lighting_Wrapped1144 = ( clampResult37_g1354 * lerpResult21_g1359 );
			c.rgb = Lighting_Wrapped1144.rgb;
			c.a = 1;
			clip( dither2637 - _Cutoff );
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
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 tex2DNode25 = tex2D( _MainTex, uv_MainTex );
			float4 color8_g891 = IsGammaSpace() ? float4( 1, 1, 1, 1 ) : float4( 1, 1, 1, 1 );
			float2 uv_AmbientOcclusion = i.uv_texcoord * _AmbientOcclusion_ST.xy + _AmbientOcclusion_ST.zw;
			float4 temp_output_3_0_g891 = ( 1.0 - ( ( 1.0 - tex2D( _AmbientOcclusion, uv_AmbientOcclusion ) ) * _AOStrength ) );
			float temp_output_9_0_g891 = _RealAO;
			float4 lerpResult5_g891 = lerp( color8_g891 , temp_output_3_0_g891 , temp_output_9_0_g891);
			float4 mainTex26 = ( tex2DNode25 * lerpResult5_g891 * _Color );
			o.Albedo = mainTex26.rgb;
			float2 uv_AL_Mask = i.uv_texcoord * _AL_Mask_ST.xy + _AL_Mask_ST.zw;
			float4 ALMask39 = tex2D( _AL_Mask, uv_AL_Mask );
			float4 temp_output_51_0_g1377 = ALMask39;
			float4 color42 = IsGammaSpace() ? float4( 1, 0, 0, 1 ) : float4( 1, 0, 0, 1 );
			float3 hsvTorgb4_g1395 = RGBToHSV( color42.rgb );
			float mulTime48 = _Time.y * _ALTimeScale;
			float Time50 = frac( mulTime48 );
			float temp_output_54_0_g1377 = Time50;
			float3 hsvTorgb8_g1395 = HSVToRGB( float3(( hsvTorgb4_g1395.x + temp_output_54_0_g1377 ),( hsvTorgb4_g1395.y + 0.0 ),( hsvTorgb4_g1395.z + 0.0 )) );
			float3 temp_output_5_0_g1394 = saturate( hsvTorgb8_g1395 );
			int Band3_g1396 = 0;
			float temp_output_8_0_g888 = 0.0;
			float temp_output_32_0_g885 = _ALDelayUVMap;
			float temp_output_7_0_g888 = temp_output_32_0_g885;
			float2 lerpResult6_g888 = lerp( float2( 0,0 ) , i.uv_texcoord , ( step( temp_output_8_0_g888 , temp_output_7_0_g888 ) * step( temp_output_7_0_g888 , temp_output_8_0_g888 ) ));
			float temp_output_8_0_g886 = 1.0;
			float temp_output_7_0_g886 = temp_output_32_0_g885;
			float2 lerpResult6_g886 = lerp( float2( 0,0 ) , i.uv2_texcoord2 , ( step( temp_output_8_0_g886 , temp_output_7_0_g886 ) * step( temp_output_7_0_g886 , temp_output_8_0_g886 ) ));
			float temp_output_8_0_g887 = 2.0;
			float temp_output_7_0_g887 = temp_output_32_0_g885;
			float2 lerpResult6_g887 = lerp( float2( 0,0 ) , i.uv3_texcoord3 , ( step( temp_output_8_0_g887 , temp_output_7_0_g887 ) * step( temp_output_7_0_g887 , temp_output_8_0_g887 ) ));
			float temp_output_8_0_g889 = 3.0;
			float temp_output_7_0_g889 = temp_output_32_0_g885;
			float2 lerpResult6_g889 = lerp( float2( 0,0 ) , i.uv4_texcoord4 , ( step( temp_output_8_0_g889 , temp_output_7_0_g889 ) * step( temp_output_7_0_g889 , temp_output_8_0_g889 ) ));
			float4 ase_positionSS = i.screenPosition;
			float4 ase_positionSSNorm = ase_positionSS / ase_positionSS.w;
			ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
			float2 appendResult18_g885 = (float2(ase_positionSSNorm.x , ase_positionSSNorm.y));
			float temp_output_8_0_g890 = 8.0;
			float temp_output_7_0_g890 = temp_output_32_0_g885;
			float2 lerpResult6_g890 = lerp( float2( 0,0 ) , appendResult18_g885 , ( step( temp_output_8_0_g890 , temp_output_7_0_g890 ) * step( temp_output_7_0_g890 , temp_output_8_0_g890 ) ));
			float2 DelayUV2355 = ( lerpResult6_g888 + lerpResult6_g886 + lerpResult6_g887 + lerpResult6_g889 + lerpResult6_g890 );
			float3 hsvTorgb2458 = RGBToHSV( tex2D( _ALDelayMap, DelayUV2355 ).rgb );
			float clampResult987 = clamp(  (0.0 + ( hsvTorgb2458.z - 0.0 ) * ( _ALUVDelayMaxDelay - 0.0 ) / ( 1.0 - 0.0 ) ) , 0.0 , 127.0 );
			float in_ALDelay991 = round( clampResult987 );
			int temp_output_55_0_g1377 = (int)in_ALDelay991;
			int Delay3_g1396 = temp_output_55_0_g1377;
			float localAudioLinkData3_g1396 = AudioLinkData3_g1396( Band3_g1396 , Delay3_g1396 );
			float temp_output_8_0_g1397 = 1.0;
			float localIfAudioLinkv2Exists1_g1398 = IfAudioLinkv2Exists1_g1398();
			float temp_output_7_0_g1397 = saturate( ( localIfAudioLinkv2Exists1_g1398 + 1.0 ) );
			float3 lerpResult6_g1397 = lerp( temp_output_5_0_g1394 , ( temp_output_5_0_g1394 * localAudioLinkData3_g1396 ) , ( step( temp_output_8_0_g1397 , temp_output_7_0_g1397 ) * step( temp_output_7_0_g1397 , temp_output_8_0_g1397 ) ));
			float4 color44 = IsGammaSpace() ? float4( 0, 0.8196079, 0, 1 ) : float4( 0, 0.637597, 0, 1 );
			float3 hsvTorgb4_g1379 = RGBToHSV( color44.rgb );
			float3 hsvTorgb8_g1379 = HSVToRGB( float3(( hsvTorgb4_g1379.x + temp_output_54_0_g1377 ),( hsvTorgb4_g1379.y + 0.0 ),( hsvTorgb4_g1379.z + 0.0 )) );
			float3 temp_output_5_0_g1378 = saturate( hsvTorgb8_g1379 );
			int Band3_g1380 = 2;
			int Delay3_g1380 = temp_output_55_0_g1377;
			float localAudioLinkData3_g1380 = AudioLinkData3_g1380( Band3_g1380 , Delay3_g1380 );
			float temp_output_8_0_g1381 = 1.0;
			float localIfAudioLinkv2Exists1_g1382 = IfAudioLinkv2Exists1_g1382();
			float temp_output_7_0_g1381 = saturate( ( localIfAudioLinkv2Exists1_g1382 + 0.0 ) );
			float3 lerpResult6_g1381 = lerp( temp_output_5_0_g1378 , ( temp_output_5_0_g1378 * localAudioLinkData3_g1380 ) , ( step( temp_output_8_0_g1381 , temp_output_7_0_g1381 ) * step( temp_output_7_0_g1381 , temp_output_8_0_g1381 ) ));
			float4 color43 = IsGammaSpace() ? float4( 1, 0.9294118, 0, 1 ) : float4( 1, 0.8468735, 0, 1 );
			float3 hsvTorgb4_g1384 = RGBToHSV( color43.rgb );
			float3 hsvTorgb8_g1384 = HSVToRGB( float3(( hsvTorgb4_g1384.x + temp_output_54_0_g1377 ),( hsvTorgb4_g1384.y + 0.0 ),( hsvTorgb4_g1384.z + 0.0 )) );
			float3 temp_output_5_0_g1383 = saturate( hsvTorgb8_g1384 );
			int Band3_g1385 = 1;
			int Delay3_g1385 = temp_output_55_0_g1377;
			float localAudioLinkData3_g1385 = AudioLinkData3_g1385( Band3_g1385 , Delay3_g1385 );
			float temp_output_8_0_g1386 = 1.0;
			float localIfAudioLinkv2Exists1_g1387 = IfAudioLinkv2Exists1_g1387();
			float temp_output_7_0_g1386 = saturate( ( localIfAudioLinkv2Exists1_g1387 + 0.0 ) );
			float3 lerpResult6_g1386 = lerp( temp_output_5_0_g1383 , ( temp_output_5_0_g1383 * localAudioLinkData3_g1385 ) , ( step( temp_output_8_0_g1386 , temp_output_7_0_g1386 ) * step( temp_output_7_0_g1386 , temp_output_8_0_g1386 ) ));
			float4 color45 = IsGammaSpace() ? float4( 0, 0, 1, 1 ) : float4( 0, 0, 1, 1 );
			float3 hsvTorgb4_g1389 = RGBToHSV( color45.rgb );
			float3 hsvTorgb8_g1389 = HSVToRGB( float3(( hsvTorgb4_g1389.x + temp_output_54_0_g1377 ),( hsvTorgb4_g1389.y + 0.0 ),( hsvTorgb4_g1389.z + 0.0 )) );
			float3 temp_output_5_0_g1388 = saturate( hsvTorgb8_g1389 );
			int Band3_g1390 = 3;
			int Delay3_g1390 = temp_output_55_0_g1377;
			float localAudioLinkData3_g1390 = AudioLinkData3_g1390( Band3_g1390 , Delay3_g1390 );
			float temp_output_8_0_g1391 = 1.0;
			float localIfAudioLinkv2Exists1_g1392 = IfAudioLinkv2Exists1_g1392();
			float temp_output_7_0_g1391 = saturate( ( localIfAudioLinkv2Exists1_g1392 + 0.0 ) );
			float3 lerpResult6_g1391 = lerp( temp_output_5_0_g1388 , ( temp_output_5_0_g1388 * localAudioLinkData3_g1390 ) , ( step( temp_output_8_0_g1391 , temp_output_7_0_g1391 ) * step( temp_output_7_0_g1391 , temp_output_8_0_g1391 ) ));
			float localIfAudioLinkv2Exists1_g1393 = IfAudioLinkv2Exists1_g1393();
			float4 AL_Final85 = ( ( _EnableAudioLink * ( ( temp_output_51_0_g1377 * float4( lerpResult6_g1397 , 0.0 ) ) + ( temp_output_51_0_g1377 * float4( lerpResult6_g1381 , 0.0 ) ) + ( temp_output_51_0_g1377 * float4( lerpResult6_g1386 , 0.0 ) ) + ( temp_output_51_0_g1377 * float4( lerpResult6_g1391 , 0.0 ) ) ) ) * saturate( ( localIfAudioLinkv2Exists1_g1393 + _ALEmitifInactive ) ) );
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 Emission119 = ( tex2D( _Emission, uv_Emission ) * _EmissionColor );
			float3 ase_positionWS = i.worldPos;
			float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_positionWS );
			float3 ase_viewDirWS = normalize( ase_viewVectorWS );
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 normalMap1002 = UnpackNormal( tex2D( _BumpMap, uv_BumpMap ) );
			float fresnelNdotV9_g1399 = dot( (WorldNormalVector( i , normalMap1002 )), ase_viewDirWS );
			float fresnelNode9_g1399 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV9_g1399, _RimPower ) );
			float4 lerpResult14_g1399 = lerp( float4( 1,1,1,0 ) , mainTex26 , _RimBaseColorStrength);
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float3 hsvTorgb3_g1399 = RGBToHSV( ase_lightColor.rgb );
			float3 temp_output_11_0_g1353 = normalMap1002;
			float3 temp_output_2_0_g1354 = temp_output_11_0_g1353;
			float3 temp_output_1_0_g1357 = temp_output_2_0_g1354;
			float4 appendResult6_g1357 = (float4(( temp_output_1_0_g1357 * 0.3 ) , 1.0));
			float4 Normal7_g1357 = appendResult6_g1357;
			float3 localShadeSH97_g1357 = ShadeSH97_g1357( Normal7_g1357 );
			float temp_output_9_0_g1357 = _IndirectDiffuseOffset;
			float temp_output_8_0_g1358 = 1.0;
			float temp_output_7_0_g1358 = _IndirLightUseMinforMax;
			float lerpResult6_g1358 = lerp( _IndirectDiffuseOffsetMax , temp_output_9_0_g1357 , ( step( temp_output_8_0_g1358 , temp_output_7_0_g1358 ) * step( temp_output_7_0_g1358 , temp_output_8_0_g1358 ) ));
			float temp_output_8_0_g1357 = lerpResult6_g1358;
			float3 temp_output_16_0_g1357 = saturate( ( localShadeSH97_g1357 + temp_output_8_0_g1357 ) );
			float3 maxIndirLight2618 = temp_output_16_0_g1357;
			float3 hsvTorgb24_g1399 = RGBToHSV( maxIndirLight2618 );
			float4 Rim116 = ( _EnableRimLighting * ( ( ( fresnelNode9_g1399 * _RimEnergy ) * lerpResult14_g1399 ) * max( ( 0.0 * saturate( ( exp( hsvTorgb3_g1399.z ) - 1.0 ) ) ) , hsvTorgb24_g1399.z ) ) );
			float4 EmissionFinal29 = saturate( ( AL_Final85 + Emission119 + Rim116 ) );
			o.Emission = EmissionFinal29.rgb;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows exclude_path:deferred vertex:vertexDataFunc 

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
				float4 customPack1 : TEXCOORD1;
				float4 customPack2 : TEXCOORD2;
				float4 customPack3 : TEXCOORD3;
				float4 tSpace0 : TEXCOORD4;
				float4 tSpace1 : TEXCOORD5;
				float4 tSpace2 : TEXCOORD6;
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
				o.customPack1.zw = customInputData.uv2_texcoord2;
				o.customPack1.zw = v.texcoord1;
				o.customPack2.xy = customInputData.uv3_texcoord3;
				o.customPack2.xy = v.texcoord2;
				o.customPack2.zw = customInputData.uv4_texcoord4;
				o.customPack2.zw = v.texcoord3;
				o.customPack3.xyzw = customInputData.screenPosition;
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
				surfIN.uv2_texcoord2 = IN.customPack1.zw;
				surfIN.uv3_texcoord3 = IN.customPack2.xy;
				surfIN.uv4_texcoord4 = IN.customPack2.zw;
				surfIN.screenPosition = IN.customPack3.xyzw;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT( UnityGI, gi );
				o.Alpha = LightingStandardCustomLighting( o, worldViewDir, gi ).a;
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Standard"
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
}
/*ASEBEGIN
Version=19900
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2333;-2064,-2752;Inherit;False;673.8176;177.324;Selection of UV Maps to Use for UV Tile Discarding;3;2355;2627;2357;Audio Link Delay UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2357;-2032,-2688;Inherit;False;Property;_ALDelayUVMap;AL Delay UV Map;29;2;[Header];[Enum];Create;True;0;5;UV0;0;UV1;1;UV2;2;UV3;3;Screen Space;8;0;True;0;False;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2627;-1824,-2688;Inherit;False;VVGetTextureUV;-1;;885;c300954d56021714fb5c622c8f34ec06;0;1;32;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;27;-2064,-3536;Inherit;False;1084.464;673.0301;Comment;12;2630;2546;2307;26;1003;2629;25;2552;2540;2542;2635;1047;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;977;-272,-3248;Inherit;False;1452.845;376.6802;Comment;8;991;985;987;979;993;2458;2457;2363;AudioLink Delay Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2355;-1616,-2688;Inherit;False;DelayUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;37;-1072,-1328;Inherit;False;859.9141;343.3768;Comment;3;34;1002;1006;Normal Map;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2363;-240,-3152;Inherit;False;2355;DelayUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2542;-2000,-3280;Inherit;False;Property;_AOStrength;AO Strength;23;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2552;-1872,-3040;Inherit;False;Property;_RealAO;Real AO;24;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2540;-2032,-3216;Inherit;True;Property;_AmbientOcclusion;Ambient Occlusion;22;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1003;-2000,-3472;Inherit;True;Property;_MainTex;Albedo;2;1;[SingleLineTexture];Create;False;1;Standard Fallbacks;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2640;2961.226,-37.76123;Inherit;False;564.665;432.8813;Comment;6;2659;2658;2650;2649;2648;2647;Camera Globals;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2714;-2080,-1440;Inherit;False;859.9478;416.3767;Comment;5;2719;2718;2716;2715;1017;Metallic and Smoothness;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2457;-32,-3168;Inherit;True;Property;_ALDelayMap;AudioLink Delay Tex Map;28;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;25;-1712,-3472;Inherit;True;Property;_AlbedoSample;Albedo Sample;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2307;-1616,-3056;Inherit;False;Property;_Color;Color;3;0;Create;False;0;0;0;True;0;False;1,1,1,0;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2630;-1728,-3200;Inherit;False;VVAmbientOcclusion;-1;;891;9931be4718b157b4ebb46a99812bfe31;0;3;6;FLOAT;0;False;7;COLOR;0,0,0,0;False;9;FLOAT;0;False;2;COLOR;11;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1006;-1008,-1216;Inherit;True;Property;_BumpMap;Normal Map;4;1;[SingleLineTexture];Create;False;0;0;0;True;0;False;None;None;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2647;3009.226,26.23877;Inherit;False;Global;CVRRenderingCam;CVRRenderingCam;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2719;-2016,-1152;Inherit;False;Property;_SmoothnessChannel;Smoothness Channel;18;1;[Enum];Create;False;0;2;Alpha;0;Green;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1017;-2000,-1376;Inherit;True;Property;_MetallicGlossMap;Metallic Smoothness;17;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;34;-736,-1216;Inherit;True;Property;_NMSample;NM Sample;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;72;1440,-3088;Inherit;False;765.7347;170.1592;Comment;4;243;50;49;48;Time;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;979;160,-2976;Inherit;False;Property;_ALUVDelayMaxDelay;AL UV Delay Max Delay;30;0;Create;True;0;0;0;False;0;False;0;127;0;127;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2458;256,-3168;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2629;-1360,-3312;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2641;2977.226,-1221.761;Inherit;False;1222.874;463.641;Comment;11;2674;2672;2669;2668;2665;2664;2661;2660;2653;2652;2651;Disable Rendering in Social VR Cameras;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2642;2977.226,-629.7612;Inherit;False;1226.13;481.8655;Comment;12;2675;2673;2671;2670;2667;2666;2663;2662;2657;2656;2655;2654;Disable Rendering in Social VR Mirrors;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2648;3009.226,122.2388;Inherit;False;Global;_VRChatCameraMode;_VRChatCameraMode;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2649;3217.226,26.23877;Inherit;False;cvr camera;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2650;3009.226,218.2388;Inherit;False;Global;_VRChatMirrorMode;_VRChatMirrorMode;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2718;-1680,-1248;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;201;-2064,-2464;Inherit;False;668.8916;177.8153;Selection of UV Maps to Use for UV Tile Discarding;3;2313;200;2626;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1002;-416,-1200;Inherit;False;normalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;993;496,-3184;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;127;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;243;1472,-3040;Inherit;False;Property;_ALTimeScale;AL HueShift Time Scale;31;0;Create;False;0;0;0;False;0;False;0;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2602;-1984.555,-896;Inherit;False;1332.554;1205.834;Comment;20;2722;2723;2724;1497;2567;2584;2583;2291;2582;2375;2589;1207;2556;2415;2414;2392;1144;2618;2634;2725;Shading;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;26;-1200,-3312;Inherit;False;mainTex;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2651;3025.226,-1077.761;Inherit;False;2649;cvr camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2652;3025.226,-997.7612;Inherit;False;Constant;_Float14;Float 14;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2653;3025.226,-917.7612;Inherit;False;Constant;_Float15;Float 15;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2654;3009.226,-341.7612;Inherit;False;Constant;_Float18;Float 14;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2655;3009.226,-261.7612;Inherit;False;Constant;_Float19;Float 15;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2656;3009.226,-421.7612;Inherit;False;Constant;_Float21;Float 21;48;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2657;3025.226,-501.7612;Inherit;False;2649;cvr camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2658;3249.226,122.2388;Inherit;False;vrc camera;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2659;3249.226,218.2388;Inherit;False;vrc mirror;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2715;-1488,-1312;Inherit;False;_Metalic;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2716;-1488,-1248;Inherit;False;_Smoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2313;-2016,-2400;Inherit;False;Property;_DiscardUVMap;Discard UV Map;36;2;[Header];[Enum];Create;True;1;UV Tile Discarding;4;UV0;0;UV1;1;UV2;2;UV3;3;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;38;16,-2656;Inherit;False;604.8932;280;Comment;2;40;39;AL Emission Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;987;672,-3184;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;127;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;48;1712,-3040;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2660;3217.226,-1013.761;Inherit;False;If Float Equal;-1;;1260;bdca1c28487c8a1418e72579bec63589;0;4;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2661;3233.226,-1109.761;Inherit;False;2658;vrc camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2662;3217.226,-421.7612;Inherit;False;If Float Equal;-1;;1300;bdca1c28487c8a1418e72579bec63589;0;4;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2663;3233.226,-517.7612;Inherit;False;2659;vrc mirror;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2626;-1840,-2400;Inherit;False;VVGetVertexUV;-1;;1348;b2c6b9b1b245cf54ca03e50557eebb87;0;1;26;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2392;-1888,-576;Inherit;False;Property;_IndirectDiffuseOffset;Indirect Light Min;8;0;Create;False;0;0;0;False;0;False;0;0.04;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2414;-1888,-512;Inherit;False;Property;_IndirectDiffuseOffsetMax;Indirect Light Max;9;0;Create;False;0;0;0;False;0;False;0;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2415;-1792,-448;Inherit;False;Property;_IndirLightUseMinforMax;Use Min for Max;10;1;[ToggleUI];Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2556;-1856,-384;Inherit;False;Property;_IndirectLimiterMode;Indirect Limiter Mode;14;1;[Enum];Create;True;0;2;Clamp;0;Remap;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1207;-1856,-320;Inherit;False;Property;_WrappedShadingValue;Wrapped Shading Value;15;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2589;-1792,192;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2375;-1888,-192;Inherit;False;Property;_MinBrightness;Min Brightness;7;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2582;-1792,-128;Inherit;False;1002;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2291;-1824,-256;Inherit;False;Property;_WrapIndirScale;Indirect Light Scale;16;0;Create;False;0;0;0;False;0;False;3;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2583;-1824,-64;Inherit;False;2716;_Smoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2584;-1792,0;Inherit;False;2715;_Metalic;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2724;-1920,-640;Inherit;False;Property;_ClampRealtimeLighting;Relative Clamp Realtime Lighting;11;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2723;-1888,-704;Inherit;False;Property;_RealtimeLightMax;Relative Real Light Max;12;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2722;-1888,-768;Inherit;False;Property;_RealtimeLightMin;Relative Real Light Min;13;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2725;-1920,-832;Inherit;False;Property;_MetallicReflectionMode;Fresnel Metallics (Experimental);19;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;49;1872,-3040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RoundOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;985;800,-3184;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2634;-1328,-640;Inherit;True;VivikaShading;-1;;1353;efce34b3f4a0e2b44933c4737d48061f;0;15;54;FLOAT;0;False;51;FLOAT;0;False;52;FLOAT;0;False;48;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;3;False;9;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT3;0,0,0;False;12;FLOAT;0;False;13;FLOAT;0;False;18;COLOR;0,0,0,0;False;2;FLOAT3;32;COLOR;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;40;80,-2608;Inherit;True;Property;_AL_Mask;AudioLink Mask;27;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2664;3409.226,-1077.761;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2665;3409.226,-1173.761;Inherit;False;Constant;_Float12;Float 12;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2666;3409.226,-485.7612;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2667;3409.226,-581.7612;Inherit;False;Constant;_Float20;Float 12;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2688;1472,-1328;Inherit;False;1050.305;1191.881;Comment;19;2691;2689;2743;2744;2745;2746;2747;2748;2749;2750;2751;2752;2753;2754;2755;2756;2757;2758;2759;UV Tile Discard;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;200;-1632,-2400;Inherit;False;DiscardUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1;32,-1120;Inherit;False;1041.734;585.5447;Comment;9;116;2620;2621;333;2505;1404;12;87;113;Rim;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;117;16,-2288;Inherit;False;907.3133;529.2772;Comment;4;1005;119;121;118;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;107;-1328,-2656;Inherit;False;1185.214;1096.479;Comment;11;85;2616;42;44;43;45;415;2614;995;51;75;AudioLink Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;991;944,-3168;Inherit;False;in_ALDelay;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;50;1984,-3040;Inherit;False;Time;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;39;400,-2608;Inherit;False;ALMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2618;-896,-688;Inherit;False;maxIndirLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2668;3569.226,-1125.761;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2669;3217.226,-853.7612;Inherit;False;Property;_DontRenderInSocialVRCameras;Don't Render in Social VR Cameras;55;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2670;3569.226,-533.7612;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2671;3217.226,-261.7612;Inherit;False;Property;_DontRenderinSocialVRMirrors;Don't Render in Social VR Mirrors;56;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2689;1600,-256;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2744;1504,-1280;Inherit;False;Property;_UDIMDiscardRow0_0;Discard UV Row 0,0;37;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2745;1504,-1216;Inherit;False;Property;_UDIMDiscardRow1_0;Discard UV Row 1,0;38;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2746;1504,-1152;Inherit;False;Property;_UDIMDiscardRow2_0;Discard UV Row 2,0;39;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2747;1504,-1088;Inherit;False;Property;_UDIMDiscardRow3_0;Discard UV Row 3,0;40;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2748;1504,-1024;Inherit;False;Property;_UDIMDiscardRow0_1;Discard UV Row 0,1;41;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2749;1504,-960;Inherit;False;Property;_UDIMDiscardRow1_1;Discard UV Row 1,1;42;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2750;1504,-896;Inherit;False;Property;_UDIMDiscardRow2_1;Discard UV Row 2,1;43;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2751;1504,-832;Inherit;False;Property;_UDIMDiscardRow3_1;Discard UV Row 3,1;44;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2752;1504,-768;Inherit;False;Property;_UDIMDiscardRow0_2;Discard UV Row 0,2;45;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2753;1504,-704;Inherit;False;Property;_UDIMDiscardRow1_2;Discard UV Row 1,2;46;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2754;1504,-640;Inherit;False;Property;_UDIMDiscardRow2_2;Discard UV Row 2,2;47;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2755;1504,-576;Inherit;False;Property;_UDIMDiscardRow3_2;Discard UV Row 3,2;48;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2756;1504,-512;Inherit;False;Property;_UDIMDiscardRow0_3;Discard UV Row 0,3;49;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2757;1504,-448;Inherit;False;Property;_UDIMDiscardRow1_3;Discard UV Row 1,3;50;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2758;1504,-384;Inherit;False;Property;_UDIMDiscardRow2_3;Discard UV Tile 2,3;51;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2759;1504,-320;Inherit;False;Property;_UDIMDiscardRow3_3;Discard UV Row 3,3;52;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;75;-944,-1920;Inherit;False;39;ALMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;51;-1168,-1936;Inherit;False;50;Time;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;995;-1168,-1872;Inherit;False;991;in_ALDelay;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2614;-1200,-1744;Inherit;False;Property;_ALEmitifInactive;AL Emit if Inactive;26;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;415;-1264,-1808;Half;False;Property;_EnableAudioLink;Enable AudioLink;25;2;[Header];[ToggleUI];Create;True;1;AudioLink;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;45;-1200,-2096;Inherit;False;Constant;_AL_Treble;AL_Treble;6;0;Create;True;0;0;0;False;0;False;0,0,1,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;43;-1200,-2256;Inherit;False;Constant;_AL_LowMid;AL_LowMid;6;0;Create;True;0;0;0;False;0;False;1,0.9294118,0,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;44;-1200,-2416;Inherit;False;Constant;_AL_HighMid;AL_HighMid;6;0;Create;True;0;0;0;False;0;False;0,0.8196079,0,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;42;-1200,-2576;Inherit;False;Constant;_AL_Bass;AL_Bass;6;0;Create;True;0;0;0;False;0;False;1,0,0,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;113;96,-848;Inherit;False;Property;_RimBaseColorStrength;Rim Base Color Strength;35;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;87;96,-912;Inherit;False;Property;_RimEnergy;Rim Energy;34;0;Create;True;0;0;0;False;0;False;0.345;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;12;96,-976;Float;False;Property;_RimPower;Rim Power;33;0;Create;True;0;0;0;False;0;False;2.07;1.86;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1404;192,-784;Inherit;False;1002;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2505;160,-720;Inherit;False;2618;maxIndirLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;333;96,-1040;Half;False;Property;_EnableRimLighting;Enable Rim Lighting;32;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2621;192,-656;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1005;128,-1952;Inherit;False;Property;_EmissionColor;Emission Color;6;0;Create;False;0;0;0;True;0;False;0,0,0,0;0,1,0.9604408,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2672;3681.226,-1077.761;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2673;3681.226,-485.7612;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;118;80,-2224;Inherit;True;Property;_Emission;Emission;5;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2743;1984,-928;Inherit;False;VVUVTileDiscardFull;-1;;1490;37cd3007c1dbdac4b9341609f3fa3a5a;0;17;100;FLOAT;0;False;101;FLOAT;0;False;102;FLOAT;0;False;103;FLOAT;0;False;104;FLOAT;0;False;105;FLOAT;0;False;106;FLOAT;0;False;107;FLOAT;0;False;108;FLOAT;0;False;109;FLOAT;0;False;110;FLOAT;0;False;111;FLOAT;0;False;112;FLOAT;0;False;113;FLOAT;0;False;114;FLOAT;0;False;115;FLOAT;0;False;99;FLOAT2;0,0;False;1;FLOAT;116
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;121;432,-2144;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2616;-720,-2336;Inherit;False;VVALCombine;-1;;1377;bceeba5c9c06c59459d6b7e4bf2084da;0;9;54;FLOAT;0;False;55;INT;0;False;25;COLOR;1,0,0,1;False;27;COLOR;1,0.9294118,0,1;False;26;COLOR;0,0.8196079,0,1;False;28;COLOR;0,0,1,1;False;51;COLOR;0,0,0,0;False;52;FLOAT;0;False;53;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2620;496,-912;Inherit;False;Rim;-1;;1399;652e8c2aadb4b694999944f1079d1366;0;7;29;FLOAT;0;False;30;FLOAT;0;False;31;FLOAT;0;False;32;FLOAT;0;False;26;FLOAT3;0,0,0;False;27;FLOAT3;0,0,0;False;28;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2643;2993.226,-2373.761;Inherit;False;468;235;Comment;2;2646;2645;Vertex Position Results;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2644;2961.226,-1925.761;Inherit;False;1616.048;535.0431;Comment;12;2687;2686;2684;2683;2682;2680;2679;2678;2677;2676;2720;2721;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2674;3825.226,-1109.761;Inherit;False;Dont Render in Social VR Camera Result;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2675;3841.226,-517.7612;Inherit;False;Dont Render in Social VR Mirror Result;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2691;2304,-912;Inherit;False;UVTileDiscard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;31;16,-1680;Inherit;False;798.6848;366.049;Comment;6;29;2539;30;86;28;122;Emission Combination;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;119;592,-2224;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;85;-400,-2288;Inherit;False;AL_Final;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;116;848,-912;Float;False;Rim;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PosVertexDataNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2645;3025.226,-2309.761;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2678;3009.226,-1701.761;Inherit;False;2675;Dont Render in Social VR Mirror Result;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2676;3009.226,-1781.761;Inherit;False;2674;Dont Render in Social VR Camera Result;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2720;3118.091,-1551.621;Inherit;False;Property;_UDIMDiscardAll;Discard All;53;1;[ToggleUI];Create;False;1;The Following Setting Completely Disables Rendering whatever is using this material. This works similarly to UV Tile Discarding.;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2677;3137.226,-1861.761;Inherit;False;2691;UVTileDiscard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;122;48,-1520;Inherit;False;119;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;28;32,-1440;Inherit;False;116;Rim;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;86;32,-1616;Inherit;False;85;AL_Final;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2646;3249.226,-2325.761;Inherit;False;Vertex Position;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2679;3457.226,-1589.761;Inherit;False;Constant;_Float11;Float 11;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2680;3393.226,-1797.761;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;30;240,-1536;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2682;3601.226,-1717.761;Inherit;False;Constant;_Float5;Float 5;46;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2683;3633.226,-1621.761;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2684;3537.226,-1477.761;Inherit;False;2646;Vertex Position;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2721;3600,-1824;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2539;448,-1536;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;220;1248,-2688;Inherit;False;962.8354;715.8684;Comment;7;0;33;32;193;332;2636;2637;Output;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2635;-1349.583,-3449.378;Inherit;False;alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2686;3825.226,-1781.761;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;217;1840,-1792;Inherit;False;420.8079;185;Comment;2;219;218;Declare NaN;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1144;-896,-576;Inherit;False;Lighting Wrapped;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;29;592,-1536;Inherit;False;EmissionFinal;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2636;1328,-2304;Inherit;False;2635;alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2638;-492.3212,-4127.505;Inherit;False;324;355;Comment;1;2639;Fallbacks;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2687;4113.226,-1733.761;Inherit;False;Discard Vertex;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;33;1488,-2640;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;218;1888,-1744;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;219;2048,-1744;Inherit;False;NaN;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;32;1504,-2464;Inherit;False;29;EmissionFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2546;-1312,-3088;Inherit;False;ao_times_strength;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;332;1552,-2176;Inherit;False;1144;Lighting Wrapped;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.DitheringNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2637;1581.029,-2303.3;Inherit;False;0;False;4;0;FLOAT;0;False;1;SAMPLER2D;;False;2;FLOAT4;0,0,0,0;False;3;SAMPLERSTATE;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1047;-1136,-3424;Inherit;False;Property;_CullMode;Cull Mode;1;1;[Enum];Create;True;0;3;Off;0;Front;1;Back;2;0;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2639;-444.3212,-4063.505;Inherit;True;Property;_EmissionMap;Fallback Emission Map;54;1;[SingleLineTexture];Create;False;0;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;193;1552,-2112;Inherit;False;2687;Discard Vertex;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2567;-1856,128;Inherit;False;Property;_MetallicFresnelPower;Metallic Fresnel Power;21;0;Create;True;0;0;0;False;0;False;3;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1497;-1824,64;Inherit;False;Property;_WrapMetallicFesnelScale;Metallic Fesnel Scale;20;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;0;1968,-2528;Float;False;True;-1;2;AmplifyShaderEditor.MaterialInspector;0;0;CustomLighting;VoyVivika/VivikaShader/Vivika Shader Transparent Cutout;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;ForwardOnly;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;5;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;Standard;0;-1;-1;-1;1;VRCFallback=DoubleSided;False;0;0;True;_CullMode;-1;0;False;;1;Include;..\Libs\AudioLink\AudioLink.cginc;False;;Custom;False;0;0;;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2627;32;2357;0
WireConnection;2355;0;2627;0
WireConnection;2457;1;2363;0
WireConnection;25;0;1003;0
WireConnection;2630;6;2542;0
WireConnection;2630;7;2540;0
WireConnection;2630;9;2552;0
WireConnection;34;0;1006;0
WireConnection;2458;0;2457;0
WireConnection;2629;0;25;0
WireConnection;2629;1;2630;11
WireConnection;2629;2;2307;0
WireConnection;2649;0;2647;0
WireConnection;2718;0;1017;4
WireConnection;2718;1;1017;2
WireConnection;2718;2;2719;0
WireConnection;1002;0;34;0
WireConnection;993;0;2458;3
WireConnection;993;4;979;0
WireConnection;26;0;2629;0
WireConnection;2658;0;2648;0
WireConnection;2659;0;2650;0
WireConnection;2715;0;1017;1
WireConnection;2716;0;2718;0
WireConnection;987;0;993;0
WireConnection;48;0;243;0
WireConnection;2660;7;2651;0
WireConnection;2660;8;2652;0
WireConnection;2660;9;2652;0
WireConnection;2660;10;2653;0
WireConnection;2662;7;2657;0
WireConnection;2662;8;2656;0
WireConnection;2662;9;2654;0
WireConnection;2662;10;2655;0
WireConnection;2626;26;2313;0
WireConnection;49;0;48;0
WireConnection;985;0;987;0
WireConnection;2634;54;2725;0
WireConnection;2634;51;2722;0
WireConnection;2634;52;2723;0
WireConnection;2634;48;2724;0
WireConnection;2634;4;2392;0
WireConnection;2634;5;2414;0
WireConnection;2634;6;2415;0
WireConnection;2634;7;2556;0
WireConnection;2634;8;1207;0
WireConnection;2634;9;2291;0
WireConnection;2634;10;2375;0
WireConnection;2634;11;2582;0
WireConnection;2634;12;2583;0
WireConnection;2634;13;2584;0
WireConnection;2634;18;2589;0
WireConnection;2664;0;2661;0
WireConnection;2664;1;2660;0
WireConnection;2666;0;2663;0
WireConnection;2666;1;2662;0
WireConnection;200;0;2626;0
WireConnection;991;0;985;0
WireConnection;50;0;49;0
WireConnection;39;0;40;0
WireConnection;2618;0;2634;32
WireConnection;2668;0;2665;0
WireConnection;2668;1;2664;0
WireConnection;2670;0;2667;0
WireConnection;2670;1;2666;0
WireConnection;2672;0;2668;0
WireConnection;2672;1;2669;0
WireConnection;2673;0;2670;0
WireConnection;2673;1;2671;0
WireConnection;2743;100;2744;0
WireConnection;2743;101;2745;0
WireConnection;2743;102;2746;0
WireConnection;2743;103;2747;0
WireConnection;2743;104;2748;0
WireConnection;2743;105;2749;0
WireConnection;2743;106;2750;0
WireConnection;2743;107;2751;0
WireConnection;2743;108;2752;0
WireConnection;2743;109;2753;0
WireConnection;2743;110;2754;0
WireConnection;2743;111;2755;0
WireConnection;2743;112;2756;0
WireConnection;2743;113;2757;0
WireConnection;2743;114;2758;0
WireConnection;2743;115;2759;0
WireConnection;2743;99;2689;0
WireConnection;121;0;118;0
WireConnection;121;1;1005;0
WireConnection;2616;54;51;0
WireConnection;2616;55;995;0
WireConnection;2616;25;42;0
WireConnection;2616;27;43;0
WireConnection;2616;26;44;0
WireConnection;2616;28;45;0
WireConnection;2616;51;75;0
WireConnection;2616;52;415;0
WireConnection;2616;53;2614;0
WireConnection;2620;29;333;0
WireConnection;2620;30;12;0
WireConnection;2620;31;87;0
WireConnection;2620;32;113;0
WireConnection;2620;26;1404;0
WireConnection;2620;27;2505;0
WireConnection;2620;28;2621;0
WireConnection;2674;0;2672;0
WireConnection;2675;0;2673;0
WireConnection;2691;0;2743;116
WireConnection;119;0;121;0
WireConnection;85;0;2616;0
WireConnection;116;0;2620;0
WireConnection;2646;0;2645;0
WireConnection;2680;0;2677;0
WireConnection;2680;1;2676;0
WireConnection;2680;2;2678;0
WireConnection;2680;3;2720;0
WireConnection;30;0;86;0
WireConnection;30;1;122;0
WireConnection;30;2;28;0
WireConnection;2683;0;2679;0
WireConnection;2683;1;2679;0
WireConnection;2721;0;2680;0
WireConnection;2539;0;30;0
WireConnection;2635;0;25;4
WireConnection;2686;0;2721;0
WireConnection;2686;1;2682;0
WireConnection;2686;2;2683;0
WireConnection;2686;3;2684;0
WireConnection;1144;0;2634;0
WireConnection;29;0;2539;0
WireConnection;2687;0;2686;0
WireConnection;219;0;218;0
WireConnection;2546;0;2630;0
WireConnection;2637;0;2636;0
WireConnection;0;0;33;0
WireConnection;0;2;32;0
WireConnection;0;10;2637;0
WireConnection;0;13;332;0
WireConnection;0;11;193;0
ASEEND*/
//CHKSM=A7495EAB86BB975341E67ECA6FDE4A4111507172