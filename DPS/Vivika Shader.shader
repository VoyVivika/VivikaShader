// Made with Amplify Shader Editor v1.9.9.7
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VoyVivika/Vivika Shader/Vivika Shader DPS Penetrator"
{
	Properties
	{
		[Enum(Opaque,0,Cutout,1,Transparent Cutout,2,Transparent,3)] _Mode( "Render Mode", Float ) = 0
		[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend( "SrcBlend", Float ) = 0
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend( "DstBlend", Float ) = 0
		[ToggleUI] _ZWrite( "ZWrite", Float ) = 1
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		[Enum(Off,0,Front,1,Back,2)] _CullMode( "Cull Mode", Float ) = 0
		[SingleLineTexture] _MainTex( "Albedo", 2D ) = "white" {}
		_Color( "Color", Color ) = ( 1, 1, 1, 1 )
		[Toggle( _CUSTOMALPHAMAP )] _UseAlphaMap( "Use Alpha Map", Float ) = 0
		[SingleLineTexture] _AlphaMap( "Alpha Map", 2D ) = "white" {}
		_AlphaMapStrength( "Alpha Map Strength", Range( 0, 1 ) ) = 1
		[SingleLineTexture] _BumpMap( "Normal Map", 2D ) = "bump" {}
		_NormalMapRealtimeStrength( "Normal Map Realtime Strength", Float ) = 10
		_Emission( "Emission", 2D ) = "black" {}
		_EmissionColor( "Emission Color", Color ) = ( 0, 0, 0, 0 )
		_MinBrightness( "Min Brightness", Range( 0, 1 ) ) = 0
		_IndirectDiffuseOffset( "Indirect Light Min", Range( 0, 1 ) ) = 1
		_IndirectDiffuseOffsetMax( "Indirect Light Max", Range( 0, 1 ) ) = 0
		[ToggleUI] _IndirLightUseMinforMax( "Use Min for Max", Float ) = 1
		[ToggleUI] _ClampRealtimeLighting( "Relative Clamp Realtime Lighting", Float ) = 0
		_RealtimeLightMax( "Relative Real Light Max", Range( 0, 1 ) ) = 0
		_RealtimeLightMin( "Relative Real Light Min", Range( 0, 1 ) ) = 0
		[Enum(Clamp,0,Remap,1)] _IndirectLimiterMode( "Indirect Limiter Mode", Float ) = 0
		_WrappedShadingValue( "Wrapped Shading Value", Float ) = 1
		_WrapIndirScale( "Indirect Light Scale", Float ) = 3
		[SingleLineTexture] _MetallicGlossMap( "Metallic Smoothness", 2D ) = "black" {}
		[Enum(Alpha,0,Green,1,Option3,2)] _SmoothnessChannel( "Smoothness Channel", Float ) = 0
		_MetallicStrength( "Metallic Strength", Range( 0, 1 ) ) = 1
		_SmoothnessStrength( "Smoothness Strength", Range( 0, 1 ) ) = 1
		[ToggleUI] _MetallicReflectionMode( "Fresnel Metallics (Experimental)", Float ) = 0
		[SingleLineTexture] _FallbackReflection( "Fallback Reflection", CUBE ) = "black" {}
		[ToggleUI] _ForceFallbackReflections( "Force Fallback Reflections", Float ) = 0
		_AmbientOcclusion( "Ambient Occlusion", 2D ) = "white" {}
		_AOStrength( "AO Strength", Range( 0, 1 ) ) = 1
		[ToggleUI] _RealAO( "Real AO", Float ) = 0
		[Header(AudioLink)][Toggle( _ENABLEAUDIOLINK_ON )] _EnableAudioLink( "Enable AudioLink", Float ) = 0
		[ToggleUI] _AudioLinkToggle( "AudioLink Toggle (for Animation)", Float ) = 1
		[ToggleUI] _ALEmitifInactive( "AL Emit if Inactive", Float ) = 0
		[Enum(Bass,0,Low Mid,1,High Mid,2,Treble,3)] _InactEmitBand( "Inactive Emit Band", Float ) = 0
		[Toggle] _EmitAll( "Emit All", Float ) = 0
		_AL_Mask( "AudioLink Mask", 2D ) = "black" {}
		[SingleLineTexture] _ALDelayMap( "AudioLink Delay Tex Map", 2D ) = "black" {}
		[Enum(UV0,0,UV1,1,UV2,2,UV3,3,Screen Space,8)] _ALDelayUVMap( "AL Delay UV Map", Float ) = 2
		[Toggle] _DebugDelayMap( "Debug Delay Map", Float ) = 0
		[IntRange] _ALUVDelayMaxDelay( "AL UV Delay Max Delay", Range( 0, 127 ) ) = 0
		_AL_Bass( "Bass Color", Color ) = ( 1, 0, 0, 1 )
		[Enum(None,0,Red,1,Green,2,Blue,3,Alpha,4)] _ALBassDelay( "Bass Delay Channel", Float ) = 1
		[Enum(None,0,Red,1,Green,2,Blue,3,Alpha,4)] _ALBassMask( "Bass Mask Channel", Float ) = 1
		_AL_LowMid( "Low Mid Color", Color ) = ( 1, 0.9294118, 0, 1 )
		[Enum(None,0,Red,1,Green,2,Blue,3,Alpha,4)] _ALLowMidMask( "Low Mid Mask Channel", Float ) = 3
		[Enum(None,0,Red,1,Green,2,Blue,3,Alpha,4)] _ALLowMidDelay( "Low Mid Delay Channel", Float ) = 3
		_AL_HighMid( "High Mid Color", Color ) = ( 0, 0.8196079, 0, 1 )
		[Enum(None,0,Red,1,Green,2,Blue,3,Alpha,4)] _ALHighMidMask( "High Mid Mask Channel", Float ) = 2
		[Enum(None,0,Red,1,Green,2,Blue,3,Alpha,4)] _ALHighMidDelay( "High Mid Delay Channel", Float ) = 2
		_AL_Treble( "Treble Color", Color ) = ( 0, 0, 1, 1 )
		[Enum(None,0,Red,1,Green,2,Blue,3,Alpha,4)] _ALTrebleMask( "Treble Mask Channel", Float ) = 1
		[Enum(None,0,Red,1,Green,2,Blue,3,Alpha,4)] _ALTrebleDelay( "Treble Delay Channel", Float ) = 1
		_ALTimeScale( "AL HueShift Time Scale", Float ) = 0
		[Header(Rim Lighting)][Toggle( _ENABLERIMLIGHTING_ON )] _EnableRimLighting( "Enable Rim Lighting", Float ) = 0
		[ToggleUI] _RimToggle( "Rim Toggle (for Animation)", Float ) = 1
		_RimPower( "Rim Power", Range( 0, 10 ) ) = 2.07
		_RimEnergy( "Rim Energy", Range( 0, 1 ) ) = 0.345
		_RimBaseColorStrength( "Rim Base Color Strength", Range( 0, 1 ) ) = 1
		[Header(UV Tile Discarding)][Toggle( _VERTEXDISCARD_ON )] _EnableVertexDiscarding( "Enable Vertex Discarding", Float ) = 0
		[Enum(UV0,0,UV1,1,UV2,2,UV3,3)] _DiscardUVMap( "Discard UV Map", Float ) = 1
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
		[ToggleUI] _DontRenderInSocialVRCameras( "Don't Render in Social VR Cameras", Float ) = 0
		[ToggleUI] _DontRenderinSocialVRMirrors( "Don't Render in Social VR Mirrors", Float ) = 0
		[Header(Fallback Textures)][SingleLineTexture] _EmissionMap( "Fallback Emission Map", 2D ) = "white" {}
		[Header(DPS Penetrator Settings)] _Squeeze( "Squeeze Minimum Size", Range( 0, 0.2 ) ) = 0
		_SqueezeDist( "Squeeze Smoothness", Range( 0, 0.1 ) ) = 0
		_BulgePower( "Bulge Amount", Range( 0, 0.01 ) ) = 0
		_BulgeOffset( "Bulge Length", Range( 0, 0.3 ) ) = 0
		_Length( "Length of Penetrator Model", Range( 0, 3 ) ) = 0
		_EntranceStiffness( "Entrance Stiffness", Range( 0.01, 1 ) ) = 0.01
		_Curvature( "Curvature", Range( -1, 1 ) ) = 0
		_ReCurvature( "ReCurvature", Range( -1, 1 ) ) = 0
		_Wriggle( "Wriggle Amount", Range( 0, 1 ) ) = 0
		_WriggleSpeed( "Wriggle Speed", Range( 0.1, 30 ) ) = 0.28
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord4( "", 2D ) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  "VRCFallback"="DoubleSided" }
		Cull [_CullMode]
		ZWrite [_ZWrite]
		Blend [_SrcBlend] [_DstBlend] , [_SrcBlend] [_DstBlend]
		
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "../Libs/VRCLV/LightVolumes.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#pragma shader_feature_local _VERTEXDISCARD_ON
		#pragma shader_feature_local _ENABLEAUDIOLINK_ON
		#pragma shader_feature_local _ENABLERIMLIGHTING_ON
		#pragma shader_feature_local _AlphaIsInUse
		#pragma shader_feature_local _CUSTOMALPHAMAP
		#pragma shader_feature_local _DoDither
		#define ASE_VERSION 19907
		#include "..\Libs\AudioLink\AudioLink.cginc"
		#define RALIV_PENETRATOR
		#include "Assets/RalivDynamicPenetrationSystem/Plugins/RalivDPS_Defines.cginc"
		#include "Assets/RalivDynamicPenetrationSystem/Plugins/RalivDPS_Functions.cginc"
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
			float3 worldRefl;
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
		uniform float _SrcBlend;
		uniform float _DstBlend;
		uniform float _ZWrite;
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
		uniform float _AudioLinkToggle;
		uniform float _ALEmitifInactive;
		uniform sampler2D _AL_Mask;
		uniform float4 _AL_Mask_ST;
		uniform float _ALBassMask;
		uniform float4 _AL_Bass;
		uniform float _ALTimeScale;
		uniform float _EmitAll;
		uniform float _InactEmitBand;
		uniform sampler2D _ALDelayMap;
		uniform float _ALDelayUVMap;
		uniform float _ALUVDelayMaxDelay;
		uniform float _ALBassDelay;
		uniform float _ALLowMidMask;
		uniform float4 _AL_LowMid;
		uniform float _ALLowMidDelay;
		uniform float _ALHighMidMask;
		uniform float4 _AL_HighMid;
		uniform float _ALHighMidDelay;
		uniform float _ALTrebleMask;
		uniform float4 _AL_Treble;
		uniform float _ALTrebleDelay;
		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;
		uniform float4 _EmissionColor;
		uniform float _RimToggle;
		uniform sampler2D _BumpMap;
		uniform float4 _BumpMap_ST;
		uniform float _RimPower;
		uniform float _RimEnergy;
		uniform float _RimBaseColorStrength;
		uniform float _IndirectDiffuseOffsetMax;
		uniform float _IndirectDiffuseOffset;
		uniform float _IndirLightUseMinforMax;
		uniform sampler2D _AlphaMap;
		uniform float4 _AlphaMap_ST;
		uniform float _AlphaMapStrength;
		uniform float _Mode;
		uniform float _DebugDelayMap;
		uniform float _WrappedShadingValue;
		uniform float _NormalMapRealtimeStrength;
		uniform float _RealtimeLightMin;
		uniform float _RealtimeLightMax;
		uniform float _ClampRealtimeLighting;
		uniform float _IndirectLimiterMode;
		uniform float _WrapIndirScale;
		uniform float _MinBrightness;
		uniform sampler2D _MetallicGlossMap;
		uniform float4 _MetallicGlossMap_ST;
		uniform float _SmoothnessChannel;
		uniform float _SmoothnessStrength;
		uniform samplerCUBE _FallbackReflection;
		float4 _FallbackReflection_TexelSize;
		uniform float _ForceFallbackReflections;
		uniform float _MetallicStrength;
		uniform float _MetallicReflectionMode;
		uniform float _Cutoff = 0.5;


		float IfAudioLinkv2Exists1_g3394(  )
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

		float IfAudioLinkv2Exists1_g3410(  )
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


		inline float AudioLinkData3_g3409( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g3406(  )
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


		inline float AudioLinkData3_g3405( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g3398(  )
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


		inline float AudioLinkData3_g3397( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g3402(  )
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


		inline float AudioLinkData3_g3401( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float3 ShadeSH97_g2839( float4 Normal )
		{
			return ShadeSH9(Normal);
		}


		inline float Dither8x8Bayer( uint x, uint y )
		{
			const float dither[ 64 ] = {
			     1, 49, 13, 61,  4, 52, 16, 64,
			    33, 17, 45, 29, 36, 20, 48, 32,
			     9, 57,  5, 53, 12, 60,  8, 56,
			    41, 25, 37, 21, 44, 28, 40, 24,
			     3, 51, 15, 63,  2, 50, 14, 62,
			    35, 19, 47, 31, 34, 18, 46, 30,
			    11, 59,  7, 55, 10, 58,  6, 54,
			    43, 27, 39, 23, 42, 26, 38, 22};
			uint r = y * 8 + x;
			return dither[ min( r, 63 ) ] / 64; // same # of instructions as pre-dividing due to compiler magic
		}


		float4 unitysampletexcubelodexpression59_g2847( float3 refDir )
		{
			return UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, refDir, UNITY_SPECCUBE_LOD_STEPS);
		}


		float4 unity_SpecCube0_HDRexpression60_g2847(  )
		{
			return unity_SpecCube0_HDR;
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float localCallPenetratorReshapeFunction1_g3472 = ( 0.0 );
			float4 ase_positionOS4f = v.vertex;
			float4 vertexPos1_g3472 = ase_positionOS4f;
			float3 ase_normalOS = v.normal.xyz;
			float3 vertexNormal1_g3472 = ase_normalOS;
			{
			PenetratorReshape(vertexPos1_g3472, vertexNormal1_g3472);
			}
			float4 dps_position3038 = vertexPos1_g3472;
			float4 Vertex_Position2663 = dps_position3038;
			float4 ase_positionSS = ComputeScreenPos( UnityObjectToClipPos( v.vertex ) );
			float4 ase_positionSSNorm = ase_positionSS / ase_positionSS.w;
			ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
			float2 appendResult32_g2852 = (float2(ase_positionSSNorm.x , ase_positionSSNorm.y));
			float temp_output_26_0_g2852 = _DiscardUVMap;
			float2 lerpResult4_g2865 = lerp( v.texcoord.xy , appendResult32_g2852 , ( max( sign( ( temp_output_26_0_g2852 - 8.0 ) ), 0.0 ) - 1.0 ));
			float2 lerpResult4_g2862 = lerp( lerpResult4_g2865 , v.texcoord3.xy , ( max( sign( ( temp_output_26_0_g2852 - 3.0 ) ), 0.0 ) - 1.0 ));
			float2 lerpResult4_g2859 = lerp( lerpResult4_g2862 , v.texcoord2.xy , ( max( sign( ( temp_output_26_0_g2852 - 2.0 ) ), 0.0 ) - 1.0 ));
			float2 lerpResult4_g2856 = lerp( lerpResult4_g2859 , v.texcoord1.xy , ( max( sign( ( temp_output_26_0_g2852 - 1.0 ) ), 0.0 ) - 1.0 ));
			float2 lerpResult4_g2853 = lerp( lerpResult4_g2856 , v.texcoord.xy , ( max( sign( ( temp_output_26_0_g2852 - 0.0 ) ), 0.0 ) - 1.0 ));
			float2 DiscardUV200 = lerpResult4_g2853;
			float2 temp_output_99_0_g3411 = DiscardUV200;
			float2 break61_g3454 = temp_output_99_0_g3411;
			float2 break63_g3454 = floor( float2( 0,0 ) );
			float2 break61_g3457 = temp_output_99_0_g3411;
			float2 break63_g3457 = floor( float2( 0,1 ) );
			float2 break61_g3445 = temp_output_99_0_g3411;
			float2 break63_g3445 = floor( float2( 0,2 ) );
			float2 break61_g3451 = temp_output_99_0_g3411;
			float2 break63_g3451 = floor( float2( 0,3 ) );
			float2 break61_g3448 = temp_output_99_0_g3411;
			float2 break63_g3448 = floor( float2( 1,0 ) );
			float2 break61_g3436 = temp_output_99_0_g3411;
			float2 break63_g3436 = floor( float2( 1,1 ) );
			float2 break61_g3439 = temp_output_99_0_g3411;
			float2 break63_g3439 = floor( float2( 1,2 ) );
			float2 break61_g3442 = temp_output_99_0_g3411;
			float2 break63_g3442 = floor( float2( 1,3 ) );
			float2 break61_g3433 = temp_output_99_0_g3411;
			float2 break63_g3433 = floor( float2( 2,0 ) );
			float2 break61_g3430 = temp_output_99_0_g3411;
			float2 break63_g3430 = floor( float2( 2,1 ) );
			float2 break61_g3427 = temp_output_99_0_g3411;
			float2 break63_g3427 = floor( float2( 2,2 ) );
			float2 break61_g3424 = temp_output_99_0_g3411;
			float2 break63_g3424 = floor( float2( 2,3 ) );
			float2 break61_g3412 = temp_output_99_0_g3411;
			float2 break63_g3412 = floor( float2( 3,0 ) );
			float2 break61_g3415 = temp_output_99_0_g3411;
			float2 break63_g3415 = floor( float2( 3,1 ) );
			float2 break61_g3418 = temp_output_99_0_g3411;
			float2 break63_g3418 = floor( float2( 3,2 ) );
			float2 break61_g3421 = temp_output_99_0_g3411;
			float2 break63_g3421 = floor( float2( 3,3 ) );
			float UVTileDiscard192 = step( 1.0 , ( ( ( saturate( _UDIMDiscardRow0_0 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3454.x ) - break63_g3454.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3454.y ) - break63_g3454.y ) ) ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_0 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3457.x ) - break63_g3457.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3457.y ) - break63_g3457.y ) ) ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_0 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3445.x ) - break63_g3445.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3445.y ) - break63_g3445.y ) ) ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_0 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3451.x ) - break63_g3451.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3451.y ) - break63_g3451.y ) ) ) ) ) ) ) ) + ( ( saturate( _UDIMDiscardRow0_1 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3448.x ) - break63_g3448.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3448.y ) - break63_g3448.y ) ) ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_1 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3436.x ) - break63_g3436.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3436.y ) - break63_g3436.y ) ) ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_1 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3439.x ) - break63_g3439.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3439.y ) - break63_g3439.y ) ) ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_1 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3442.x ) - break63_g3442.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3442.y ) - break63_g3442.y ) ) ) ) ) ) ) ) + ( ( saturate( _UDIMDiscardRow0_2 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3433.x ) - break63_g3433.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3433.y ) - break63_g3433.y ) ) ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_2 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3430.x ) - break63_g3430.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3430.y ) - break63_g3430.y ) ) ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_2 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3427.x ) - break63_g3427.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3427.y ) - break63_g3427.y ) ) ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_2 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3424.x ) - break63_g3424.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3424.y ) - break63_g3424.y ) ) ) ) ) ) ) ) + ( ( saturate( _UDIMDiscardRow0_3 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3412.x ) - break63_g3412.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3412.y ) - break63_g3412.y ) ) ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_3 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3415.x ) - break63_g3415.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3415.y ) - break63_g3415.y ) ) ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_3 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3418.x ) - break63_g3418.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3418.y ) - break63_g3418.y ) ) ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_3 ) * saturate( ( ( 1.0 - abs( sign( ( floor( break61_g3421.x ) - break63_g3421.x ) ) ) ) * ( 1.0 - abs( sign( ( floor( break61_g3421.y ) - break63_g3421.y ) ) ) ) ) ) ) ) ) );
			float vrc_camera2672 = _VRChatCameraMode;
			float cvr_camera2670 = CVRRenderingCam;
			float Dont_Render_in_Social_VR_Camera_Result2686 = ( ( max( sign( ( 1.0 - ( vrc_camera2672 + ( 1.0 - abs( sign( ( cvr_camera2670 - 1.0 ) ) ) ) ) ) ), 0.0 ) - 1.0 ) * _DontRenderInSocialVRCameras );
			float vrc_mirror2707 = _VRChatMirrorMode;
			float Dont_Render_in_Social_VR_Mirror_Result2704 = ( ( max( sign( ( 1.0 - ( vrc_mirror2707 + ( 1.0 - abs( sign( ( cvr_camera2670 - 2.0 ) ) ) ) ) ) ), 0.0 ) - 1.0 ) * _DontRenderinSocialVRMirrors );
			float4 temp_cast_0 = (( 0.0 / 0.0 )).xxxx;
			#ifdef _VERTEXDISCARD_ON
				float4 staticSwitch3022 = ( saturate( ( UVTileDiscard192 + Dont_Render_in_Social_VR_Camera_Result2686 + Dont_Render_in_Social_VR_Mirror_Result2704 + _UDIMDiscardAll ) ) == 1.0 ? temp_cast_0 : Vertex_Position2663 );
			#else
				float4 staticSwitch3022 = Vertex_Position2663;
			#endif
			float4 Discard_Vertex2662 = staticSwitch3022;
			v.vertex.xyz = Discard_Vertex2662.xyz;
			v.vertex.w = 1;
			float3 dps_normal3039 = vertexNormal1_g3472;
			v.normal = dps_normal3039;
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
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 color8_g3466 = IsGammaSpace() ? float4( 1, 1, 1, 1 ) : float4( 1, 1, 1, 1 );
			float2 uv_AmbientOcclusion = i.uv_texcoord * _AmbientOcclusion_ST.xy + _AmbientOcclusion_ST.zw;
			float4 temp_output_3_0_g3466 = ( 1.0 - ( ( 1.0 - tex2D( _AmbientOcclusion, uv_AmbientOcclusion ) ) * _AOStrength ) );
			float temp_output_9_0_g3466 = _RealAO;
			float4 lerpResult5_g3466 = lerp( color8_g3466 , temp_output_3_0_g3466 , temp_output_9_0_g3466);
			float4 temp_output_2629_0 = ( tex2D( _MainTex, uv_MainTex ) * lerpResult5_g3466 * _Color );
			float alphaSrc2970 = temp_output_2629_0.a;
			float2 uv_AlphaMap = i.uv_texcoord * _AlphaMap_ST.xy + _AlphaMap_ST.zw;
			#ifdef _CUSTOMALPHAMAP
				float staticSwitch3014 = ( tex2D( _AlphaMap, uv_AlphaMap ).r * _AlphaMapStrength );
			#else
				float staticSwitch3014 = alphaSrc2970;
			#endif
			float4 ase_positionSS = i.screenPosition;
			float4 ase_positionSSNorm = ase_positionSS / ase_positionSS.w;
			ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
			float2 ditherScreenPosPixel2974 = ase_positionSSNorm.xy * _ScreenParams.xy;
			float dither2974 = Dither8x8Bayer( fmod( ditherScreenPosPixel2974.x, 8 ), fmod( ditherScreenPosPixel2974.y, 8 ) );
			dither2974 = step( dither2974, saturate( staticSwitch3014 * 1.00001 ) );
			#ifdef _DoDither
				float staticSwitch3145 = dither2974;
			#else
				float staticSwitch3145 = staticSwitch3014;
			#endif
			float lerpResult2993 = lerp( staticSwitch3014 , staticSwitch3145 , ( ( max( sign( ( 2.0 - _Mode ) ), 0.0 ) - 1.0 ) * ( max( sign( ( _Mode - 2.0 ) ), 0.0 ) - 1.0 ) ));
			float lerpResult3011 = lerp( lerpResult2993 , 1.0 , ( max( sign( ( _Mode - 0.0 ) ), 0.0 ) - 1.0 ));
			#ifdef _AlphaIsInUse
				float staticSwitch3142 = lerpResult3011;
			#else
				float staticSwitch3142 = 1.0;
			#endif
			float alphaFinal2979 = staticSwitch3142;
			float temp_output_2981_0 = alphaFinal2979;
			float3 ase_positionWS = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_lightDirWS = 0;
			#else //aseld
			float3 ase_lightDirWS = normalize( UnityWorldSpaceLightDir( ase_positionWS ) );
			#endif //aseld
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 normalMap1002 = UnpackNormal( tex2D( _BumpMap, uv_BumpMap ) );
			float3 temp_output_11_0_g2837 = normalMap1002;
			float3 temp_output_2_0_g2838 = temp_output_11_0_g2837;
			float dotResult3_g2846 = dot( ase_lightDirWS , (WorldNormalVector( i , temp_output_2_0_g2838 )) );
			float temp_output_5_0_g2845 = _WrappedShadingValue;
			float ase_mainLightShadowAtten = ase_lightAtten;
			float temp_output_102_0_g2838 = normalMap1002.z;
			float temp_output_15_0_g2838 = saturate( saturate( ( ase_mainLightShadowAtten - ( ( 1.0 - temp_output_102_0_g2838 ) * _NormalMapRealtimeStrength ) ) ) );
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float4 temp_output_43_0_g2838 = saturate( ase_lightColor );
			float4 temp_output_23_0_g2838 = saturate( ( temp_output_43_0_g2838 * temp_output_15_0_g2838 ) );
			float4 temp_output_78_0_g2838 = saturate( temp_output_43_0_g2838 );
			float4 temp_cast_16 = (_RealtimeLightMin).xxxx;
			float4 clampResult66_g2838 = clamp( temp_output_23_0_g2838 , ( temp_output_78_0_g2838 - temp_cast_16 ) , ( temp_output_78_0_g2838 + _RealtimeLightMax ) );
			float4 lerpResult72_g2838 = lerp( temp_output_23_0_g2838 , clampResult66_g2838 , _ClampRealtimeLighting);
			float3 temp_output_1_0_g2839 = temp_output_2_0_g2838;
			float3 newWorldNormal45_g2839 = normalize( (WorldNormalVector( i , temp_output_1_0_g2839 )) );
			UnityGI gi2_g2839 = gi;
			float3 diffNorm2_g2839 = newWorldNormal45_g2839;
			gi2_g2839 = UnityGI_Base( data, 1, diffNorm2_g2839 );
			float3 indirectDiffuse2_g2839 = gi2_g2839.indirect.diffuse + diffNorm2_g2839 * 0.0001;
			float3 worldNormal2_g2844 = newWorldNormal45_g2839;
			float localLightVolumeSH1_g2840 = ( 0.0 );
			float3 temp_output_6_0_g2840 = ase_positionWS;
			float3 worldPos1_g2840 = temp_output_6_0_g2840;
			float3 L01_g2840 = float3( 0,0,0 );
			float3 L1r1_g2840 = float3( 0,0,0 );
			float3 L1g1_g2840 = float3( 0,0,0 );
			float3 L1b1_g2840 = float3( 0,0,0 );
			float3 temp_output_17_0_g2840 = float3( 0,0,0 );
			float3 worldPosOffset1_g2840 = temp_output_17_0_g2840;
			LightVolumeSH( worldPos1_g2840 , L01_g2840 , L1r1_g2840 , L1g1_g2840 , L1b1_g2840 , worldPosOffset1_g2840 );
			float3 L02_g2844 = L01_g2840;
			float3 L1r2_g2844 = L1r1_g2840;
			float3 L1g2_g2844 = L1g1_g2840;
			float3 L1b2_g2844 = L1b1_g2840;
			float3 localLightVolumeEvaluate2_g2844 = LightVolumeEvaluate( worldNormal2_g2844 , L02_g2844 , L1r2_g2844 , L1g2_g2844 , L1b2_g2844 );
			float localLightVolumesEnabled2_g2841 = LightVolumesEnabled(  );
			float3 lerpResult50_g2839 = lerp( indirectDiffuse2_g2839 , localLightVolumeEvaluate2_g2844 , localLightVolumesEnabled2_g2841);
			float3 temp_output_34_0_g2839 = saturate( lerpResult50_g2839 );
			float4 appendResult6_g2839 = (float4(( temp_output_1_0_g2839 * 0.3 ) , 1.0));
			float4 Normal7_g2839 = appendResult6_g2839;
			float3 localShadeSH97_g2839 = ShadeSH97_g2839( Normal7_g2839 );
			float temp_output_9_0_g2839 = _IndirectDiffuseOffset;
			float3 temp_cast_18 = (temp_output_9_0_g2839).xxx;
			float3 temp_output_15_0_g2839 = saturate( ( localShadeSH97_g2839 - temp_cast_18 ) );
			float lerpResult2_g2842 = lerp( _IndirectDiffuseOffsetMax , temp_output_9_0_g2839 , ( 1.0 - abs( sign( ( _IndirLightUseMinforMax - 1.0 ) ) ) ));
			float temp_output_71_0_g2839 = lerpResult2_g2842;
			float3 temp_output_16_0_g2839 = saturate( ( localShadeSH97_g2839 + temp_output_71_0_g2839 ) );
			float3 clampResult17_g2839 = clamp( temp_output_34_0_g2839 , temp_output_15_0_g2839 , temp_output_16_0_g2839 );
			float3 lerpResult20_g2839 = lerp( clampResult17_g2839 ,  (temp_output_15_0_g2839 + ( temp_output_34_0_g2839 - float3( 0,0,0 ) ) * ( temp_output_16_0_g2839 - temp_output_15_0_g2839 ) / ( float3( 1,1,1 ) - float3( 0,0,0 ) ) ) , _IndirectLimiterMode);
			float4 color4_g2838 = IsGammaSpace() ? float4( 1, 1, 1, 0 ) : float4( 1, 1, 1, 0 );
			float4 temp_cast_20 = (1.0).xxxx;
			float4 temp_cast_21 = (_MinBrightness).xxxx;
			float4 color40_g2838 = IsGammaSpace() ? float4( 1, 1, 1, 1 ) : float4( 1, 1, 1, 1 );
			float4 clampResult37_g2838 = clamp( saturate( ( saturate( ( saturate( exp2( ( ( dotResult3_g2846 + temp_output_5_0_g2845 ) / ( 1.0 + temp_output_5_0_g2845 ) ) ) ) + saturate( exp2( temp_output_15_0_g2838 ) ) ) ) * saturate( ( lerpResult72_g2838 + saturate( (saturate( ( exp2( saturate( ( float4( lerpResult20_g2839 , 0.0 ) * color4_g2838 ) ) ) - temp_cast_20 ) )*_WrapIndirScale + 0.0) ) ) ) ) ) , temp_cast_21 , color40_g2838 );
			float4 mainTex26 = temp_output_2629_0;
			float3 temp_output_1_0_g2847 = temp_output_11_0_g2837;
			float3 indirectNormal4_g2847 = normalize( WorldNormalVector( i , temp_output_1_0_g2847 ) );
			float2 uv_MetallicGlossMap = i.uv_texcoord * _MetallicGlossMap_ST.xy + _MetallicGlossMap_ST.zw;
			float4 tex2DNode1017 = tex2D( _MetallicGlossMap, uv_MetallicGlossMap );
			float lerpResult2713 = lerp( tex2DNode1017.a , tex2DNode1017.g , _SmoothnessChannel);
			float _Smoothness2711 = ( lerpResult2713 * _SmoothnessStrength );
			float temp_output_5_0_g2847 = _Smoothness2711;
			Unity_GlossyEnvironmentData g4_g2847 = UnityGlossyEnvironmentSetup( temp_output_5_0_g2847, data.worldViewDir, indirectNormal4_g2847, float3(0,0,0));
			float3 indirectSpecular4_g2847 = UnityGI_IndirectSpecular( data, 1.0, indirectNormal4_g2847, g4_g2847 );
			float4 FallbackReflections2844 = texCUBElod( _FallbackReflection, float4( normalize( WorldReflectionVector( i , normalMap1002 ) ), ( floor( log2( max( _FallbackReflection_TexelSize.z, _FallbackReflection_TexelSize.w ) ) ) * ( 1.0 - _Smoothness2711 ) )) );
			float3 refDir59_g2847 = normalize( WorldReflectionVector( i , temp_output_1_0_g2847 ) );
			float4 localunitysampletexcubelodexpression59_g2847 = unitysampletexcubelodexpression59_g2847( refDir59_g2847 );
			float4 localunity_SpecCube0_HDRexpression60_g2847 = unity_SpecCube0_HDRexpression60_g2847();
			float4 lerpResult53_g2847 = lerp( float4( indirectSpecular4_g2847 , 0.0 ) , FallbackReflections2844 , saturate( ( ( ( 1.0 - abs( sign( ( localunitysampletexcubelodexpression59_g2847.w - 0.0 ) ) ) ) * ( 1.0 - abs( sign( ( localunity_SpecCube0_HDRexpression60_g2847.w - 0.0 ) ) ) ) ) + _ForceFallbackReflections ) ));
			float _Metalic2710 = ( _MetallicStrength * tex2DNode1017.r );
			float temp_output_10_0_g2847 = _Metalic2710;
			float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_positionWS );
			float3 ase_viewDirWS = normalize( ase_viewVectorWS );
			float3 ase_normalWS = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_normalWSNorm = normalize( ase_normalWS );
			float fresnelNdotV22_g2847 = dot( ase_normalWSNorm, ase_viewDirWS );
			float fresnelNode22_g2847 = ( temp_output_10_0_g2847 + ( temp_output_5_0_g2847 * 1.0 ) * pow( max( 1.0 - fresnelNdotV22_g2847 , 0.0001 ), 1.0 ) );
			float lerpResult35_g2847 = lerp( temp_output_10_0_g2847 , ( temp_output_5_0_g2847 * saturate( fresnelNode22_g2847 ) ) , _MetallicReflectionMode);
			float4 lerpResult21_g2847 = lerp( mainTex26 , lerpResult53_g2847 , lerpResult35_g2847);
			float4 Lighting_Wrapped1144 = ( clampResult37_g2838 * lerpResult21_g2847 );
			c.rgb = ( Lighting_Wrapped1144 * alphaFinal2979 ).rgb;
			c.a = temp_output_2981_0;
			clip( temp_output_2981_0 - _Cutoff );
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
			float4 color8_g3466 = IsGammaSpace() ? float4( 1, 1, 1, 1 ) : float4( 1, 1, 1, 1 );
			float2 uv_AmbientOcclusion = i.uv_texcoord * _AmbientOcclusion_ST.xy + _AmbientOcclusion_ST.zw;
			float4 temp_output_3_0_g3466 = ( 1.0 - ( ( 1.0 - tex2D( _AmbientOcclusion, uv_AmbientOcclusion ) ) * _AOStrength ) );
			float temp_output_9_0_g3466 = _RealAO;
			float4 lerpResult5_g3466 = lerp( color8_g3466 , temp_output_3_0_g3466 , temp_output_9_0_g3466);
			float4 temp_output_2629_0 = ( tex2D( _MainTex, uv_MainTex ) * lerpResult5_g3466 * _Color );
			float4 mainTex26 = temp_output_2629_0;
			o.Albedo = mainTex26.rgb;
			float localIfAudioLinkv2Exists1_g3394 = IfAudioLinkv2Exists1_g3394();
			float2 uv_AL_Mask = i.uv_texcoord * _AL_Mask_ST.xy + _AL_Mask_ST.zw;
			float4 ALMask39 = tex2D( _AL_Mask, uv_AL_Mask );
			float4 temp_output_51_0_g3349 = ALMask39;
			float4 break11_g3365 = temp_output_51_0_g3349;
			float temp_output_2_0_g3365 = _ALBassMask;
			float lerpResult53_g3365 = lerp( break11_g3365.b , break11_g3365.a , max( sign( ( temp_output_2_0_g3365 - 3.0 ) ), 0.0 ));
			float lerpResult52_g3365 = lerp( break11_g3365.g , lerpResult53_g3365 , max( sign( ( temp_output_2_0_g3365 - 2.0 ) ), 0.0 ));
			float lerpResult50_g3365 = lerp( break11_g3365.r , lerpResult52_g3365 , max( sign( ( temp_output_2_0_g3365 - 1.0 ) ), 0.0 ));
			float lerpResult48_g3365 = lerp( 0.0 , lerpResult50_g3365 , max( sign( ( temp_output_2_0_g3365 - 0.0 ) ), 0.0 ));
			float3 hsvTorgb4_g3408 = RGBToHSV( _AL_Bass.rgb );
			float mulTime48 = _Time.y * _ALTimeScale;
			float Time50 = frac( mulTime48 );
			float temp_output_54_0_g3349 = Time50;
			float3 hsvTorgb8_g3408 = HSVToRGB( float3(( hsvTorgb4_g3408.x + temp_output_54_0_g3349 ),( hsvTorgb4_g3408.y + 0.0 ),( hsvTorgb4_g3408.z + 0.0 )) );
			float3 temp_output_5_0_g3407 = saturate( hsvTorgb8_g3408 );
			float temp_output_243_0_g3349 = _EmitAll;
			float temp_output_205_0_g3349 = _InactEmitBand;
			float3 lerpResult33_g3407 = lerp( float3( 0,0,0 ) , temp_output_5_0_g3407 , min( 1.0, ( temp_output_243_0_g3349 + ( 1.0 - abs( sign( ( temp_output_205_0_g3349 - 0.0 ) ) ) ) ) ));
			int Band3_g3409 = 0;
			float4 ase_positionSS = i.screenPosition;
			float4 ase_positionSSNorm = ase_positionSS / ase_positionSS.w;
			ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
			float2 appendResult18_g2826 = (float2(ase_positionSSNorm.x , ase_positionSSNorm.y));
			float temp_output_32_0_g2826 = _ALDelayUVMap;
			float2 lerpResult4_g2835 = lerp( appendResult18_g2826 , i.uv_texcoord , max( sign( ( temp_output_32_0_g2826 - 8.0 ) ), 0.0 ));
			float2 lerpResult4_g2833 = lerp( i.uv4_texcoord4 , lerpResult4_g2835 , max( sign( ( temp_output_32_0_g2826 - 3.0 ) ), 0.0 ));
			float2 lerpResult4_g2831 = lerp( i.uv3_texcoord3 , lerpResult4_g2833 , max( sign( ( temp_output_32_0_g2826 - 2.0 ) ), 0.0 ));
			float2 lerpResult4_g2829 = lerp( i.uv2_texcoord2 , lerpResult4_g2831 , max( sign( ( temp_output_32_0_g2826 - 1.0 ) ), 0.0 ));
			float2 lerpResult4_g2827 = lerp( i.uv_texcoord , lerpResult4_g2829 , max( sign( ( temp_output_32_0_g2826 - 0.0 ) ), 0.0 ));
			float2 DelayUV2355 = lerpResult4_g2827;
			float4 tex2DNode2457 = tex2D( _ALDelayMap, DelayUV2355 );
			float4 in_ALDelayMap3078 = ( tex2DNode2457 * _ALUVDelayMaxDelay );
			float4 temp_output_75_0_g3349 = in_ALDelayMap3078;
			float4 break11_g3385 = temp_output_75_0_g3349;
			float temp_output_2_0_g3385 = _ALBassDelay;
			float lerpResult53_g3385 = lerp( break11_g3385.b , break11_g3385.a , max( sign( ( temp_output_2_0_g3385 - 3.0 ) ), 0.0 ));
			float lerpResult52_g3385 = lerp( break11_g3385.g , lerpResult53_g3385 , max( sign( ( temp_output_2_0_g3385 - 2.0 ) ), 0.0 ));
			float lerpResult50_g3385 = lerp( break11_g3385.r , lerpResult52_g3385 , max( sign( ( temp_output_2_0_g3385 - 1.0 ) ), 0.0 ));
			float lerpResult48_g3385 = lerp( 0.0 , lerpResult50_g3385 , max( sign( ( temp_output_2_0_g3385 - 0.0 ) ), 0.0 ));
			float localIfAudioLinkv2Exists1_g3410 = IfAudioLinkv2Exists1_g3410();
			float temp_output_9_0_g3407 = localIfAudioLinkv2Exists1_g3410;
			int lerpResult35_g3407 = lerp( 0 , (int)lerpResult48_g3385 , temp_output_9_0_g3407);
			int Delay3_g3409 = lerpResult35_g3407;
			float localAudioLinkData3_g3409 = AudioLinkData3_g3409( Band3_g3409 , Delay3_g3409 );
			float temp_output_6_0_g3407 = localAudioLinkData3_g3409;
			float3 lerpResult34_g3407 = lerp( lerpResult33_g3407 , ( temp_output_5_0_g3407 * temp_output_6_0_g3407 ) , temp_output_9_0_g3407);
			float4 break11_g3350 = temp_output_51_0_g3349;
			float temp_output_2_0_g3350 = _ALLowMidMask;
			float lerpResult53_g3350 = lerp( break11_g3350.b , break11_g3350.a , max( sign( ( temp_output_2_0_g3350 - 3.0 ) ), 0.0 ));
			float lerpResult52_g3350 = lerp( break11_g3350.g , lerpResult53_g3350 , max( sign( ( temp_output_2_0_g3350 - 2.0 ) ), 0.0 ));
			float lerpResult50_g3350 = lerp( break11_g3350.r , lerpResult52_g3350 , max( sign( ( temp_output_2_0_g3350 - 1.0 ) ), 0.0 ));
			float lerpResult48_g3350 = lerp( 0.0 , lerpResult50_g3350 , max( sign( ( temp_output_2_0_g3350 - 0.0 ) ), 0.0 ));
			float3 hsvTorgb4_g3404 = RGBToHSV( _AL_LowMid.rgb );
			float3 hsvTorgb8_g3404 = HSVToRGB( float3(( hsvTorgb4_g3404.x + temp_output_54_0_g3349 ),( hsvTorgb4_g3404.y + 0.0 ),( hsvTorgb4_g3404.z + 0.0 )) );
			float3 temp_output_5_0_g3403 = saturate( hsvTorgb8_g3404 );
			float3 lerpResult33_g3403 = lerp( float3( 0,0,0 ) , temp_output_5_0_g3403 , min( 1.0, ( temp_output_243_0_g3349 + ( 1.0 - abs( sign( ( temp_output_205_0_g3349 - 1.0 ) ) ) ) ) ));
			int Band3_g3405 = 1;
			float4 break11_g3380 = temp_output_75_0_g3349;
			float temp_output_2_0_g3380 = _ALLowMidDelay;
			float lerpResult53_g3380 = lerp( break11_g3380.b , break11_g3380.a , max( sign( ( temp_output_2_0_g3380 - 3.0 ) ), 0.0 ));
			float lerpResult52_g3380 = lerp( break11_g3380.g , lerpResult53_g3380 , max( sign( ( temp_output_2_0_g3380 - 2.0 ) ), 0.0 ));
			float lerpResult50_g3380 = lerp( break11_g3380.r , lerpResult52_g3380 , max( sign( ( temp_output_2_0_g3380 - 1.0 ) ), 0.0 ));
			float lerpResult48_g3380 = lerp( 0.0 , lerpResult50_g3380 , max( sign( ( temp_output_2_0_g3380 - 0.0 ) ), 0.0 ));
			float localIfAudioLinkv2Exists1_g3406 = IfAudioLinkv2Exists1_g3406();
			float temp_output_9_0_g3403 = localIfAudioLinkv2Exists1_g3406;
			int lerpResult35_g3403 = lerp( 0 , (int)lerpResult48_g3380 , temp_output_9_0_g3403);
			int Delay3_g3405 = lerpResult35_g3403;
			float localAudioLinkData3_g3405 = AudioLinkData3_g3405( Band3_g3405 , Delay3_g3405 );
			float temp_output_6_0_g3403 = localAudioLinkData3_g3405;
			float3 lerpResult34_g3403 = lerp( lerpResult33_g3403 , ( temp_output_5_0_g3403 * temp_output_6_0_g3403 ) , temp_output_9_0_g3403);
			float4 break11_g3355 = temp_output_51_0_g3349;
			float temp_output_2_0_g3355 = _ALHighMidMask;
			float lerpResult53_g3355 = lerp( break11_g3355.b , break11_g3355.a , max( sign( ( temp_output_2_0_g3355 - 3.0 ) ), 0.0 ));
			float lerpResult52_g3355 = lerp( break11_g3355.g , lerpResult53_g3355 , max( sign( ( temp_output_2_0_g3355 - 2.0 ) ), 0.0 ));
			float lerpResult50_g3355 = lerp( break11_g3355.r , lerpResult52_g3355 , max( sign( ( temp_output_2_0_g3355 - 1.0 ) ), 0.0 ));
			float lerpResult48_g3355 = lerp( 0.0 , lerpResult50_g3355 , max( sign( ( temp_output_2_0_g3355 - 0.0 ) ), 0.0 ));
			float3 hsvTorgb4_g3396 = RGBToHSV( _AL_HighMid.rgb );
			float3 hsvTorgb8_g3396 = HSVToRGB( float3(( hsvTorgb4_g3396.x + temp_output_54_0_g3349 ),( hsvTorgb4_g3396.y + 0.0 ),( hsvTorgb4_g3396.z + 0.0 )) );
			float3 temp_output_5_0_g3395 = saturate( hsvTorgb8_g3396 );
			float3 lerpResult33_g3395 = lerp( float3( 0,0,0 ) , temp_output_5_0_g3395 , min( 1.0, ( temp_output_243_0_g3349 + ( 1.0 - abs( sign( ( temp_output_205_0_g3349 - 2.0 ) ) ) ) ) ));
			int Band3_g3397 = 2;
			float4 break11_g3370 = temp_output_75_0_g3349;
			float temp_output_2_0_g3370 = _ALHighMidDelay;
			float lerpResult53_g3370 = lerp( break11_g3370.b , break11_g3370.a , max( sign( ( temp_output_2_0_g3370 - 3.0 ) ), 0.0 ));
			float lerpResult52_g3370 = lerp( break11_g3370.g , lerpResult53_g3370 , max( sign( ( temp_output_2_0_g3370 - 2.0 ) ), 0.0 ));
			float lerpResult50_g3370 = lerp( break11_g3370.r , lerpResult52_g3370 , max( sign( ( temp_output_2_0_g3370 - 1.0 ) ), 0.0 ));
			float lerpResult48_g3370 = lerp( 0.0 , lerpResult50_g3370 , max( sign( ( temp_output_2_0_g3370 - 0.0 ) ), 0.0 ));
			float localIfAudioLinkv2Exists1_g3398 = IfAudioLinkv2Exists1_g3398();
			float temp_output_9_0_g3395 = localIfAudioLinkv2Exists1_g3398;
			int lerpResult35_g3395 = lerp( 0 , (int)lerpResult48_g3370 , temp_output_9_0_g3395);
			int Delay3_g3397 = lerpResult35_g3395;
			float localAudioLinkData3_g3397 = AudioLinkData3_g3397( Band3_g3397 , Delay3_g3397 );
			float temp_output_6_0_g3395 = localAudioLinkData3_g3397;
			float3 lerpResult34_g3395 = lerp( lerpResult33_g3395 , ( temp_output_5_0_g3395 * temp_output_6_0_g3395 ) , temp_output_9_0_g3395);
			float4 break11_g3360 = temp_output_51_0_g3349;
			float temp_output_2_0_g3360 = _ALTrebleMask;
			float lerpResult53_g3360 = lerp( break11_g3360.b , break11_g3360.a , max( sign( ( temp_output_2_0_g3360 - 3.0 ) ), 0.0 ));
			float lerpResult52_g3360 = lerp( break11_g3360.g , lerpResult53_g3360 , max( sign( ( temp_output_2_0_g3360 - 2.0 ) ), 0.0 ));
			float lerpResult50_g3360 = lerp( break11_g3360.r , lerpResult52_g3360 , max( sign( ( temp_output_2_0_g3360 - 1.0 ) ), 0.0 ));
			float lerpResult48_g3360 = lerp( 0.0 , lerpResult50_g3360 , max( sign( ( temp_output_2_0_g3360 - 0.0 ) ), 0.0 ));
			float3 hsvTorgb4_g3400 = RGBToHSV( _AL_Treble.rgb );
			float3 hsvTorgb8_g3400 = HSVToRGB( float3(( hsvTorgb4_g3400.x + temp_output_54_0_g3349 ),( hsvTorgb4_g3400.y + 0.0 ),( hsvTorgb4_g3400.z + 0.0 )) );
			float3 temp_output_5_0_g3399 = saturate( hsvTorgb8_g3400 );
			float3 lerpResult33_g3399 = lerp( float3( 0,0,0 ) , temp_output_5_0_g3399 , min( 1.0, ( temp_output_243_0_g3349 + ( 1.0 - abs( sign( ( temp_output_205_0_g3349 - 3.0 ) ) ) ) ) ));
			int Band3_g3401 = 3;
			float4 break11_g3375 = temp_output_75_0_g3349;
			float temp_output_2_0_g3375 = _ALTrebleDelay;
			float lerpResult53_g3375 = lerp( break11_g3375.b , break11_g3375.a , max( sign( ( temp_output_2_0_g3375 - 3.0 ) ), 0.0 ));
			float lerpResult52_g3375 = lerp( break11_g3375.g , lerpResult53_g3375 , max( sign( ( temp_output_2_0_g3375 - 2.0 ) ), 0.0 ));
			float lerpResult50_g3375 = lerp( break11_g3375.r , lerpResult52_g3375 , max( sign( ( temp_output_2_0_g3375 - 1.0 ) ), 0.0 ));
			float lerpResult48_g3375 = lerp( 0.0 , lerpResult50_g3375 , max( sign( ( temp_output_2_0_g3375 - 0.0 ) ), 0.0 ));
			float localIfAudioLinkv2Exists1_g3402 = IfAudioLinkv2Exists1_g3402();
			float temp_output_9_0_g3399 = localIfAudioLinkv2Exists1_g3402;
			int lerpResult35_g3399 = lerp( 0 , (int)lerpResult48_g3375 , temp_output_9_0_g3399);
			int Delay3_g3401 = lerpResult35_g3399;
			float localAudioLinkData3_g3401 = AudioLinkData3_g3401( Band3_g3401 , Delay3_g3401 );
			float temp_output_6_0_g3399 = localAudioLinkData3_g3401;
			float3 lerpResult34_g3399 = lerp( lerpResult33_g3399 , ( temp_output_5_0_g3399 * temp_output_6_0_g3399 ) , temp_output_9_0_g3399);
			#ifdef _ENABLEAUDIOLINK_ON
				float3 staticSwitch3023 = ( _AudioLinkToggle * min( ( localIfAudioLinkv2Exists1_g3394 + _ALEmitifInactive ), 1.0 ) * ( ( lerpResult48_g3365 * lerpResult34_g3407 ) + ( lerpResult48_g3350 * lerpResult34_g3403 ) + ( lerpResult48_g3355 * lerpResult34_g3395 ) + ( lerpResult48_g3360 * lerpResult34_g3399 ) ) );
			#else
				float3 staticSwitch3023 = float3( 0,0,0 );
			#endif
			float3 AL_Final85 = staticSwitch3023;
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 Emission119 = ( tex2D( _Emission, uv_Emission ) * _EmissionColor );
			float3 ase_positionWS = i.worldPos;
			float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_positionWS );
			float3 ase_viewDirWS = normalize( ase_viewVectorWS );
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 normalMap1002 = UnpackNormal( tex2D( _BumpMap, uv_BumpMap ) );
			float fresnelNdotV9_g2872 = dot( (WorldNormalVector( i , normalMap1002 )), ase_viewDirWS );
			float fresnelNode9_g2872 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV9_g2872, _RimPower ) );
			float4 lerpResult14_g2872 = lerp( float4( 1,1,1,0 ) , mainTex26 , _RimBaseColorStrength);
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float3 hsvTorgb3_g2872 = RGBToHSV( ase_lightColor.rgb );
			float3 temp_output_11_0_g2837 = normalMap1002;
			float3 temp_output_2_0_g2838 = temp_output_11_0_g2837;
			float3 temp_output_1_0_g2839 = temp_output_2_0_g2838;
			float4 appendResult6_g2839 = (float4(( temp_output_1_0_g2839 * 0.3 ) , 1.0));
			float4 Normal7_g2839 = appendResult6_g2839;
			float3 localShadeSH97_g2839 = ShadeSH97_g2839( Normal7_g2839 );
			float temp_output_9_0_g2839 = _IndirectDiffuseOffset;
			float lerpResult2_g2842 = lerp( _IndirectDiffuseOffsetMax , temp_output_9_0_g2839 , ( 1.0 - abs( sign( ( _IndirLightUseMinforMax - 1.0 ) ) ) ));
			float temp_output_71_0_g2839 = lerpResult2_g2842;
			float3 temp_output_16_0_g2839 = saturate( ( localShadeSH97_g2839 + temp_output_71_0_g2839 ) );
			float3 maxIndirLight2618 = temp_output_16_0_g2839;
			float3 hsvTorgb24_g2872 = RGBToHSV( maxIndirLight2618 );
			#ifdef _ENABLERIMLIGHTING_ON
				float4 staticSwitch3044 = ( _RimToggle * ( ( ( fresnelNode9_g2872 * _RimEnergy ) * lerpResult14_g2872 ) * max( ( 0.0 * saturate( ( exp( hsvTorgb3_g2872.z ) - 1.0 ) ) ), hsvTorgb24_g2872.z ) ) );
			#else
				float4 staticSwitch3044 = float4( 0,0,0,0 );
			#endif
			float4 Rim116 = staticSwitch3044;
			float4 EmissionFinal29 = saturate( ( float4( AL_Final85 , 0.0 ) + Emission119 + Rim116 ) );
			float alphaSrc2970 = temp_output_2629_0.a;
			float2 uv_AlphaMap = i.uv_texcoord * _AlphaMap_ST.xy + _AlphaMap_ST.zw;
			#ifdef _CUSTOMALPHAMAP
				float staticSwitch3014 = ( tex2D( _AlphaMap, uv_AlphaMap ).r * _AlphaMapStrength );
			#else
				float staticSwitch3014 = alphaSrc2970;
			#endif
			float2 ditherScreenPosPixel2974 = ase_positionSSNorm.xy * _ScreenParams.xy;
			float dither2974 = Dither8x8Bayer( fmod( ditherScreenPosPixel2974.x, 8 ), fmod( ditherScreenPosPixel2974.y, 8 ) );
			dither2974 = step( dither2974, saturate( staticSwitch3014 * 1.00001 ) );
			#ifdef _DoDither
				float staticSwitch3145 = dither2974;
			#else
				float staticSwitch3145 = staticSwitch3014;
			#endif
			float lerpResult2993 = lerp( staticSwitch3014 , staticSwitch3145 , ( ( max( sign( ( 2.0 - _Mode ) ), 0.0 ) - 1.0 ) * ( max( sign( ( _Mode - 2.0 ) ), 0.0 ) - 1.0 ) ));
			float lerpResult3011 = lerp( lerpResult2993 , 1.0 , ( max( sign( ( _Mode - 0.0 ) ), 0.0 ) - 1.0 ));
			#ifdef _AlphaIsInUse
				float staticSwitch3142 = lerpResult3011;
			#else
				float staticSwitch3142 = 1.0;
			#endif
			float alphaFinal2979 = staticSwitch3142;
			float4 delayMapRaw3168 = tex2DNode2457;
			float temp_output_3158_0 = frac( _Time.y );
			float4 temp_cast_14 = (( 1.0 - abs( sign( ( ( max( sign( ( delayMapRaw3168.r - temp_output_3158_0 ) ), 0.0 ) - 1.0 ) - ( max( sign( ( frac( ( temp_output_3158_0 + 0.1 ) ) - delayMapRaw3168.r ) ), 0.0 ) - 1.0 ) ) ) ) )).xxxx;
			float4 lerpResult3167 = lerp( ( EmissionFinal29 * alphaFinal2979 ) , temp_cast_14 , _DebugDelayMap);
			o.Emission = lerpResult3167.rgb;
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
			sampler3D _DitherMaskLOD;
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
				surfIN.worldRefl = -worldViewDir;
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
				half alphaRef = tex3D( _DitherMaskLOD, float3( vpos.xy * 0.25, o.Alpha * 0.9375 ) ).a;
				clip( alphaRef - 0.01 );
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Standard"
	CustomEditor "Voy.VivikaShader.VivikaShaderGUI"
}
/*ASEBEGIN
Version=19907
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2840;-2112,784;Inherit;False;2134.878;650.9312;This is here instead of inside the Amplify Function because ASE will not let me use a Texture Object for this. Quite Annoyed;12;2942;2941;2836;2844;2837;2838;2937;2943;2944;2946;2947;2948;Fallback Reflections;1,1,1,1;0;0
Node;AmplifyShaderEditor.TexelSizeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2941;-1600,832;Inherit;False;-1;Create;1;0;SAMPLERCUBE;;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMaxOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2942;-1312,880;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2333;-2064,-2752;Inherit;False;673.8176;177.324;Selection of UV Maps to Use for UV Tile Discarding;2;2355;2357;Audio Link Delay UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2709;-3340.804,-2011.94;Inherit;False;1278.638;454.7993;Comment;9;2714;2713;2710;2711;2952;2950;2951;2949;1017;Metallic and Smoothness;1,1,1,1;0;0
Node;AmplifyShaderEditor.Log2OpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2943;-1168,896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2947;-1264,1184;Inherit;False;2711;_Smoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1017;-3312,-1936;Inherit;True;Property;_MetallicGlossMap;Metallic Smoothness;28;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;2623525d29abd65ca85273d7806da98a;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FloorOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2944;-1040,896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2838;-2080,1088;Inherit;False;1002;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2948;-1006.712,1312.68;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2714;-3280,-1712;Inherit;False;Property;_SmoothnessChannel;Smoothness Channel;29;1;[Enum];Create;False;0;3;Alpha;0;Green;1;Option3;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2357;-2032,-2688;Inherit;False;Property;_ALDelayUVMap;AL Delay UV Map;45;2;[Header];[Enum];Create;False;0;5;UV0;0;UV1;1;UV2;2;UV3;3;Screen Space;8;0;True;0;False;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2937;-1888,864;Inherit;True;Property;_FallbackReflection;Fallback Reflection;33;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;None;74d77ebd39499c3419c52d85e0715da0;False;black;LockedToCube;Cube;False;-1;0;2;SAMPLERCUBE;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2949;-2784,-1680;Inherit;False;Property;_SmoothnessStrength;Smoothness Strength;31;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldReflectionVector, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2837;-1872,1072;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2946;-832,1152;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2951;-3024,-1952;Inherit;False;Property;_MetallicStrength;Metallic Strength;30;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2713;-2960,-1824;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3156;-1824,-2688;Inherit;False;VVGetTextureUV;-1;;2826;c300954d56021714fb5c622c8f34ec06;0;1;32;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2679;3296,1920;Inherit;False;564.665;432.8813;Comment;6;2672;2670;2671;2668;2706;2707;Camera Globals;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;977;-2882,-6240;Inherit;False;1538.605;614.2061;Comment;11;3078;3082;3080;3081;3079;3146;2457;979;2363;3150;3168;AudioLink Delay Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2355;-1616,-2688;Inherit;False;DelayUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;72;1440,-3088;Inherit;False;765.7347;170.1592;Comment;4;243;50;49;48;Time;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2950;-2496,-1744;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2952;-2512,-1952;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2836;-624,1056;Inherit;True;Property;_FallbackReflectionA;Fallback ReflectionA;23;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;74d77ebd39499c3419c52d85e0715da0;74d77ebd39499c3419c52d85e0715da0;True;0;False;black;LockedToCube;False;Object;-1;MipLevel;Cube;False;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2602;-1992.124,-896;Inherit;False;1364.542;1343.179;Comment;21;2842;2732;2723;2727;2726;2556;2414;2392;1144;2618;2584;2583;2589;2291;2582;2375;1207;2415;2845;3061;3107;Shading;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2668;3344,1984;Inherit;False;Global;CVRRenderingCam;CVRRenderingCam;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2363;-2770,-6144;Inherit;False;2355;DelayUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;37;-1072,-1328;Inherit;False;859.9141;343.3768;Comment;3;34;1002;1006;Normal Map;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2711;-2291.804,-1819.94;Inherit;False;_Smoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2710;-2291.804,-1883.94;Inherit;False;_Metalic;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2582;-1776,-48;Inherit;False;1002;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;243;1472,-3040;Inherit;False;Property;_ALTimeScale;AL HueShift Time Scale;60;0;Create;False;0;0;0;True;0;False;0;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2844;-320,1056;Inherit;False;FallbackReflections;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2685;3312,736;Inherit;False;1222.874;463.641;Comment;10;2669;2686;2678;2677;2675;2673;2683;2674;3095;3097;Disable Rendering in Social VR Cameras;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;201;-2064,-2464;Inherit;False;668.8916;177.8153;Selection of UV Maps to Use for UV Tile Discarding;2;2313;200;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2693;3312,1328;Inherit;False;1226.13;481.8655;Comment;10;2702;2704;2703;2700;2699;2694;2705;2698;3098;3099;Disable Rendering in Social VR Mirrors;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2671;3344,2080;Inherit;False;Global;_VRChatCameraMode;_VRChatCameraMode;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2706;3344,2176;Inherit;False;Global;_VRChatMirrorMode;_VRChatMirrorMode;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2670;3552,1984;Inherit;False;cvr camera;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;979;-2832,-5856;Inherit;False;Property;_ALUVDelayMaxDelay;AL UV Delay Max Delay;47;1;[IntRange];Create;False;0;0;0;True;0;False;0;127;0;127;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;38;16,-2656;Inherit;False;604.8932;280;Comment;2;40;39;AL Emission Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleTimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;48;1712,-3040;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2415;-1776,-368;Inherit;False;Property;_IndirLightUseMinforMax;Use Min for Max;21;1;[ToggleUI];Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1207;-1840,-240;Inherit;False;Property;_WrappedShadingValue;Wrapped Shading Value;26;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2375;-1872,-112;Inherit;False;Property;_MinBrightness;Min Brightness;18;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2291;-1808,-176;Inherit;False;Property;_WrapIndirScale;Indirect Light Scale;27;0;Create;False;0;0;0;False;0;False;3;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2589;-1776,144;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2584;-1776,80;Inherit;False;2710;_Metalic;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2392;-1872,-496;Inherit;False;Property;_IndirectDiffuseOffset;Indirect Light Min;19;0;Create;False;0;0;0;False;0;False;1;0.04;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2414;-1872,-432;Inherit;False;Property;_IndirectDiffuseOffsetMax;Indirect Light Max;20;0;Create;False;0;0;0;False;0;False;0;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2556;-1840,-304;Inherit;False;Property;_IndirectLimiterMode;Indirect Limiter Mode;25;1;[Enum];Create;True;0;2;Clamp;0;Remap;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2726;-1872,-688;Inherit;False;Property;_RealtimeLightMin;Relative Real Light Min;24;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2727;-1872,-624;Inherit;False;Property;_RealtimeLightMax;Relative Real Light Max;23;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2723;-1904,-560;Inherit;False;Property;_ClampRealtimeLighting;Relative Clamp Realtime Lighting;22;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2732;-1904,-752;Inherit;False;Property;_MetallicReflectionMode;Fresnel Metallics (Experimental);32;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2845;-1840,208;Inherit;False;2844;FallbackReflections;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2583;-1808,16;Inherit;False;2711;_Smoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2842;-1840,-816;Inherit;False;Property;_ForceFallbackReflections;Force Fallback Reflections;34;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1006;-1008,-1216;Inherit;True;Property;_BumpMap;Normal Map;14;1;[SingleLineTexture];Create;False;0;0;0;True;0;False;None;b5750d4597ec1ccfe99b81833420c464;True;bump;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3061;-1477.856,-822.5417;Inherit;False;Property;_NormalMapRealtimeStrength;Normal Map Realtime Strength;15;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3064;-1516.677,-464.9637;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2457;-2562,-6160;Inherit;True;Property;_ALDelayMap;AudioLink Delay Tex Map;44;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;b09f22a7c655346478fa1bd670e6038e;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2683;3360,960;Inherit;False;Constant;_Float14;Float 14;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2705;3344,1536;Inherit;False;Constant;_Float21;Float 21;48;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2694;3360,1456;Inherit;False;2670;cvr camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2672;3584,2080;Inherit;False;vrc camera;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2707;3584,2176;Inherit;False;vrc mirror;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2674;3360,880;Inherit;False;2670;cvr camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2313;-2016,-2400;Inherit;False;Property;_DiscardUVMap;Discard UV Map;67;1;[Enum];Create;False;1;;4;UV0;0;UV1;1;UV2;2;UV3;3;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;40;80,-2608;Inherit;True;Property;_AL_Mask;AudioLink Mask;43;0;Create;False;0;0;0;True;0;False;-1;None;ceb7b5fe62fd2f685be60f571cf9dc1e;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;34;-736,-1216;Inherit;True;Property;_NMSample;NM Sample;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FractNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;49;1888,-3040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3150;-2224,-5952;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3107;-1328,-640;Inherit;True;VivikaShading;5;;2837;efce34b3f4a0e2b44933c4737d48061f;0;19;104;FLOAT;1;False;95;FLOAT;0;False;87;FLOAT;0;False;54;FLOAT;0;False;51;FLOAT;0;False;52;FLOAT;0;False;48;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;3;False;9;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT3;0,0,0;False;12;FLOAT;0;False;13;FLOAT;0;False;18;COLOR;0,0,0,0;False;84;COLOR;0,0,0,0;False;2;FLOAT3;32;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2673;3536,848;Inherit;False;2672;vrc camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3097;3552,944;Inherit;False;Equal (Float);-1;;2850;0dacf0ec3269f3b7c8299909e77d796d;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3098;3552,1536;Inherit;False;Equal (Float);-1;;2851;0dacf0ec3269f3b7c8299909e77d796d;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2698;3568,1456;Inherit;False;2707;vrc mirror;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3155;-1840,-2400;Inherit;False;VVGetVertexUV;-1;;2852;b2c6b9b1b245cf54ca03e50557eebb87;0;1;26;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;107;-2687,-5504;Inherit;False;1275.472;1936.78;Comment;21;85;3023;3089;3087;3088;3086;3072;3071;3070;3069;3085;75;2614;51;45;43;44;42;3047;3173;3178;AudioLink Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;39;400,-2608;Inherit;False;ALMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1002;-416,-1200;Inherit;False;normalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1;32,-1120;Inherit;False;1041.734;585.5447;Comment;10;116;2621;2505;1404;12;87;113;3044;3045;3046;Rim;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2618;-896,-688;Inherit;False;maxIndirLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;50;2000,-3040;Inherit;False;Time;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;27;-2064,-3536;Inherit;False;1157.464;741.0301;Comment;14;2546;1047;26;2629;2307;25;2630;2540;1003;2552;2542;2970;2975;3015;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3078;-1714,-6144;Inherit;False;in_ALDelayMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;138;1760,-1216;Inherit;False;1050.305;1191.881;Comment;18;192;198;774;775;776;777;773;772;771;770;768;767;766;765;764;763;762;270;UV Tile Discard;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;200;-1632,-2400;Inherit;False;DiscardUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2675;3744,880;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2699;3744,1472;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2677;3712,784;Inherit;False;Constant;_Float12;Float 12;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2700;3552,1376;Inherit;False;Constant;_Float20;Float 12;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;117;16,-2288;Inherit;False;907.3133;529.2772;Comment;4;1005;119;121;118;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1404;192,-784;Inherit;False;1002;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2505;160,-720;Inherit;False;2618;maxIndirLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2621;192,-656;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;12;96,-976;Float;False;Property;_RimPower;Rim Power;63;0;Create;False;0;0;0;True;0;False;2.07;1.86;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;87;96,-912;Inherit;False;Property;_RimEnergy;Rim Energy;64;0;Create;False;0;0;0;True;0;False;0.345;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;113;96,-848;Inherit;False;Property;_RimBaseColorStrength;Rim Base Color Strength;65;0;Create;False;0;0;0;True;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3046;96,-1040;Inherit;False;Property;_RimToggle;Rim Toggle (for Animation);62;1;[ToggleUI];Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3047;-2656,-4688;Inherit;False;Property;_AudioLinkToggle;AudioLink Toggle (for Animation);39;1;[ToggleUI];Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;45;-2560,-4880;Inherit;False;Property;_AL_Treble;Treble Color;57;0;Create;False;0;0;0;False;0;False;0,0,1,1;0,0,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;51;-2528,-4624;Inherit;False;50;Time;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3085;-2560,-4176;Inherit;False;3078;in_ALDelayMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3069;-2560,-4432;Inherit;False;Property;_ALBassMask;Bass Mask Channel;50;1;[Enum];Create;False;0;5;None;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3070;-2592,-4368;Inherit;False;Property;_ALHighMidMask;High Mid Mask Channel;55;1;[Enum];Create;False;0;5;None;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3071;-2592,-4304;Inherit;False;Property;_ALLowMidMask;Low Mid Mask Channel;52;1;[Enum];Create;False;0;5;None;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3072;-2560,-4240;Inherit;False;Property;_ALTrebleMask;Treble Mask Channel;58;1;[Enum];Create;False;0;5;None;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3020;1102,-4882;Inherit;False;3009.957;1023.063;Comment;19;2995;2979;3011;3075;2993;3139;3014;2974;3140;3138;2971;3017;3141;2962;3013;3018;3142;3144;3145;Alpha Calculations;1,1,1,1;0;0
Node;AmplifyShaderEditor.BreakToComponentsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2975;-1152,-3184;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;42;-2560,-5456;Inherit;False;Property;_AL_Bass;Bass Color;48;0;Create;False;0;0;0;False;0;False;1,0,0,1;1,0,0,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;44;-2560,-5264;Inherit;False;Property;_AL_HighMid;High Mid Color;54;0;Create;False;0;0;0;False;0;False;0,0.8196079,0,1;0,0.8196079,0,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;43;-2560,-5072;Inherit;False;Property;_AL_LowMid;Low Mid Color;51;0;Create;False;0;0;0;False;0;False;1,0.9294118,0,1;1,0.9294118,0,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;75;-2528,-4496;Inherit;False;39;ALMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3086;-2560,-4112;Inherit;False;Property;_ALBassDelay;Bass Delay Channel;49;1;[Enum];Create;False;0;5;None;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3088;-2592,-4048;Inherit;False;Property;_ALHighMidDelay;High Mid Delay Channel;56;1;[Enum];Create;False;0;5;None;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3087;-2592,-3984;Inherit;False;Property;_ALLowMidDelay;Low Mid Delay Channel;53;1;[Enum];Create;False;0;5;None;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3089;-2592,-3920;Inherit;False;Property;_ALTrebleDelay;Treble Delay Channel;59;1;[Enum];Create;False;0;5;None;0;Red;1;Green;2;Blue;3;Alpha;4;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3173;-2592,-3856;Inherit;False;Property;_InactEmitBand;Inactive Emit Band;41;1;[Enum];Create;False;0;4;Bass;0;Low Mid;1;High Mid;2;Treble;3;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2614;-2560,-4560;Inherit;False;Property;_ALEmitifInactive;AL Emit if Inactive;40;1;[ToggleUI];Create;False;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3178;-2232.984,-5345.633;Inherit;False;Property;_EmitAll;Emit All;42;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;270;1792,-1168;Inherit;False;Property;_UDIMDiscardRow0_0;Discard UV Row 0,0;68;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;762;1792,-1104;Inherit;False;Property;_UDIMDiscardRow1_0;Discard UV Row 1,0;69;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;763;1792,-1040;Inherit;False;Property;_UDIMDiscardRow2_0;Discard UV Row 2,0;70;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;764;1792,-976;Inherit;False;Property;_UDIMDiscardRow3_0;Discard UV Row 3,0;71;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;765;1792,-912;Inherit;False;Property;_UDIMDiscardRow0_1;Discard UV Row 0,1;72;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;766;1792,-848;Inherit;False;Property;_UDIMDiscardRow1_1;Discard UV Row 1,1;73;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;767;1792,-784;Inherit;False;Property;_UDIMDiscardRow2_1;Discard UV Row 2,1;74;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;768;1792,-720;Inherit;False;Property;_UDIMDiscardRow3_1;Discard UV Row 3,1;75;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;770;1792,-656;Inherit;False;Property;_UDIMDiscardRow0_2;Discard UV Row 0,2;76;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;771;1792,-592;Inherit;False;Property;_UDIMDiscardRow1_2;Discard UV Row 1,2;77;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;772;1792,-528;Inherit;False;Property;_UDIMDiscardRow2_2;Discard UV Row 2,2;78;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;773;1792,-464;Inherit;False;Property;_UDIMDiscardRow3_2;Discard UV Row 3,2;79;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;774;1792,-400;Inherit;False;Property;_UDIMDiscardRow0_3;Discard UV Row 0,3;80;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;775;1792,-336;Inherit;False;Property;_UDIMDiscardRow1_3;Discard UV Row 1,3;81;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;776;1792,-272;Inherit;False;Property;_UDIMDiscardRow2_3;Discard UV Tile 2,3;82;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;777;1792,-208;Inherit;False;Property;_UDIMDiscardRow3_3;Discard UV Row 3,3;83;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;198;1888,-144;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3095;3872,816;Inherit;False;Greater or Equal (Float);-1;;2868;9d883a649d0c24745bcf903b998f8f88;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3099;3872,1392;Inherit;False;Greater or Equal (Float);-1;;2870;9d883a649d0c24745bcf903b998f8f88;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2702;3776,1600;Inherit;False;Property;_DontRenderinSocialVRMirrors;Don't Render in Social VR Mirrors;86;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2669;3760,992;Inherit;False;Property;_DontRenderInSocialVRCameras;Don't Render in Social VR Cameras;85;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;118;80,-2224;Inherit;True;Property;_Emission;Emission;16;0;Create;True;0;0;0;True;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1005;128,-1952;Inherit;False;Property;_EmissionColor;Emission Color;17;0;Create;False;0;0;0;True;0;False;0,0,0,0;0,0,0,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3045;496,-912;Inherit;False;Rim;-1;;2872;652e8c2aadb4b694999944f1079d1366;0;7;29;FLOAT;0;False;30;FLOAT;0;False;31;FLOAT;0;False;32;FLOAT;0;False;26;FLOAT3;0,0,0;False;27;FLOAT3;0,0,0;False;28;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2970;-1152,-2912;Inherit;False;alphaSrc;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3018;1152,-4624;Inherit;False;Property;_AlphaMapStrength;Alpha Map Strength;13;0;Create;False;0;0;0;True;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3013;1152,-4832;Inherit;True;Property;_AlphaMap;Alpha Map;12;1;[SingleLineTexture];Create;False;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2962;1952,-4480;Inherit;False;Property;_Mode;Render Mode;0;1;[Enum];Create;False;0;4;Opaque;0;Cutout;1;Transparent Cutout;2;Transparent;3;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3141;1680,-4096;Inherit;False;Constant;_Float1;Float 1;85;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3177;-2176,-4928;Inherit;False;VVALCombine;-1;;3349;bceeba5c9c06c59459d6b7e4bf2084da;0;19;243;FLOAT;0;False;54;FLOAT;0;False;25;COLOR;1,0,0,1;False;27;COLOR;1,0.9294118,0,1;False;26;COLOR;0,0.8196079,0,1;False;28;COLOR;0,0,1,1;False;51;COLOR;0,0,0,0;False;52;FLOAT;0;False;53;FLOAT;0;False;205;FLOAT;0;False;59;FLOAT;0;False;60;FLOAT;0;False;68;FLOAT;0;False;69;FLOAT;0;False;75;COLOR;0,0,0,0;False;78;FLOAT;0;False;82;FLOAT;0;False;79;FLOAT;0;False;83;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3035;544,1264;Inherit;False;1147.106;537.085;Comment;5;3039;3038;3037;3036;3190;DPS Penetrator;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3094;2272,-816;Inherit;False;VVUVTileDiscardFull;-1;;3411;37cd3007c1dbdac4b9341609f3fa3a5a;0;17;100;FLOAT;0;False;101;FLOAT;0;False;102;FLOAT;0;False;103;FLOAT;0;False;104;FLOAT;0;False;105;FLOAT;0;False;106;FLOAT;0;False;107;FLOAT;0;False;108;FLOAT;0;False;109;FLOAT;0;False;110;FLOAT;0;False;111;FLOAT;0;False;112;FLOAT;0;False;113;FLOAT;0;False;114;FLOAT;0;False;115;FLOAT;0;False;99;FLOAT2;0,0;False;1;FLOAT;116
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2703;4112,1408;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2678;4128,832;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;121;432,-2144;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3044;497.8331,-1021.399;Inherit;False;Property;_EnableRimLighting;Enable Rim Lighting;61;0;Create;False;0;0;0;False;1;Header(Rim Lighting);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3023;-1904,-4944;Inherit;False;Property;_EnableAudioLink;Enable AudioLink;38;0;Create;False;0;0;0;True;1;Header(AudioLink);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3017;1520,-4560;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2971;1312,-4304;Inherit;False;2970;alphaSrc;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3140;1920,-4032;Inherit;False;Less or Equal (Float);-1;;3460;c206052517de386488d07c2846267e45;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3138;1888,-4240;Inherit;False;Greater or Equal (Float);-1;;3462;9d883a649d0c24745bcf903b998f8f88;0;2;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DitherNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2974;1936,-4384;Inherit;False;1;False;4;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;2;SAMPLER2D;;False;3;SAMPLERSTATE;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3037;592,1328;Inherit;False;1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NormalVertexDataNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3036;592,1648;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2666;3296,32;Inherit;False;1616.048;535.0431;Comment;13;2687;2654;2655;2661;2660;2658;2662;2657;2689;2708;2715;2716;3022;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;192;2592,-800;Inherit;False;UVTileDiscard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2704;4176,1568;Inherit;False;Dont Render in Social VR Mirror Result;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2686;4176,944;Inherit;False;Dont Render in Social VR Camera Result;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;31;16,-1680;Inherit;False;798.6848;366.049;Comment;6;29;2539;30;86;28;122;Emission Combination;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;116;848,-912;Float;False;Rim;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;85;-1632,-4928;Inherit;False;AL_Final;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3014;1648,-4320;Inherit;False;Property;_UseAlphaMap;Use Alpha Map;11;0;Create;False;0;0;0;True;0;False;0;0;0;True;_CUSTOMALPHAMAP;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3139;2160,-4160;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3145;2144,-4368;Inherit;False;Property;_DoDither;DoDither;85;0;Create;True;0;0;0;False;0;False;0;0;0;False;_DoDither;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;119;624,-2176;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3190;972.3232,1498.95;Inherit;False;DPS Penetrator;-1;;3472;29f996d8f1416f64b9b7eb6129a09bb0;0;2;4;FLOAT4;0,0,0,0;False;7;FLOAT3;0,0,0;False;2;FLOAT4;0;FLOAT3;8
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2687;3344,176;Inherit;False;2686;Dont Render in Social VR Camera Result;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2708;3344,256;Inherit;False;2704;Dont Render in Social VR Mirror Result;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2654;3472,96;Inherit;False;192;UVTileDiscard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2715;3456,384;Inherit;False;Property;_UDIMDiscardAll;Discard All;84;1;[ToggleUI];Create;False;1;The Following Setting Completely Disables Rendering whatever is using this material. This works similarly to UV Tile Discarding.;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3038;1440,1328;Inherit;False;dps position;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;122;48,-1520;Inherit;False;119;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;28;32,-1440;Inherit;False;116;Rim;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;86;32,-1616;Inherit;False;85;AL_Final;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2993;2368,-4304;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3075;2336,-4464;Inherit;False;Less or Equal (Float);-1;;3464;c206052517de386488d07c2846267e45;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2665;3328,-416;Inherit;False;468;235;Comment;1;2663;Vertex Position Results;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2661;3792,368;Inherit;False;Constant;_Float11;Float 11;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2655;3728,160;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3041;3357.298,-347.6859;Inherit;False;3038;dps position;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;30;240,-1536;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3011;2576,-4320;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3144;2656,-4432;Inherit;False;Constant;_Float2;Float 2;85;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3168;-1725.756,-5958.502;Inherit;False;delayMapRaw;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2542;-2000,-3280;Inherit;False;Property;_AOStrength;AO Strength;36;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1003;-2000,-3472;Inherit;True;Property;_MainTex;Albedo;9;1;[SingleLineTexture];Create;False;1;Standard Fallbacks;0;0;True;0;False;None;14a12068859ba0c3d98b13e7c96bd197;False;white;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2658;3936,240;Inherit;False;Constant;_Float5;Float 5;46;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2660;3968,336;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2716;3920,128;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2552;-1936,-2928;Inherit;False;Property;_RealAO;Real AO;37;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2540;-2032,-3200;Inherit;True;Property;_AmbientOcclusion;Ambient Occlusion;35;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2663;3584,-368;Inherit;False;Vertex Position;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2539;448,-1536;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3142;2816,-4384;Inherit;False;Property;_AlphaIsInUse;AlphaIsInUse;85;0;Create;True;0;0;0;False;0;False;0;0;0;False;_AlphaIsInUse;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3157;-80,-2912;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3160;186.0386,-2776.599;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3162;208,-3200;Inherit;False;3168;delayMapRaw;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;25;-1712,-3472;Inherit;True;Property;_AlbedoSample;Albedo Sample;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.Compare, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2657;4160,96;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2689;3872,480;Inherit;False;2663;Vertex Position;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2307;-1664,-3072;Inherit;False;Property;_Color;Color;10;0;Create;False;0;0;0;True;0;False;1,1,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2630;-1728,-3200;Inherit;False;VVAmbientOcclusion;-1;;3466;9931be4718b157b4ebb46a99812bfe31;0;3;6;FLOAT;0;False;7;COLOR;0,0,0,0;False;9;FLOAT;0;False;2;COLOR;11;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;220;1248,-2688;Inherit;False;1337.556;736.401;Comment;10;2981;0;193;332;32;33;3008;3009;3042;3167;Output;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;29;592,-1536;Inherit;False;EmissionFinal;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2979;3104,-4336;Inherit;False;alphaFinal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3161;336,-2784;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3158;256,-2976;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3163;444.6429,-3138.414;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2629;-1360,-3312;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1144;-896,-576;Inherit;False;Lighting Wrapped;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3022;4336,304;Inherit;False;Property;_EnableVertexDiscarding;Enable Vertex Discarding;66;0;Create;False;0;0;0;False;1;Header(UV Tile Discarding);False;0;0;0;True;_VERTEXDISCARD_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2981;1440,-2192;Inherit;False;2979;alphaFinal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;32;1296,-2544;Inherit;False;29;EmissionFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3159;560,-2944;Inherit;False;Greater or Equal (Float);-1;;3467;9d883a649d0c24745bcf903b998f8f88;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3164;560,-2784;Inherit;False;Less or Equal (Float);-1;;3469;c206052517de386488d07c2846267e45;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;26;-1200,-3312;Inherit;False;mainTex;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;217;1840,-1792;Inherit;False;420.8079;185;Comment;2;219;218;Declare NaN;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2641;-688.6962,-4043.483;Inherit;False;324;355;Comment;1;2642;Fallbacks;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;332;1408,-2112;Inherit;False;1144;Lighting Wrapped;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2662;4624,336;Inherit;False;Discard Vertex;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3039;1456,1696;Inherit;False;dps normal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3165;864,-2864;Inherit;False;Equal (Float);-1;;3471;0dacf0ec3269f3b7c8299909e77d796d;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3008;1808,-2384;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3166;752,-2608;Inherit;False;Property;_DebugDelayMap;Debug Delay Map;46;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3179;-1347.486,2044.651;Inherit;False;356;883;Comment;10;3189;3188;3187;3186;3185;3184;3183;3182;3181;3180;DPS Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3146;-2496,-5888;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TFHCRemapNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3079;-2226,-6160;Inherit;False;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;3;COLOR;0,0,0,0;False;4;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3015;-1456,-2864;Inherit;False;colorAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;33;1296,-2640;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;218;1888,-1744;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;219;2048,-1744;Inherit;False;NaN;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1047;-1168,-3472;Inherit;False;Property;_CullMode;Cull Mode;8;1;[Enum];Create;True;0;3;Off;0;Front;1;Back;2;0;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2546;-1376,-3120;Inherit;False;ao_times_strength;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;193;1408,-2032;Inherit;False;2662;Discard Vertex;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2959;1041.064,-5636.165;Inherit;False;Property;_SrcBlend;SrcBlend;1;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2960;1040,-5552;Inherit;False;Property;_DstBlend;DstBlend;2;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2961;1040,-5456;Inherit;False;Property;_ZWrite;ZWrite;3;1;[ToggleUI];Create;False;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2642;-640.6962,-3979.483;Inherit;True;Property;_EmissionMap;Fallback Emission Map;87;2;[Header];[SingleLineTexture];Create;False;1;Fallback Textures;0;0;True;0;False;None;ceb7b5fe62fd2f685be60f571cf9dc1e;False;white;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3042;2016,-2080;Inherit;False;3039;dps normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2995;2192,-4608;Inherit;False;rendMode;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3009;1920,-2176;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3081;-2256,-5808;Inherit;False;Constant;_Vector24;Vector 24;80;0;Create;True;0;0;0;False;0;False;127,127,127,127;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3080;-2016,-5856;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0.7490194,0.4980392,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RoundOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3082;-1936,-6176;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3167;2048,-2448;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3180;-1283.486,2172.651;Inherit;False;Property;_SqueezeDist;Squeeze Smoothness;89;0;Fetch;False;0;0;0;True;0;False;0;0;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3181;-1283.486,2252.651;Inherit;False;Property;_BulgePower;Bulge Amount;90;0;Fetch;False;0;0;0;True;0;False;0;0;0;0.01;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3183;-1283.486,2572.651;Inherit;False;Property;_Curvature;Curvature;94;0;Fetch;False;0;0;0;True;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3184;-1283.486,2652.651;Inherit;False;Property;_ReCurvature;ReCurvature;95;0;Fetch;False;0;0;0;True;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3185;-1283.486,2732.651;Inherit;False;Property;_Wriggle;Wriggle Amount;96;0;Fetch;False;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3186;-1283.486,2412.651;Inherit;False;Property;_Length;Length of Penetrator Model;92;0;Fetch;False;0;0;0;True;0;False;0;0.1073551;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3187;-1283.486,2492.651;Inherit;False;Property;_EntranceStiffness;Entrance Stiffness;93;0;Fetch;False;0;0;0;True;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3188;-1283.486,2812.651;Inherit;False;Property;_WriggleSpeed;Wriggle Speed;97;0;Fetch;False;0;0;0;True;0;False;0.28;0.28;0.1;30;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3189;-1283.486,2092.651;Inherit;False;Property;_Squeeze;Squeeze Minimum Size;88;1;[Header];Fetch;False;1;DPS Penetrator Settings;0;0;True;0;False;0;0;0;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3182;-1283.486,2332.651;Inherit;False;Property;_BulgeOffset;Bulge Length;91;0;Fetch;False;0;0;0;True;0;False;0;0;0;0.3;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;0;2320,-2528;Float;False;True;-1;2;Voy.VivikaShader.VivikaShaderGUI;0;0;CustomLighting;VoyVivika/Vivika Shader/Vivika Shader DPS Penetrator;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;True;_ZWrite;0;False;;False;0;False;;0;False;;False;0;0;False;;0;Custom;0.5;True;True;0;True;Opaque;;Geometry;ForwardOnly;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;1;5;True;_SrcBlend;10;True;_DstBlend;1;0;True;_SrcBlend;0;True;_DstBlend;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Absolute;0;Standard;4;-1;-1;-1;1;VRCFallback=DoubleSided;False;0;0;True;_CullMode;-1;0;False;;1;Include;..\Libs\AudioLink\AudioLink.cginc;False;;Custom;False;0;0;;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2941;0;2937;0
WireConnection;2942;0;2941;3
WireConnection;2942;1;2941;4
WireConnection;2943;0;2942;0
WireConnection;2944;0;2943;0
WireConnection;2948;0;2947;0
WireConnection;2837;0;2838;0
WireConnection;2946;0;2944;0
WireConnection;2946;1;2948;0
WireConnection;2713;0;1017;4
WireConnection;2713;1;1017;2
WireConnection;2713;2;2714;0
WireConnection;3156;32;2357;0
WireConnection;2355;0;3156;0
WireConnection;2950;0;2713;0
WireConnection;2950;1;2949;0
WireConnection;2952;0;2951;0
WireConnection;2952;1;1017;1
WireConnection;2836;0;2937;0
WireConnection;2836;1;2837;0
WireConnection;2836;2;2946;0
WireConnection;2711;0;2950;0
WireConnection;2710;0;2952;0
WireConnection;2844;0;2836;0
WireConnection;2670;0;2668;0
WireConnection;48;0;243;0
WireConnection;3064;0;2582;0
WireConnection;2457;1;2363;0
WireConnection;2672;0;2671;0
WireConnection;2707;0;2706;0
WireConnection;34;0;1006;0
WireConnection;49;0;48;0
WireConnection;3150;0;2457;0
WireConnection;3150;1;979;0
WireConnection;3107;104;3061;0
WireConnection;3107;95;3064;2
WireConnection;3107;87;2842;0
WireConnection;3107;54;2732;0
WireConnection;3107;51;2726;0
WireConnection;3107;52;2727;0
WireConnection;3107;48;2723;0
WireConnection;3107;4;2392;0
WireConnection;3107;5;2414;0
WireConnection;3107;6;2415;0
WireConnection;3107;7;2556;0
WireConnection;3107;8;1207;0
WireConnection;3107;9;2291;0
WireConnection;3107;10;2375;0
WireConnection;3107;11;2582;0
WireConnection;3107;12;2583;0
WireConnection;3107;13;2584;0
WireConnection;3107;18;2589;0
WireConnection;3107;84;2845;0
WireConnection;3097;1;2674;0
WireConnection;3097;2;2683;0
WireConnection;3098;1;2694;0
WireConnection;3098;2;2705;0
WireConnection;3155;26;2313;0
WireConnection;39;0;40;0
WireConnection;1002;0;34;0
WireConnection;2618;0;3107;32
WireConnection;50;0;49;0
WireConnection;3078;0;3150;0
WireConnection;200;0;3155;0
WireConnection;2675;0;2673;0
WireConnection;2675;1;3097;0
WireConnection;2699;0;2698;0
WireConnection;2699;1;3098;0
WireConnection;2975;0;2629;0
WireConnection;3095;1;2675;0
WireConnection;3095;2;2677;0
WireConnection;3099;1;2699;0
WireConnection;3099;2;2700;0
WireConnection;3045;29;3046;0
WireConnection;3045;30;12;0
WireConnection;3045;31;87;0
WireConnection;3045;32;113;0
WireConnection;3045;26;1404;0
WireConnection;3045;27;2505;0
WireConnection;3045;28;2621;0
WireConnection;2970;0;2975;3
WireConnection;3177;243;3178;0
WireConnection;3177;54;51;0
WireConnection;3177;25;42;0
WireConnection;3177;27;43;0
WireConnection;3177;26;44;0
WireConnection;3177;28;45;0
WireConnection;3177;51;75;0
WireConnection;3177;52;3047;0
WireConnection;3177;53;2614;0
WireConnection;3177;205;3173;0
WireConnection;3177;59;3069;0
WireConnection;3177;60;3070;0
WireConnection;3177;68;3071;0
WireConnection;3177;69;3072;0
WireConnection;3177;75;3085;0
WireConnection;3177;78;3086;0
WireConnection;3177;82;3087;0
WireConnection;3177;79;3088;0
WireConnection;3177;83;3089;0
WireConnection;3094;100;270;0
WireConnection;3094;101;762;0
WireConnection;3094;102;763;0
WireConnection;3094;103;764;0
WireConnection;3094;104;765;0
WireConnection;3094;105;766;0
WireConnection;3094;106;767;0
WireConnection;3094;107;768;0
WireConnection;3094;108;770;0
WireConnection;3094;109;771;0
WireConnection;3094;110;772;0
WireConnection;3094;111;773;0
WireConnection;3094;112;774;0
WireConnection;3094;113;775;0
WireConnection;3094;114;776;0
WireConnection;3094;115;777;0
WireConnection;3094;99;198;0
WireConnection;2703;0;3099;0
WireConnection;2703;1;2702;0
WireConnection;2678;0;3095;0
WireConnection;2678;1;2669;0
WireConnection;121;0;118;0
WireConnection;121;1;1005;0
WireConnection;3044;0;3045;0
WireConnection;3023;0;3177;0
WireConnection;3017;0;3013;1
WireConnection;3017;1;3018;0
WireConnection;3140;1;2962;0
WireConnection;3140;2;3141;0
WireConnection;3138;1;2962;0
WireConnection;3138;2;3141;0
WireConnection;2974;0;3014;0
WireConnection;192;0;3094;116
WireConnection;2704;0;2703;0
WireConnection;2686;0;2678;0
WireConnection;116;0;3044;0
WireConnection;85;0;3023;0
WireConnection;3014;1;2971;0
WireConnection;3014;0;3017;0
WireConnection;3139;0;3138;0
WireConnection;3139;1;3140;0
WireConnection;3145;1;3014;0
WireConnection;3145;0;2974;0
WireConnection;119;0;121;0
WireConnection;3190;4;3037;0
WireConnection;3190;7;3036;0
WireConnection;3038;0;3190;0
WireConnection;2993;0;3014;0
WireConnection;2993;1;3145;0
WireConnection;2993;2;3139;0
WireConnection;3075;1;2962;0
WireConnection;2655;0;2654;0
WireConnection;2655;1;2687;0
WireConnection;2655;2;2708;0
WireConnection;2655;3;2715;0
WireConnection;30;0;86;0
WireConnection;30;1;122;0
WireConnection;30;2;28;0
WireConnection;3011;0;2993;0
WireConnection;3011;2;3075;0
WireConnection;3168;0;2457;0
WireConnection;2660;0;2661;0
WireConnection;2660;1;2661;0
WireConnection;2716;0;2655;0
WireConnection;2663;0;3041;0
WireConnection;2539;0;30;0
WireConnection;3142;1;3144;0
WireConnection;3142;0;3011;0
WireConnection;3160;0;3158;0
WireConnection;25;0;1003;0
WireConnection;2657;0;2716;0
WireConnection;2657;1;2658;0
WireConnection;2657;2;2660;0
WireConnection;2657;3;2689;0
WireConnection;2630;6;2542;0
WireConnection;2630;7;2540;0
WireConnection;2630;9;2552;0
WireConnection;29;0;2539;0
WireConnection;2979;0;3142;0
WireConnection;3161;0;3160;0
WireConnection;3158;0;3157;0
WireConnection;3163;0;3162;0
WireConnection;2629;0;25;0
WireConnection;2629;1;2630;11
WireConnection;2629;2;2307;0
WireConnection;1144;0;3107;0
WireConnection;3022;1;2689;0
WireConnection;3022;0;2657;0
WireConnection;3159;1;3158;0
WireConnection;3159;2;3163;0
WireConnection;3164;1;3161;0
WireConnection;3164;2;3163;0
WireConnection;26;0;2629;0
WireConnection;2662;0;3022;0
WireConnection;3039;0;3190;8
WireConnection;3165;1;3159;0
WireConnection;3165;2;3164;0
WireConnection;3008;0;32;0
WireConnection;3008;1;2981;0
WireConnection;3146;0;979;0
WireConnection;3146;1;979;0
WireConnection;3146;2;979;0
WireConnection;3146;3;979;0
WireConnection;3079;0;2457;0
WireConnection;3079;4;3146;0
WireConnection;3015;0;2307;4
WireConnection;219;0;218;0
WireConnection;2546;0;2630;0
WireConnection;2995;0;2962;0
WireConnection;3009;0;332;0
WireConnection;3009;1;2981;0
WireConnection;3080;0;3079;0
WireConnection;3080;2;3081;0
WireConnection;3082;0;3079;0
WireConnection;3167;0;3008;0
WireConnection;3167;1;3165;0
WireConnection;3167;2;3166;0
WireConnection;0;0;33;0
WireConnection;0;2;3167;0
WireConnection;0;9;2981;0
WireConnection;0;10;2981;0
WireConnection;0;13;3009;0
WireConnection;0;11;193;0
WireConnection;0;12;3042;0
ASEEND*/
//CHKSM=CD42FDA8F6DC78583D4E838F0814CFD7A38605FE