// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VoyVivika/VivikaShader/Vivika Shader Opaque"
{
	Properties
	{
		[Enum(Off,0,Front,1,Back,2)]_CullMode("Cull Mode", Float) = 0
		[SingleLineTexture]_MainTex("Albedo", 2D) = "white" {}
		_Color("Color", Color) = (1,1,1,0)
		[SingleLineTexture]_BumpMap("Normal Map", 2D) = "bump" {}
		_Emission("Emission", 2D) = "black" {}
		_EmissionColor("Emission Color", Color) = (0,0,0,0)
		_MinBrightness("Min Brightness", Range( 0 , 1)) = 0
		_IndirectDiffuseOffset("Indirect Light Min", Range( 0 , 1)) = 1
		_IndirectDiffuseOffsetMax("Indirect Light Max", Range( 0 , 1)) = 0
		[ToggleUI]_IndirLightUseMinforMax("Use Min for Max", Float) = 1
		[ToggleUI]_ClampRealtimeLighting("Relative Clamp Realtime Lighting", Float) = 0
		_RealtimeLightMax("Relative Real Light Max", Range( 0 , 1)) = 0
		_RealtimeLightMin("Relative Real Light Min", Range( 0 , 1)) = 0
		[Enum(Clamp,0,Remap,1)]_IndirectLimiterMode("Indirect Limiter Mode", Float) = 0
		_WrappedShadingValue("Wrapped Shading Value", Float) = 1
		_WrapIndirScale("Indirect Light Scale", Float) = 3
		[SingleLineTexture]_MetallicGlossMap("Metallic Smoothness", 2D) = "black" {}
		[Enum(Alpha,0,Green,1)]_SmoothnessChannel("Smoothness Channel", Float) = 0
		_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 1
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 1
		[ToggleUI]_MetallicReflectionMode("Fresnel Metallics (Experimental)", Float) = 0
		[SingleLineTexture]_FallbackReflection("Fallback Reflection", CUBE) = "black" {}
		[ToggleUI]_ForceFallbackReflections("Force Fallback Reflections", Float) = 0
		_AmbientOcclusion("Ambient Occlusion", 2D) = "white" {}
		_AOStrength("AO Strength", Range( 0 , 1)) = 1
		[ToggleUI]_RealAO("Real AO", Float) = 0
		[Header(AudioLink)][ToggleUI]_EnableAudioLink("Enable AudioLink", Range( 0 , 1)) = 0
		[ToggleUI]_ALEmitifInactive("AL Emit if Inactive", Float) = 0
		_AL_Mask("AudioLink Mask", 2D) = "black" {}
		[SingleLineTexture]_ALDelayMap("AudioLink Delay Tex Map", 2D) = "black" {}
		[Enum(UV0,0,UV1,1,UV2,2,UV3,3,Screen Space,8)]_ALDelayUVMap("AL Delay UV Map", Float) = 2
		_ALUVDelayMaxDelay("AL UV Delay Max Delay", Range( 0 , 127)) = 0
		_ALTimeScale("AL HueShift Time Scale", Float) = 0
		[ToggleUI]_EnableRimLighting("Enable Rim Lighting", Range( 0 , 1)) = 1
		_RimPower("Rim Power", Range( 0 , 10)) = 2.07
		_RimEnergy("Rim Energy", Range( 0 , 1)) = 0.345
		_RimBaseColorStrength("Rim Base Color Strength", Range( 0 , 1)) = 1
		[Header(UV Tile Discarding)][Enum(UV0,0,UV1,1,UV2,2,UV3,3)]_DiscardUVMap("Discard UV Map", Float) = 1
		[ToggleUI]_UDIMDiscardRow0_0("Discard UV Row 0,0", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow1_0("Discard UV Row 1,0", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow2_0("Discard UV Row 2,0", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow3_0("Discard UV Row 3,0", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow0_1("Discard UV Row 0,1", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow1_1("Discard UV Row 1,1", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow2_1("Discard UV Row 2,1", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow3_1("Discard UV Row 3,1", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow0_2("Discard UV Row 0,2", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow1_2("Discard UV Row 1,2", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow2_2("Discard UV Row 2,2", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow3_2("Discard UV Row 3,2", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow0_3("Discard UV Row 0,3", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow1_3("Discard UV Row 1,3", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow2_3("Discard UV Tile 2,3", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardRow3_3("Discard UV Row 3,3", Range( 0 , 1)) = 0
		[ToggleUI]_UDIMDiscardAll("Discard All", Float) = 0
		[SingleLineTexture]_EmissionMap("Fallback Emission Map", 2D) = "white" {}
		[ToggleUI]_DontRenderInSocialVRCameras("Don't Render in Social VR Cameras", Float) = 0
		[ToggleUI]_DontRenderinSocialVRMirrors("Don't Render in Social VR Mirrors", Float) = 0
		[HideInInspector] _texcoord4( "", 2D ) = "white" {}
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  "VRCFallback"="DoubleSided" }
		Cull [_CullMode]
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "../Libs/VRCLV/LightVolumes.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
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
		uniform float _SmoothnessStrength;
		uniform samplerCUBE _FallbackReflection;
		float4 _FallbackReflection_TexelSize;
		uniform float _ForceFallbackReflections;
		uniform float _MetallicStrength;
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

		inline float AudioLinkData3_g1904( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1906(  )
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


		inline float AudioLinkData3_g1888( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1890(  )
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


		inline float AudioLinkData3_g1893( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1895(  )
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


		inline float AudioLinkData3_g1898( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1900(  )
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


		float IfAudioLinkv2Exists1_g1901(  )
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


		float3 ShadeSH97_g1913( float4 Normal )
		{
			return ShadeSH9(Normal);
		}


		float4 unitysampletexcubelodexpression59_g1908( float3 refDir )
		{
			return UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, refDir, UNITY_SPECCUBE_LOD_STEPS);
		}


		float4 unity_SpecCube0_HDRexpression60_g1908(  )
		{
			return unity_SpecCube0_HDR;
		}


		float AND1_g1909( float A, float B )
		{
			return A && B;
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 break63_g1883 = floor( float2( 0,0 ) );
			float temp_output_8_0_g1225 = 0.0;
			float temp_output_26_0_g1221 = _DiscardUVMap;
			float temp_output_7_0_g1225 = temp_output_26_0_g1221;
			float2 lerpResult6_g1225 = lerp( float2( 0,0 ) , v.texcoord.xy , ( step( temp_output_8_0_g1225 , temp_output_7_0_g1225 ) * step( temp_output_7_0_g1225 , temp_output_8_0_g1225 ) ));
			float temp_output_8_0_g1222 = 1.0;
			float temp_output_7_0_g1222 = temp_output_26_0_g1221;
			float2 lerpResult6_g1222 = lerp( float2( 0,0 ) , v.texcoord1.xy , ( step( temp_output_8_0_g1222 , temp_output_7_0_g1222 ) * step( temp_output_7_0_g1222 , temp_output_8_0_g1222 ) ));
			float temp_output_8_0_g1223 = 2.0;
			float temp_output_7_0_g1223 = temp_output_26_0_g1221;
			float2 lerpResult6_g1223 = lerp( float2( 0,0 ) , v.texcoord2.xy , ( step( temp_output_8_0_g1223 , temp_output_7_0_g1223 ) * step( temp_output_7_0_g1223 , temp_output_8_0_g1223 ) ));
			float temp_output_8_0_g1224 = 3.0;
			float temp_output_7_0_g1224 = temp_output_26_0_g1221;
			float2 lerpResult6_g1224 = lerp( float2( 0,0 ) , v.texcoord3.xy , ( step( temp_output_8_0_g1224 , temp_output_7_0_g1224 ) * step( temp_output_7_0_g1224 , temp_output_8_0_g1224 ) ));
			float2 DiscardUV200 = ( lerpResult6_g1225 + lerpResult6_g1222 + lerpResult6_g1223 + lerpResult6_g1224 );
			float2 temp_output_99_0_g1867 = DiscardUV200;
			float2 break61_g1883 = temp_output_99_0_g1867;
			float2 break63_g1881 = floor( float2( 0,1 ) );
			float2 break61_g1881 = temp_output_99_0_g1867;
			float2 break63_g1879 = floor( float2( 0,2 ) );
			float2 break61_g1879 = temp_output_99_0_g1867;
			float2 break63_g1882 = floor( float2( 0,3 ) );
			float2 break61_g1882 = temp_output_99_0_g1867;
			float2 break63_g1880 = floor( float2( 1,0 ) );
			float2 break61_g1880 = temp_output_99_0_g1867;
			float2 break63_g1876 = floor( float2( 1,1 ) );
			float2 break61_g1876 = temp_output_99_0_g1867;
			float2 break63_g1877 = floor( float2( 1,2 ) );
			float2 break61_g1877 = temp_output_99_0_g1867;
			float2 break63_g1878 = floor( float2( 1,3 ) );
			float2 break61_g1878 = temp_output_99_0_g1867;
			float2 break63_g1875 = floor( float2( 2,0 ) );
			float2 break61_g1875 = temp_output_99_0_g1867;
			float2 break63_g1874 = floor( float2( 2,1 ) );
			float2 break61_g1874 = temp_output_99_0_g1867;
			float2 break63_g1873 = floor( float2( 2,2 ) );
			float2 break61_g1873 = temp_output_99_0_g1867;
			float2 break63_g1872 = floor( float2( 2,3 ) );
			float2 break61_g1872 = temp_output_99_0_g1867;
			float2 break63_g1868 = floor( float2( 3,0 ) );
			float2 break61_g1868 = temp_output_99_0_g1867;
			float2 break63_g1869 = floor( float2( 3,1 ) );
			float2 break61_g1869 = temp_output_99_0_g1867;
			float2 break63_g1870 = floor( float2( 3,2 ) );
			float2 break61_g1870 = temp_output_99_0_g1867;
			float2 break63_g1871 = floor( float2( 3,3 ) );
			float2 break61_g1871 = temp_output_99_0_g1867;
			float UVTileDiscard192 = step( 1.0 , ( ( ( saturate( _UDIMDiscardRow0_0 ) * saturate( ( step( break63_g1883.x , break61_g1883.x ) * step( break61_g1883.x , ( break63_g1883.x + 0.9999999 ) ) * step( break63_g1883.y , break61_g1883.y ) * step( break61_g1883.y , ( break63_g1883.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_0 ) * saturate( ( step( break63_g1881.x , break61_g1881.x ) * step( break61_g1881.x , ( break63_g1881.x + 0.9999999 ) ) * step( break63_g1881.y , break61_g1881.y ) * step( break61_g1881.y , ( break63_g1881.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_0 ) * saturate( ( step( break63_g1879.x , break61_g1879.x ) * step( break61_g1879.x , ( break63_g1879.x + 0.9999999 ) ) * step( break63_g1879.y , break61_g1879.y ) * step( break61_g1879.y , ( break63_g1879.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_0 ) * saturate( ( step( break63_g1882.x , break61_g1882.x ) * step( break61_g1882.x , ( break63_g1882.x + 0.9999999 ) ) * step( break63_g1882.y , break61_g1882.y ) * step( break61_g1882.y , ( break63_g1882.y + 0.9999999 ) ) ) ) ) ) + ( ( saturate( _UDIMDiscardRow0_1 ) * saturate( ( step( break63_g1880.x , break61_g1880.x ) * step( break61_g1880.x , ( break63_g1880.x + 0.9999999 ) ) * step( break63_g1880.y , break61_g1880.y ) * step( break61_g1880.y , ( break63_g1880.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_1 ) * saturate( ( step( break63_g1876.x , break61_g1876.x ) * step( break61_g1876.x , ( break63_g1876.x + 0.9999999 ) ) * step( break63_g1876.y , break61_g1876.y ) * step( break61_g1876.y , ( break63_g1876.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_1 ) * saturate( ( step( break63_g1877.x , break61_g1877.x ) * step( break61_g1877.x , ( break63_g1877.x + 0.9999999 ) ) * step( break63_g1877.y , break61_g1877.y ) * step( break61_g1877.y , ( break63_g1877.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_1 ) * saturate( ( step( break63_g1878.x , break61_g1878.x ) * step( break61_g1878.x , ( break63_g1878.x + 0.9999999 ) ) * step( break63_g1878.y , break61_g1878.y ) * step( break61_g1878.y , ( break63_g1878.y + 0.9999999 ) ) ) ) ) ) + ( ( saturate( _UDIMDiscardRow0_2 ) * saturate( ( step( break63_g1875.x , break61_g1875.x ) * step( break61_g1875.x , ( break63_g1875.x + 0.9999999 ) ) * step( break63_g1875.y , break61_g1875.y ) * step( break61_g1875.y , ( break63_g1875.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_2 ) * saturate( ( step( break63_g1874.x , break61_g1874.x ) * step( break61_g1874.x , ( break63_g1874.x + 0.9999999 ) ) * step( break63_g1874.y , break61_g1874.y ) * step( break61_g1874.y , ( break63_g1874.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_2 ) * saturate( ( step( break63_g1873.x , break61_g1873.x ) * step( break61_g1873.x , ( break63_g1873.x + 0.9999999 ) ) * step( break63_g1873.y , break61_g1873.y ) * step( break61_g1873.y , ( break63_g1873.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_2 ) * saturate( ( step( break63_g1872.x , break61_g1872.x ) * step( break61_g1872.x , ( break63_g1872.x + 0.9999999 ) ) * step( break63_g1872.y , break61_g1872.y ) * step( break61_g1872.y , ( break63_g1872.y + 0.9999999 ) ) ) ) ) ) + ( ( saturate( _UDIMDiscardRow0_3 ) * saturate( ( step( break63_g1868.x , break61_g1868.x ) * step( break61_g1868.x , ( break63_g1868.x + 0.9999999 ) ) * step( break63_g1868.y , break61_g1868.y ) * step( break61_g1868.y , ( break63_g1868.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow1_3 ) * saturate( ( step( break63_g1869.x , break61_g1869.x ) * step( break61_g1869.x , ( break63_g1869.x + 0.9999999 ) ) * step( break63_g1869.y , break61_g1869.y ) * step( break61_g1869.y , ( break63_g1869.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow2_3 ) * saturate( ( step( break63_g1870.x , break61_g1870.x ) * step( break61_g1870.x , ( break63_g1870.x + 0.9999999 ) ) * step( break63_g1870.y , break61_g1870.y ) * step( break61_g1870.y , ( break63_g1870.y + 0.9999999 ) ) ) ) ) + ( saturate( _UDIMDiscardRow3_3 ) * saturate( ( step( break63_g1871.x , break61_g1871.x ) * step( break61_g1871.x , ( break63_g1871.x + 0.9999999 ) ) * step( break63_g1871.y , break61_g1871.y ) * step( break61_g1871.y , ( break63_g1871.y + 0.9999999 ) ) ) ) ) ) ) );
			float vrc_camera2672 = _VRChatCameraMode;
			float temp_output_8_0_g1260 = 1.0;
			float cvr_camera2670 = CVRRenderingCam;
			float temp_output_7_0_g1260 = cvr_camera2670;
			float lerpResult6_g1260 = lerp( 0.0 , 1.0 , ( step( temp_output_8_0_g1260 , temp_output_7_0_g1260 ) * step( temp_output_7_0_g1260 , temp_output_8_0_g1260 ) ));
			float Dont_Render_in_Social_VR_Camera_Result2686 = ( step( 1.0 , ( vrc_camera2672 + lerpResult6_g1260 ) ) * _DontRenderInSocialVRCameras );
			float vrc_mirror2707 = _VRChatMirrorMode;
			float temp_output_8_0_g1300 = 2.0;
			float temp_output_7_0_g1300 = cvr_camera2670;
			float lerpResult6_g1300 = lerp( 0.0 , 1.0 , ( step( temp_output_8_0_g1300 , temp_output_7_0_g1300 ) * step( temp_output_7_0_g1300 , temp_output_8_0_g1300 ) ));
			float Dont_Render_in_Social_VR_Mirror_Result2704 = ( step( 1.0 , ( vrc_mirror2707 + lerpResult6_g1300 ) ) * _DontRenderinSocialVRMirrors );
			float3 temp_cast_0 = (( 0.0 / 0.0 )).xxx;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 Vertex_Position2663 = ase_vertex3Pos;
			float3 Discard_Vertex2662 = ( saturate( ( UVTileDiscard192 + Dont_Render_in_Social_VR_Camera_Result2686 + Dont_Render_in_Social_VR_Mirror_Result2704 + _UDIMDiscardAll ) ) == 1.0 ? temp_cast_0 : Vertex_Position2663 );
			v.vertex.xyz = Discard_Vertex2662;
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
			float3 ase_worldPos = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 normalMap1002 = UnpackNormal( tex2D( _BumpMap, uv_BumpMap ) );
			float3 temp_output_11_0_g1907 = normalMap1002;
			float3 temp_output_2_0_g1910 = temp_output_11_0_g1907;
			float dotResult3_g1912 = dot( ase_worldlightDir , (WorldNormalVector( i , temp_output_2_0_g1910 )) );
			float temp_output_5_0_g1911 = _WrappedShadingValue;
			float temp_output_15_0_g1910 = saturate( saturate( ase_lightAtten ) );
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float4 temp_output_43_0_g1910 = saturate( ase_lightColor );
			float4 temp_output_23_0_g1910 = saturate( ( temp_output_43_0_g1910 * temp_output_15_0_g1910 ) );
			float4 temp_output_78_0_g1910 = saturate( temp_output_43_0_g1910 );
			float4 temp_cast_16 = (_RealtimeLightMin).xxxx;
			float4 clampResult66_g1910 = clamp( temp_output_23_0_g1910 , ( temp_output_78_0_g1910 - temp_cast_16 ) , ( temp_output_78_0_g1910 + _RealtimeLightMax ) );
			float4 lerpResult72_g1910 = lerp( temp_output_23_0_g1910 , clampResult66_g1910 , _ClampRealtimeLighting);
			float3 temp_output_1_0_g1913 = temp_output_2_0_g1910;
			UnityGI gi2_g1913 = gi;
			float3 diffNorm2_g1913 = normalize( WorldNormalVector( i , temp_output_1_0_g1913 ) );
			gi2_g1913 = UnityGI_Base( data, 1, diffNorm2_g1913 );
			float3 indirectDiffuse2_g1913 = gi2_g1913.indirect.diffuse + diffNorm2_g1913 * 0.0001;
			float3 normalizeResult52_g1913 = normalize( (WorldNormalVector( i , temp_output_1_0_g1913 )) );
			float3 worldNormal2_g1916 = normalizeResult52_g1913;
			float localLightVolumeSH1_g1915 = ( 0.0 );
			float3 temp_output_6_0_g1915 = ase_worldPos;
			float3 worldPos1_g1915 = temp_output_6_0_g1915;
			float3 L01_g1915 = float3( 0,0,0 );
			float3 L1r1_g1915 = float3( 0,0,0 );
			float3 L1g1_g1915 = float3( 0,0,0 );
			float3 L1b1_g1915 = float3( 0,0,0 );
			float3 temp_output_17_0_g1915 = float3( 0,0,0 );
			float3 worldPosOffset1_g1915 = temp_output_17_0_g1915;
			LightVolumeSH( worldPos1_g1915 , L01_g1915 , L1r1_g1915 , L1g1_g1915 , L1b1_g1915 , worldPosOffset1_g1915 );
			float3 L02_g1916 = L01_g1915;
			float3 L1r2_g1916 = L1r1_g1915;
			float3 L1g2_g1916 = L1g1_g1915;
			float3 L1b2_g1916 = L1b1_g1915;
			float3 localLightVolumeEvaluate2_g1916 = LightVolumeEvaluate( worldNormal2_g1916 , L02_g1916 , L1r2_g1916 , L1g2_g1916 , L1b2_g1916 );
			float localLightVolumesEnabled2_g1917 = LightVolumesEnabled(  );
			float3 lerpResult50_g1913 = lerp( indirectDiffuse2_g1913 , localLightVolumeEvaluate2_g1916 , localLightVolumesEnabled2_g1917);
			float3 temp_output_34_0_g1913 = saturate( lerpResult50_g1913 );
			float4 appendResult6_g1913 = (float4(( temp_output_1_0_g1913 * 0.3 ) , 1.0));
			float4 Normal7_g1913 = appendResult6_g1913;
			float3 localShadeSH97_g1913 = ShadeSH97_g1913( Normal7_g1913 );
			float temp_output_9_0_g1913 = _IndirectDiffuseOffset;
			float3 temp_cast_18 = (temp_output_9_0_g1913).xxx;
			float3 temp_output_15_0_g1913 = saturate( ( localShadeSH97_g1913 - temp_cast_18 ) );
			float temp_output_8_0_g1914 = 1.0;
			float temp_output_7_0_g1914 = _IndirLightUseMinforMax;
			float lerpResult6_g1914 = lerp( _IndirectDiffuseOffsetMax , temp_output_9_0_g1913 , ( step( temp_output_8_0_g1914 , temp_output_7_0_g1914 ) * step( temp_output_7_0_g1914 , temp_output_8_0_g1914 ) ));
			float temp_output_8_0_g1913 = lerpResult6_g1914;
			float3 temp_output_16_0_g1913 = saturate( ( localShadeSH97_g1913 + temp_output_8_0_g1913 ) );
			float3 clampResult17_g1913 = clamp( temp_output_34_0_g1913 , temp_output_15_0_g1913 , temp_output_16_0_g1913 );
			float3 lerpResult20_g1913 = lerp( clampResult17_g1913 , (temp_output_15_0_g1913 + (temp_output_34_0_g1913 - float3( 0,0,0 )) * (temp_output_16_0_g1913 - temp_output_15_0_g1913) / (float3( 1,1,1 ) - float3( 0,0,0 ))) , _IndirectLimiterMode);
			float4 color4_g1910 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
			float4 temp_cast_20 = (1.0).xxxx;
			float4 temp_cast_21 = (_MinBrightness).xxxx;
			float4 color40_g1910 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 clampResult37_g1910 = clamp( saturate( ( saturate( ( saturate( exp2( ( ( dotResult3_g1912 + temp_output_5_0_g1911 ) / ( 1.0 + temp_output_5_0_g1911 ) ) ) ) + saturate( exp2( temp_output_15_0_g1910 ) ) ) ) * saturate( ( lerpResult72_g1910 + saturate( (saturate( ( exp2( saturate( ( float4( lerpResult20_g1913 , 0.0 ) * color4_g1910 ) ) ) - temp_cast_20 ) )*_WrapIndirScale + 0.0) ) ) ) ) ) , temp_cast_21 , color40_g1910 );
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 color8_g891 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float2 uv_AmbientOcclusion = i.uv_texcoord * _AmbientOcclusion_ST.xy + _AmbientOcclusion_ST.zw;
			float4 temp_output_3_0_g891 = ( 1.0 - ( ( 1.0 - tex2D( _AmbientOcclusion, uv_AmbientOcclusion ) ) * _AOStrength ) );
			float temp_output_9_0_g891 = _RealAO;
			float4 lerpResult5_g891 = lerp( color8_g891 , temp_output_3_0_g891 , temp_output_9_0_g891);
			float4 mainTex26 = ( tex2D( _MainTex, uv_MainTex ) * lerpResult5_g891 * _Color );
			float3 temp_output_1_0_g1908 = temp_output_11_0_g1907;
			float3 indirectNormal4_g1908 = normalize( WorldNormalVector( i , temp_output_1_0_g1908 ) );
			float2 uv_MetallicGlossMap = i.uv_texcoord * _MetallicGlossMap_ST.xy + _MetallicGlossMap_ST.zw;
			float4 tex2DNode1017 = tex2D( _MetallicGlossMap, uv_MetallicGlossMap );
			float lerpResult2713 = lerp( tex2DNode1017.a , tex2DNode1017.g , _SmoothnessChannel);
			float _Smoothness2711 = ( lerpResult2713 * _SmoothnessStrength );
			float temp_output_5_0_g1908 = _Smoothness2711;
			Unity_GlossyEnvironmentData g4_g1908 = UnityGlossyEnvironmentSetup( temp_output_5_0_g1908, data.worldViewDir, indirectNormal4_g1908, float3(0,0,0));
			float3 indirectSpecular4_g1908 = UnityGI_IndirectSpecular( data, 1.0, indirectNormal4_g1908, g4_g1908 );
			float4 FallbackReflections2844 = texCUBElod( _FallbackReflection, float4( normalize( WorldReflectionVector( i , normalMap1002 ) ), ( floor( log2( max( _FallbackReflection_TexelSize.z , _FallbackReflection_TexelSize.w ) ) ) * ( 1.0 - _Smoothness2711 ) )) );
			float3 refDir59_g1908 = normalize( WorldReflectionVector( i , temp_output_1_0_g1908 ) );
			float4 localunitysampletexcubelodexpression59_g1908 = unitysampletexcubelodexpression59_g1908( refDir59_g1908 );
			float A1_g1909 = ( localunitysampletexcubelodexpression59_g1908.w == 0.0 ? 1.0 : 0.0 );
			float4 localunity_SpecCube0_HDRexpression60_g1908 = unity_SpecCube0_HDRexpression60_g1908();
			float B1_g1909 = ( localunity_SpecCube0_HDRexpression60_g1908.w == 0.0 ? 1.0 : 0.0 );
			float localAND1_g1909 = AND1_g1909( A1_g1909 , B1_g1909 );
			float temp_output_67_0_g1908 = localAND1_g1909;
			float4 lerpResult53_g1908 = lerp( float4( indirectSpecular4_g1908 , 0.0 ) , FallbackReflections2844 , saturate( ( temp_output_67_0_g1908 + _ForceFallbackReflections ) ));
			float _Metalic2710 = ( _MetallicStrength * tex2DNode1017.r );
			float temp_output_10_0_g1908 = _Metalic2710;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float fresnelNdotV22_g1908 = dot( ase_normWorldNormal, ase_worldViewDir );
			float fresnelNode22_g1908 = ( temp_output_10_0_g1908 + ( temp_output_5_0_g1908 * 1.0 ) * pow( max( 1.0 - fresnelNdotV22_g1908 , 0.0001 ), 1.0 ) );
			float lerpResult35_g1908 = lerp( temp_output_10_0_g1908 , ( temp_output_5_0_g1908 * saturate( fresnelNode22_g1908 ) ) , _MetallicReflectionMode);
			float4 lerpResult21_g1908 = lerp( mainTex26 , lerpResult53_g1908 , lerpResult35_g1908);
			float4 Lighting_Wrapped1144 = ( clampResult37_g1910 * lerpResult21_g1908 );
			c.rgb = Lighting_Wrapped1144.rgb;
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
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 color8_g891 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float2 uv_AmbientOcclusion = i.uv_texcoord * _AmbientOcclusion_ST.xy + _AmbientOcclusion_ST.zw;
			float4 temp_output_3_0_g891 = ( 1.0 - ( ( 1.0 - tex2D( _AmbientOcclusion, uv_AmbientOcclusion ) ) * _AOStrength ) );
			float temp_output_9_0_g891 = _RealAO;
			float4 lerpResult5_g891 = lerp( color8_g891 , temp_output_3_0_g891 , temp_output_9_0_g891);
			float4 mainTex26 = ( tex2D( _MainTex, uv_MainTex ) * lerpResult5_g891 * _Color );
			o.Albedo = mainTex26.rgb;
			float2 uv_AL_Mask = i.uv_texcoord * _AL_Mask_ST.xy + _AL_Mask_ST.zw;
			float4 ALMask39 = tex2D( _AL_Mask, uv_AL_Mask );
			float4 temp_output_51_0_g1885 = ALMask39;
			float4 color42 = IsGammaSpace() ? float4(1,0,0,1) : float4(1,0,0,1);
			float3 hsvTorgb4_g1903 = RGBToHSV( color42.rgb );
			float mulTime48 = _Time.y * _ALTimeScale;
			float Time50 = frac( mulTime48 );
			float temp_output_54_0_g1885 = Time50;
			float3 hsvTorgb8_g1903 = HSVToRGB( float3(( hsvTorgb4_g1903.x + temp_output_54_0_g1885 ),( hsvTorgb4_g1903.y + 0.0 ),( hsvTorgb4_g1903.z + 0.0 )) );
			float3 temp_output_5_0_g1902 = saturate( hsvTorgb8_g1903 );
			int Band3_g1904 = 0;
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
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 appendResult18_g885 = (float2(ase_screenPosNorm.x , ase_screenPosNorm.y));
			float temp_output_8_0_g890 = 8.0;
			float temp_output_7_0_g890 = temp_output_32_0_g885;
			float2 lerpResult6_g890 = lerp( float2( 0,0 ) , appendResult18_g885 , ( step( temp_output_8_0_g890 , temp_output_7_0_g890 ) * step( temp_output_7_0_g890 , temp_output_8_0_g890 ) ));
			float2 DelayUV2355 = ( lerpResult6_g888 + lerpResult6_g886 + lerpResult6_g887 + lerpResult6_g889 + lerpResult6_g890 );
			float3 hsvTorgb2458 = RGBToHSV( tex2D( _ALDelayMap, DelayUV2355 ).rgb );
			float clampResult987 = clamp( (0.0 + (hsvTorgb2458.z - 0.0) * (_ALUVDelayMaxDelay - 0.0) / (1.0 - 0.0)) , 0.0 , 127.0 );
			float in_ALDelay991 = round( clampResult987 );
			int temp_output_55_0_g1885 = (int)in_ALDelay991;
			int Delay3_g1904 = temp_output_55_0_g1885;
			float localAudioLinkData3_g1904 = AudioLinkData3_g1904( Band3_g1904 , Delay3_g1904 );
			float temp_output_8_0_g1905 = 1.0;
			float localIfAudioLinkv2Exists1_g1906 = IfAudioLinkv2Exists1_g1906();
			float temp_output_7_0_g1905 = saturate( ( localIfAudioLinkv2Exists1_g1906 + 1.0 ) );
			float3 lerpResult6_g1905 = lerp( temp_output_5_0_g1902 , ( temp_output_5_0_g1902 * localAudioLinkData3_g1904 ) , ( step( temp_output_8_0_g1905 , temp_output_7_0_g1905 ) * step( temp_output_7_0_g1905 , temp_output_8_0_g1905 ) ));
			float4 color44 = IsGammaSpace() ? float4(0,0.8196079,0,1) : float4(0,0.637597,0,1);
			float3 hsvTorgb4_g1887 = RGBToHSV( color44.rgb );
			float3 hsvTorgb8_g1887 = HSVToRGB( float3(( hsvTorgb4_g1887.x + temp_output_54_0_g1885 ),( hsvTorgb4_g1887.y + 0.0 ),( hsvTorgb4_g1887.z + 0.0 )) );
			float3 temp_output_5_0_g1886 = saturate( hsvTorgb8_g1887 );
			int Band3_g1888 = 2;
			int Delay3_g1888 = temp_output_55_0_g1885;
			float localAudioLinkData3_g1888 = AudioLinkData3_g1888( Band3_g1888 , Delay3_g1888 );
			float temp_output_8_0_g1889 = 1.0;
			float localIfAudioLinkv2Exists1_g1890 = IfAudioLinkv2Exists1_g1890();
			float temp_output_7_0_g1889 = saturate( ( localIfAudioLinkv2Exists1_g1890 + 0.0 ) );
			float3 lerpResult6_g1889 = lerp( temp_output_5_0_g1886 , ( temp_output_5_0_g1886 * localAudioLinkData3_g1888 ) , ( step( temp_output_8_0_g1889 , temp_output_7_0_g1889 ) * step( temp_output_7_0_g1889 , temp_output_8_0_g1889 ) ));
			float4 color43 = IsGammaSpace() ? float4(1,0.9294118,0,1) : float4(1,0.8468735,0,1);
			float3 hsvTorgb4_g1892 = RGBToHSV( color43.rgb );
			float3 hsvTorgb8_g1892 = HSVToRGB( float3(( hsvTorgb4_g1892.x + temp_output_54_0_g1885 ),( hsvTorgb4_g1892.y + 0.0 ),( hsvTorgb4_g1892.z + 0.0 )) );
			float3 temp_output_5_0_g1891 = saturate( hsvTorgb8_g1892 );
			int Band3_g1893 = 1;
			int Delay3_g1893 = temp_output_55_0_g1885;
			float localAudioLinkData3_g1893 = AudioLinkData3_g1893( Band3_g1893 , Delay3_g1893 );
			float temp_output_8_0_g1894 = 1.0;
			float localIfAudioLinkv2Exists1_g1895 = IfAudioLinkv2Exists1_g1895();
			float temp_output_7_0_g1894 = saturate( ( localIfAudioLinkv2Exists1_g1895 + 0.0 ) );
			float3 lerpResult6_g1894 = lerp( temp_output_5_0_g1891 , ( temp_output_5_0_g1891 * localAudioLinkData3_g1893 ) , ( step( temp_output_8_0_g1894 , temp_output_7_0_g1894 ) * step( temp_output_7_0_g1894 , temp_output_8_0_g1894 ) ));
			float4 color45 = IsGammaSpace() ? float4(0,0,1,1) : float4(0,0,1,1);
			float3 hsvTorgb4_g1897 = RGBToHSV( color45.rgb );
			float3 hsvTorgb8_g1897 = HSVToRGB( float3(( hsvTorgb4_g1897.x + temp_output_54_0_g1885 ),( hsvTorgb4_g1897.y + 0.0 ),( hsvTorgb4_g1897.z + 0.0 )) );
			float3 temp_output_5_0_g1896 = saturate( hsvTorgb8_g1897 );
			int Band3_g1898 = 3;
			int Delay3_g1898 = temp_output_55_0_g1885;
			float localAudioLinkData3_g1898 = AudioLinkData3_g1898( Band3_g1898 , Delay3_g1898 );
			float temp_output_8_0_g1899 = 1.0;
			float localIfAudioLinkv2Exists1_g1900 = IfAudioLinkv2Exists1_g1900();
			float temp_output_7_0_g1899 = saturate( ( localIfAudioLinkv2Exists1_g1900 + 0.0 ) );
			float3 lerpResult6_g1899 = lerp( temp_output_5_0_g1896 , ( temp_output_5_0_g1896 * localAudioLinkData3_g1898 ) , ( step( temp_output_8_0_g1899 , temp_output_7_0_g1899 ) * step( temp_output_7_0_g1899 , temp_output_8_0_g1899 ) ));
			float localIfAudioLinkv2Exists1_g1901 = IfAudioLinkv2Exists1_g1901();
			float4 AL_Final85 = ( ( _EnableAudioLink * ( ( temp_output_51_0_g1885 * float4( lerpResult6_g1905 , 0.0 ) ) + ( temp_output_51_0_g1885 * float4( lerpResult6_g1889 , 0.0 ) ) + ( temp_output_51_0_g1885 * float4( lerpResult6_g1894 , 0.0 ) ) + ( temp_output_51_0_g1885 * float4( lerpResult6_g1899 , 0.0 ) ) ) ) * saturate( ( localIfAudioLinkv2Exists1_g1901 + _ALEmitifInactive ) ) );
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 Emission119 = ( tex2D( _Emission, uv_Emission ) * _EmissionColor );
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 normalMap1002 = UnpackNormal( tex2D( _BumpMap, uv_BumpMap ) );
			float fresnelNdotV9_g1884 = dot( (WorldNormalVector( i , normalMap1002 )), ase_worldViewDir );
			float fresnelNode9_g1884 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV9_g1884, _RimPower ) );
			float4 lerpResult14_g1884 = lerp( float4( 1,1,1,0 ) , mainTex26 , _RimBaseColorStrength);
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float3 hsvTorgb3_g1884 = RGBToHSV( ase_lightColor.rgb );
			float3 temp_output_11_0_g1907 = normalMap1002;
			float3 temp_output_2_0_g1910 = temp_output_11_0_g1907;
			float3 temp_output_1_0_g1913 = temp_output_2_0_g1910;
			float4 appendResult6_g1913 = (float4(( temp_output_1_0_g1913 * 0.3 ) , 1.0));
			float4 Normal7_g1913 = appendResult6_g1913;
			float3 localShadeSH97_g1913 = ShadeSH97_g1913( Normal7_g1913 );
			float temp_output_9_0_g1913 = _IndirectDiffuseOffset;
			float temp_output_8_0_g1914 = 1.0;
			float temp_output_7_0_g1914 = _IndirLightUseMinforMax;
			float lerpResult6_g1914 = lerp( _IndirectDiffuseOffsetMax , temp_output_9_0_g1913 , ( step( temp_output_8_0_g1914 , temp_output_7_0_g1914 ) * step( temp_output_7_0_g1914 , temp_output_8_0_g1914 ) ));
			float temp_output_8_0_g1913 = lerpResult6_g1914;
			float3 temp_output_16_0_g1913 = saturate( ( localShadeSH97_g1913 + temp_output_8_0_g1913 ) );
			float3 maxIndirLight2618 = temp_output_16_0_g1913;
			float3 hsvTorgb24_g1884 = RGBToHSV( maxIndirLight2618 );
			float4 Rim116 = ( _EnableRimLighting * ( ( ( fresnelNode9_g1884 * _RimEnergy ) * lerpResult14_g1884 ) * max( ( 0.0 * saturate( ( exp( hsvTorgb3_g1884.z ) - 1.0 ) ) ) , hsvTorgb24_g1884.z ) ) );
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
				surfIN.worldRefl = -worldViewDir;
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				surfIN.screenPos = IN.screenPos;
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
	Fallback "Standard"
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
}
/*ASEBEGIN
Version=19303
Node;AmplifyShaderEditor.CommentaryNode;2709;-3327.804,-2011.94;Inherit;False;1303.948;440.3767;Comment;9;2710;2711;2713;1017;2714;2949;2950;2951;2952;Metallic and Smoothness;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2840;-2112,784;Inherit;False;2134.878;650.9312;This is here instead of inside the Amplify Function because ASE will not let me use a Texture Object for this. Quite Annoyed;12;2942;2941;2836;2844;2837;2838;2937;2943;2944;2946;2947;2948;Fallback Reflections;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2714;-3296,-1728;Inherit;False;Property;_SmoothnessChannel;Smoothness Channel;20;1;[Enum];Create;False;0;2;Alpha;0;Green;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1017;-3312,-1936;Inherit;True;Property;_MetallicGlossMap;Metallic Smoothness;19;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;2333;-2064,-2752;Inherit;False;673.8176;177.324;Selection of UV Maps to Use for UV Tile Discarding;3;2355;2627;2357;Audio Link Delay UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-1072,-1328;Inherit;False;859.9141;343.3768;Comment;3;34;1002;1006;Normal Map;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;2713;-2960,-1824;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2937;-1888,864;Inherit;True;Property;_FallbackReflection;Fallback Reflection;24;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;d4a1e20cc62b8e7449d3fd72491a6d2b;d4a1e20cc62b8e7449d3fd72491a6d2b;False;black;LockedToCube;Cube;-1;0;2;SAMPLERCUBE;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;2949;-2784,-1680;Inherit;False;Property;_SmoothnessStrength;Smoothness Strength;22;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2357;-2032,-2688;Inherit;False;Property;_ALDelayUVMap;AL Delay UV Map;33;2;[Header];[Enum];Create;True;0;5;UV0;0;UV1;1;UV2;2;UV3;3;Screen Space;8;0;True;0;False;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;1006;-1008,-1216;Inherit;True;Property;_BumpMap;Normal Map;6;1;[SingleLineTexture];Create;False;0;0;0;True;0;False;None;None;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2950;-2496,-1744;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexelSizeNode;2941;-1600,832;Inherit;False;-1;1;0;SAMPLERCUBE;;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;2627;-1824,-2688;Inherit;False;VVGetTextureUV;-1;;885;c300954d56021714fb5c622c8f34ec06;0;1;32;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;34;-736,-1216;Inherit;True;Property;_NMSample;NM Sample;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;2711;-2291.804,-1819.94;Inherit;False;_Smoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;2942;-1312,880;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;27;-2064,-3536;Inherit;False;1084.464;673.0301;Comment;11;2630;2546;2307;26;1003;2629;25;2552;2540;2542;1047;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;977;-272,-3248;Inherit;False;1452.845;376.6802;Comment;8;991;985;987;979;993;2458;2457;2363;AudioLink Delay Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2355;-1616,-2688;Inherit;False;DelayUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1002;-416,-1200;Inherit;False;normalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Log2OpNode;2943;-1168,896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2947;-1264,1184;Inherit;False;2711;_Smoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2363;-240,-3152;Inherit;False;2355;DelayUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2542;-2000,-3280;Inherit;False;Property;_AOStrength;AO Strength;27;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2540;-2032,-3216;Inherit;True;Property;_AmbientOcclusion;Ambient Occlusion;26;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2552;-1872,-3040;Inherit;False;Property;_RealAO;Real AO;28;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;1003;-2000,-3472;Inherit;True;Property;_MainTex;Albedo;4;1;[SingleLineTexture];Create;False;1;Standard Fallbacks;0;0;True;0;False;8c4ab964c9c0603409d9ddb3762defa6;8c4ab964c9c0603409d9ddb3762defa6;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.CommentaryNode;2679;3296,1920;Inherit;False;564.665;432.8813;Comment;6;2672;2670;2671;2668;2706;2707;Camera Globals;1,1,1,1;0;0
Node;AmplifyShaderEditor.FloorOpNode;2944;-1040,896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2838;-2080,1088;Inherit;False;1002;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;2948;-1006.712,1312.68;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2457;-32,-3168;Inherit;True;Property;_ALDelayMap;AudioLink Delay Tex Map;32;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;2307;-1616,-3056;Inherit;False;Property;_Color;Color;5;0;Create;False;0;0;0;True;0;False;1,1,1,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;2630;-1728,-3200;Inherit;False;VVAmbientOcclusion;-1;;891;9931be4718b157b4ebb46a99812bfe31;0;3;6;FLOAT;0;False;7;COLOR;0,0,0,0;False;9;FLOAT;0;False;2;COLOR;11;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2668;3344,1984;Inherit;False;Global;CVRRenderingCam;CVRRenderingCam;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;25;-1712,-3472;Inherit;True;Property;_AlbedoSample;Albedo Sample;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldReflectionVector;2837;-1872,1072;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2946;-832,1152;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2951;-3024,-1952;Inherit;False;Property;_MetallicStrength;Metallic Strength;21;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;72;1440,-3088;Inherit;False;765.7347;170.1592;Comment;4;243;50;49;48;Time;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;979;160,-2976;Inherit;False;Property;_ALUVDelayMaxDelay;AL UV Delay Max Delay;34;0;Create;True;0;0;0;False;0;False;0;127;0;127;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;2458;256,-3168;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2629;-1360,-3312;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;2685;3312,736;Inherit;False;1222.874;463.641;Comment;11;2669;2686;2678;2676;2677;2675;2673;2682;2684;2683;2674;Disable Rendering in Social VR Cameras;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;201;-2064,-2464;Inherit;False;668.8916;177.8153;Selection of UV Maps to Use for UV Tile Discarding;3;2313;200;2626;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2693;3312,1328;Inherit;False;1226.13;481.8655;Comment;12;2702;2704;2703;2701;2700;2699;2694;2705;2696;2695;2698;2697;Disable Rendering in Social VR Mirrors;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2671;3344,2080;Inherit;False;Global;_VRChatCameraMode;_VRChatCameraMode;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2670;3552,1984;Inherit;False;cvr camera;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2706;3344,2176;Inherit;False;Global;_VRChatMirrorMode;_VRChatMirrorMode;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2952;-2512,-1952;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2836;-624,1056;Inherit;True;Property;_FallbackReflectionA;Fallback ReflectionA;23;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;74d77ebd39499c3419c52d85e0715da0;74d77ebd39499c3419c52d85e0715da0;True;0;False;black;LockedToCube;False;Object;-1;MipLevel;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;993;496,-3184;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;127;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;243;1472,-3040;Inherit;False;Property;_ALTimeScale;AL HueShift Time Scale;35;0;Create;False;0;0;0;False;0;False;0;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;2602;-1992.124,-896;Inherit;False;1364.542;1343.179;Comment;19;2842;2732;2723;2727;2726;2556;2414;2392;1144;2618;2584;2583;2589;2291;2582;2375;1207;2415;2845;Shading;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;26;-1200,-3312;Inherit;False;mainTex;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2313;-2016,-2400;Inherit;False;Property;_DiscardUVMap;Discard UV Map;40;2;[Header];[Enum];Create;True;1;UV Tile Discarding;4;UV0;0;UV1;1;UV2;2;UV3;3;0;True;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2674;3360,880;Inherit;False;2670;cvr camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2683;3360,960;Inherit;False;Constant;_Float14;Float 14;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2684;3360,1040;Inherit;False;Constant;_Float15;Float 15;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2695;3344,1616;Inherit;False;Constant;_Float18;Float 14;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2696;3344,1696;Inherit;False;Constant;_Float19;Float 15;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2705;3344,1536;Inherit;False;Constant;_Float21;Float 21;48;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2694;3360,1456;Inherit;False;2670;cvr camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2672;3584,2080;Inherit;False;vrc camera;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2707;3584,2176;Inherit;False;vrc mirror;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2710;-2291.804,-1883.94;Inherit;False;_Metalic;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2844;-320,1056;Inherit;False;FallbackReflections;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;38;16,-2656;Inherit;False;604.8932;280;Comment;2;40;39;AL Emission Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;987;672,-3184;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;127;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;48;1712,-3040;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2626;-1840,-2400;Inherit;False;VVGetVertexUV;-1;;1221;b2c6b9b1b245cf54ca03e50557eebb87;0;1;26;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;2682;3552,944;Inherit;False;If Float Equal;-1;;1260;bdca1c28487c8a1418e72579bec63589;0;4;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2673;3568,848;Inherit;False;2672;vrc camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2697;3552,1536;Inherit;False;If Float Equal;-1;;1300;bdca1c28487c8a1418e72579bec63589;0;4;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2698;3568,1440;Inherit;False;2707;vrc mirror;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2415;-1776,-368;Inherit;False;Property;_IndirLightUseMinforMax;Use Min for Max;12;1;[ToggleUI];Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1207;-1840,-240;Inherit;False;Property;_WrappedShadingValue;Wrapped Shading Value;17;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2375;-1872,-112;Inherit;False;Property;_MinBrightness;Min Brightness;9;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2582;-1776,-48;Inherit;False;1002;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2291;-1808,-176;Inherit;False;Property;_WrapIndirScale;Indirect Light Scale;18;0;Create;False;0;0;0;False;0;False;3;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2589;-1776,144;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2584;-1776,80;Inherit;False;2710;_Metalic;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2392;-1872,-496;Inherit;False;Property;_IndirectDiffuseOffset;Indirect Light Min;10;0;Create;False;0;0;0;False;0;False;1;0.04;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2414;-1872,-432;Inherit;False;Property;_IndirectDiffuseOffsetMax;Indirect Light Max;11;0;Create;False;0;0;0;False;0;False;0;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2556;-1840,-304;Inherit;False;Property;_IndirectLimiterMode;Indirect Limiter Mode;16;1;[Enum];Create;True;0;2;Clamp;0;Remap;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2726;-1872,-688;Inherit;False;Property;_RealtimeLightMin;Relative Real Light Min;15;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2727;-1872,-624;Inherit;False;Property;_RealtimeLightMax;Relative Real Light Max;14;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2723;-1904,-560;Inherit;False;Property;_ClampRealtimeLighting;Relative Clamp Realtime Lighting;13;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2732;-1904,-752;Inherit;False;Property;_MetallicReflectionMode;Fresnel Metallics (Experimental);23;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2845;-1840,208;Inherit;False;2844;FallbackReflections;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2583;-1808,16;Inherit;False;2711;_Smoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2842;-1840,-816;Inherit;False;Property;_ForceFallbackReflections;Force Fallback Reflections;25;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;49;1872,-3040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RoundOpNode;985;800,-3184;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;40;80,-2608;Inherit;True;Property;_AL_Mask;AudioLink Mask;31;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;138;1760,-1216;Inherit;False;1050.305;1191.881;Comment;19;192;198;774;775;776;777;773;772;771;770;768;767;766;765;764;763;762;270;2822;UV Tile Discard;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;200;-1632,-2400;Inherit;False;DiscardUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2675;3744,880;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2677;3744,784;Inherit;False;Constant;_Float12;Float 12;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2699;3744,1472;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2700;3744,1376;Inherit;False;Constant;_Float20;Float 12;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2955;-1328,-640;Inherit;True;VivikaShading;0;;1907;efce34b3f4a0e2b44933c4737d48061f;0;17;87;FLOAT;0;False;54;FLOAT;0;False;51;FLOAT;0;False;52;FLOAT;0;False;48;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;3;False;9;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT3;0,0,0;False;12;FLOAT;0;False;13;FLOAT;0;False;18;COLOR;0,0,0,0;False;84;COLOR;0,0,0,0;False;2;FLOAT3;32;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1;32,-1120;Inherit;False;1041.734;585.5447;Comment;9;116;2620;2621;333;2505;1404;12;87;113;Rim;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;117;16,-2288;Inherit;False;907.3133;529.2772;Comment;4;1005;119;121;118;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;107;-1328,-2656;Inherit;False;1185.214;1096.479;Comment;10;85;42;44;43;45;415;2614;995;51;75;AudioLink Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;991;944,-3168;Inherit;False;in_ALDelay;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;50;1984,-3040;Inherit;False;Time;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;400,-2608;Inherit;False;ALMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2618;-896,-688;Inherit;False;maxIndirLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StepOpNode;2676;3904,832;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2669;3552,1104;Inherit;False;Property;_DontRenderInSocialVRCameras;Don't Render in Social VR Cameras;59;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;2701;3904,1424;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2702;3552,1696;Inherit;False;Property;_DontRenderinSocialVRMirrors;Don't Render in Social VR Mirrors;60;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;198;1888,-144;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;270;1792,-1168;Inherit;False;Property;_UDIMDiscardRow0_0;Discard UV Row 0,0;41;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;762;1792,-1104;Inherit;False;Property;_UDIMDiscardRow1_0;Discard UV Row 1,0;42;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;763;1792,-1040;Inherit;False;Property;_UDIMDiscardRow2_0;Discard UV Row 2,0;43;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;764;1792,-976;Inherit;False;Property;_UDIMDiscardRow3_0;Discard UV Row 3,0;44;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;765;1792,-912;Inherit;False;Property;_UDIMDiscardRow0_1;Discard UV Row 0,1;45;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;766;1792,-848;Inherit;False;Property;_UDIMDiscardRow1_1;Discard UV Row 1,1;46;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;767;1792,-784;Inherit;False;Property;_UDIMDiscardRow2_1;Discard UV Row 2,1;47;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;768;1792,-720;Inherit;False;Property;_UDIMDiscardRow3_1;Discard UV Row 3,1;48;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;770;1792,-656;Inherit;False;Property;_UDIMDiscardRow0_2;Discard UV Row 0,2;49;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;771;1792,-592;Inherit;False;Property;_UDIMDiscardRow1_2;Discard UV Row 1,2;50;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;772;1792,-528;Inherit;False;Property;_UDIMDiscardRow2_2;Discard UV Row 2,2;51;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;773;1792,-464;Inherit;False;Property;_UDIMDiscardRow3_2;Discard UV Row 3,2;52;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;774;1792,-400;Inherit;False;Property;_UDIMDiscardRow0_3;Discard UV Row 0,3;53;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;775;1792,-336;Inherit;False;Property;_UDIMDiscardRow1_3;Discard UV Row 1,3;54;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;776;1792,-272;Inherit;False;Property;_UDIMDiscardRow2_3;Discard UV Tile 2,3;55;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;777;1792,-208;Inherit;False;Property;_UDIMDiscardRow3_3;Discard UV Row 3,3;56;1;[ToggleUI];Create;False;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;75;-944,-1920;Inherit;False;39;ALMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;51;-1168,-1936;Inherit;False;50;Time;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;995;-1168,-1872;Inherit;False;991;in_ALDelay;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2614;-1200,-1744;Inherit;False;Property;_ALEmitifInactive;AL Emit if Inactive;30;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;415;-1264,-1808;Half;False;Property;_EnableAudioLink;Enable AudioLink;29;2;[Header];[ToggleUI];Create;True;1;AudioLink;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;45;-1200,-2096;Inherit;False;Constant;_AL_Treble;AL_Treble;6;0;Create;True;0;0;0;False;0;False;0,0,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;43;-1200,-2256;Inherit;False;Constant;_AL_LowMid;AL_LowMid;6;0;Create;True;0;0;0;False;0;False;1,0.9294118,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;44;-1200,-2416;Inherit;False;Constant;_AL_HighMid;AL_HighMid;6;0;Create;True;0;0;0;False;0;False;0,0.8196079,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;113;96,-848;Inherit;False;Property;_RimBaseColorStrength;Rim Base Color Strength;39;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;87;96,-912;Inherit;False;Property;_RimEnergy;Rim Energy;38;0;Create;True;0;0;0;False;0;False;0.345;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;96,-976;Float;False;Property;_RimPower;Rim Power;37;0;Create;True;0;0;0;False;0;False;2.07;1.86;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1404;192,-784;Inherit;False;1002;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2505;160,-720;Inherit;False;2618;maxIndirLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;333;96,-1040;Half;False;Property;_EnableRimLighting;Enable Rim Lighting;36;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2621;192,-656;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1005;128,-1952;Inherit;False;Property;_EmissionColor;Emission Color;8;0;Create;False;0;0;0;True;0;False;0,0,0,0;0,1,0.9604408,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;42;-1200,-2576;Inherit;False;Constant;_AL_Bass;AL_Bass;6;0;Create;True;0;0;0;False;0;False;1,0,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2678;4016,880;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2703;4016,1472;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;118;80,-2224;Inherit;True;Property;_Emission;Emission;7;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;2822;2272,-816;Inherit;False;VVUVTileDiscardFull;-1;;1867;37cd3007c1dbdac4b9341609f3fa3a5a;0;17;100;FLOAT;0;False;101;FLOAT;0;False;102;FLOAT;0;False;103;FLOAT;0;False;104;FLOAT;0;False;105;FLOAT;0;False;106;FLOAT;0;False;107;FLOAT;0;False;108;FLOAT;0;False;109;FLOAT;0;False;110;FLOAT;0;False;111;FLOAT;0;False;112;FLOAT;0;False;113;FLOAT;0;False;114;FLOAT;0;False;115;FLOAT;0;False;99;FLOAT2;0,0;False;1;FLOAT;116
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;121;432,-2144;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2620;496,-912;Inherit;False;Rim;-1;;1884;652e8c2aadb4b694999944f1079d1366;0;7;29;FLOAT;0;False;30;FLOAT;0;False;31;FLOAT;0;False;32;FLOAT;0;False;26;FLOAT3;0,0,0;False;27;FLOAT3;0,0,0;False;28;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;2665;3328,-416;Inherit;False;468;235;Comment;2;2663;2691;Vertex Position Results;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2666;3296,32;Inherit;False;1616.048;535.0431;Comment;12;2687;2654;2655;2661;2660;2658;2662;2657;2689;2708;2715;2716;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2686;4160,848;Inherit;False;Dont Render in Social VR Camera Result;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2704;4176,1440;Inherit;False;Dont Render in Social VR Mirror Result;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;192;2592,-800;Inherit;False;UVTileDiscard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2821;-720,-2336;Inherit;False;VVALCombine;-1;;1885;bceeba5c9c06c59459d6b7e4bf2084da;0;9;54;FLOAT;0;False;55;INT;0;False;25;COLOR;1,0,0,1;False;27;COLOR;1,0.9294118,0,1;False;26;COLOR;0,0.8196079,0,1;False;28;COLOR;0,0,1,1;False;51;COLOR;0,0,0,0;False;52;FLOAT;0;False;53;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;31;16,-1680;Inherit;False;798.6848;366.049;Comment;6;29;2539;30;86;28;122;Emission Combination;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;119;592,-2224;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;116;848,-912;Float;False;Rim;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PosVertexDataNode;2691;3360,-352;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;2687;3344,176;Inherit;False;2686;Dont Render in Social VR Camera Result;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2654;3472,96;Inherit;False;192;UVTileDiscard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2708;3344,256;Inherit;False;2704;Dont Render in Social VR Mirror Result;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2715;3456,384;Inherit;False;Property;_UDIMDiscardAll;Discard All;57;1;[ToggleUI];Create;False;1;The Following Setting Completely Disables Rendering whatever is using this material. This works similarly to UV Tile Discarding.;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;85;-400,-2288;Inherit;False;AL_Final;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;122;48,-1520;Inherit;False;119;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;28;32,-1440;Inherit;False;116;Rim;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;86;32,-1616;Inherit;False;85;AL_Final;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2661;3792,368;Inherit;False;Constant;_Float11;Float 11;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2655;3728,160;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2663;3584,-368;Inherit;False;Vertex Position;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;240,-1536;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2658;3936,240;Inherit;False;Constant;_Float5;Float 5;46;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2660;3968,336;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2689;3872,480;Inherit;False;2663;Vertex Position;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;2716;3920,128;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2539;448,-1536;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;2657;4160,176;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;220;1248,-2688;Inherit;False;962.8354;715.8684;Comment;5;0;33;32;193;332;Output;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;217;1840,-1792;Inherit;False;420.8079;185;Comment;2;219;218;Declare NaN;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;29;592,-1536;Inherit;False;EmissionFinal;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;2641;-688.6962,-4043.483;Inherit;False;324;355;Comment;1;2642;Fallbacks;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1144;-896,-576;Inherit;False;Lighting Wrapped;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2662;4448,224;Inherit;False;Discard Vertex;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;218;1888,-1744;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;219;2048,-1744;Inherit;False;NaN;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2546;-1312,-3088;Inherit;False;ao_times_strength;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1047;-1232,-3456;Inherit;False;Property;_CullMode;Cull Mode;3;1;[Enum];Create;True;0;3;Off;0;Front;1;Back;2;0;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2642;-640.6962,-3979.483;Inherit;True;Property;_EmissionMap;Fallback Emission Map;58;1;[SingleLineTexture];Create;False;0;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;193;1552,-2176;Inherit;False;2662;Discard Vertex;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;32;1504,-2464;Inherit;False;29;EmissionFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;1488,-2640;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;332;1728,-2304;Inherit;False;1144;Lighting Wrapped;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1968,-2528;Float;False;True;-1;2;AmplifyShaderEditor.MaterialInspector;0;0;CustomLighting;VoyVivika/VivikaShader/Vivika Shader Opaque;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;5;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Absolute;0;Standard;-1;-1;-1;-1;1;VRCFallback=DoubleSided;False;0;0;True;_CullMode;-1;0;False;;1;Include;..\Libs\AudioLink\AudioLink.cginc;False;;Custom;False;0;0;;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2713;0;1017;4
WireConnection;2713;1;1017;2
WireConnection;2713;2;2714;0
WireConnection;2950;0;2713;0
WireConnection;2950;1;2949;0
WireConnection;2941;0;2937;0
WireConnection;2627;32;2357;0
WireConnection;34;0;1006;0
WireConnection;2711;0;2950;0
WireConnection;2942;0;2941;3
WireConnection;2942;1;2941;4
WireConnection;2355;0;2627;0
WireConnection;1002;0;34;0
WireConnection;2943;0;2942;0
WireConnection;2944;0;2943;0
WireConnection;2948;0;2947;0
WireConnection;2457;1;2363;0
WireConnection;2630;6;2542;0
WireConnection;2630;7;2540;0
WireConnection;2630;9;2552;0
WireConnection;25;0;1003;0
WireConnection;2837;0;2838;0
WireConnection;2946;0;2944;0
WireConnection;2946;1;2948;0
WireConnection;2458;0;2457;0
WireConnection;2629;0;25;0
WireConnection;2629;1;2630;11
WireConnection;2629;2;2307;0
WireConnection;2670;0;2668;0
WireConnection;2952;0;2951;0
WireConnection;2952;1;1017;1
WireConnection;2836;0;2937;0
WireConnection;2836;1;2837;0
WireConnection;2836;2;2946;0
WireConnection;993;0;2458;3
WireConnection;993;4;979;0
WireConnection;26;0;2629;0
WireConnection;2672;0;2671;0
WireConnection;2707;0;2706;0
WireConnection;2710;0;2952;0
WireConnection;2844;0;2836;0
WireConnection;987;0;993;0
WireConnection;48;0;243;0
WireConnection;2626;26;2313;0
WireConnection;2682;7;2674;0
WireConnection;2682;8;2683;0
WireConnection;2682;9;2683;0
WireConnection;2682;10;2684;0
WireConnection;2697;7;2694;0
WireConnection;2697;8;2705;0
WireConnection;2697;9;2695;0
WireConnection;2697;10;2696;0
WireConnection;49;0;48;0
WireConnection;985;0;987;0
WireConnection;200;0;2626;0
WireConnection;2675;0;2673;0
WireConnection;2675;1;2682;0
WireConnection;2699;0;2698;0
WireConnection;2699;1;2697;0
WireConnection;2955;87;2842;0
WireConnection;2955;54;2732;0
WireConnection;2955;51;2726;0
WireConnection;2955;52;2727;0
WireConnection;2955;48;2723;0
WireConnection;2955;4;2392;0
WireConnection;2955;5;2414;0
WireConnection;2955;6;2415;0
WireConnection;2955;7;2556;0
WireConnection;2955;8;1207;0
WireConnection;2955;9;2291;0
WireConnection;2955;10;2375;0
WireConnection;2955;11;2582;0
WireConnection;2955;12;2583;0
WireConnection;2955;13;2584;0
WireConnection;2955;18;2589;0
WireConnection;2955;84;2845;0
WireConnection;991;0;985;0
WireConnection;50;0;49;0
WireConnection;39;0;40;0
WireConnection;2618;0;2955;32
WireConnection;2676;0;2677;0
WireConnection;2676;1;2675;0
WireConnection;2701;0;2700;0
WireConnection;2701;1;2699;0
WireConnection;2678;0;2676;0
WireConnection;2678;1;2669;0
WireConnection;2703;0;2701;0
WireConnection;2703;1;2702;0
WireConnection;2822;100;270;0
WireConnection;2822;101;762;0
WireConnection;2822;102;763;0
WireConnection;2822;103;764;0
WireConnection;2822;104;765;0
WireConnection;2822;105;766;0
WireConnection;2822;106;767;0
WireConnection;2822;107;768;0
WireConnection;2822;108;770;0
WireConnection;2822;109;771;0
WireConnection;2822;110;772;0
WireConnection;2822;111;773;0
WireConnection;2822;112;774;0
WireConnection;2822;113;775;0
WireConnection;2822;114;776;0
WireConnection;2822;115;777;0
WireConnection;2822;99;198;0
WireConnection;121;0;118;0
WireConnection;121;1;1005;0
WireConnection;2620;29;333;0
WireConnection;2620;30;12;0
WireConnection;2620;31;87;0
WireConnection;2620;32;113;0
WireConnection;2620;26;1404;0
WireConnection;2620;27;2505;0
WireConnection;2620;28;2621;0
WireConnection;2686;0;2678;0
WireConnection;2704;0;2703;0
WireConnection;192;0;2822;116
WireConnection;2821;54;51;0
WireConnection;2821;55;995;0
WireConnection;2821;25;42;0
WireConnection;2821;27;43;0
WireConnection;2821;26;44;0
WireConnection;2821;28;45;0
WireConnection;2821;51;75;0
WireConnection;2821;52;415;0
WireConnection;2821;53;2614;0
WireConnection;119;0;121;0
WireConnection;116;0;2620;0
WireConnection;85;0;2821;0
WireConnection;2655;0;2654;0
WireConnection;2655;1;2687;0
WireConnection;2655;2;2708;0
WireConnection;2655;3;2715;0
WireConnection;2663;0;2691;0
WireConnection;30;0;86;0
WireConnection;30;1;122;0
WireConnection;30;2;28;0
WireConnection;2660;0;2661;0
WireConnection;2660;1;2661;0
WireConnection;2716;0;2655;0
WireConnection;2539;0;30;0
WireConnection;2657;0;2716;0
WireConnection;2657;1;2658;0
WireConnection;2657;2;2660;0
WireConnection;2657;3;2689;0
WireConnection;29;0;2539;0
WireConnection;1144;0;2955;0
WireConnection;2662;0;2657;0
WireConnection;219;0;218;0
WireConnection;2546;0;2630;0
WireConnection;0;0;33;0
WireConnection;0;2;32;0
WireConnection;0;13;332;0
WireConnection;0;11;193;0
ASEEND*/
//CHKSM=F216B5CAE9040548BAD392C276A55536105F6C7F