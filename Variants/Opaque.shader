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
		_IndirectDiffuseOffset("Indirect Light Min", Range( 0 , 1)) = 0
		_IndirectDiffuseOffsetMax("Indirect Light Max", Range( 0 , 1)) = 0
		[ToggleUI]_IndirLightUseMinforMax("Use Min for Max", Float) = 1
		[Enum(Clamp,0,Remap,1)]_IndirectLimiterMode("Indirect Limiter Mode", Float) = 0
		_WrappedShadingValue("Wrapped Shading Value", Float) = 1
		_WrapIndirScale("Indirect Light Scale", Float) = 3
		[SingleLineTexture]_MetallicGlossMap("Unity Metallic", 2D) = "black" {}
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
		[ToggleUI]_DiscardUVTile00("Discard UV Tile 0,0", Range( 0 , 1)) = 0
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
		uniform float _DiscardUVTile00;
		uniform float _DiscardUVMap;
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
		uniform float _VRChatCameraMode;
		uniform float CVRRenderingCam;
		uniform float _DontRenderInSocialVRCameras;
		uniform float _VRChatMirrorMode;
		uniform float _DontRenderinSocialVRMirrors;
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
		uniform float _IndirectLimiterMode;
		uniform float _WrapIndirScale;
		uniform float _MinBrightness;
		uniform sampler2D _MetallicGlossMap;
		uniform float4 _MetallicGlossMap_ST;


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

		inline float AudioLinkData3_g1344( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1346(  )
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


		inline float AudioLinkData3_g1329( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1331(  )
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


		inline float AudioLinkData3_g1334( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1336(  )
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


		inline float AudioLinkData3_g1339( int Band, int Delay )
		{
			return AudioLinkData( ALPASS_AUDIOLINK + uint2( Delay, Band ) ).rrrr;
		}


		float IfAudioLinkv2Exists1_g1341(  )
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


		float IfAudioLinkv2Exists1_g1347(  )
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


		float3 ShadeSH97_g1306( float4 Normal )
		{
			return ShadeSH9(Normal);
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 break63_g1321 = floor( float2( 0,0 ) );
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
			float2 temp_output_99_0_g1308 = DiscardUV200;
			float2 break61_g1321 = temp_output_99_0_g1308;
			float2 break63_g1323 = floor( float2( 0,1 ) );
			float2 break61_g1323 = temp_output_99_0_g1308;
			float2 break63_g1320 = floor( float2( 0,2 ) );
			float2 break61_g1320 = temp_output_99_0_g1308;
			float2 break63_g1324 = floor( float2( 0,3 ) );
			float2 break61_g1324 = temp_output_99_0_g1308;
			float2 break63_g1322 = floor( float2( 1,0 ) );
			float2 break61_g1322 = temp_output_99_0_g1308;
			float2 break63_g1317 = floor( float2( 1,1 ) );
			float2 break61_g1317 = temp_output_99_0_g1308;
			float2 break63_g1318 = floor( float2( 1,2 ) );
			float2 break61_g1318 = temp_output_99_0_g1308;
			float2 break63_g1319 = floor( float2( 1,3 ) );
			float2 break61_g1319 = temp_output_99_0_g1308;
			float2 break63_g1316 = floor( float2( 2,0 ) );
			float2 break61_g1316 = temp_output_99_0_g1308;
			float2 break63_g1315 = floor( float2( 2,1 ) );
			float2 break61_g1315 = temp_output_99_0_g1308;
			float2 break63_g1314 = floor( float2( 2,2 ) );
			float2 break61_g1314 = temp_output_99_0_g1308;
			float2 break63_g1313 = floor( float2( 2,3 ) );
			float2 break61_g1313 = temp_output_99_0_g1308;
			float2 break63_g1309 = floor( float2( 3,0 ) );
			float2 break61_g1309 = temp_output_99_0_g1308;
			float2 break63_g1310 = floor( float2( 3,1 ) );
			float2 break61_g1310 = temp_output_99_0_g1308;
			float2 break63_g1311 = floor( float2( 3,2 ) );
			float2 break61_g1311 = temp_output_99_0_g1308;
			float2 break63_g1312 = floor( float2( 3,3 ) );
			float2 break61_g1312 = temp_output_99_0_g1308;
			float UVTileDiscard192 = step( 1.0 , ( ( ( saturate( _DiscardUVTile00 ) * saturate( ( step( break63_g1321.x , break61_g1321.x ) * step( break61_g1321.x , ( break63_g1321.x + 0.9999999 ) ) * step( break63_g1321.y , break61_g1321.y ) * step( break61_g1321.y , ( break63_g1321.y + 0.9999999 ) ) ) ) ) + ( saturate( _DiscardUVTile01 ) * saturate( ( step( break63_g1323.x , break61_g1323.x ) * step( break61_g1323.x , ( break63_g1323.x + 0.9999999 ) ) * step( break63_g1323.y , break61_g1323.y ) * step( break61_g1323.y , ( break63_g1323.y + 0.9999999 ) ) ) ) ) + ( saturate( _DiscardUVTile02 ) * saturate( ( step( break63_g1320.x , break61_g1320.x ) * step( break61_g1320.x , ( break63_g1320.x + 0.9999999 ) ) * step( break63_g1320.y , break61_g1320.y ) * step( break61_g1320.y , ( break63_g1320.y + 0.9999999 ) ) ) ) ) + ( saturate( _DiscardUVTile03 ) * saturate( ( step( break63_g1324.x , break61_g1324.x ) * step( break61_g1324.x , ( break63_g1324.x + 0.9999999 ) ) * step( break63_g1324.y , break61_g1324.y ) * step( break61_g1324.y , ( break63_g1324.y + 0.9999999 ) ) ) ) ) ) + ( ( saturate( _DiscardUVTile10 ) * saturate( ( step( break63_g1322.x , break61_g1322.x ) * step( break61_g1322.x , ( break63_g1322.x + 0.9999999 ) ) * step( break63_g1322.y , break61_g1322.y ) * step( break61_g1322.y , ( break63_g1322.y + 0.9999999 ) ) ) ) ) + ( saturate( _DiscardUVTile11 ) * saturate( ( step( break63_g1317.x , break61_g1317.x ) * step( break61_g1317.x , ( break63_g1317.x + 0.9999999 ) ) * step( break63_g1317.y , break61_g1317.y ) * step( break61_g1317.y , ( break63_g1317.y + 0.9999999 ) ) ) ) ) + ( saturate( _DiscardUVTile12 ) * saturate( ( step( break63_g1318.x , break61_g1318.x ) * step( break61_g1318.x , ( break63_g1318.x + 0.9999999 ) ) * step( break63_g1318.y , break61_g1318.y ) * step( break61_g1318.y , ( break63_g1318.y + 0.9999999 ) ) ) ) ) + ( saturate( _DiscardUVTile13 ) * saturate( ( step( break63_g1319.x , break61_g1319.x ) * step( break61_g1319.x , ( break63_g1319.x + 0.9999999 ) ) * step( break63_g1319.y , break61_g1319.y ) * step( break61_g1319.y , ( break63_g1319.y + 0.9999999 ) ) ) ) ) ) + ( ( saturate( _DiscardUVTile20 ) * saturate( ( step( break63_g1316.x , break61_g1316.x ) * step( break61_g1316.x , ( break63_g1316.x + 0.9999999 ) ) * step( break63_g1316.y , break61_g1316.y ) * step( break61_g1316.y , ( break63_g1316.y + 0.9999999 ) ) ) ) ) + ( saturate( _DiscardUVTile21 ) * saturate( ( step( break63_g1315.x , break61_g1315.x ) * step( break61_g1315.x , ( break63_g1315.x + 0.9999999 ) ) * step( break63_g1315.y , break61_g1315.y ) * step( break61_g1315.y , ( break63_g1315.y + 0.9999999 ) ) ) ) ) + ( saturate( _DiscardUVTile22 ) * saturate( ( step( break63_g1314.x , break61_g1314.x ) * step( break61_g1314.x , ( break63_g1314.x + 0.9999999 ) ) * step( break63_g1314.y , break61_g1314.y ) * step( break61_g1314.y , ( break63_g1314.y + 0.9999999 ) ) ) ) ) + ( saturate( _DiscardUVTile23 ) * saturate( ( step( break63_g1313.x , break61_g1313.x ) * step( break61_g1313.x , ( break63_g1313.x + 0.9999999 ) ) * step( break63_g1313.y , break61_g1313.y ) * step( break61_g1313.y , ( break63_g1313.y + 0.9999999 ) ) ) ) ) ) + ( ( saturate( _DiscardUVTile30 ) * saturate( ( step( break63_g1309.x , break61_g1309.x ) * step( break61_g1309.x , ( break63_g1309.x + 0.9999999 ) ) * step( break63_g1309.y , break61_g1309.y ) * step( break61_g1309.y , ( break63_g1309.y + 0.9999999 ) ) ) ) ) + ( saturate( _DiscardUVTile31 ) * saturate( ( step( break63_g1310.x , break61_g1310.x ) * step( break61_g1310.x , ( break63_g1310.x + 0.9999999 ) ) * step( break63_g1310.y , break61_g1310.y ) * step( break61_g1310.y , ( break63_g1310.y + 0.9999999 ) ) ) ) ) + ( saturate( _DiscardUVTile32 ) * saturate( ( step( break63_g1311.x , break61_g1311.x ) * step( break61_g1311.x , ( break63_g1311.x + 0.9999999 ) ) * step( break63_g1311.y , break61_g1311.y ) * step( break61_g1311.y , ( break63_g1311.y + 0.9999999 ) ) ) ) ) + ( saturate( _DiscardUVTile33 ) * saturate( ( step( break63_g1312.x , break61_g1312.x ) * step( break61_g1312.x , ( break63_g1312.x + 0.9999999 ) ) * step( break63_g1312.y , break61_g1312.y ) * step( break61_g1312.y , ( break63_g1312.y + 0.9999999 ) ) ) ) ) ) ) );
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
			float3 Discard_Vertex2662 = ( step( 1.0 , ( UVTileDiscard192 + Dont_Render_in_Social_VR_Camera_Result2686 + Dont_Render_in_Social_VR_Mirror_Result2704 ) ) == 1.0 ? temp_cast_0 : Vertex_Position2663 );
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
			float3 temp_output_11_0_g1301 = normalMap1002;
			float3 temp_output_2_0_g1303 = temp_output_11_0_g1301;
			float dotResult3_g1305 = dot( ase_worldlightDir , (WorldNormalVector( i , temp_output_2_0_g1303 )) );
			float temp_output_5_0_g1304 = _WrappedShadingValue;
			float temp_output_15_0_g1303 = saturate( ase_lightAtten );
			float4 color16_g1303 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float4 lerpResult17_g1303 = lerp( color16_g1303 , ase_lightColor , temp_output_15_0_g1303);
			float3 temp_output_1_0_g1306 = temp_output_2_0_g1303;
			UnityGI gi2_g1306 = gi;
			float3 diffNorm2_g1306 = normalize( WorldNormalVector( i , temp_output_1_0_g1306 ) );
			gi2_g1306 = UnityGI_Base( data, 1, diffNorm2_g1306 );
			float3 indirectDiffuse2_g1306 = gi2_g1306.indirect.diffuse + diffNorm2_g1306 * 0.0001;
			float3 temp_output_34_0_g1306 = saturate( indirectDiffuse2_g1306 );
			float4 appendResult6_g1306 = (float4(( temp_output_1_0_g1306 * 0.3 ) , 1.0));
			float4 Normal7_g1306 = appendResult6_g1306;
			float3 localShadeSH97_g1306 = ShadeSH97_g1306( Normal7_g1306 );
			float temp_output_9_0_g1306 = _IndirectDiffuseOffset;
			float3 temp_cast_17 = (temp_output_9_0_g1306).xxx;
			float3 temp_output_15_0_g1306 = saturate( ( localShadeSH97_g1306 - temp_cast_17 ) );
			float temp_output_8_0_g1307 = 1.0;
			float temp_output_7_0_g1307 = _IndirLightUseMinforMax;
			float lerpResult6_g1307 = lerp( _IndirectDiffuseOffsetMax , temp_output_9_0_g1306 , ( step( temp_output_8_0_g1307 , temp_output_7_0_g1307 ) * step( temp_output_7_0_g1307 , temp_output_8_0_g1307 ) ));
			float3 temp_output_16_0_g1306 = saturate( ( localShadeSH97_g1306 + lerpResult6_g1307 ) );
			float3 clampResult17_g1306 = clamp( temp_output_34_0_g1306 , temp_output_15_0_g1306 , temp_output_16_0_g1306 );
			float3 lerpResult20_g1306 = lerp( clampResult17_g1306 , (temp_output_15_0_g1306 + (temp_output_34_0_g1306 - float3( 0,0,0 )) * (temp_output_16_0_g1306 - temp_output_15_0_g1306) / (float3( 1,1,1 ) - float3( 0,0,0 ))) , _IndirectLimiterMode);
			float4 color4_g1303 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
			float4 temp_cast_19 = (1.0).xxxx;
			float4 temp_cast_20 = (_MinBrightness).xxxx;
			float4 color40_g1303 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 clampResult37_g1303 = clamp( saturate( ( saturate( ( saturate( exp2( ( ( dotResult3_g1305 + temp_output_5_0_g1304 ) / ( 1.0 + temp_output_5_0_g1304 ) ) ) ) + saturate( exp2( temp_output_15_0_g1303 ) ) ) ) * saturate( ( saturate( lerpResult17_g1303 ) + saturate( (saturate( ( exp2( saturate( ( float4( lerpResult20_g1306 , 0.0 ) * color4_g1303 ) ) ) - temp_cast_19 ) )*_WrapIndirScale + 0.0) ) ) ) ) ) , temp_cast_20 , color40_g1303 );
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 color8_g891 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float2 uv_AmbientOcclusion = i.uv_texcoord * _AmbientOcclusion_ST.xy + _AmbientOcclusion_ST.zw;
			float4 temp_output_3_0_g891 = ( 1.0 - ( ( 1.0 - tex2D( _AmbientOcclusion, uv_AmbientOcclusion ) ) * _AOStrength ) );
			float temp_output_9_0_g891 = _RealAO;
			float4 lerpResult5_g891 = lerp( color8_g891 , temp_output_3_0_g891 , temp_output_9_0_g891);
			float4 mainTex26 = ( tex2D( _MainTex, uv_MainTex ) * lerpResult5_g891 * _Color );
			float3 indirectNormal4_g1302 = normalize( WorldNormalVector( i , temp_output_11_0_g1301 ) );
			float2 uv_MetallicGlossMap = i.uv_texcoord * _MetallicGlossMap_ST.xy + _MetallicGlossMap_ST.zw;
			float4 tex2DNode1017 = tex2D( _MetallicGlossMap, uv_MetallicGlossMap );
			float _Smoothness755 = tex2DNode1017.a;
			Unity_GlossyEnvironmentData g4_g1302 = UnityGlossyEnvironmentSetup( _Smoothness755, data.worldViewDir, indirectNormal4_g1302, float3(0,0,0));
			float3 indirectSpecular4_g1302 = UnityGI_IndirectSpecular( data, 1.0, indirectNormal4_g1302, g4_g1302 );
			float _Metalic753 = tex2DNode1017.r;
			float4 lerpResult21_g1302 = lerp( mainTex26 , float4( indirectSpecular4_g1302 , 0.0 ) , _Metalic753);
			float4 Lighting_Wrapped1144 = ( clampResult37_g1303 * lerpResult21_g1302 );
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
			float4 temp_output_51_0_g1326 = ALMask39;
			float4 color42 = IsGammaSpace() ? float4(1,0,0,1) : float4(1,0,0,1);
			float3 hsvTorgb4_g1343 = RGBToHSV( color42.rgb );
			float mulTime48 = _Time.y * _ALTimeScale;
			float Time50 = frac( mulTime48 );
			float temp_output_54_0_g1326 = Time50;
			float3 hsvTorgb8_g1343 = HSVToRGB( float3(( hsvTorgb4_g1343.x + temp_output_54_0_g1326 ),( hsvTorgb4_g1343.y + 0.0 ),( hsvTorgb4_g1343.z + 0.0 )) );
			float3 temp_output_5_0_g1342 = saturate( hsvTorgb8_g1343 );
			int Band3_g1344 = 0;
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
			int temp_output_55_0_g1326 = (int)in_ALDelay991;
			int Delay3_g1344 = temp_output_55_0_g1326;
			float localAudioLinkData3_g1344 = AudioLinkData3_g1344( Band3_g1344 , Delay3_g1344 );
			float temp_output_8_0_g1345 = 1.0;
			float localIfAudioLinkv2Exists1_g1346 = IfAudioLinkv2Exists1_g1346();
			float temp_output_7_0_g1345 = saturate( ( localIfAudioLinkv2Exists1_g1346 + 1.0 ) );
			float3 lerpResult6_g1345 = lerp( temp_output_5_0_g1342 , ( temp_output_5_0_g1342 * localAudioLinkData3_g1344 ) , ( step( temp_output_8_0_g1345 , temp_output_7_0_g1345 ) * step( temp_output_7_0_g1345 , temp_output_8_0_g1345 ) ));
			float4 color44 = IsGammaSpace() ? float4(0,0.8196079,0,1) : float4(0,0.637597,0,1);
			float3 hsvTorgb4_g1328 = RGBToHSV( color44.rgb );
			float3 hsvTorgb8_g1328 = HSVToRGB( float3(( hsvTorgb4_g1328.x + temp_output_54_0_g1326 ),( hsvTorgb4_g1328.y + 0.0 ),( hsvTorgb4_g1328.z + 0.0 )) );
			float3 temp_output_5_0_g1327 = saturate( hsvTorgb8_g1328 );
			int Band3_g1329 = 2;
			int Delay3_g1329 = temp_output_55_0_g1326;
			float localAudioLinkData3_g1329 = AudioLinkData3_g1329( Band3_g1329 , Delay3_g1329 );
			float temp_output_8_0_g1330 = 1.0;
			float localIfAudioLinkv2Exists1_g1331 = IfAudioLinkv2Exists1_g1331();
			float temp_output_7_0_g1330 = saturate( ( localIfAudioLinkv2Exists1_g1331 + 0.0 ) );
			float3 lerpResult6_g1330 = lerp( temp_output_5_0_g1327 , ( temp_output_5_0_g1327 * localAudioLinkData3_g1329 ) , ( step( temp_output_8_0_g1330 , temp_output_7_0_g1330 ) * step( temp_output_7_0_g1330 , temp_output_8_0_g1330 ) ));
			float4 color43 = IsGammaSpace() ? float4(1,0.9294118,0,1) : float4(1,0.8468735,0,1);
			float3 hsvTorgb4_g1333 = RGBToHSV( color43.rgb );
			float3 hsvTorgb8_g1333 = HSVToRGB( float3(( hsvTorgb4_g1333.x + temp_output_54_0_g1326 ),( hsvTorgb4_g1333.y + 0.0 ),( hsvTorgb4_g1333.z + 0.0 )) );
			float3 temp_output_5_0_g1332 = saturate( hsvTorgb8_g1333 );
			int Band3_g1334 = 1;
			int Delay3_g1334 = temp_output_55_0_g1326;
			float localAudioLinkData3_g1334 = AudioLinkData3_g1334( Band3_g1334 , Delay3_g1334 );
			float temp_output_8_0_g1335 = 1.0;
			float localIfAudioLinkv2Exists1_g1336 = IfAudioLinkv2Exists1_g1336();
			float temp_output_7_0_g1335 = saturate( ( localIfAudioLinkv2Exists1_g1336 + 0.0 ) );
			float3 lerpResult6_g1335 = lerp( temp_output_5_0_g1332 , ( temp_output_5_0_g1332 * localAudioLinkData3_g1334 ) , ( step( temp_output_8_0_g1335 , temp_output_7_0_g1335 ) * step( temp_output_7_0_g1335 , temp_output_8_0_g1335 ) ));
			float4 color45 = IsGammaSpace() ? float4(0,0,1,1) : float4(0,0,1,1);
			float3 hsvTorgb4_g1338 = RGBToHSV( color45.rgb );
			float3 hsvTorgb8_g1338 = HSVToRGB( float3(( hsvTorgb4_g1338.x + temp_output_54_0_g1326 ),( hsvTorgb4_g1338.y + 0.0 ),( hsvTorgb4_g1338.z + 0.0 )) );
			float3 temp_output_5_0_g1337 = saturate( hsvTorgb8_g1338 );
			int Band3_g1339 = 3;
			int Delay3_g1339 = temp_output_55_0_g1326;
			float localAudioLinkData3_g1339 = AudioLinkData3_g1339( Band3_g1339 , Delay3_g1339 );
			float temp_output_8_0_g1340 = 1.0;
			float localIfAudioLinkv2Exists1_g1341 = IfAudioLinkv2Exists1_g1341();
			float temp_output_7_0_g1340 = saturate( ( localIfAudioLinkv2Exists1_g1341 + 0.0 ) );
			float3 lerpResult6_g1340 = lerp( temp_output_5_0_g1337 , ( temp_output_5_0_g1337 * localAudioLinkData3_g1339 ) , ( step( temp_output_8_0_g1340 , temp_output_7_0_g1340 ) * step( temp_output_7_0_g1340 , temp_output_8_0_g1340 ) ));
			float localIfAudioLinkv2Exists1_g1347 = IfAudioLinkv2Exists1_g1347();
			float4 AL_Final85 = ( ( _EnableAudioLink * ( ( temp_output_51_0_g1326 * float4( lerpResult6_g1345 , 0.0 ) ) + ( temp_output_51_0_g1326 * float4( lerpResult6_g1330 , 0.0 ) ) + ( temp_output_51_0_g1326 * float4( lerpResult6_g1335 , 0.0 ) ) + ( temp_output_51_0_g1326 * float4( lerpResult6_g1340 , 0.0 ) ) ) ) * saturate( ( localIfAudioLinkv2Exists1_g1347 + _ALEmitifInactive ) ) );
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 Emission119 = ( tex2D( _Emission, uv_Emission ) * _EmissionColor );
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 normalMap1002 = UnpackNormal( tex2D( _BumpMap, uv_BumpMap ) );
			float fresnelNdotV9_g1325 = dot( (WorldNormalVector( i , normalMap1002 )), ase_worldViewDir );
			float fresnelNode9_g1325 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV9_g1325, _RimPower ) );
			float4 lerpResult14_g1325 = lerp( float4( 1,1,1,0 ) , mainTex26 , _RimBaseColorStrength);
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float3 hsvTorgb3_g1325 = RGBToHSV( ase_lightColor.rgb );
			float3 temp_output_11_0_g1301 = normalMap1002;
			float3 temp_output_2_0_g1303 = temp_output_11_0_g1301;
			float3 temp_output_1_0_g1306 = temp_output_2_0_g1303;
			float4 appendResult6_g1306 = (float4(( temp_output_1_0_g1306 * 0.3 ) , 1.0));
			float4 Normal7_g1306 = appendResult6_g1306;
			float3 localShadeSH97_g1306 = ShadeSH97_g1306( Normal7_g1306 );
			float temp_output_9_0_g1306 = _IndirectDiffuseOffset;
			float temp_output_8_0_g1307 = 1.0;
			float temp_output_7_0_g1307 = _IndirLightUseMinforMax;
			float lerpResult6_g1307 = lerp( _IndirectDiffuseOffsetMax , temp_output_9_0_g1306 , ( step( temp_output_8_0_g1307 , temp_output_7_0_g1307 ) * step( temp_output_7_0_g1307 , temp_output_8_0_g1307 ) ));
			float3 temp_output_16_0_g1306 = saturate( ( localShadeSH97_g1306 + lerpResult6_g1307 ) );
			float3 maxIndirLight2618 = temp_output_16_0_g1306;
			float3 hsvTorgb24_g1325 = RGBToHSV( maxIndirLight2618 );
			float4 Rim116 = ( _EnableRimLighting * ( ( ( fresnelNode9_g1325 * _RimEnergy ) * lerpResult14_g1325 ) * max( ( 0.0 * saturate( ( exp( hsvTorgb3_g1325.z ) - 1.0 ) ) ) , hsvTorgb24_g1325.z ) ) );
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
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19303
Node;AmplifyShaderEditor.CommentaryNode;2333;-2064,-2752;Inherit;False;673.8176;177.324;Selection of UV Maps to Use for UV Tile Discarding;3;2355;2627;2357;Audio Link Delay UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2357;-2032,-2688;Inherit;False;Property;_ALDelayUVMap;AL Delay UV Map;21;2;[Header];[Enum];Create;True;0;5;UV0;0;UV1;1;UV2;2;UV3;3;Screen Space;8;0;True;0;False;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2627;-1824,-2688;Inherit;False;VVGetTextureUV;-1;;885;c300954d56021714fb5c622c8f34ec06;0;1;32;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;27;-2064,-3536;Inherit;False;1084.464;673.0301;Comment;11;2630;2546;2307;26;1003;2629;25;2552;2540;2542;1047;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;977;-272,-3248;Inherit;False;1452.845;376.6802;Comment;8;991;985;987;979;993;2458;2457;2363;AudioLink Delay Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2355;-1616,-2688;Inherit;False;DelayUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;37;-1072,-1328;Inherit;False;859.9141;343.3768;Comment;3;34;1002;1006;Normal Map;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;2363;-240,-3152;Inherit;False;2355;DelayUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2542;-2000,-3280;Inherit;False;Property;_AOStrength;AO Strength;15;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2540;-2032,-3216;Inherit;True;Property;_AmbientOcclusion;Ambient Occlusion;14;0;Create;True;0;0;0;False;0;False;-1;None;cbb0fb74fb087f94db59618e2c77cb4e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2552;-1872,-3040;Inherit;False;Property;_RealAO;Real AO;16;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;1003;-2000,-3472;Inherit;True;Property;_MainTex;Albedo;1;1;[SingleLineTexture];Create;False;1;Standard Fallbacks;0;0;True;0;False;None;5865417736e272d46845efbf0b4e3a6f;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.CommentaryNode;2679;3296,1920;Inherit;False;564.665;432.8813;Comment;6;2672;2670;2671;2668;2706;2707;Camera Globals;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;2457;-32,-3168;Inherit;True;Property;_ALDelayMap;AudioLink Delay Tex Map;20;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;2050;-1728,-1440;Inherit;False;551.9897;288.0864;Comment;3;755;753;1017;Metallic and Smoothness;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;25;-1712,-3472;Inherit;True;Property;_AlbedoSample;Albedo Sample;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;1006;-1008,-1216;Inherit;True;Property;_BumpMap;Normal Map;3;1;[SingleLineTexture];Create;False;0;0;0;True;0;False;None;None;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ColorNode;2307;-1616,-3056;Inherit;False;Property;_Color;Color;2;0;Create;False;0;0;0;True;0;False;1,1,1,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;2630;-1728,-3200;Inherit;False;VVAmbientOcclusion;-1;;891;9931be4718b157b4ebb46a99812bfe31;0;3;6;FLOAT;0;False;7;COLOR;0,0,0,0;False;9;FLOAT;0;False;2;COLOR;11;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2668;3344,1984;Inherit;False;Global;CVRRenderingCam;CVRRenderingCam;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;34;-736,-1216;Inherit;True;Property;_NMSample;NM Sample;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;72;1440,-3088;Inherit;False;765.7347;170.1592;Comment;4;243;50;49;48;Time;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;979;160,-2976;Inherit;False;Property;_ALUVDelayMaxDelay;AL UV Delay Max Delay;22;0;Create;True;0;0;0;False;0;False;0;127;0;127;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;2458;256,-3168;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SamplerNode;1017;-1696,-1376;Inherit;True;Property;_MetallicGlossMap;Unity Metallic;13;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;None;a49653b5359381149b17445fbfae805c;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2629;-1360,-3312;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;2685;3312,736;Inherit;False;1222.874;463.641;Comment;11;2669;2686;2678;2676;2677;2675;2673;2682;2684;2683;2674;Disable Rendering in Social VR Cameras;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;201;-2064,-2464;Inherit;False;668.8916;177.8153;Selection of UV Maps to Use for UV Tile Discarding;3;2313;200;2626;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2693;3312,1328;Inherit;False;1226.13;481.8655;Comment;12;2702;2704;2703;2701;2700;2699;2694;2705;2696;2695;2698;2697;Disable Rendering in Social VR Mirrors;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2671;3344,2080;Inherit;False;Global;_VRChatCameraMode;_VRChatCameraMode;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2670;3552,1984;Inherit;False;cvr camera;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2706;3344,2176;Inherit;False;Global;_VRChatMirrorMode;_VRChatMirrorMode;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1002;-416,-1200;Inherit;False;normalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;993;496,-3184;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;127;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;243;1472,-3040;Inherit;False;Property;_ALTimeScale;AL HueShift Time Scale;23;0;Create;False;0;0;0;False;0;False;0;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;2602;-1728,-896;Inherit;False;1076;931;Comment;13;2392;2414;2415;2556;1207;2589;2375;2582;2583;2584;2291;1144;2618;Shading;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;755;-1408,-1280;Inherit;False;_Smoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;753;-1408,-1344;Inherit;False;_Metalic;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;26;-1200,-3312;Inherit;False;mainTex;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2313;-2016,-2400;Inherit;False;Property;_DiscardUVMap;Discard UV Map;28;2;[Header];[Enum];Create;True;1;UV Tile Discarding;4;UV0;0;UV1;1;UV2;2;UV3;3;0;True;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2674;3360,880;Inherit;False;2670;cvr camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2683;3360,960;Inherit;False;Constant;_Float14;Float 14;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2684;3360,1040;Inherit;False;Constant;_Float15;Float 15;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2695;3344,1616;Inherit;False;Constant;_Float18;Float 14;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2696;3344,1696;Inherit;False;Constant;_Float19;Float 15;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2705;3344,1536;Inherit;False;Constant;_Float21;Float 21;48;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2694;3360,1456;Inherit;False;2670;cvr camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2672;3584,2080;Inherit;False;vrc camera;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2707;3584,2176;Inherit;False;vrc mirror;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;38;16,-2656;Inherit;False;604.8932;280;Comment;2;40;39;AL Emission Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;987;672,-3184;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;127;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;48;1712,-3040;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2392;-1680,-848;Inherit;False;Property;_IndirectDiffuseOffset;Indirect Light Min;7;0;Create;False;0;0;0;False;0;False;0;0.04;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2414;-1680,-784;Inherit;False;Property;_IndirectDiffuseOffsetMax;Indirect Light Max;8;0;Create;False;0;0;0;False;0;False;0;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2415;-1584,-720;Inherit;False;Property;_IndirLightUseMinforMax;Use Min for Max;9;1;[ToggleUI];Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2556;-1648,-656;Inherit;False;Property;_IndirectLimiterMode;Indirect Limiter Mode;10;1;[Enum];Create;True;0;2;Clamp;0;Remap;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1207;-1648,-592;Inherit;False;Property;_WrappedShadingValue;Wrapped Shading Value;11;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2375;-1680,-464;Inherit;False;Property;_MinBrightness;Min Brightness;6;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2582;-1584,-400;Inherit;False;1002;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2583;-1616,-336;Inherit;False;755;_Smoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2291;-1616,-528;Inherit;False;Property;_WrapIndirScale;Indirect Light Scale;12;0;Create;False;0;0;0;False;0;False;3;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2584;-1584,-272;Inherit;False;753;_Metalic;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2589;-1584,-208;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2626;-1840,-2400;Inherit;False;VVGetVertexUV;-1;;1221;b2c6b9b1b245cf54ca03e50557eebb87;0;1;26;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;2682;3552,944;Inherit;False;If Float Equal;-1;;1260;bdca1c28487c8a1418e72579bec63589;0;4;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2673;3568,848;Inherit;False;2672;vrc camera;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2697;3552,1536;Inherit;False;If Float Equal;-1;;1300;bdca1c28487c8a1418e72579bec63589;0;4;7;FLOAT;0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2698;3568,1440;Inherit;False;2707;vrc mirror;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;49;1872,-3040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RoundOpNode;985;800,-3184;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;40;80,-2608;Inherit;True;Property;_AL_Mask;AudioLink Mask;19;0;Create;False;0;0;0;False;0;False;-1;None;1461f00c595f651479fe46554916498b;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;2650;-1328,-640;Inherit;True;VivikaShading;-1;;1301;efce34b3f4a0e2b44933c4737d48061f;0;11;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;3;False;9;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT3;0,0,0;False;12;FLOAT;0;False;13;FLOAT;0;False;18;COLOR;0,0,0,0;False;2;FLOAT3;32;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;138;1744,-1136;Inherit;False;1050.305;1191.881;Comment;19;192;198;774;775;776;777;773;772;771;770;768;767;766;765;764;763;762;270;2692;UV Tile Discard;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;200;-1632,-2400;Inherit;False;DiscardUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2675;3744,880;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2677;3744,784;Inherit;False;Constant;_Float12;Float 12;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2699;3744,1472;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2700;3744,1376;Inherit;False;Constant;_Float20;Float 12;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1;32,-1120;Inherit;False;1041.734;585.5447;Comment;9;116;2620;2621;333;2505;1404;12;87;113;Rim;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;117;16,-2288;Inherit;False;907.3133;529.2772;Comment;4;1005;119;121;118;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;107;-1328,-2656;Inherit;False;1185.214;1096.479;Comment;10;85;42;44;43;45;415;2614;995;51;75;AudioLink Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;991;944,-3168;Inherit;False;in_ALDelay;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;50;1984,-3040;Inherit;False;Time;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;400,-2608;Inherit;False;ALMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2618;-896,-688;Inherit;False;maxIndirLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;270;1776,-1088;Inherit;False;Property;_DiscardUVTile00;Discard UV Tile 0,0;29;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;762;1776,-1024;Inherit;False;Property;_DiscardUVTile01;Discard UV Tile 0,1;30;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;763;1776,-960;Inherit;False;Property;_DiscardUVTile02;Discard UV Tile 0,2;31;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;764;1776,-896;Inherit;False;Property;_DiscardUVTile03;Discard UV Tile 0,3;32;1;[ToggleUI];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;765;1776,-832;Inherit;False;Property;_DiscardUVTile10;Discard UV Tile 1,0;33;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;766;1776,-768;Inherit;False;Property;_DiscardUVTile11;Discard UV Tile 1,1;34;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;767;1776,-704;Inherit;False;Property;_DiscardUVTile12;Discard UV Tile 1,2;35;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;768;1776,-640;Inherit;False;Property;_DiscardUVTile13;Discard UV Tile 1,3;36;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;770;1776,-576;Inherit;False;Property;_DiscardUVTile20;Discard UV Tile 2,0;37;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;771;1776,-512;Inherit;False;Property;_DiscardUVTile21;Discard UV Tile 2,1;38;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;772;1776,-448;Inherit;False;Property;_DiscardUVTile22;Discard UV Tile 2,2;39;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;773;1776,-384;Inherit;False;Property;_DiscardUVTile23;Discard UV Tile 2,3;40;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;777;1776,-128;Inherit;False;Property;_DiscardUVTile33;Discard UV Tile 3,3;44;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;776;1776,-192;Inherit;False;Property;_DiscardUVTile32;Discard UV Tile 3,2;43;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;775;1776,-256;Inherit;False;Property;_DiscardUVTile31;Discard UV Tile 3,1;41;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;774;1776,-320;Inherit;False;Property;_DiscardUVTile30;Discard UV Tile 3,0;42;1;[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;198;1872,-64;Inherit;False;200;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StepOpNode;2676;3904,832;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2669;3552,1104;Inherit;False;Property;_DontRenderInSocialVRCameras;Don't Render in Social VR Cameras;46;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;2701;3904,1424;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2702;3552,1696;Inherit;False;Property;_DontRenderinSocialVRMirrors;Don't Render in Social VR Mirrors;47;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;75;-944,-1920;Inherit;False;39;ALMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;51;-1168,-1936;Inherit;False;50;Time;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;995;-1168,-1872;Inherit;False;991;in_ALDelay;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2614;-1200,-1744;Inherit;False;Property;_ALEmitifInactive;AL Emit if Inactive;18;1;[ToggleUI];Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;415;-1264,-1808;Half;False;Property;_EnableAudioLink;Enable AudioLink;17;2;[Header];[ToggleUI];Create;True;1;AudioLink;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;45;-1200,-2096;Inherit;False;Constant;_AL_Treble;AL_Treble;6;0;Create;True;0;0;0;False;0;False;0,0,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;43;-1200,-2256;Inherit;False;Constant;_AL_LowMid;AL_LowMid;6;0;Create;True;0;0;0;False;0;False;1,0.9294118,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;44;-1200,-2416;Inherit;False;Constant;_AL_HighMid;AL_HighMid;6;0;Create;True;0;0;0;False;0;False;0,0.8196079,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;113;96,-848;Inherit;False;Property;_RimBaseColorStrength;Rim Base Color Strength;27;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;87;96,-912;Inherit;False;Property;_RimEnergy;Rim Energy;26;0;Create;True;0;0;0;False;0;False;0.345;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;96,-976;Float;False;Property;_RimPower;Rim Power;25;0;Create;True;0;0;0;False;0;False;2.07;1.86;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1404;192,-784;Inherit;False;1002;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2505;160,-720;Inherit;False;2618;maxIndirLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;333;96,-1040;Half;False;Property;_EnableRimLighting;Enable Rim Lighting;24;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2621;192,-656;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1005;128,-1952;Inherit;False;Property;_EmissionColor;Emission Color;5;0;Create;False;0;0;0;True;0;False;0,0,0,0;0,1,0.9604408,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;42;-1200,-2576;Inherit;False;Constant;_AL_Bass;AL_Bass;6;0;Create;True;0;0;0;False;0;False;1,0,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;2692;2256,-736;Inherit;False;VVUVTileDiscardFull;-1;;1308;37cd3007c1dbdac4b9341609f3fa3a5a;0;17;100;FLOAT;0;False;101;FLOAT;0;False;102;FLOAT;0;False;103;FLOAT;0;False;104;FLOAT;0;False;105;FLOAT;0;False;106;FLOAT;0;False;107;FLOAT;0;False;108;FLOAT;0;False;109;FLOAT;0;False;110;FLOAT;0;False;111;FLOAT;0;False;112;FLOAT;0;False;113;FLOAT;0;False;114;FLOAT;0;False;115;FLOAT;0;False;99;FLOAT2;0,0;False;1;FLOAT;116
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2678;4016,880;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2703;4016,1472;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;118;80,-2224;Inherit;True;Property;_Emission;Emission;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;121;432,-2144;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2620;496,-912;Inherit;False;Rim;-1;;1325;652e8c2aadb4b694999944f1079d1366;0;7;29;FLOAT;0;False;30;FLOAT;0;False;31;FLOAT;0;False;32;FLOAT;0;False;26;FLOAT3;0,0,0;False;27;FLOAT3;0,0,0;False;28;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;2688;-720,-2336;Inherit;False;VVALCombine;-1;;1326;bceeba5c9c06c59459d6b7e4bf2084da;0;9;54;FLOAT;0;False;55;INT;0;False;25;COLOR;1,0,0,1;False;27;COLOR;1,0.9294118,0,1;False;26;COLOR;0,0.8196079,0,1;False;28;COLOR;0,0,1,1;False;51;COLOR;0,0,0,0;False;52;FLOAT;0;False;53;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;2665;3328,-416;Inherit;False;468;235;Comment;2;2663;2691;Vertex Position Results;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2666;3296,32;Inherit;False;1616.048;535.0431;Comment;12;2687;2654;2655;2661;2660;2656;2658;2662;2657;2689;2690;2708;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;192;2576,-720;Inherit;False;UVTileDiscard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2686;4160,848;Inherit;False;Dont Render in Social VR Camera Result;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2704;4176,1440;Inherit;False;Dont Render in Social VR Mirror Result;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;31;16,-1680;Inherit;False;798.6848;366.049;Comment;6;29;2539;30;86;28;122;Emission Combination;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;119;592,-2224;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;85;-400,-2288;Inherit;False;AL_Final;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;116;848,-912;Float;False;Rim;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PosVertexDataNode;2691;3360,-352;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;2687;3344,176;Inherit;False;2686;Dont Render in Social VR Camera Result;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2654;3472,96;Inherit;False;192;UVTileDiscard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2708;3344,256;Inherit;False;2704;Dont Render in Social VR Mirror Result;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;122;48,-1520;Inherit;False;119;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;28;32,-1440;Inherit;False;116;Rim;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;86;32,-1616;Inherit;False;85;AL_Final;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2663;3584,-368;Inherit;False;Vertex Position;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2661;3792,368;Inherit;False;Constant;_Float11;Float 11;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2655;3728,160;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2690;3792,80;Inherit;False;Constant;_Float17;Float 17;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;240,-1536;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2658;3936,240;Inherit;False;Constant;_Float5;Float 5;46;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2660;3968,336;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2689;3872,480;Inherit;False;2663;Vertex Position;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StepOpNode;2656;3968,128;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;2539;448,-1536;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;2657;4160,176;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;220;1248,-2688;Inherit;False;962.8354;715.8684;Comment;5;0;33;32;193;332;Output;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;217;1840,-1792;Inherit;False;420.8079;185;Comment;2;219;218;Declare NaN;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1144;-896,-576;Inherit;False;Lighting Wrapped;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;29;592,-1536;Inherit;False;EmissionFinal;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;2641;-688.6962,-4043.483;Inherit;False;324;355;Comment;1;2642;Fallbacks;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2662;4448,224;Inherit;False;Discard Vertex;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;1488,-2640;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;218;1888,-1744;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;219;2048,-1744;Inherit;False;NaN;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;32;1504,-2464;Inherit;False;29;EmissionFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2546;-1312,-3088;Inherit;False;ao_times_strength;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1047;-1232,-3456;Inherit;False;Property;_CullMode;Cull Mode;0;1;[Enum];Create;True;0;3;Off;0;Front;1;Back;2;0;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2642;-640.6962,-3979.483;Inherit;True;Property;_EmissionMap;Fallback Emission Map;45;1;[SingleLineTexture];Create;False;0;0;0;True;0;False;None;1461f00c595f651479fe46554916498b;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;332;1728,-2304;Inherit;False;1144;Lighting Wrapped;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;193;1552,-2176;Inherit;False;2662;Discard Vertex;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1968,-2528;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;VoyVivika/VivikaShader/Vivika Shader Opaque;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;5;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Absolute;0;Standard;-1;-1;-1;-1;1;VRCFallback=DoubleSided;False;0;0;True;_CullMode;-1;0;False;;1;Include;..\Libs\AudioLink\AudioLink.cginc;False;;Custom;False;0;0;;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
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
WireConnection;2670;0;2668;0
WireConnection;1002;0;34;0
WireConnection;993;0;2458;3
WireConnection;993;4;979;0
WireConnection;755;0;1017;4
WireConnection;753;0;1017;1
WireConnection;26;0;2629;0
WireConnection;2672;0;2671;0
WireConnection;2707;0;2706;0
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
WireConnection;2650;4;2392;0
WireConnection;2650;5;2414;0
WireConnection;2650;6;2415;0
WireConnection;2650;7;2556;0
WireConnection;2650;8;1207;0
WireConnection;2650;9;2291;0
WireConnection;2650;10;2375;0
WireConnection;2650;11;2582;0
WireConnection;2650;12;2583;0
WireConnection;2650;13;2584;0
WireConnection;2650;18;2589;0
WireConnection;200;0;2626;0
WireConnection;2675;0;2673;0
WireConnection;2675;1;2682;0
WireConnection;2699;0;2698;0
WireConnection;2699;1;2697;0
WireConnection;991;0;985;0
WireConnection;50;0;49;0
WireConnection;39;0;40;0
WireConnection;2618;0;2650;32
WireConnection;2676;0;2677;0
WireConnection;2676;1;2675;0
WireConnection;2701;0;2700;0
WireConnection;2701;1;2699;0
WireConnection;2692;100;270;0
WireConnection;2692;101;762;0
WireConnection;2692;102;763;0
WireConnection;2692;103;764;0
WireConnection;2692;104;765;0
WireConnection;2692;105;766;0
WireConnection;2692;106;767;0
WireConnection;2692;107;768;0
WireConnection;2692;108;770;0
WireConnection;2692;109;771;0
WireConnection;2692;110;772;0
WireConnection;2692;111;773;0
WireConnection;2692;112;774;0
WireConnection;2692;113;775;0
WireConnection;2692;114;776;0
WireConnection;2692;115;777;0
WireConnection;2692;99;198;0
WireConnection;2678;0;2676;0
WireConnection;2678;1;2669;0
WireConnection;2703;0;2701;0
WireConnection;2703;1;2702;0
WireConnection;121;0;118;0
WireConnection;121;1;1005;0
WireConnection;2620;29;333;0
WireConnection;2620;30;12;0
WireConnection;2620;31;87;0
WireConnection;2620;32;113;0
WireConnection;2620;26;1404;0
WireConnection;2620;27;2505;0
WireConnection;2620;28;2621;0
WireConnection;2688;54;51;0
WireConnection;2688;55;995;0
WireConnection;2688;25;42;0
WireConnection;2688;27;43;0
WireConnection;2688;26;44;0
WireConnection;2688;28;45;0
WireConnection;2688;51;75;0
WireConnection;2688;52;415;0
WireConnection;2688;53;2614;0
WireConnection;192;0;2692;116
WireConnection;2686;0;2678;0
WireConnection;2704;0;2703;0
WireConnection;119;0;121;0
WireConnection;85;0;2688;0
WireConnection;116;0;2620;0
WireConnection;2663;0;2691;0
WireConnection;2655;0;2654;0
WireConnection;2655;1;2687;0
WireConnection;2655;2;2708;0
WireConnection;30;0;86;0
WireConnection;30;1;122;0
WireConnection;30;2;28;0
WireConnection;2660;0;2661;0
WireConnection;2660;1;2661;0
WireConnection;2656;0;2690;0
WireConnection;2656;1;2655;0
WireConnection;2539;0;30;0
WireConnection;2657;0;2656;0
WireConnection;2657;1;2658;0
WireConnection;2657;2;2660;0
WireConnection;2657;3;2689;0
WireConnection;1144;0;2650;0
WireConnection;29;0;2539;0
WireConnection;2662;0;2657;0
WireConnection;219;0;218;0
WireConnection;2546;0;2630;0
WireConnection;0;0;33;0
WireConnection;0;2;32;0
WireConnection;0;13;332;0
WireConnection;0;11;193;0
ASEEND*/
//CHKSM=0FB1C44AC5E204397DBC0933A6B74D4C1B6B199F