// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VoyVivika/DivorceShaders/Depricated/Divorce Main (Deprecated)"
{
	Properties
	{
		[Enum(Standard,0,Flat,1,Test,2)]_LightingType("Lighting Type", Float) = 0
		_MaxFlatLightDistance("Max Flat Light Distance", Float) = 8
		_mainTex("mainTex", 2D) = "white" {}
		_normalMap("normalMap", 2D) = "bump" {}
		_MultiMap("MultiMap", 2D) = "black" {}
		_Emission("Emission", 2D) = "black" {}
		_EmissionStrength1("Emission Strength", Range( 0 , 1)) = 0
		[ToggleUI]_EnableRimLighting("Enable Rim Lighting", Range( 0 , 1)) = 1
		_RimPower("Rim Power", Range( 0 , 10)) = 2.07
		_RimEnergy("Rim Energy", Range( 0 , 1)) = 0.345
		_RimNormalMap("Rim Normal Map", 2D) = "bump" {}
		_RimBaseColorStrength("Rim Base Color Strength", Range( 0 , 1)) = 1
		[Header(UV Tile Discard)][ToggleUI]_DiscardUVTile00("Discard UV Tile 0,0", Range( 0 , 1)) = 0
		[ToggleUI]_DiscardUVTile01("Discard UV Tile 0,1", Float) = 0
		[ToggleUI]_DiscardUVTile02("Discard UV Tile 0,2", Float) = 0
		[ToggleUI]_DiscardUVTile03("Discard UV Tile 0,3", Float) = 0
		[ToggleUI]_DiscardUVTile10("Discard UV Tile 1,0", Float) = 0
		[ToggleUI]_DiscardUVTile11("Discard UV Tile 1,1", Float) = 0
		[ToggleUI]_DiscardUVTile12("Discard UV Tile 1,2", Float) = 0
		[ToggleUI]_DiscardUVTile13("Discard UV Tile 1,3", Float) = 0
		[ToggleUI]_DiscardUVTile20("Discard UV Tile 2,0", Float) = 0
		[ToggleUI]_DiscardUVTile21("Discard UV Tile 2,1", Float) = 0
		[ToggleUI]_DiscardUVTile22("Discard UV Tile 2,2", Float) = 0
		[ToggleUI]_DiscardUVTile23("Discard UV Tile 2,3", Float) = 0
		[ToggleUI]_DiscardUVTile30("Discard UV Tile 3,0", Float) = 0
		[ToggleUI]_DiscardUVTile31("Discard UV Tile 3,1", Float) = 0
		[ToggleUI]_DiscardUVTile32("Discard UV Tile 3,2", Float) = 0
		[ToggleUI]_DiscardUVTile33("Discard UV Tile 3,3", Float) = 0
		[Header(UV Range Discard)][Header(X and Y are Start UVs)][Header(Z and W are End UVs)]_UVRangeDiscard1Range("UV Range Discard 1 Range", Vector) = (0,0,1,1)
		[ToggleUI]_UVRangeDiscard1("UV Range Discard 1", Float) = 0
		_UVRangeDiscard2Range("UV Range Discard 2 Range", Vector) = (0,0,1,1)
		[ToggleUI]_UVRangeDiscard2("UV Range Discard 2", Float) = 0
		_UVRangeDiscard3Range("UV Range Discard 3 Range", Vector) = (0,0,1,1)
		[ToggleUI]_UVRangeDiscard3("UV Range Discard 3", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityCG.cginc"
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
			float3 worldPos;
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

		uniform half _DiscardUVTile00;
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
		uniform float _UVRangeDiscard1;
		uniform float4 _UVRangeDiscard1Range;
		uniform float _UVRangeDiscard2;
		uniform float4 _UVRangeDiscard2Range;
		uniform float _UVRangeDiscard3;
		uniform float4 _UVRangeDiscard3Range;
		uniform sampler2D _mainTex;
		uniform float4 _mainTex_ST;
		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;
		uniform float _EmissionStrength1;
		uniform half _EnableRimLighting;
		uniform sampler2D _RimNormalMap;
		uniform float _RimPower;
		uniform float _RimEnergy;
		uniform float _RimBaseColorStrength;
		uniform float _LightingType;
		uniform sampler2D _normalMap;
		uniform float4 _normalMap_ST;
		uniform half _MaxFlatLightDistance;
		uniform sampler2D _MultiMap;
		uniform float4 _MultiMap_ST;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 DiscardUV237 = v.texcoord1.xy;
			float2 break9_g35 = DiscardUV237;
			float2 temp_output_24_0_g35 = floor( float2( 0,0 ) );
			float2 break11_g35 = temp_output_24_0_g35;
			float2 break13_g35 = ( temp_output_24_0_g35 + float2( 1,1 ) );
			float ifLocalVar16_g35 = 0;
			if( break11_g35.y < break13_g35.y )
				ifLocalVar16_g35 = ( 0.0 / 0.0 );
			float ifLocalVar15_g35 = 0;
			if( break9_g35.x < break13_g35.x )
				ifLocalVar15_g35 = ifLocalVar16_g35;
			float ifLocalVar14_g35 = 0;
			if( break9_g35.y > break11_g35.y )
				ifLocalVar14_g35 = ifLocalVar15_g35;
			float ifLocalVar1_g35 = 0;
			if( break9_g35.x > break11_g35.x )
				ifLocalVar1_g35 = ifLocalVar14_g35;
			float ifLocalVar18_g35 = 0;
			if( _DiscardUVTile00 == 1.0 )
				ifLocalVar18_g35 = ifLocalVar1_g35;
			float2 break9_g34 = DiscardUV237;
			float2 temp_output_24_0_g34 = floor( float2( 0,0 ) );
			float2 break11_g34 = temp_output_24_0_g34;
			float2 break13_g34 = ( temp_output_24_0_g34 + float2( 1,1 ) );
			float ifLocalVar16_g34 = 0;
			if( break11_g34.y < break13_g34.y )
				ifLocalVar16_g34 = ( 0.0 / 0.0 );
			float ifLocalVar15_g34 = 0;
			if( break9_g34.x < break13_g34.x )
				ifLocalVar15_g34 = ifLocalVar16_g34;
			float ifLocalVar14_g34 = 0;
			if( break9_g34.y > break11_g34.y )
				ifLocalVar14_g34 = ifLocalVar15_g34;
			float ifLocalVar1_g34 = 0;
			if( break9_g34.x > break11_g34.x )
				ifLocalVar1_g34 = ifLocalVar14_g34;
			float ifLocalVar18_g34 = 0;
			if( (( _DiscardUVTile01 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g34 = ifLocalVar1_g34;
			float2 break9_g32 = DiscardUV237;
			float2 temp_output_24_0_g32 = floor( float2( 0,0 ) );
			float2 break11_g32 = temp_output_24_0_g32;
			float2 break13_g32 = ( temp_output_24_0_g32 + float2( 1,1 ) );
			float ifLocalVar16_g32 = 0;
			if( break11_g32.y < break13_g32.y )
				ifLocalVar16_g32 = ( 0.0 / 0.0 );
			float ifLocalVar15_g32 = 0;
			if( break9_g32.x < break13_g32.x )
				ifLocalVar15_g32 = ifLocalVar16_g32;
			float ifLocalVar14_g32 = 0;
			if( break9_g32.y > break11_g32.y )
				ifLocalVar14_g32 = ifLocalVar15_g32;
			float ifLocalVar1_g32 = 0;
			if( break9_g32.x > break11_g32.x )
				ifLocalVar1_g32 = ifLocalVar14_g32;
			float ifLocalVar18_g32 = 0;
			if( (( _DiscardUVTile02 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g32 = ifLocalVar1_g32;
			float2 break9_g33 = DiscardUV237;
			float2 temp_output_24_0_g33 = floor( float2( 0,0 ) );
			float2 break11_g33 = temp_output_24_0_g33;
			float2 break13_g33 = ( temp_output_24_0_g33 + float2( 1,1 ) );
			float ifLocalVar16_g33 = 0;
			if( break11_g33.y < break13_g33.y )
				ifLocalVar16_g33 = ( 0.0 / 0.0 );
			float ifLocalVar15_g33 = 0;
			if( break9_g33.x < break13_g33.x )
				ifLocalVar15_g33 = ifLocalVar16_g33;
			float ifLocalVar14_g33 = 0;
			if( break9_g33.y > break11_g33.y )
				ifLocalVar14_g33 = ifLocalVar15_g33;
			float ifLocalVar1_g33 = 0;
			if( break9_g33.x > break11_g33.x )
				ifLocalVar1_g33 = ifLocalVar14_g33;
			float ifLocalVar18_g33 = 0;
			if( (( _DiscardUVTile03 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g33 = ifLocalVar1_g33;
			float2 break9_g28 = DiscardUV237;
			float2 temp_output_24_0_g28 = floor( float2( 0,0 ) );
			float2 break11_g28 = temp_output_24_0_g28;
			float2 break13_g28 = ( temp_output_24_0_g28 + float2( 1,1 ) );
			float ifLocalVar16_g28 = 0;
			if( break11_g28.y < break13_g28.y )
				ifLocalVar16_g28 = ( 0.0 / 0.0 );
			float ifLocalVar15_g28 = 0;
			if( break9_g28.x < break13_g28.x )
				ifLocalVar15_g28 = ifLocalVar16_g28;
			float ifLocalVar14_g28 = 0;
			if( break9_g28.y > break11_g28.y )
				ifLocalVar14_g28 = ifLocalVar15_g28;
			float ifLocalVar1_g28 = 0;
			if( break9_g28.x > break11_g28.x )
				ifLocalVar1_g28 = ifLocalVar14_g28;
			float ifLocalVar18_g28 = 0;
			if( (( _DiscardUVTile10 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g28 = ifLocalVar1_g28;
			float2 break9_g29 = DiscardUV237;
			float2 temp_output_24_0_g29 = floor( float2( 0,0 ) );
			float2 break11_g29 = temp_output_24_0_g29;
			float2 break13_g29 = ( temp_output_24_0_g29 + float2( 1,1 ) );
			float ifLocalVar16_g29 = 0;
			if( break11_g29.y < break13_g29.y )
				ifLocalVar16_g29 = ( 0.0 / 0.0 );
			float ifLocalVar15_g29 = 0;
			if( break9_g29.x < break13_g29.x )
				ifLocalVar15_g29 = ifLocalVar16_g29;
			float ifLocalVar14_g29 = 0;
			if( break9_g29.y > break11_g29.y )
				ifLocalVar14_g29 = ifLocalVar15_g29;
			float ifLocalVar1_g29 = 0;
			if( break9_g29.x > break11_g29.x )
				ifLocalVar1_g29 = ifLocalVar14_g29;
			float ifLocalVar18_g29 = 0;
			if( (( _DiscardUVTile11 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g29 = ifLocalVar1_g29;
			float2 break9_g30 = DiscardUV237;
			float2 temp_output_24_0_g30 = floor( float2( 0,0 ) );
			float2 break11_g30 = temp_output_24_0_g30;
			float2 break13_g30 = ( temp_output_24_0_g30 + float2( 1,1 ) );
			float ifLocalVar16_g30 = 0;
			if( break11_g30.y < break13_g30.y )
				ifLocalVar16_g30 = ( 0.0 / 0.0 );
			float ifLocalVar15_g30 = 0;
			if( break9_g30.x < break13_g30.x )
				ifLocalVar15_g30 = ifLocalVar16_g30;
			float ifLocalVar14_g30 = 0;
			if( break9_g30.y > break11_g30.y )
				ifLocalVar14_g30 = ifLocalVar15_g30;
			float ifLocalVar1_g30 = 0;
			if( break9_g30.x > break11_g30.x )
				ifLocalVar1_g30 = ifLocalVar14_g30;
			float ifLocalVar18_g30 = 0;
			if( (( _DiscardUVTile12 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g30 = ifLocalVar1_g30;
			float2 break9_g31 = DiscardUV237;
			float2 temp_output_24_0_g31 = floor( float2( 0,0 ) );
			float2 break11_g31 = temp_output_24_0_g31;
			float2 break13_g31 = ( temp_output_24_0_g31 + float2( 1,1 ) );
			float ifLocalVar16_g31 = 0;
			if( break11_g31.y < break13_g31.y )
				ifLocalVar16_g31 = ( 0.0 / 0.0 );
			float ifLocalVar15_g31 = 0;
			if( break9_g31.x < break13_g31.x )
				ifLocalVar15_g31 = ifLocalVar16_g31;
			float ifLocalVar14_g31 = 0;
			if( break9_g31.y > break11_g31.y )
				ifLocalVar14_g31 = ifLocalVar15_g31;
			float ifLocalVar1_g31 = 0;
			if( break9_g31.x > break11_g31.x )
				ifLocalVar1_g31 = ifLocalVar14_g31;
			float ifLocalVar18_g31 = 0;
			if( (( _DiscardUVTile13 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g31 = ifLocalVar1_g31;
			float2 break9_g24 = DiscardUV237;
			float2 temp_output_24_0_g24 = floor( float2( 0,0 ) );
			float2 break11_g24 = temp_output_24_0_g24;
			float2 break13_g24 = ( temp_output_24_0_g24 + float2( 1,1 ) );
			float ifLocalVar16_g24 = 0;
			if( break11_g24.y < break13_g24.y )
				ifLocalVar16_g24 = ( 0.0 / 0.0 );
			float ifLocalVar15_g24 = 0;
			if( break9_g24.x < break13_g24.x )
				ifLocalVar15_g24 = ifLocalVar16_g24;
			float ifLocalVar14_g24 = 0;
			if( break9_g24.y > break11_g24.y )
				ifLocalVar14_g24 = ifLocalVar15_g24;
			float ifLocalVar1_g24 = 0;
			if( break9_g24.x > break11_g24.x )
				ifLocalVar1_g24 = ifLocalVar14_g24;
			float ifLocalVar18_g24 = 0;
			if( (( _DiscardUVTile20 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g24 = ifLocalVar1_g24;
			float2 break9_g25 = DiscardUV237;
			float2 temp_output_24_0_g25 = floor( float2( 0,0 ) );
			float2 break11_g25 = temp_output_24_0_g25;
			float2 break13_g25 = ( temp_output_24_0_g25 + float2( 1,1 ) );
			float ifLocalVar16_g25 = 0;
			if( break11_g25.y < break13_g25.y )
				ifLocalVar16_g25 = ( 0.0 / 0.0 );
			float ifLocalVar15_g25 = 0;
			if( break9_g25.x < break13_g25.x )
				ifLocalVar15_g25 = ifLocalVar16_g25;
			float ifLocalVar14_g25 = 0;
			if( break9_g25.y > break11_g25.y )
				ifLocalVar14_g25 = ifLocalVar15_g25;
			float ifLocalVar1_g25 = 0;
			if( break9_g25.x > break11_g25.x )
				ifLocalVar1_g25 = ifLocalVar14_g25;
			float ifLocalVar18_g25 = 0;
			if( (( _DiscardUVTile21 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g25 = ifLocalVar1_g25;
			float2 break9_g26 = DiscardUV237;
			float2 temp_output_24_0_g26 = floor( float2( 0,0 ) );
			float2 break11_g26 = temp_output_24_0_g26;
			float2 break13_g26 = ( temp_output_24_0_g26 + float2( 1,1 ) );
			float ifLocalVar16_g26 = 0;
			if( break11_g26.y < break13_g26.y )
				ifLocalVar16_g26 = ( 0.0 / 0.0 );
			float ifLocalVar15_g26 = 0;
			if( break9_g26.x < break13_g26.x )
				ifLocalVar15_g26 = ifLocalVar16_g26;
			float ifLocalVar14_g26 = 0;
			if( break9_g26.y > break11_g26.y )
				ifLocalVar14_g26 = ifLocalVar15_g26;
			float ifLocalVar1_g26 = 0;
			if( break9_g26.x > break11_g26.x )
				ifLocalVar1_g26 = ifLocalVar14_g26;
			float ifLocalVar18_g26 = 0;
			if( (( _DiscardUVTile22 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g26 = ifLocalVar1_g26;
			float2 break9_g27 = DiscardUV237;
			float2 temp_output_24_0_g27 = floor( float2( 0,0 ) );
			float2 break11_g27 = temp_output_24_0_g27;
			float2 break13_g27 = ( temp_output_24_0_g27 + float2( 1,1 ) );
			float ifLocalVar16_g27 = 0;
			if( break11_g27.y < break13_g27.y )
				ifLocalVar16_g27 = ( 0.0 / 0.0 );
			float ifLocalVar15_g27 = 0;
			if( break9_g27.x < break13_g27.x )
				ifLocalVar15_g27 = ifLocalVar16_g27;
			float ifLocalVar14_g27 = 0;
			if( break9_g27.y > break11_g27.y )
				ifLocalVar14_g27 = ifLocalVar15_g27;
			float ifLocalVar1_g27 = 0;
			if( break9_g27.x > break11_g27.x )
				ifLocalVar1_g27 = ifLocalVar14_g27;
			float ifLocalVar18_g27 = 0;
			if( (( _DiscardUVTile23 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g27 = ifLocalVar1_g27;
			float2 break9_g20 = DiscardUV237;
			float2 temp_output_24_0_g20 = floor( float2( 0,0 ) );
			float2 break11_g20 = temp_output_24_0_g20;
			float2 break13_g20 = ( temp_output_24_0_g20 + float2( 1,1 ) );
			float ifLocalVar16_g20 = 0;
			if( break11_g20.y < break13_g20.y )
				ifLocalVar16_g20 = ( 0.0 / 0.0 );
			float ifLocalVar15_g20 = 0;
			if( break9_g20.x < break13_g20.x )
				ifLocalVar15_g20 = ifLocalVar16_g20;
			float ifLocalVar14_g20 = 0;
			if( break9_g20.y > break11_g20.y )
				ifLocalVar14_g20 = ifLocalVar15_g20;
			float ifLocalVar1_g20 = 0;
			if( break9_g20.x > break11_g20.x )
				ifLocalVar1_g20 = ifLocalVar14_g20;
			float ifLocalVar18_g20 = 0;
			if( (( _DiscardUVTile30 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g20 = ifLocalVar1_g20;
			float2 break9_g21 = DiscardUV237;
			float2 temp_output_24_0_g21 = floor( float2( 0,0 ) );
			float2 break11_g21 = temp_output_24_0_g21;
			float2 break13_g21 = ( temp_output_24_0_g21 + float2( 1,1 ) );
			float ifLocalVar16_g21 = 0;
			if( break11_g21.y < break13_g21.y )
				ifLocalVar16_g21 = ( 0.0 / 0.0 );
			float ifLocalVar15_g21 = 0;
			if( break9_g21.x < break13_g21.x )
				ifLocalVar15_g21 = ifLocalVar16_g21;
			float ifLocalVar14_g21 = 0;
			if( break9_g21.y > break11_g21.y )
				ifLocalVar14_g21 = ifLocalVar15_g21;
			float ifLocalVar1_g21 = 0;
			if( break9_g21.x > break11_g21.x )
				ifLocalVar1_g21 = ifLocalVar14_g21;
			float ifLocalVar18_g21 = 0;
			if( (( _DiscardUVTile31 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g21 = ifLocalVar1_g21;
			float2 break9_g22 = DiscardUV237;
			float2 temp_output_24_0_g22 = floor( float2( 0,0 ) );
			float2 break11_g22 = temp_output_24_0_g22;
			float2 break13_g22 = ( temp_output_24_0_g22 + float2( 1,1 ) );
			float ifLocalVar16_g22 = 0;
			if( break11_g22.y < break13_g22.y )
				ifLocalVar16_g22 = ( 0.0 / 0.0 );
			float ifLocalVar15_g22 = 0;
			if( break9_g22.x < break13_g22.x )
				ifLocalVar15_g22 = ifLocalVar16_g22;
			float ifLocalVar14_g22 = 0;
			if( break9_g22.y > break11_g22.y )
				ifLocalVar14_g22 = ifLocalVar15_g22;
			float ifLocalVar1_g22 = 0;
			if( break9_g22.x > break11_g22.x )
				ifLocalVar1_g22 = ifLocalVar14_g22;
			float ifLocalVar18_g22 = 0;
			if( (( _DiscardUVTile32 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g22 = ifLocalVar1_g22;
			float2 break9_g23 = DiscardUV237;
			float2 temp_output_24_0_g23 = floor( float2( 0,0 ) );
			float2 break11_g23 = temp_output_24_0_g23;
			float2 break13_g23 = ( temp_output_24_0_g23 + float2( 1,1 ) );
			float ifLocalVar16_g23 = 0;
			if( break11_g23.y < break13_g23.y )
				ifLocalVar16_g23 = ( 0.0 / 0.0 );
			float ifLocalVar15_g23 = 0;
			if( break9_g23.x < break13_g23.x )
				ifLocalVar15_g23 = ifLocalVar16_g23;
			float ifLocalVar14_g23 = 0;
			if( break9_g23.y > break11_g23.y )
				ifLocalVar14_g23 = ifLocalVar15_g23;
			float ifLocalVar1_g23 = 0;
			if( break9_g23.x > break11_g23.x )
				ifLocalVar1_g23 = ifLocalVar14_g23;
			float ifLocalVar18_g23 = 0;
			if( (( _DiscardUVTile33 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g23 = ifLocalVar1_g23;
			float UVTileDiscard232 = ( ( ifLocalVar18_g35 + ifLocalVar18_g34 + ifLocalVar18_g32 + ifLocalVar18_g33 ) + ( ifLocalVar18_g28 + ifLocalVar18_g29 + ifLocalVar18_g30 + ifLocalVar18_g31 ) + ( ifLocalVar18_g24 + ifLocalVar18_g25 + ifLocalVar18_g26 + ifLocalVar18_g27 ) + ( ifLocalVar18_g20 + ifLocalVar18_g21 + ifLocalVar18_g22 + ifLocalVar18_g23 ) );
			float2 break9_g17 = DiscardUV237;
			float4 break279 = _UVRangeDiscard1Range;
			float2 appendResult280 = (float2(break279.x , break279.y));
			float2 break11_g17 = appendResult280;
			float2 appendResult281 = (float2(break279.z , break279.w));
			float2 break13_g17 = appendResult281;
			float ifLocalVar16_g17 = 0;
			if( break11_g17.y < break13_g17.y )
				ifLocalVar16_g17 = ( 0.0 / 0.0 );
			float ifLocalVar15_g17 = 0;
			if( break9_g17.x < break13_g17.x )
				ifLocalVar15_g17 = ifLocalVar16_g17;
			float ifLocalVar14_g17 = 0;
			if( break9_g17.y > break11_g17.y )
				ifLocalVar14_g17 = ifLocalVar15_g17;
			float ifLocalVar1_g17 = 0;
			if( break9_g17.x > break11_g17.x )
				ifLocalVar1_g17 = ifLocalVar14_g17;
			float ifLocalVar18_g17 = 0;
			if( (( _UVRangeDiscard1 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g17 = ifLocalVar1_g17;
			float2 break9_g18 = DiscardUV237;
			float4 break285 = _UVRangeDiscard2Range;
			float2 appendResult287 = (float2(break285.x , break285.y));
			float2 break11_g18 = appendResult287;
			float2 appendResult288 = (float2(break285.z , break285.w));
			float2 break13_g18 = appendResult288;
			float ifLocalVar16_g18 = 0;
			if( break11_g18.y < break13_g18.y )
				ifLocalVar16_g18 = ( 0.0 / 0.0 );
			float ifLocalVar15_g18 = 0;
			if( break9_g18.x < break13_g18.x )
				ifLocalVar15_g18 = ifLocalVar16_g18;
			float ifLocalVar14_g18 = 0;
			if( break9_g18.y > break11_g18.y )
				ifLocalVar14_g18 = ifLocalVar15_g18;
			float ifLocalVar1_g18 = 0;
			if( break9_g18.x > break11_g18.x )
				ifLocalVar1_g18 = ifLocalVar14_g18;
			float ifLocalVar18_g18 = 0;
			if( (( _UVRangeDiscard2 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g18 = ifLocalVar1_g18;
			float2 break9_g19 = DiscardUV237;
			float4 break292 = _UVRangeDiscard3Range;
			float2 appendResult293 = (float2(break292.x , break292.y));
			float2 break11_g19 = appendResult293;
			float2 appendResult294 = (float2(break292.z , break292.w));
			float2 break13_g19 = appendResult294;
			float ifLocalVar16_g19 = 0;
			if( break11_g19.y < break13_g19.y )
				ifLocalVar16_g19 = ( 0.0 / 0.0 );
			float ifLocalVar15_g19 = 0;
			if( break9_g19.x < break13_g19.x )
				ifLocalVar15_g19 = ifLocalVar16_g19;
			float ifLocalVar14_g19 = 0;
			if( break9_g19.y > break11_g19.y )
				ifLocalVar14_g19 = ifLocalVar15_g19;
			float ifLocalVar1_g19 = 0;
			if( break9_g19.x > break11_g19.x )
				ifLocalVar1_g19 = ifLocalVar14_g19;
			float ifLocalVar18_g19 = 0;
			if( (( _UVRangeDiscard3 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g19 = ifLocalVar1_g19;
			float UVRangeDiscard300 = ( ifLocalVar18_g17 + ifLocalVar18_g18 + ifLocalVar18_g19 );
			float3 temp_cast_0 = (( UVTileDiscard232 + UVRangeDiscard300 )).xxx;
			v.vertex.xyz += temp_cast_0;
			v.vertex.w = 1;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float2 uv_normalMap = i.uv_texcoord * _normalMap_ST.xy + _normalMap_ST.zw;
			float3 normalMap35 = UnpackNormal( tex2D( _normalMap, uv_normalMap ) );
			UnityGI gi432 = gi;
			float3 diffNorm432 = normalMap35;
			gi432 = UnityGI_Base( data, 1, diffNorm432 );
			float3 indirectDiffuse432 = gi432.indirect.diffuse + diffNorm432 * 0.0001;
			float2 uv_mainTex = i.uv_texcoord * _mainTex_ST.xy + _mainTex_ST.zw;
			float4 mainTex26 = tex2D( _mainTex, uv_mainTex );
			float4 mainTexClamped403 = (float4( 0.01,0.01,0.01,0 ) + (mainTex26 - float4( 0,0,0,0 )) * (float4( 1,1,1,1 ) - float4( 0.01,0.01,0.01,0 )) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
			float4 ase_vertex4Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 ase_objectlightDir = normalize( ObjSpaceLightDir( ase_vertex4Pos ) );
			float dotResult451 = dot( ase_objectlightDir , (WorldNormalVector( i , normalMap35 )) );
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 Emission39 = ( tex2D( _Emission, uv_Emission ) * _EmissionStrength1 );
			float3 normalizeResult9 = normalize( i.viewDir );
			float dotResult10 = dot( UnpackNormal( tex2D( _RimNormalMap, i.uv_texcoord ) ) , normalizeResult9 );
			float4 temp_cast_5 = (1.0).xxxx;
			float4 lerpResult118 = lerp( temp_cast_5 , mainTex26 , _RimBaseColorStrength);
			float4 Rim16 = ( _EnableRimLighting * ( ( pow( ( 1.0 - saturate( dotResult10 ) ) , ( 10.0 - _RimPower ) ) * _RimEnergy ) * lerpResult118 ) );
			float4 EmissionFinal29 = ( Emission39 + Rim16 );
			float4 TestLighting441 = ( ( ( float4( indirectDiffuse432 , 0.0 ) * mainTexClamped403 ) * float4( ( dotResult451 * ase_lightColor.rgb ) , 0.0 ) ) + EmissionFinal29 );
			float3 objToWorld328 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
			float3 ase_worldPos = i.worldPos;
			float4 FlatLightColor372 = ase_lightColor;
			float2 uv_MultiMap = i.uv_texcoord * _MultiMap_ST.xy + _MultiMap_ST.zw;
			float4 multiMap90 = tex2D( _MultiMap, uv_MultiMap );
			float4 break470 = multiMap90;
			float3 indirectNormal466 = normalize( WorldNormalVector( i , normalMap35 ) );
			Unity_GlossyEnvironmentData g466 = UnityGlossyEnvironmentSetup( break470.g, data.worldViewDir, indirectNormal466, float3(0,0,0));
			float3 indirectSpecular466 = UnityGI_IndirectSpecular( data, 1.0, indirectNormal466, g466 );
			float4 Lighting_Flat339 = ( ( ( ( ( _WorldSpaceLightPos0.w == 0.0 ? ( 1.0 - (0.0 + (distance( objToWorld328 , ase_worldPos ) - 0.0) * (1.0 - 0.0) / (_MaxFlatLightDistance - 0.0)) ) : 1.0 ) * FlatLightColor372 ) + unity_AmbientSky ) * mainTexClamped403 ) + float4( ( break470.r * indirectSpecular466 ) , 0.0 ) );
			SurfaceOutputStandard s309 = (SurfaceOutputStandard ) 0;
			s309.Albedo = mainTex26.rgb;
			s309.Normal = normalize( WorldNormalVector( i , normalMap35 ) );
			s309.Emission = EmissionFinal29.rgb;
			float4 break95 = multiMap90;
			s309.Metallic = break95.r;
			s309.Smoothness = break95.g;
			s309.Occlusion = 1.0;

			data.light = gi.light;

			UnityGI gi309 = gi;
			#ifdef UNITY_PASS_FORWARDBASE
			Unity_GlossyEnvironmentData g309 = UnityGlossyEnvironmentSetup( s309.Smoothness, data.worldViewDir, s309.Normal, float3(0,0,0));
			gi309 = UnityGlobalIllumination( data, s309.Occlusion, s309.Normal, g309 );
			#endif

			float3 surfResult309 = LightingStandard ( s309, viewDir, gi309 ).rgb;
			surfResult309 += s309.Emission;

			#ifdef UNITY_PASS_FORWARDADD//309
			surfResult309 -= s309.Emission;
			#endif//309
			float3 Lighting_Standard313 = surfResult309;
			float4 LightingFinal348 = ( _LightingType == 2.0 ? TestLighting441 : ( _LightingType == 1.0 ? Lighting_Flat339 : float4( Lighting_Standard313 , 0.0 ) ) );
			c.rgb = LightingFinal348.rgb;
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
			float2 uv_mainTex = i.uv_texcoord * _mainTex_ST.xy + _mainTex_ST.zw;
			float4 mainTex26 = tex2D( _mainTex, uv_mainTex );
			o.Albedo = mainTex26.rgb;
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 Emission39 = ( tex2D( _Emission, uv_Emission ) * _EmissionStrength1 );
			float3 normalizeResult9 = normalize( i.viewDir );
			float dotResult10 = dot( UnpackNormal( tex2D( _RimNormalMap, i.uv_texcoord ) ) , normalizeResult9 );
			float4 temp_cast_1 = (1.0).xxxx;
			float4 lerpResult118 = lerp( temp_cast_1 , mainTex26 , _RimBaseColorStrength);
			float4 Rim16 = ( _EnableRimLighting * ( ( pow( ( 1.0 - saturate( dotResult10 ) ) , ( 10.0 - _RimPower ) ) * _RimEnergy ) * lerpResult118 ) );
			float4 EmissionFinal29 = ( Emission39 + Rim16 );
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
				surfIN.worldPos = worldPos;
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
Node;AmplifyShaderEditor.CommentaryNode;405;5347.928,-2049.318;Inherit;False;753.479;304;Comment;3;363;316;403;MainTexClamped;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;376;4254.456,-4323.816;Inherit;False;513.0223;304.3708;Comment;2;372;364;Flat Light Color (Clamp Toggle);1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;351;3839.958,-3130.737;Inherit;False;1309.861;1035.514;Comment;29;321;330;357;317;337;338;322;353;329;319;318;328;320;377;379;382;404;407;408;466;469;470;472;473;474;475;471;383;339;Flat Lighting;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;350;2900.431,-1502.618;Inherit;False;1184.626;975.1958;Comment;7;386;345;348;340;347;346;443;Pick Lighting Type;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;312;2479.957,-3114.737;Inherit;False;1151.4;546.5259;Comment;7;313;92;95;36;311;310;309;Standard Lighting;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;301;4485.876,-16.47354;Inherit;False;1473.337;1437.826;Comment;23;279;277;280;281;282;276;284;285;287;288;289;290;291;286;292;293;294;295;296;298;297;300;299;UV Range Discard;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;256;1781.625,-1763.974;Inherit;False;925.788;862.407;Comment;7;303;302;233;0;33;32;314;Output;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;255;226.5768,-1809.824;Inherit;False;420.8079;185;Comment;2;186;187;Declare NaN;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;254;-742.4367,481.1946;Inherit;False;485.198;209;Comment;2;236;237;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;188;-822.572,2635.338;Inherit;False;3894.102;1488.582;Comment;58;205;232;306;275;274;261;260;265;264;263;262;269;268;267;266;307;308;270;271;272;273;221;305;304;168;167;238;253;252;251;250;249;248;247;246;245;244;243;242;241;240;239;227;224;225;226;213;209;211;212;214;174;192;190;195;197;204;171;UV Tile Discard;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-1965.349,-2029.931;Inherit;False;628.8561;285.3137;Comment;2;35;34;Normal Map;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;31;-839.0011,-1985.27;Inherit;False;648.9465;356.8036;Comment;4;29;30;108;28;Emission Combination;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;27;-2452.932,-2474.635;Inherit;False;1166.821;401.1638;Comment;4;420;25;26;424;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1;-2449.5,-704.6942;Inherit;False;2343.663;988.2891;Comment;21;16;8;10;131;87;4;119;128;120;118;113;12;9;88;7;15;14;13;11;335;336;Rim;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;35;-1560.493,-1979.931;Inherit;False;normalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;34;-1915.349,-1974.617;Inherit;True;Property;_normalMap;normalMap;3;0;Create;True;0;0;0;False;0;False;-1;13ce54de7ec2bdd45a3ceb8a5e5e4cad;2104d692ecfb6c548b9894d8b46f27f8;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;38;-2315.477,-3043.785;Inherit;False;1065.027;433.5916;Comment;5;40;39;129;130;421;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;26;-1510.111,-2420.833;Inherit;False;mainTex;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;89;-813.4411,-2813.33;Inherit;False;604.8932;280;R = Metalic, G = Smoothness;2;91;90;MultiMap;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;90;-424.5481,-2761.528;Inherit;False;multiMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;28;-818.3403,-1824.771;Inherit;False;16;Rim;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;108;-813.64,-1923.391;Inherit;False;39;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;-626.0837,-1896.316;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;29;-402.084,-1896.316;Inherit;False;EmissionFinal;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;11;-1600.007,-440.8102;Inherit;False;1;0;FLOAT;1.23;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;13;-1431.003,-398.511;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;14;-1654.997,-313.2027;Inherit;False;2;0;FLOAT;10;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;15;-1238.205,-375.1104;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;7;-2200.706,-388.5101;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;88;-1030.479,-339.509;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;9;-1989.453,-379.9426;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-2070.835,-228.9134;Float;False;Property;_RimPower;Rim Power;8;0;Create;True;0;0;0;False;0;False;2.07;3.39;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;113;-1466.542,100.4863;Inherit;False;Property;_RimBaseColorStrength;Rim Base Color Strength;11;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;118;-1142.086,-49.99364;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-852.0566,-208.7814;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;128;-1522.135,-55.94977;Inherit;False;Constant;_Float0;Float 0;10;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;119;-1381.133,28.2931;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;4;-2388.392,-585.3505;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;87;-1314.283,-215.7726;Inherit;False;Property;_RimEnergy;Rim Energy;9;0;Create;True;0;0;0;False;0;False;0.345;0.25;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;131;-2404.824,-375.8046;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DotProductOpNode;10;-1811.64,-545.5266;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;8;-2139.788,-626.5024;Inherit;True;Property;_RimNormalMap;Rim Normal Map;10;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;186;276.5768,-1759.824;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;187;423.3846,-1758.21;Inherit;False;NaN;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;32;1932.747,-1538.049;Inherit;False;29;EmissionFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;1918.254,-1713.974;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2417.414,-1478.567;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;VoyVivika/DivorceShaders/Depricated/Divorce Main (Deprecated);False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;_CullMode;-1;0;False;;1;Include;Assets/AudioLink/Shaders/AudioLink.cginc;False;;Custom;False;0;0;;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;236;-691.4367,528.1946;Inherit;False;1;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;237;-481.2387,536.2844;Inherit;False;DiscardUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;91;-795.4411,-2748.33;Inherit;True;Property;_MultiMap;MultiMap;4;0;Create;True;0;0;0;False;0;False;-1;01e8d4996fddd0a448744957657de587;625d9feb77ca39242ba429b178a2e3db;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;233;2034.718,-1160.385;Inherit;False;232;UVTileDiscard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;302;2253.145,-1116.778;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;303;2017.145,-1049.778;Inherit;False;300;UVRangeDiscard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;279;4795.875,275.4184;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;280;4929.314,251.4478;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;281;4929.314,347.4476;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;282;4887.924,176.0759;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;276;5112.833,152.2467;Inherit;False;UV Range Discard;-1;;17;59eaa82e4bf18fa44b47aa07cd25b8a2;0;4;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;12;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;285;4825.462,725.6503;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;287;4958.899,701.6797;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;288;4958.899,797.6796;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;289;4917.509,626.3079;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;290;5142.418,602.479;Inherit;False;UV Range Discard;-1;;18;59eaa82e4bf18fa44b47aa07cd25b8a2;0;4;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;12;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;286;4565.462,722.6503;Inherit;False;Property;_UVRangeDiscard2Range;UV Range Discard 2 Range;30;0;Create;True;0;0;0;False;0;False;0,0,1,1;0,0,1,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;292;4888.376,1212.352;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;293;5021.814,1188.382;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;294;5021.814,1284.382;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;295;4980.423,1113.01;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;299;5512.815,583.2231;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;300;5725.213,630.923;Inherit;False;UVRangeDiscard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;298;4628.377,1209.352;Inherit;False;Property;_UVRangeDiscard3Range;UV Range Discard 3 Range;32;0;Create;True;0;0;0;False;0;False;0,0,1,1;0,0,1,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;296;5205.332,1089.181;Inherit;False;UV Range Discard;-1;;19;59eaa82e4bf18fa44b47aa07cd25b8a2;0;4;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;12;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;277;4535.876,272.4184;Inherit;False;Property;_UVRangeDiscard1Range;UV Range Discard 1 Range;28;1;[Header];Create;True;3;UV Range Discard;X and Y are Start UVs;Z and W are End UVs;0;0;False;0;False;0,0,1,1;0,0,1,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;284;4830.258,33.52643;Inherit;False;Property;_UVRangeDiscard1;UV Range Discard 1;29;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;291;4859.844,483.7585;Inherit;False;Property;_UVRangeDiscard2;UV Range Discard 2;31;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;297;4923.758,970.4604;Inherit;False;Property;_UVRangeDiscard3;UV Range Discard 3;33;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;171;-172.638,3601.526;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;204;614.7222,3635.828;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;197;8.162607,3063.744;Inherit;False;Property;_DiscardUVTile10;Discard UV Tile 1,0;16;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;195;5.422495,3286.518;Inherit;False;Property;_DiscardUVTile11;Discard UV Tile 1,1;17;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;190;-9.537224,3549.715;Inherit;False;Property;_DiscardUVTile12;Discard UV Tile 1,2;18;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;192;-2.635979,3797.332;Inherit;False;Property;_DiscardUVTile13;Discard UV Tile 1,3;19;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;174;-765.6708,3781.231;Inherit;False;Property;_DiscardUVTile03;Discard UV Tile 0,3;15;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;214;1410.908,3509.575;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;212;786.6468,3559.906;Inherit;False;Property;_DiscardUVTile22;Discard UV Tile 2,2;22;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;211;786.7757,3320.437;Inherit;False;Property;_DiscardUVTile21;Discard UV Tile 2,1;21;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;209;791.482,3082.833;Inherit;False;Property;_DiscardUVTile20;Discard UV Tile 2,0;20;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;213;793.5479,3807.524;Inherit;False;Property;_DiscardUVTile23;Discard UV Tile 2,3;23;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;226;1586.574,3080.797;Inherit;False;Property;_DiscardUVTile30;Discard UV Tile 3,0;24;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;225;1581.868,3318.402;Inherit;False;Property;_DiscardUVTile31;Discard UV Tile 3,1;25;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;224;1581.738,3558.871;Inherit;False;Property;_DiscardUVTile32;Discard UV Tile 3,2;26;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;227;1588.64,3805.487;Inherit;False;Property;_DiscardUVTile33;Discard UV Tile 3,3;27;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;239;-737.2264,3384.805;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;240;-753.2264,3640.805;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;241;-748.2264,3890.806;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;242;12.95204,3906.991;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;243;7.952158,3660.99;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;244;35.95204,3412.99;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;245;19.98512,3174.903;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;246;784.6675,3223.846;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;247;806.6674,3451.845;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;248;813.6674,3699.845;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;249;811.6811,3942.884;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;250;1607.216,3203.777;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;251;1624.216,3434.777;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;252;1593.216,3670.777;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;253;1612.216,3932.778;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;238;-739.9169,3166.196;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ToggleSwitchNode;167;-756.6124,3270.417;Inherit;False;Property;_DiscardUVTile01;Discard UV Tile 0,1;13;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;168;-772.5721,3534.614;Inherit;False;Property;_DiscardUVTile02;Discard UV Tile 0,2;14;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;304;-783.1028,3076.51;Half;False;Property;_DiscardUVTile00;Discard UV Tile 0,0;12;2;[Header];[ToggleUI];Create;True;1;UV Tile Discard;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;305;-79.51695,2924.058;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;221;2216.171,3578.736;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;273;1873.625,3138.033;Inherit;False;UV Tile Discard;-1;;20;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;272;1867.804,3353.085;Inherit;False;UV Tile Discard;-1;;21;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;271;1883.753,3586.717;Inherit;False;UV Tile Discard;-1;;22;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;270;1881.614,3823.578;Inherit;False;UV Tile Discard;-1;;23;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;308;2379.37,3073.721;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;307;1556.677,3011.856;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;266;1065.404,3128.607;Inherit;False;UV Tile Discard;-1;;24;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;267;1062.931,3353.697;Inherit;False;UV Tile Discard;-1;;25;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;268;1065.495,3597.368;Inherit;False;UV Tile Discard;-1;;26;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;269;1073.395,3844.268;Inherit;False;UV Tile Discard;-1;;27;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;262;262.1092,3109.086;Inherit;False;UV Tile Discard;-1;;28;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;263;259.2689,3338.076;Inherit;False;UV Tile Discard;-1;;29;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;264;251.2689,3608.077;Inherit;False;UV Tile Discard;-1;;30;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;265;255.2689,3851.076;Inherit;False;UV Tile Discard;-1;;31;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;260;-479.0556,3588.273;Inherit;False;UV Tile Discard;-1;;32;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;261;-474.0557,3832.273;Inherit;False;UV Tile Discard;-1;;33;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;274;-467.0557,3321.273;Inherit;False;UV Tile Discard;-1;;34;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;275;-466.2154,3089.283;Inherit;False;UV Tile Discard;-1;;35;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;306;771.8914,2908.535;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;232;2790.612,2906.184;Inherit;False;UVTileDiscard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;205;2513.174,2876.624;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;336;-571.3125,-417.429;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;16;-338.8839,-216.0253;Float;True;Rim;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;314;2151.453,-1312.354;Inherit;False;348;LightingFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.CustomStandardSurface;309;3039.958,-3002.737;Inherit;False;Metallic;Tangent;6;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,1;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;310;2735.958,-3066.737;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;311;2735.958,-2906.737;Inherit;False;29;EmissionFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;36;2751.958,-2986.737;Inherit;False;35;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;313;3327.958,-3002.737;Inherit;False;Lighting_Standard;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-865.3125,-491.429;Half;False;Property;_EnableRimLighting;Enable Rim Lighting;7;1;[ToggleUI];Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;347;3064.501,-1089.109;Inherit;False;339;Lighting_Flat;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;345;3344.026,-1204.659;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0,0,0,0;False;3;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;387;3322.653,-1259.189;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;388;3483.653,-1260.189;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;346;3036.501,-999.1086;Inherit;False;313;Lighting_Standard;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;348;3741.844,-1176.947;Inherit;False;LightingFinal;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;386;3532.958,-1201.029;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;363;5571.339,-1999.318;Inherit;True;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;3;COLOR;0.01,0.01,0.01,0;False;4;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;316;5397.928,-1956.435;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;421;-2292.207,-2983.151;Inherit;True;Property;_Emission;Emission;5;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;40;-1931.313,-2981.518;Inherit;True;Property;_EmissionSample;EmissionSample;4;0;Create;True;0;0;0;False;0;False;-1;83f90c05f51ea5c469ceb2c4218b09a7;83f90c05f51ea5c469ceb2c4218b09a7;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;129;-1615.492,-2882.704;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;-1483.536,-2883.642;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;422;-1670.462,-2793.235;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;423;-1378.249,-2760.966;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;130;-1612.778,-2719.39;Inherit;False;Property;_EmissionStrength1;Emission Strength;6;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;420;-2424.562,-2420.562;Inherit;True;Property;_mainTex;mainTex;2;0;Create;True;0;0;0;False;0;False;None;135eca2d9812d82469854770ec8b1cbe;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;25;-1799.935,-2421.444;Inherit;True;Property;_mainTexSample;mainTexSample;2;0;Create;True;0;0;0;False;0;False;-1;0db631ddb1a2c1443b81c6ac5ce43d11;135eca2d9812d82469854770ec8b1cbe;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;424;-2079.263,-2345.092;Inherit;False;mainTexObj;-1;True;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.CommentaryNode;429;8929.558,-3930.048;Inherit;False;2543.834;1608.097;Comment;22;441;442;439;438;437;436;435;434;433;432;431;430;444;445;447;451;452;453;454;457;458;460;Test Lighting;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;430;8957.017,-3855.559;Inherit;False;35;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;431;9475.705,-3749.828;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IndirectDiffuseLighting;432;9133.017,-3871.559;Inherit;True;World;1;0;FLOAT3;0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;433;9132.436,-3647.148;Inherit;False;403;mainTexClamped;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;434;9099.977,-3297.276;Inherit;True;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;435;9098.566,-3546.117;Inherit;True;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;437;9355.42,-3444.48;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;438;9582.354,-3402.238;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;442;9807.198,-3385.041;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-0.5;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;443;3353.773,-972.0173;Inherit;False;441;TestLighting;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;340;3163.911,-1204.394;Inherit;False;Property;_LightingType;Lighting Type;0;2;[Header];[Enum];Create;True;0;3;Standard;0;Flat;1;Test;2;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;445;10576.6,-3525.627;Inherit;False;29;EmissionFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LightAttenuation;436;9352.394,-3259.129;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.FogAndAmbientColorsNode;447;10556.41,-3416.129;Inherit;False;unity_AmbientEquator;0;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;444;10870.15,-3755.151;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;439;9722.709,-3722.344;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;455;9952.249,-3469.378;Inherit;False;35;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;457;10901.68,-3300.901;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;458;9710.784,-3480.281;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;459;10024.7,-3099.933;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;454;10044.03,-3705.675;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LightColorNode;453;10232.83,-3502.393;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;452;10512.67,-3643.735;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;451;10265.24,-3789.502;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;441;11192.51,-3832.345;Inherit;False;TestLighting;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ObjSpaceLightDirHlpNode;460;10005.79,-3869.407;Inherit;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;92;2527.957,-2906.737;Inherit;False;90;multiMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;95;2734.323,-2826.737;Inherit;True;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DistanceOpNode;319;4159.958,-3082.737;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;329;4415.958,-3082.737;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;5;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;322;4607.958,-3082.737;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;338;4639.958,-2938.737;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;330;4157.958,-2976.737;Half;False;Property;_MaxFlatLightDistance;Max Flat Light Distance;1;0;Create;True;0;0;0;False;0;False;8;8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;320;3935.958,-2922.737;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TransformPositionNode;328;3903.958,-3082.737;Inherit;False;Object;World;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceLightPos;318;3887.958,-2778.737;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.WireNode;337;4184.07,-2894.549;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;379;4219.492,-2878.296;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;382;4183.615,-2740.661;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;383;4388.615,-2762.661;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FogAndAmbientColorsNode;353;3894.154,-2561.179;Inherit;False;unity_AmbientSky;0;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;321;4198.556,-2674.424;Inherit;False;2;2;0;FLOAT;1;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;357;4366.857,-2663.252;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IndirectDiffuseLighting;408;4052.745,-2389.297;Inherit;True;World;1;0;FLOAT3;0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;407;3867.244,-2326.195;Inherit;False;35;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;471;4840.255,-2552.69;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;469;4289.304,-2305.901;Inherit;False;90;multiMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;470;4461.831,-2335.742;Inherit;True;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.IndirectSpecularLight;466;4686.826,-2313.573;Inherit;False;Tangent;3;0;FLOAT3;0,0,1;False;1;FLOAT;0.5;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;473;4707.169,-2423.722;Inherit;False;2;2;0;FLOAT;1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;475;4681.035,-2345.146;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;474;4893.035,-2339.146;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;472;4478.856,-2429.055;Inherit;False;35;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;317;4596.146,-2657.818;Inherit;True;2;2;0;COLOR;1,1,1,0;False;1;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;339;4938.544,-2704.094;Inherit;False;Lighting_Flat;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;403;5863.407,-1982.299;Inherit;False;mainTexClamped;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;404;4328.524,-2534.975;Inherit;False;403;mainTexClamped;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;377;3892.577,-2668.03;Inherit;False;372;FlatLightColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;364;4294.072,-4224.155;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RegisterLocalVarNode;372;4493.596,-4219.198;Inherit;False;FlatLightColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
WireConnection;35;0;34;0
WireConnection;26;0;25;0
WireConnection;90;0;91;0
WireConnection;30;0;108;0
WireConnection;30;1;28;0
WireConnection;29;0;30;0
WireConnection;11;0;10;0
WireConnection;13;0;11;0
WireConnection;14;1;12;0
WireConnection;15;0;13;0
WireConnection;15;1;14;0
WireConnection;88;0;15;0
WireConnection;88;1;87;0
WireConnection;9;0;7;0
WireConnection;118;0;128;0
WireConnection;118;1;119;0
WireConnection;118;2;113;0
WireConnection;120;0;88;0
WireConnection;120;1;118;0
WireConnection;10;0;8;0
WireConnection;10;1;9;0
WireConnection;8;1;4;0
WireConnection;187;0;186;0
WireConnection;0;0;33;0
WireConnection;0;2;32;0
WireConnection;0;13;314;0
WireConnection;0;11;302;0
WireConnection;237;0;236;0
WireConnection;302;0;233;0
WireConnection;302;1;303;0
WireConnection;279;0;277;0
WireConnection;280;0;279;0
WireConnection;280;1;279;1
WireConnection;281;0;279;2
WireConnection;281;1;279;3
WireConnection;276;21;284;0
WireConnection;276;6;282;0
WireConnection;276;10;280;0
WireConnection;276;12;281;0
WireConnection;285;0;286;0
WireConnection;287;0;285;0
WireConnection;287;1;285;1
WireConnection;288;0;285;2
WireConnection;288;1;285;3
WireConnection;290;21;291;0
WireConnection;290;6;289;0
WireConnection;290;10;287;0
WireConnection;290;12;288;0
WireConnection;292;0;298;0
WireConnection;293;0;292;0
WireConnection;293;1;292;1
WireConnection;294;0;292;2
WireConnection;294;1;292;3
WireConnection;299;0;276;0
WireConnection;299;1;290;0
WireConnection;299;2;296;0
WireConnection;300;0;299;0
WireConnection;296;21;297;0
WireConnection;296;6;295;0
WireConnection;296;10;293;0
WireConnection;296;12;294;0
WireConnection;171;0;275;0
WireConnection;171;1;274;0
WireConnection;171;2;260;0
WireConnection;171;3;261;0
WireConnection;204;0;262;0
WireConnection;204;1;263;0
WireConnection;204;2;264;0
WireConnection;204;3;265;0
WireConnection;214;0;266;0
WireConnection;214;1;267;0
WireConnection;214;2;268;0
WireConnection;214;3;269;0
WireConnection;305;0;171;0
WireConnection;221;0;273;0
WireConnection;221;1;272;0
WireConnection;221;2;271;0
WireConnection;221;3;270;0
WireConnection;273;21;226;0
WireConnection;273;6;250;0
WireConnection;272;21;225;0
WireConnection;272;6;251;0
WireConnection;271;21;224;0
WireConnection;271;6;252;0
WireConnection;270;21;227;0
WireConnection;270;6;253;0
WireConnection;308;0;221;0
WireConnection;307;0;214;0
WireConnection;266;21;209;0
WireConnection;266;6;246;0
WireConnection;267;21;211;0
WireConnection;267;6;247;0
WireConnection;268;21;212;0
WireConnection;268;6;248;0
WireConnection;269;21;213;0
WireConnection;269;6;249;0
WireConnection;262;21;197;0
WireConnection;262;6;245;0
WireConnection;263;21;195;0
WireConnection;263;6;244;0
WireConnection;264;21;190;0
WireConnection;264;6;243;0
WireConnection;265;21;192;0
WireConnection;265;6;242;0
WireConnection;260;21;168;0
WireConnection;260;6;240;0
WireConnection;261;21;174;0
WireConnection;261;6;241;0
WireConnection;274;21;167;0
WireConnection;274;6;239;0
WireConnection;275;21;304;0
WireConnection;275;6;238;0
WireConnection;306;0;204;0
WireConnection;232;0;205;0
WireConnection;205;0;305;0
WireConnection;205;1;306;0
WireConnection;205;2;307;0
WireConnection;205;3;308;0
WireConnection;336;0;335;0
WireConnection;336;1;120;0
WireConnection;16;0;336;0
WireConnection;309;0;310;0
WireConnection;309;1;36;0
WireConnection;309;2;311;0
WireConnection;309;3;95;0
WireConnection;309;4;95;1
WireConnection;313;0;309;0
WireConnection;345;0;340;0
WireConnection;345;2;347;0
WireConnection;345;3;346;0
WireConnection;387;0;340;0
WireConnection;388;0;387;0
WireConnection;348;0;386;0
WireConnection;386;0;388;0
WireConnection;386;2;443;0
WireConnection;386;3;345;0
WireConnection;363;0;316;0
WireConnection;40;0;421;0
WireConnection;129;0;40;0
WireConnection;129;1;422;0
WireConnection;39;0;129;0
WireConnection;422;0;423;0
WireConnection;423;0;130;0
WireConnection;25;0;420;0
WireConnection;424;0;420;0
WireConnection;431;0;432;0
WireConnection;431;1;433;0
WireConnection;432;0;430;0
WireConnection;437;0;435;0
WireConnection;437;1;434;0
WireConnection;438;0;437;0
WireConnection;438;1;436;0
WireConnection;442;0;438;0
WireConnection;444;0;439;0
WireConnection;444;1;445;0
WireConnection;439;0;431;0
WireConnection;439;1;458;0
WireConnection;457;0;452;0
WireConnection;458;0;459;0
WireConnection;459;0;457;0
WireConnection;454;0;455;0
WireConnection;452;0;451;0
WireConnection;452;1;453;1
WireConnection;451;0;460;0
WireConnection;451;1;454;0
WireConnection;441;0;444;0
WireConnection;95;0;92;0
WireConnection;319;0;328;0
WireConnection;319;1;320;0
WireConnection;329;0;319;0
WireConnection;329;2;330;0
WireConnection;322;0;329;0
WireConnection;338;0;322;0
WireConnection;337;0;338;0
WireConnection;379;0;318;2
WireConnection;379;2;337;0
WireConnection;382;0;383;0
WireConnection;383;0;379;0
WireConnection;321;0;382;0
WireConnection;321;1;377;0
WireConnection;357;0;321;0
WireConnection;357;1;353;0
WireConnection;408;0;407;0
WireConnection;471;0;317;0
WireConnection;471;1;473;0
WireConnection;470;0;469;0
WireConnection;466;0;472;0
WireConnection;466;1;470;1
WireConnection;473;0;470;0
WireConnection;473;1;475;0
WireConnection;475;0;474;0
WireConnection;474;0;466;0
WireConnection;317;0;357;0
WireConnection;317;1;404;0
WireConnection;339;0;471;0
WireConnection;403;0;363;0
WireConnection;372;0;364;0
ASEEND*/
//CHKSM=A4FE861B492F5A693F9A6E9683FC9FA0F96C72D1