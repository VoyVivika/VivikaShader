// Made with Amplify Shader Editor v1.9.9
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VoyVivika/VivikaShader/Vivika Shader Transparent"
{
	Properties
	{
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
		[Enum(Clamp,0,Remap,1)] _IndirectLimiterMode( "Indirect Limiter Mode", Float ) = 0
		[ToggleUI] _ClampRealtimeLighting( "Relative Clamp Realtime Lighting", Float ) = 0
		_WrappedShadingValue( "Wrapped Shading Value", Float ) = 1
		_RealtimeLightMax( "Relative Real Light Max", Range( 0, 1 ) ) = 0
		_WrapIndirScale( "Indirect Light Scale", Float ) = 3
		_RealtimeLightMin( "Relative Real Light Min", Range( 0, 1 ) ) = 0.7521966
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
		[HideInInspector] _texcoord4( "", 2D ) = "white" {}
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  "VRCFallback"="DoubleSided" }
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
			float4 screenPos;
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

		inline float AudioLinkData3_g1392( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1394(  )
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


		inline float AudioLinkData3_g1376( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1378(  )
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


		inline float AudioLinkData3_g1381( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1383(  )
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


		inline float AudioLinkData3_g1386( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1388(  )
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


		float IfAudioLinkv2Exists1_g1389(  )
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


		float3 ShadeSH97_g1353( float4 Normal )
		{
			return ShadeSH9(Normal);
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 break63_g1506 = floor( float2( 0,0 ) );
			float temp_output_8_0_g978 = 0.0;
			float temp_output_26_0_g974 = _DiscardUVMap;
			float temp_output_7_0_g978 = temp_output_26_0_g974;
			float2 lerpResult6_g978 = lerp( float2( 0,0 ) , v.texcoord.xy , ( step( temp_output_8_0_g978 , temp_output_7_0_g978 ) * step( temp_output_7_0_g978 , temp_output_8_0_g978 ) ));
			float temp_output_8_0_g975 = 1.0;
			float temp_output_7_0_g975 = temp_output_26_0_g974;
			float2 lerpResult6_g975 = lerp( float2( 0,0 ) , v.texcoord1.xy , ( step( temp_output_8_0_g975 , temp_output_7_0_g975 ) * step( temp_output_7_0_g975 , temp_output_8_0_g975 ) ));
			float temp_output_8_0_g976 = 2.0;
			float temp_output_7_0_g976 = temp_output_26_0_g974;
			float2 lerpResult6_g976 = lerp( float2( 0,0 ) , v.texcoord2.xy , ( step( temp_output_8_0_g976 , temp_output_7_0_g976 ) * step( temp_output_7_0_g976 , temp_output_8_0_g976 ) ));
			float temp_output_8_0_g977 = 3.0;
			float temp_output_7_0_g977 = temp_output_26_0_g974;
			float2 lerpResult6_g977 = lerp( float2( 0,0 ) , v.texcoord3.xy , ( step( temp_output_8_0_g977 , temp_output_7_0_g977 ) * step( temp_output_7_0_g977 , temp_output_8_0_g977 ) ));
			float2 DiscardUV200 = ( lerpResult6_g978 + lerpResult6_g975 + lerpResult6_g976 + lerpResult6_g977 );
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
			float UVTileDiscard2690 = step( 1.0 , ( ( ( saturate( _UDIMDiscardRow0_0 ) * saturate( ( step( break63_g1506.x , break61_g1506.x ) * step( break61_g1506.x , ( break63_g1506.x + 0.9999999 ) ) * step( break63_g1506.y , break61_g1506.y ) * step( break61_g1506.y , ( break63_g1506.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_0 ) * saturate( ( step( break63_g1504.x , break61_g1504.x ) * step( break61_g1504.x , ( break63_g1504.x + 0.9999999 ) ) * step( break63_g1504.y , break61_g1504.y ) * step( break61_g1504.y , ( break63_g1504.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_0 ) * saturate( ( step( break63_g1502.x , break61_g1502.x ) * step( break61_g1502.x , ( break63_g1502.x + 0.9999999 ) ) * step( break63_g1502.y , break61_g1502.y ) * step( break61_g1502.y , ( break63_g1502.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_0 ) * saturate( ( step( break63_g1505.x , break61_g1505.x ) * step( break61_g1505.x , ( break63_g1505.x + 0.9999999 ) ) * step( break63_g1505.y , break61_g1505.y ) * step( break61_g1505.y , ( break63_g1505.y + 0.9999999 ) ) ) ) ) ) + ( ( saturate( _UDIMDiscardRow0_1 ) * saturate( ( step( break63_g1503.x , break61_g1503.x ) * step( break61_g1503.x , ( break63_g1503.x + 0.9999999 ) ) * step( break63_g1503.y , break61_g1503.y ) * step( break61_g1503.y , ( break63_g1503.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_1 ) * saturate( ( step( break63_g1499.x , break61_g1499.x ) * step( break61_g1499.x , ( break63_g1499.x + 0.9999999 ) ) * step( break63_g1499.y , break61_g1499.y ) * step( break61_g1499.y , ( break63_g1499.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_1 ) * saturate( ( step( break63_g1500.x , break61_g1500.x ) * step( break61_g1500.x , ( break63_g1500.x + 0.9999999 ) ) * step( break63_g1500.y , break61_g1500.y ) * step( break61_g1500.y , ( break63_g1500.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_1 ) * saturate( ( step( break63_g1501.x , break61_g1501.x ) * step( break61_g1501.x , ( break63_g1501.x + 0.9999999 ) ) * step( break63_g1501.y , break61_g1501.y ) * step( break61_g1501.y , ( break63_g1501.y + 0.9999999 ) ) ) ) ) ) + ( ( saturate( _UDIMDiscardRow0_2 ) * saturate( ( step( break63_g1498.x , break61_g1498.x ) * step( break61_g1498.x , ( break63_g1498.x + 0.9999999 ) ) * step( break63_g1498.y , break61_g1498.y ) * step( break61_g1498.y , ( break63_g1498.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_2 ) * saturate( ( step( break63_g1497.x , break61_g1497.x ) * step( break61_g1497.x , ( break63_g1497.x + 0.9999999 ) ) * step( break63_g1497.y , break61_g1497.y ) * step( break61_g1497.y , ( break63_g1497.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_2 ) * saturate( ( step( break63_g1496.x , break61_g1496.x ) * step( break61_g1496.x , ( break63_g1496.x + 0.9999999 ) ) * step( break63_g1496.y , break61_g1496.y ) * step( break61_g1496.y , ( break63_g1496.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_2 ) * saturate( ( step( break63_g1495.x , break61_g1495.x ) * step( break61_g1495.x , ( break63_g1495.x + 0.9999999 ) ) * step( break63_g1495.y , break61_g1495.y ) * step( break61_g1495.y , ( break63_g1495.y + 0.9999999 ) ) ) ) ) ) + ( ( saturate( _UDIMDiscardRow0_3 ) * saturate( ( step( break63_g1491.x , break61_g1491.x ) * step( break61_g1491.x , ( break63_g1491.x + 0.9999999 ) ) * step( break63_g1491.y , break61_g1491.y ) * step( break61_g1491.y , ( break63_g1491.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_3 ) * saturate( ( step( break63_g1492.x , break61_g1492.x ) * step( break61_g1492.x , ( break63_g1492.x + 0.9999999 ) ) * step( break63_g1492.y , break61_g1492.y ) * step( break61_g1492.y , ( break63_g1492.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_3 ) * saturate( ( step( break63_g1493.x , break61_g1493.x ) * step( break61_g1493.x , ( break63_g1493.x + 0.9999999 ) ) * step( break63_g1493.y , break61_g1493.y ) * step( break61_g1493.y , ( break63_g1493.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_3 ) * saturate( ( step( break63_g1494.x , break61_g1494.x ) * step( break61_g1494.x , ( break63_g1494.x + 0.9999999 ) ) * step( break63_g1494.y , break61_g1494.y ) * step( break61_g1494.y , ( break63_g1494.y + 0.9999999 ) ) ) ) ) ) ) );
			float vrc_camera2657 = _VRChatCameraMode;
			float temp_output_8_0_g1348 = 1.0;
			float cvr_camera2648 = CVRRenderingCam;
			float temp_output_7_0_g1348 = cvr_camera2648;
			float lerpResult6_g1348 = lerp( 0.0 , 1.0 , ( step( temp_output_8_0_g1348 , temp_output_7_0_g1348 ) * step( temp_output_7_0_g1348 , temp_output_8_0_g1348 ) ));
			float Dont_Render_in_Social_VR_Camera_Result2673 = ( step( 1.0 , ( vrc_camera2657 + lerpResult6_g1348 ) ) * _DontRenderInSocialVRCameras );
			float vrc_mirror2658 = _VRChatMirrorMode;
			float temp_output_8_0_g1300 = 2.0;
			float temp_output_7_0_g1300 = cvr_camera2648;
			float lerpResult6_g1300 = lerp( 0.0 , 1.0 , ( step( temp_output_8_0_g1300 , temp_output_7_0_g1300 ) * step( temp_output_7_0_g1300 , temp_output_8_0_g1300 ) ));
			float Dont_Render_in_Social_VR_Mirror_Result2674 = ( step( 1.0 , ( vrc_mirror2658 + lerpResult6_g1300 ) ) * _DontRenderinSocialVRMirrors );
			float3 temp_cast_0 = (( 0.0 / 0.0 )).xxx;
			float3 ase_positionOS = v.vertex.xyz;
			float3 Vertex_Position2645 = ase_positionOS;
			float3 Discard_Vertex2686 = ( saturate( ( UVTileDiscard2690 + Dont_Render_in_Social_VR_Camera_Result2673 + Dont_Render_in_Social_VR_Mirror_Result2674 + _UDIMDiscardAll ) ) == 1.0 ? temp_cast_0 : Vertex_Position2645 );
			v.vertex.xyz += Discard_Vertex2686;
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
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 tex2DNode25 = tex2D( _MainTex, uv_MainTex );
			float alpha2635 = tex2DNode25.a;
			float3 ase_positionWS = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_lightDirWS = 0;
			#else //aseld
			float3 ase_lightDirWS = normalize( UnityWorldSpaceLightDir( ase_positionWS ) );
			#endif //aseld
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 normalMap1002 = UnpackNormal( tex2D( _BumpMap, uv_BumpMap ) );
			float3 temp_output_11_0_g1349 = normalMap1002;
			float3 temp_output_2_0_g1350 = temp_output_11_0_g1349;
			float dotResult3_g1352 = dot( ase_lightDirWS , (WorldNormalVector( i , temp_output_2_0_g1350 )) );
			float temp_output_5_0_g1351 = _WrappedShadingValue;
			float temp_output_15_0_g1350 = saturate( saturate( ase_lightAtten ) );
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float4 temp_output_43_0_g1350 = saturate( ase_lightColor );
			float4 temp_output_23_0_g1350 = saturate( ( temp_output_43_0_g1350 * temp_output_15_0_g1350 ) );
			float4 temp_output_78_0_g1350 = saturate( temp_output_43_0_g1350 );
			float4 temp_cast_16 = (_RealtimeLightMin).xxxx;
			float4 clampResult66_g1350 = clamp( temp_output_23_0_g1350 , ( temp_output_78_0_g1350 - temp_cast_16 ) , ( temp_output_78_0_g1350 + _RealtimeLightMax ) );
			float4 lerpResult72_g1350 = lerp( temp_output_23_0_g1350 , clampResult66_g1350 , _ClampRealtimeLighting);
			float3 temp_output_1_0_g1353 = temp_output_2_0_g1350;
			UnityGI gi2_g1353 = gi;
			float3 diffNorm2_g1353 = normalize( WorldNormalVector( i , temp_output_1_0_g1353 ) );
			gi2_g1353 = UnityGI_Base( data, 1, diffNorm2_g1353 );
			float3 indirectDiffuse2_g1353 = gi2_g1353.indirect.diffuse + diffNorm2_g1353 * 0.0001;
			float3 temp_output_34_0_g1353 = saturate( indirectDiffuse2_g1353 );
			float4 appendResult6_g1353 = (float4(( temp_output_1_0_g1353 * 0.3 ) , 1.0));
			float4 Normal7_g1353 = appendResult6_g1353;
			float3 localShadeSH97_g1353 = ShadeSH97_g1353( Normal7_g1353 );
			float temp_output_9_0_g1353 = _IndirectDiffuseOffset;
			float3 temp_cast_18 = (temp_output_9_0_g1353).xxx;
			float3 temp_output_15_0_g1353 = saturate( ( localShadeSH97_g1353 - temp_cast_18 ) );
			float temp_output_8_0_g1354 = 1.0;
			float temp_output_7_0_g1354 = _IndirLightUseMinforMax;
			float lerpResult6_g1354 = lerp( _IndirectDiffuseOffsetMax , temp_output_9_0_g1353 , ( step( temp_output_8_0_g1354 , temp_output_7_0_g1354 ) * step( temp_output_7_0_g1354 , temp_output_8_0_g1354 ) ));
			float temp_output_8_0_g1353 = lerpResult6_g1354;
			float3 temp_output_16_0_g1353 = saturate( ( localShadeSH97_g1353 + temp_output_8_0_g1353 ) );
			float3 clampResult17_g1353 = clamp( temp_output_34_0_g1353 , temp_output_15_0_g1353 , temp_output_16_0_g1353 );
			float3 lerpResult20_g1353 = lerp( clampResult17_g1353 ,  (temp_output_15_0_g1353 + ( temp_output_34_0_g1353 - float3( 0,0,0 ) ) * ( temp_output_16_0_g1353 - temp_output_15_0_g1353 ) / ( float3( 1,1,1 ) - float3( 0,0,0 ) ) ) , _IndirectLimiterMode);
			float4 color4_g1350 = IsGammaSpace() ? float4( 1, 1, 1, 0 ) : float4( 1, 1, 1, 0 );
			float4 temp_cast_20 = (1.0).xxxx;
			float4 temp_cast_21 = (_MinBrightness).xxxx;
			float4 color40_g1350 = IsGammaSpace() ? float4( 1, 1, 1, 1 ) : float4( 1, 1, 1, 1 );
			float4 clampResult37_g1350 = clamp( saturate( ( saturate( ( saturate( exp2( ( ( dotResult3_g1352 + temp_output_5_0_g1351 ) / ( 1.0 + temp_output_5_0_g1351 ) ) ) ) + saturate( exp2( temp_output_15_0_g1350 ) ) ) ) * saturate( ( lerpResult72_g1350 + saturate( (saturate( ( exp2( saturate( ( float4( lerpResult20_g1353 , 0.0 ) * color4_g1350 ) ) ) - temp_cast_20 ) )*_WrapIndirScale + 0.0) ) ) ) ) ) , temp_cast_21 , color40_g1350 );
			float4 color8_g891 = IsGammaSpace() ? float4( 1, 1, 1, 1 ) : float4( 1, 1, 1, 1 );
			float2 uv_AmbientOcclusion = i.uv_texcoord * _AmbientOcclusion_ST.xy + _AmbientOcclusion_ST.zw;
			float4 temp_output_3_0_g891 = ( 1.0 - ( ( 1.0 - tex2D( _AmbientOcclusion, uv_AmbientOcclusion ) ) * _AOStrength ) );
			float temp_output_9_0_g891 = _RealAO;
			float4 lerpResult5_g891 = lerp( color8_g891 , temp_output_3_0_g891 , temp_output_9_0_g891);
			float4 mainTex26 = ( tex2DNode25 * lerpResult5_g891 * _Color );
			float3 indirectNormal4_g1355 = normalize( WorldNormalVector( i , temp_output_11_0_g1349 ) );
			float2 uv_MetallicGlossMap = i.uv_texcoord * _MetallicGlossMap_ST.xy + _MetallicGlossMap_ST.zw;
			float4 tex2DNode1017 = tex2D( _MetallicGlossMap, uv_MetallicGlossMap );
			float lerpResult2707 = lerp( tex2DNode1017.a , tex2DNode1017.g , _SmoothnessChannel);
			float _Smoothness755 = lerpResult2707;
			float temp_output_5_0_g1355 = _Smoothness755;
			Unity_GlossyEnvironmentData g4_g1355 = UnityGlossyEnvironmentSetup( temp_output_5_0_g1355, data.worldViewDir, indirectNormal4_g1355, float3(0,0,0));
			float3 indirectSpecular4_g1355 = UnityGI_IndirectSpecular( data, 1.0, indirectNormal4_g1355, g4_g1355 );
			float _Metalic753 = tex2DNode1017.r;
			float temp_output_10_0_g1355 = _Metalic753;
			float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_positionWS );
			float3 ase_viewDirWS = normalize( ase_viewVectorWS );
			float3 ase_normalWS = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_normalWSNorm = normalize( ase_normalWS );
			float fresnelNdotV22_g1355 = dot( ase_normalWSNorm, ase_viewDirWS );
			float fresnelNode22_g1355 = ( temp_output_10_0_g1355 + ( temp_output_5_0_g1355 * 1.0 ) * pow( max( 1.0 - fresnelNdotV22_g1355 , 0.0001 ), 1.0 ) );
			float lerpResult35_g1355 = lerp( temp_output_10_0_g1355 , ( temp_output_5_0_g1355 * saturate( fresnelNode22_g1355 ) ) , _MetallicReflectionMode);
			float4 lerpResult21_g1355 = lerp( mainTex26 , float4( indirectSpecular4_g1355 , 0.0 ) , lerpResult35_g1355);
			float4 Lighting_Wrapped1144 = ( clampResult37_g1350 * lerpResult21_g1355 );
			c.rgb = Lighting_Wrapped1144.rgb;
			c.a = alpha2635;
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
			float4 temp_output_51_0_g1373 = ALMask39;
			float4 color42 = IsGammaSpace() ? float4( 1, 0, 0, 1 ) : float4( 1, 0, 0, 1 );
			float3 hsvTorgb4_g1391 = RGBToHSV( color42.rgb );
			float mulTime48 = _Time.y * _ALTimeScale;
			float Time50 = frac( mulTime48 );
			float temp_output_54_0_g1373 = Time50;
			float3 hsvTorgb8_g1391 = HSVToRGB( float3(( hsvTorgb4_g1391.x + temp_output_54_0_g1373 ),( hsvTorgb4_g1391.y + 0.0 ),( hsvTorgb4_g1391.z + 0.0 )) );
			float3 temp_output_5_0_g1390 = saturate( hsvTorgb8_g1391 );
			int Band3_g1392 = 0;
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
			float4 ase_positionSS = float4( i.screenPos.xyz , i.screenPos.w + 1e-7 );
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
			int temp_output_55_0_g1373 = (int)in_ALDelay991;
			int Delay3_g1392 = temp_output_55_0_g1373;
			float localAudioLinkData3_g1392 = AudioLinkData3_g1392( Band3_g1392 , Delay3_g1392 );
			float temp_output_8_0_g1393 = 1.0;
			float localIfAudioLinkv2Exists1_g1394 = IfAudioLinkv2Exists1_g1394();
			float temp_output_7_0_g1393 = saturate( ( localIfAudioLinkv2Exists1_g1394 + 1.0 ) );
			float3 lerpResult6_g1393 = lerp( temp_output_5_0_g1390 , ( temp_output_5_0_g1390 * localAudioLinkData3_g1392 ) , ( step( temp_output_8_0_g1393 , temp_output_7_0_g1393 ) * step( temp_output_7_0_g1393 , temp_output_8_0_g1393 ) ));
			float4 color44 = IsGammaSpace() ? float4( 0, 0.8196079, 0, 1 ) : float4( 0, 0.637597, 0, 1 );
			float3 hsvTorgb4_g1375 = RGBToHSV( color44.rgb );
			float3 hsvTorgb8_g1375 = HSVToRGB( float3(( hsvTorgb4_g1375.x + temp_output_54_0_g1373 ),( hsvTorgb4_g1375.y + 0.0 ),( hsvTorgb4_g1375.z + 0.0 )) );
			float3 temp_output_5_0_g1374 = saturate( hsvTorgb8_g1375 );
			int Band3_g1376 = 2;
			int Delay3_g1376 = temp_output_55_0_g1373;
			float localAudioLinkData3_g1376 = AudioLinkData3_g1376( Band3_g1376 , Delay3_g1376 );
			float temp_output_8_0_g1377 = 1.0;
			float localIfAudioLinkv2Exists1_g1378 = IfAudioLinkv2Exists1_g1378();
			float temp_output_7_0_g1377 = saturate( ( localIfAudioLinkv2Exists1_g1378 + 0.0 ) );
			float3 lerpResult6_g1377 = lerp( temp_output_5_0_g1374 , ( temp_output_5_0_g1374 * localAudioLinkData3_g1376 ) , ( step( temp_output_8_0_g1377 , temp_output_7_0_g1377 ) * step( temp_output_7_0_g1377 , temp_output_8_0_g1377 ) ));
			float4 color43 = IsGammaSpace() ? float4( 1, 0.9294118, 0, 1 ) : float4( 1, 0.8468735, 0, 1 );
			float3 hsvTorgb4_g1380 = RGBToHSV( color43.rgb );
			float3 hsvTorgb8_g1380 = HSVToRGB( float3(( hsvTorgb4_g1380.x + temp_output_54_0_g1373 ),( hsvTorgb4_g1380.y + 0.0 ),( hsvTorgb4_g1380.z + 0.0 )) );
			float3 temp_output_5_0_g1379 = saturate( hsvTorgb8_g1380 );
			int Band3_g1381 = 1;
			int Delay3_g1381 = temp_output_55_0_g1373;
			float localAudioLinkData3_g1381 = AudioLinkData3_g1381( Band3_g1381 , Delay3_g1381 );
			float temp_output_8_0_g1382 = 1.0;
			float localIfAudioLinkv2Exists1_g1383 = IfAudioLinkv2Exists1_g1383();
			float temp_output_7_0_g1382 = saturate( ( localIfAudioLinkv2Exists1_g1383 + 0.0 ) );
			float3 lerpResult6_g1382 = lerp( temp_output_5_0_g1379 , ( temp_output_5_0_g1379 * localAudioLinkData3_g1381 ) , ( step( temp_output_8_0_g1382 , temp_output_7_0_g1382 ) * step( temp_output_7_0_g1382 , temp_output_8_0_g1382 ) ));
			float4 color45 = IsGammaSpace() ? float4( 0, 0, 1, 1 ) : float4( 0, 0, 1, 1 );
			float3 hsvTorgb4_g1385 = RGBToHSV( color45.rgb );
			float3 hsvTorgb8_g1385 = HSVToRGB( float3(( hsvTorgb4_g1385.x + temp_output_54_0_g1373 ),( hsvTorgb4_g1385.y + 0.0 ),( hsvTorgb4_g1385.z + 0.0 )) );
			float3 temp_output_5_0_g1384 = saturate( hsvTorgb8_g1385 );
			int Band3_g1386 = 3;
			int Delay3_g1386 = temp_output_55_0_g1373;
			float localAudioLinkData3_g1386 = AudioLinkData3_g1386( Band3_g1386 , Delay3_g1386 );
			float temp_output_8_0_g1387 = 1.0;
			float localIfAudioLinkv2Exists1_g1388 = IfAudioLinkv2Exists1_g1388();
			float temp_output_7_0_g1387 = saturate( ( localIfAudioLinkv2Exists1_g1388 + 0.0 ) );
			float3 lerpResult6_g1387 = lerp( temp_output_5_0_g1384 , ( temp_output_5_0_g1384 * localAudioLinkData3_g1386 ) , ( step( temp_output_8_0_g1387 , temp_output_7_0_g1387 ) * step( temp_output_7_0_g1387 , temp_output_8_0_g1387 ) ));
			float localIfAudioLinkv2Exists1_g1389 = IfAudioLinkv2Exists1_g1389();
			float4 AL_Final85 = ( ( _EnableAudioLink * ( ( temp_output_51_0_g1373 * float4( lerpResult6_g1393 , 0.0 ) ) + ( temp_output_51_0_g1373 * float4( lerpResult6_g1377 , 0.0 ) ) + ( temp_output_51_0_g1373 * float4( lerpResult6_g1382 , 0.0 ) ) + ( temp_output_51_0_g1373 * float4( lerpResult6_g1387 , 0.0 ) ) ) ) * saturate( ( localIfAudioLinkv2Exists1_g1389 + _ALEmitifInactive ) ) );
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 Emission119 = ( tex2D( _Emission, uv_Emission ) * _EmissionColor );
			float3 ase_positionWS = i.worldPos;
			float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_positionWS );
			float3 ase_viewDirWS = normalize( ase_viewVectorWS );
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 normalMap1002 = UnpackNormal( tex2D( _BumpMap, uv_BumpMap ) );
			float fresnelNdotV9_g1395 = dot( (WorldNormalVector( i , normalMap1002 )), ase_viewDirWS );
			float fresnelNode9_g1395 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV9_g1395, _RimPower ) );
			float4 lerpResult14_g1395 = lerp( float4( 1,1,1,0 ) , mainTex26 , _RimBaseColorStrength);
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float3 hsvTorgb3_g1395 = RGBToHSV( ase_lightColor.rgb );
			float3 temp_output_11_0_g1349 = normalMap1002;
			float3 temp_output_2_0_g1350 = temp_output_11_0_g1349;
			float3 temp_output_1_0_g1353 = temp_output_2_0_g1350;
			float4 appendResult6_g1353 = (float4(( temp_output_1_0_g1353 * 0.3 ) , 1.0));
			float4 Normal7_g1353 = appendResult6_g1353;
			float3 localShadeSH97_g1353 = ShadeSH97_g1353( Normal7_g1353 );
			float temp_output_9_0_g1353 = _IndirectDiffuseOffset;
			float temp_output_8_0_g1354 = 1.0;
			float temp_output_7_0_g1354 = _IndirLightUseMinforMax;
			float lerpResult6_g1354 = lerp( _IndirectDiffuseOffsetMax , temp_output_9_0_g1353 , ( step( temp_output_8_0_g1354 , temp_output_7_0_g1354 ) * step( temp_output_7_0_g1354 , temp_output_8_0_g1354 ) ));
			float temp_output_8_0_g1353 = lerpResult6_g1354;
			float3 temp_output_16_0_g1353 = saturate( ( localShadeSH97_g1353 + temp_output_8_0_g1353 ) );
			float3 maxIndirLight2618 = temp_output_16_0_g1353;
			float3 hsvTorgb24_g1395 = RGBToHSV( maxIndirLight2618 );
			float4 Rim116 = ( _EnableRimLighting * ( ( ( fresnelNode9_g1395 * _RimEnergy ) * lerpResult14_g1395 ) * max( ( 0.0 * saturate( ( exp( hsvTorgb3_g1395.z ) - 1.0 ) ) ) , hsvTorgb24_g1395.z ) ) );
			float4 EmissionFinal29 = saturate( ( AL_Final85 + Emission119 + Rim116 ) );
			o.Emission = EmissionFinal29.rgb;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardCustomLighting alpha:fade keepalpha fullforwardshadows exclude_path:deferred vertex:vertexDataFunc 

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
			sampler3D _DitherMaskLOD;
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float4 customPack1 : TEXCOORD1;
				float4 customPack2 : TEXCOORD2;
				float4 screenPos : TEXCOORD3;
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
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				o.screenPos = ComputeScreenPos( o.pos );
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
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				surfIN.screenPos = IN.screenPos;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT( UnityGI, gi );
				o.Alpha = LightingStandardCustomLighting( o, worldViewDir, gi ).a;
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				half alphaRef = tex3D( _DitherMaskLOD, float3( vpos.xy * 0.25, o.Alpha * 0.9375 ) ).a;
				clip( alphaRef - 0.01 );
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
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2357;-2032,-2688;Inherit;False;Property;_ALDelayUVMap;AL Delay UV Map;28;2;[Header];[Enum];Create;True;0;5;UV0;0;UV1;1;UV2;2;UV3;3;Screen Space;8;0;True;0;False;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2627;-1824,-2688;Inherit;False;VVGetTextureUV;-1;;885;c300954d56021714fb5c622c8f34ec06;0;1;32;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;27;-2064,-3536;Inherit;False;1084.464;673.0301;Comment;12;2630;2546;2307;26;1003;2629;25;2552;2540;2542;2635;1047;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;977;-272,-3248;Inherit;False;1452.845;376.6802;Comment;8;991;985;987;979;993;2458;2457;2363;AudioLink Delay Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2355;-1616,-2688;Inherit;False;DelayUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;37;-1072,-1328;Inherit;False;859.9141;343.3768;Comment;3;34;1002;1006;Normal Map;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2363;-240,-3152;Inherit;False;2355;DelayUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2542;-2000,-3280;Inherit;False;Property;_AOStrength;AO Strength;22;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2540;-2032,-3216;Inherit;True;Property;_AmbientOcclusion;Ambient Occlusion;21;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2552;-1872,-3040;Inherit;False;Property;_RealAO;Real AO;23;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1003;-2000,-3472;Inherit;True;Property;_MainTex;Albedo;1;1;[SingleLineTexture];Create;False;1;Standard Fallbacks;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2639;2743.86,-140.2664;Inherit;False;564.665;432.8813;Comment;6;2658;2657;2649;2648;2647;2646;Camera Globals;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2050;-2016,-1456;Inherit;False;859.9478;416.3767;Comment;5;2707;2708;1017;755;753;Metallic and Smoothness;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2457;-32,-3168;Inherit;True;Property;_ALDelayMap;AudioLink Delay Tex Map;27;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;25;-1712,-3472;Inherit;True;Property;_AlbedoSample;Albedo Sample;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1006;-1008,-1216;Inherit;True;Property;_BumpMap;Normal Map;3;1;[SingleLineTexture];Create;False;0;0;0;True;0;False;None;None;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2307;-1616,-3056;Inherit;False;Property;_Color;Color;2;0;Create;False;0;0;0;True;0;False;1,1,1,0;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2630;-1728,-3200;Inherit;False;VVAmbientOcclusion;-1;;891;9931be4718b157b4ebb46a99812bfe31;0;3;6;FLOAT;0;False;7;COLOR;0,0,0,0;False;9;FLOAT;0;False;2;COLOR;11;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2646;2791.86,-76.26636;Inherit;False;Global;CVRRenderingCam;CVRRenderingCam;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2708;-1952,-1168;Inherit;False;Property;_SmoothnessChannel;Smoothness Channel;17;1;[Enum];Create;False;0;2;Alpha;0;Green;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1017;-1984,-1392;Inherit;True;Property;_MetallicGlossMap;Metallic Smoothness;16;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;34;-736,-1216;Inherit;True;Property;_NMSample;NM Sample;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;72;1440,-3088;Inherit;False;765.7347;170.1592;Comment;4;243;50;49;48;Time;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;979;160,-2976;Inherit;False;Property;_ALUVDelayMaxDelay;AL UV Delay Max Delay;29;0;Create;True;0;0;0;False;0;False;0;127;0;127;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2458;256,-3168;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2629;-1360,-3312;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;201;-2064,-2464;Inherit;False;668.8916;177.8153;Selection of UV Maps to Use for UV Tile Discarding;3;2313;200;2626;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2641;2759.86,-732.2664;Inherit;False;1226.13;481.8655;Comment;12;2674;2672;2670;2669;2666;2665;2662;2661;2656;2655;2654;2653;Disable Rendering in Social VR Mirrors;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2648;2999.86,-76.26636;Inherit;False;cvr camera;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2649;2791.86,115.7336;Inherit;False;Global;_VRChatMirrorMode;_VRChatMirrorMode;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2640;2759.86,-1324.266;Inherit;False;1222.874;463.641;Comment;11;2673;2671;2668;2667;2664;2663;2660;2659;2652;2651;2650;Disable Rendering in Social VR Cameras;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2647;2791.86,19.73364;Inherit;False;Global;_VRChatCameraMode;_VRChatCameraMode;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2707;-1616,-1264;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1002;-416,-1200;Inherit;False;normalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;993;496,-3184;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;127;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;243;1472,-3040;Inherit;False;Property;_ALTimeScale;AL HueShift Time Scale;30;0;Create;False;0;0;0;False;0;False;0;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2602;-2031.881,-896;Inherit;False;1379.881;1212.574;Comment;20;2711;2712;2713;1497;2567;2291;2584;2583;2582;2375;2589;1207;2556;2415;2414;2392;1144;2618;2634;2714;Shading;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;26;-1200,-3312;Inherit;False;mainTex;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2313;-2016,-2400;Inherit;False;Property;_DiscardUVMap;Discard UV Map;35;2;[Header];[Enum];Create;True;1;UV Tile Discarding;4;UV0;0;UV1;1;UV2;2;UV3;3;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2653;2791.86,-444.2664;Inherit;False;Constant;_Float18;Float 14;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2654;2791.86,-364.2664;Inherit;False;Constant;_Float19;Float 15;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2655;2791.86,-524.2664;Inherit;False;Constant;_Float21;Float 21;48;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2656;2807.86,-604.2664;Inherit;False;2648;cvr camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2658;3031.86,115.7336;Inherit;False;vrc mirror;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2650;2807.86,-1180.266;Inherit;False;2648;cvr camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2651;2807.86,-1100.266;Inherit;False;Constant;_Float14;Float 14;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2652;2807.86,-1020.266;Inherit;False;Constant;_Float15;Float 15;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2657;3031.86,19.73364;Inherit;False;vrc camera;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;753;-1424,-1328;Inherit;False;_Metalic;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;755;-1424,-1264;Inherit;False;_Smoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;38;16,-2656;Inherit;False;604.8932;280;Comment;2;40;39;AL Emission Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;987;672,-3184;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;127;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;48;1712,-3040;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2626;-1840,-2400;Inherit;False;VVGetVertexUV;-1;;974;b2c6b9b1b245cf54ca03e50557eebb87;0;1;26;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2661;2999.86,-524.2664;Inherit;False;If Float Equal;-1;;1300;bdca1c28487c8a1418e72579bec63589;0;4;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2662;3015.86,-620.2664;Inherit;False;2658;vrc mirror;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2659;2999.86,-1116.266;Inherit;False;If Float Equal;-1;;1348;bdca1c28487c8a1418e72579bec63589;0;4;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2660;3015.86,-1212.266;Inherit;False;2657;vrc camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2392;-1904,-576;Inherit;False;Property;_IndirectDiffuseOffset;Indirect Light Min;7;0;Create;False;0;0;0;False;0;False;0;0.04;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2414;-1904,-512;Inherit;False;Property;_IndirectDiffuseOffsetMax;Indirect Light Max;8;0;Create;False;0;0;0;False;0;False;0;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2415;-1808,-448;Inherit;False;Property;_IndirLightUseMinforMax;Use Min for Max;9;1;[ToggleUI];Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2556;-1872,-384;Inherit;False;Property;_IndirectLimiterMode;Indirect Limiter Mode;10;1;[Enum];Create;True;0;2;Clamp;0;Remap;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1207;-1872,-320;Inherit;False;Property;_WrappedShadingValue;Wrapped Shading Value;12;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2589;-1808,192;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2375;-1904,-192;Inherit;False;Property;_MinBrightness;Min Brightness;6;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2582;-1808,-128;Inherit;False;1002;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2583;-1840,-64;Inherit;False;755;_Smoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2584;-1808,0;Inherit;False;753;_Metalic;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2291;-1840,-256;Inherit;False;Property;_WrapIndirScale;Indirect Light Scale;14;0;Create;False;0;0;0;False;0;False;3;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2713;-1936,-640;Inherit;False;Property;_ClampRealtimeLighting;Relative Clamp Realtime Lighting;11;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2712;-1904,-704;Inherit;False;Property;_RealtimeLightMax;Relative Real Light Max;13;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2711;-1904,-768;Inherit;False;Property;_RealtimeLightMin;Relative Real Light Min;15;0;Create;False;0;0;0;False;0;False;0.7521966;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2714;-1936,-832;Inherit;False;Property;_MetallicReflectionMode;Fresnel Metallics (Experimental);18;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;49;1872,-3040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RoundOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;985;800,-3184;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;40;80,-2608;Inherit;True;Property;_AL_Mask;AudioLink Mask;26;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2634;-1328,-640;Inherit;True;VivikaShading;-1;;1349;efce34b3f4a0e2b44933c4737d48061f;0;15;54;FLOAT;0;False;51;FLOAT;0;False;52;FLOAT;0;False;48;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;3;False;9;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT3;0,0,0;False;12;FLOAT;0;False;13;FLOAT;0;False;18;COLOR;0,0,0,0;False;2;FLOAT3;32;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;200;-1632,-2400;Inherit;False;DiscardUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2665;3191.86,-588.2664;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2666;3191.86,-684.2664;Inherit;False;Constant;_Float20;Float 12;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2663;3191.86,-1180.266;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2664;3191.86,-1276.266;Inherit;False;Constant;_Float12;Float 12;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2687;1376,-1264;Inherit;False;1050.305;1191.881;Comment;19;2690;2688;2732;2733;2734;2735;2736;2737;2738;2739;2740;2741;2742;2743;2744;2745;2746;2747;2748;UV Tile Discard;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1;32,-1120;Inherit;False;1041.734;585.5447;Comment;9;116;2620;2621;333;2505;1404;12;87;113;Rim;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;117;16,-2288;Inherit;False;907.3133;529.2772;Comment;4;1005;119;121;118;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;107;-1328,-2656;Inherit;False;1185.214;1096.479;Comment;11;85;2616;42;44;43;45;415;2614;995;51;75;AudioLink Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;991;944,-3168;Inherit;False;in_ALDelay;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;50;1984,-3040;Inherit;False;Time;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;39;400,-2608;Inherit;False;ALMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2618;-896,-688;Inherit;False;maxIndirLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2669;3351.86,-636.2664;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2670;2999.86,-364.2664;Inherit;False;Property;_DontRenderinSocialVRMirrors;Don't Render in Social VR Mirrors;55;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2667;3351.86,-1228.266;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2668;2999.86,-956.2664;Inherit;False;Property;_DontRenderInSocialVRCameras;Don't Render in Social VR Cameras;54;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2688;1504,-192;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2733;1408,-1216;Inherit;False;Property;_UDIMDiscardRow0_0;Discard UV Row 0,0;36;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2734;1408,-1152;Inherit;False;Property;_UDIMDiscardRow1_0;Discard UV Row 1,0;37;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2735;1408,-1088;Inherit;False;Property;_UDIMDiscardRow2_0;Discard UV Row 2,0;38;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2736;1408,-1024;Inherit;False;Property;_UDIMDiscardRow3_0;Discard UV Row 3,0;39;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2737;1408,-960;Inherit;False;Property;_UDIMDiscardRow0_1;Discard UV Row 0,1;40;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2738;1408,-896;Inherit;False;Property;_UDIMDiscardRow1_1;Discard UV Row 1,1;41;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2739;1408,-832;Inherit;False;Property;_UDIMDiscardRow2_1;Discard UV Row 2,1;42;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2740;1408,-768;Inherit;False;Property;_UDIMDiscardRow3_1;Discard UV Row 3,1;43;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2741;1408,-704;Inherit;False;Property;_UDIMDiscardRow0_2;Discard UV Row 0,2;44;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2742;1408,-640;Inherit;False;Property;_UDIMDiscardRow1_2;Discard UV Row 1,2;45;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2743;1408,-576;Inherit;False;Property;_UDIMDiscardRow2_2;Discard UV Row 2,2;46;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2744;1408,-512;Inherit;False;Property;_UDIMDiscardRow3_2;Discard UV Row 3,2;47;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2745;1408,-448;Inherit;False;Property;_UDIMDiscardRow0_3;Discard UV Row 0,3;48;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2746;1408,-384;Inherit;False;Property;_UDIMDiscardRow1_3;Discard UV Row 1,3;49;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2747;1408,-320;Inherit;False;Property;_UDIMDiscardRow2_3;Discard UV Tile 2,3;50;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2748;1408,-256;Inherit;False;Property;_UDIMDiscardRow3_3;Discard UV Row 3,3;51;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;75;-944,-1920;Inherit;False;39;ALMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;51;-1168,-1936;Inherit;False;50;Time;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;995;-1168,-1872;Inherit;False;991;in_ALDelay;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2614;-1200,-1744;Inherit;False;Property;_ALEmitifInactive;AL Emit if Inactive;25;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;415;-1264,-1808;Half;False;Property;_EnableAudioLink;Enable AudioLink;24;2;[Header];[ToggleUI];Create;True;1;AudioLink;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;45;-1200,-2096;Inherit;False;Constant;_AL_Treble;AL_Treble;6;0;Create;True;0;0;0;False;0;False;0,0,1,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;43;-1200,-2256;Inherit;False;Constant;_AL_LowMid;AL_LowMid;6;0;Create;True;0;0;0;False;0;False;1,0.9294118,0,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;44;-1200,-2416;Inherit;False;Constant;_AL_HighMid;AL_HighMid;6;0;Create;True;0;0;0;False;0;False;0,0.8196079,0,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;42;-1200,-2576;Inherit;False;Constant;_AL_Bass;AL_Bass;6;0;Create;True;0;0;0;False;0;False;1,0,0,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;113;96,-848;Inherit;False;Property;_RimBaseColorStrength;Rim Base Color Strength;34;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;87;96,-912;Inherit;False;Property;_RimEnergy;Rim Energy;33;0;Create;True;0;0;0;False;0;False;0.345;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;12;96,-976;Float;False;Property;_RimPower;Rim Power;32;0;Create;True;0;0;0;False;0;False;2.07;1.86;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1404;192,-784;Inherit;False;1002;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2505;160,-720;Inherit;False;2618;maxIndirLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;333;96,-1040;Half;False;Property;_EnableRimLighting;Enable Rim Lighting;31;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2621;192,-656;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2672;3463.86,-588.2664;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1005;128,-1952;Inherit;False;Property;_EmissionColor;Emission Color;5;0;Create;False;0;0;0;True;0;False;0,0,0,0;0,1,0.9604408,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;118;80,-2224;Inherit;True;Property;_Emission;Emission;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2671;3463.86,-1180.266;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2732;1888,-864;Inherit;False;VVUVTileDiscardFull;-1;;1490;37cd3007c1dbdac4b9341609f3fa3a5a;0;17;100;FLOAT;0;False;101;FLOAT;0;False;102;FLOAT;0;False;103;FLOAT;0;False;104;FLOAT;0;False;105;FLOAT;0;False;106;FLOAT;0;False;107;FLOAT;0;False;108;FLOAT;0;False;109;FLOAT;0;False;110;FLOAT;0;False;111;FLOAT;0;False;112;FLOAT;0;False;113;FLOAT;0;False;114;FLOAT;0;False;115;FLOAT;0;False;99;FLOAT2;0,0;False;1;FLOAT;116
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;121;432,-2144;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2616;-720,-2336;Inherit;False;VVALCombine;-1;;1373;bceeba5c9c06c59459d6b7e4bf2084da;0;9;54;FLOAT;0;False;55;INT;0;False;25;COLOR;1,0,0,1;False;27;COLOR;1,0.9294118,0,1;False;26;COLOR;0,0.8196079,0,1;False;28;COLOR;0,0,1,1;False;51;COLOR;0,0,0,0;False;52;FLOAT;0;False;53;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2620;496,-912;Inherit;False;Rim;-1;;1395;652e8c2aadb4b694999944f1079d1366;0;7;29;FLOAT;0;False;30;FLOAT;0;False;31;FLOAT;0;False;32;FLOAT;0;False;26;FLOAT3;0,0,0;False;27;FLOAT3;0,0,0;False;28;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2642;2775.86,-2476.266;Inherit;False;468;235;Comment;2;2645;2644;Vertex Position Results;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2643;2743.86,-2028.266;Inherit;False;1616.048;535.0431;Comment;12;2686;2685;2683;2682;2681;2679;2678;2677;2676;2675;2709;2710;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2690;2208,-848;Inherit;False;UVTileDiscard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2674;3623.86,-620.2664;Inherit;False;Dont Render in Social VR Mirror Result;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2673;3607.86,-1212.266;Inherit;False;Dont Render in Social VR Camera Result;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;31;16,-1680;Inherit;False;798.6848;366.049;Comment;6;29;2539;30;86;28;122;Emission Combination;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;119;592,-2224;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;85;-400,-2288;Inherit;False;AL_Final;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;116;848,-912;Float;False;Rim;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PosVertexDataNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2644;2807.86,-2412.266;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2677;2791.86,-1804.266;Inherit;False;2674;Dont Render in Social VR Mirror Result;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2675;2791.86,-1884.266;Inherit;False;2673;Dont Render in Social VR Camera Result;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2676;2919.86,-1964.266;Inherit;False;2690;UVTileDiscard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2709;2872.272,-1629.46;Inherit;False;Property;_UDIMDiscardAll;Discard All;52;1;[ToggleUI];Create;False;1;The Following Setting Completely Disables Rendering whatever is using this material. This works similarly to UV Tile Discarding.;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;122;48,-1520;Inherit;False;119;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;28;32,-1440;Inherit;False;116;Rim;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;86;32,-1616;Inherit;False;85;AL_Final;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2645;3031.86,-2428.266;Inherit;False;Vertex Position;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2678;3239.86,-1692.266;Inherit;False;Constant;_Float11;Float 11;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2679;3175.86,-1900.266;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;30;240,-1536;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2682;3415.86,-1724.266;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2683;3319.86,-1580.266;Inherit;False;2645;Vertex Position;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2710;3360,-1920;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2681;3383.86,-1820.266;Inherit;False;Constant;_Float5;Float 5;46;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2539;448,-1536;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2685;3607.86,-1884.266;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;220;1248,-2688;Inherit;False;962.8354;715.8684;Comment;5;0;33;32;193;332;Output;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;217;1840,-1792;Inherit;False;420.8079;185;Comment;2;219;218;Declare NaN;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1144;-896,-576;Inherit;False;Lighting Wrapped;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;29;592,-1536;Inherit;False;EmissionFinal;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2635;-1349.583,-3449.378;Inherit;False;alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2637;-458.2572,-4105.429;Inherit;False;324;355;Comment;1;2638;Fallbacks;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2686;3895.86,-1836.266;Inherit;False;Discard Vertex;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;33;1488,-2640;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;218;1888,-1744;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;219;2048,-1744;Inherit;False;NaN;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;32;1504,-2464;Inherit;False;29;EmissionFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2546;-1312,-3088;Inherit;False;ao_times_strength;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;332;1552,-2176;Inherit;False;1144;Lighting Wrapped;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2636;1529.536,-2339.176;Inherit;False;2635;alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1047;-1120,-3456;Inherit;False;Property;_CullMode;Cull Mode;0;1;[Enum];Create;True;0;3;Off;0;Front;1;Back;2;0;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2638;-410.2572,-4041.429;Inherit;True;Property;_EmissionMap;Fallback Emission Map;53;1;[SingleLineTexture];Create;False;0;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;193;1552,-2112;Inherit;False;2686;Discard Vertex;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2567;-1872,128;Inherit;False;Property;_MetallicFresnelPower;Metallic Fresnel Power;20;0;Create;True;0;0;0;False;0;False;3;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1497;-1840,64;Inherit;False;Property;_WrapMetallicFesnelScale;Metallic Fesnel Scale;19;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;0;1968,-2528;Float;False;True;-1;2;AmplifyShaderEditor.MaterialInspector;0;0;CustomLighting;VoyVivika/VivikaShader/Vivika Shader Transparent;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Transparent;0.5;True;True;0;False;Transparent;;Transparent;ForwardOnly;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;2;5;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;Standard;-1;-1;-1;-1;1;VRCFallback=DoubleSided;False;0;0;True;_CullMode;-1;0;False;;1;Include;..\Libs\AudioLink\AudioLink.cginc;False;;Custom;False;0;0;;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
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
WireConnection;2648;0;2646;0
WireConnection;2707;0;1017;4
WireConnection;2707;1;1017;2
WireConnection;2707;2;2708;0
WireConnection;1002;0;34;0
WireConnection;993;0;2458;3
WireConnection;993;4;979;0
WireConnection;26;0;2629;0
WireConnection;2658;0;2649;0
WireConnection;2657;0;2647;0
WireConnection;753;0;1017;1
WireConnection;755;0;2707;0
WireConnection;987;0;993;0
WireConnection;48;0;243;0
WireConnection;2626;26;2313;0
WireConnection;2661;7;2656;0
WireConnection;2661;8;2655;0
WireConnection;2661;9;2653;0
WireConnection;2661;10;2654;0
WireConnection;2659;7;2650;0
WireConnection;2659;8;2651;0
WireConnection;2659;9;2651;0
WireConnection;2659;10;2652;0
WireConnection;49;0;48;0
WireConnection;985;0;987;0
WireConnection;2634;54;2714;0
WireConnection;2634;51;2711;0
WireConnection;2634;52;2712;0
WireConnection;2634;48;2713;0
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
WireConnection;200;0;2626;0
WireConnection;2665;0;2662;0
WireConnection;2665;1;2661;0
WireConnection;2663;0;2660;0
WireConnection;2663;1;2659;0
WireConnection;991;0;985;0
WireConnection;50;0;49;0
WireConnection;39;0;40;0
WireConnection;2618;0;2634;32
WireConnection;2669;0;2666;0
WireConnection;2669;1;2665;0
WireConnection;2667;0;2664;0
WireConnection;2667;1;2663;0
WireConnection;2672;0;2669;0
WireConnection;2672;1;2670;0
WireConnection;2671;0;2667;0
WireConnection;2671;1;2668;0
WireConnection;2732;100;2733;0
WireConnection;2732;101;2734;0
WireConnection;2732;102;2735;0
WireConnection;2732;103;2736;0
WireConnection;2732;104;2737;0
WireConnection;2732;105;2738;0
WireConnection;2732;106;2739;0
WireConnection;2732;107;2740;0
WireConnection;2732;108;2741;0
WireConnection;2732;109;2742;0
WireConnection;2732;110;2743;0
WireConnection;2732;111;2744;0
WireConnection;2732;112;2745;0
WireConnection;2732;113;2746;0
WireConnection;2732;114;2747;0
WireConnection;2732;115;2748;0
WireConnection;2732;99;2688;0
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
WireConnection;2690;0;2732;116
WireConnection;2674;0;2672;0
WireConnection;2673;0;2671;0
WireConnection;119;0;121;0
WireConnection;85;0;2616;0
WireConnection;116;0;2620;0
WireConnection;2645;0;2644;0
WireConnection;2679;0;2676;0
WireConnection;2679;1;2675;0
WireConnection;2679;2;2677;0
WireConnection;2679;3;2709;0
WireConnection;30;0;86;0
WireConnection;30;1;122;0
WireConnection;30;2;28;0
WireConnection;2682;0;2678;0
WireConnection;2682;1;2678;0
WireConnection;2710;0;2679;0
WireConnection;2539;0;30;0
WireConnection;2685;0;2710;0
WireConnection;2685;1;2681;0
WireConnection;2685;2;2682;0
WireConnection;2685;3;2683;0
WireConnection;1144;0;2634;0
WireConnection;29;0;2539;0
WireConnection;2635;0;25;4
WireConnection;2686;0;2685;0
WireConnection;219;0;218;0
WireConnection;2546;0;2630;0
WireConnection;0;0;33;0
WireConnection;0;2;32;0
WireConnection;0;9;2636;0
WireConnection;0;13;332;0
WireConnection;0;11;193;0
ASEEND*/
//CHKSM=AD5333A5CDAED01C41B86C6DF06AEAE04368959C