// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VoyVivika/DivorceShaders/Divorce Main"
{
	Properties
	{
		_RimNormalMap("Rim Normal Map", 2D) = "bump" {}
		_mainTex("mainTex", 2D) = "white" {}
		_normalMap("normalMap", 2D) = "bump" {}
		_MultiMap("MultiMap", 2D) = "white" {}
		_Emission("Emission", 2D) = "black" {}
		_RimPower("Rim Power", Range( 0 , 10)) = 2.07
		_RimEnergy("Rim Energy", Range( 0 , 1)) = 0.345
		_EmissionStrength1("Emission Strength", Range( 0 , 1)) = 0
		_RimBaseColorStrength("Rim Base Color Strength", Range( 0 , 1)) = 1
		[ToggleUI]_DiscardUVTile00("Discard UV Tile 0,0", Float) = 0
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
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull [_CullMode]
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
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
		};

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
		uniform sampler2D _normalMap;
		uniform float4 _normalMap_ST;
		uniform sampler2D _mainTex;
		uniform float4 _mainTex_ST;
		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;
		uniform float _EmissionStrength1;
		uniform sampler2D _RimNormalMap;
		uniform float _RimPower;
		uniform float _RimEnergy;
		uniform float _RimBaseColorStrength;
		uniform sampler2D _MultiMap;
		uniform float4 _MultiMap_ST;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 DiscardUV237 = v.texcoord1.xy;
			float2 break9_g10 = DiscardUV237;
			float2 temp_output_24_0_g10 = floor( float2( 0,0 ) );
			float2 break11_g10 = temp_output_24_0_g10;
			float2 break13_g10 = ( temp_output_24_0_g10 + float2( 1,1 ) );
			float ifLocalVar16_g10 = 0;
			if( break11_g10.y < break13_g10.y )
				ifLocalVar16_g10 = ( 0.0 / 0.0 );
			float ifLocalVar15_g10 = 0;
			if( break9_g10.x < break13_g10.x )
				ifLocalVar15_g10 = ifLocalVar16_g10;
			float ifLocalVar14_g10 = 0;
			if( break9_g10.y > break11_g10.y )
				ifLocalVar14_g10 = ifLocalVar15_g10;
			float ifLocalVar1_g10 = 0;
			if( break9_g10.x > break11_g10.x )
				ifLocalVar1_g10 = ifLocalVar14_g10;
			float ifLocalVar18_g10 = 0;
			if( (( _DiscardUVTile00 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g10 = ifLocalVar1_g10;
			float2 break9_g11 = DiscardUV237;
			float2 temp_output_24_0_g11 = floor( float2( 0,1 ) );
			float2 break11_g11 = temp_output_24_0_g11;
			float2 break13_g11 = ( temp_output_24_0_g11 + float2( 1,1 ) );
			float ifLocalVar16_g11 = 0;
			if( break11_g11.y < break13_g11.y )
				ifLocalVar16_g11 = ( 0.0 / 0.0 );
			float ifLocalVar15_g11 = 0;
			if( break9_g11.x < break13_g11.x )
				ifLocalVar15_g11 = ifLocalVar16_g11;
			float ifLocalVar14_g11 = 0;
			if( break9_g11.y > break11_g11.y )
				ifLocalVar14_g11 = ifLocalVar15_g11;
			float ifLocalVar1_g11 = 0;
			if( break9_g11.x > break11_g11.x )
				ifLocalVar1_g11 = ifLocalVar14_g11;
			float ifLocalVar18_g11 = 0;
			if( (( _DiscardUVTile01 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g11 = ifLocalVar1_g11;
			float2 break9_g12 = DiscardUV237;
			float2 temp_output_24_0_g12 = floor( float2( 0,2 ) );
			float2 break11_g12 = temp_output_24_0_g12;
			float2 break13_g12 = ( temp_output_24_0_g12 + float2( 1,1 ) );
			float ifLocalVar16_g12 = 0;
			if( break11_g12.y < break13_g12.y )
				ifLocalVar16_g12 = ( 0.0 / 0.0 );
			float ifLocalVar15_g12 = 0;
			if( break9_g12.x < break13_g12.x )
				ifLocalVar15_g12 = ifLocalVar16_g12;
			float ifLocalVar14_g12 = 0;
			if( break9_g12.y > break11_g12.y )
				ifLocalVar14_g12 = ifLocalVar15_g12;
			float ifLocalVar1_g12 = 0;
			if( break9_g12.x > break11_g12.x )
				ifLocalVar1_g12 = ifLocalVar14_g12;
			float ifLocalVar18_g12 = 0;
			if( (( _DiscardUVTile02 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g12 = ifLocalVar1_g12;
			float2 break9_g13 = DiscardUV237;
			float2 temp_output_24_0_g13 = floor( float2( 0,3 ) );
			float2 break11_g13 = temp_output_24_0_g13;
			float2 break13_g13 = ( temp_output_24_0_g13 + float2( 1,1 ) );
			float ifLocalVar16_g13 = 0;
			if( break11_g13.y < break13_g13.y )
				ifLocalVar16_g13 = ( 0.0 / 0.0 );
			float ifLocalVar15_g13 = 0;
			if( break9_g13.x < break13_g13.x )
				ifLocalVar15_g13 = ifLocalVar16_g13;
			float ifLocalVar14_g13 = 0;
			if( break9_g13.y > break11_g13.y )
				ifLocalVar14_g13 = ifLocalVar15_g13;
			float ifLocalVar1_g13 = 0;
			if( break9_g13.x > break11_g13.x )
				ifLocalVar1_g13 = ifLocalVar14_g13;
			float ifLocalVar18_g13 = 0;
			if( (( _DiscardUVTile03 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g13 = ifLocalVar1_g13;
			float2 break9_g15 = DiscardUV237;
			float2 temp_output_24_0_g15 = floor( float2( 1,0 ) );
			float2 break11_g15 = temp_output_24_0_g15;
			float2 break13_g15 = ( temp_output_24_0_g15 + float2( 1,1 ) );
			float ifLocalVar16_g15 = 0;
			if( break11_g15.y < break13_g15.y )
				ifLocalVar16_g15 = ( 0.0 / 0.0 );
			float ifLocalVar15_g15 = 0;
			if( break9_g15.x < break13_g15.x )
				ifLocalVar15_g15 = ifLocalVar16_g15;
			float ifLocalVar14_g15 = 0;
			if( break9_g15.y > break11_g15.y )
				ifLocalVar14_g15 = ifLocalVar15_g15;
			float ifLocalVar1_g15 = 0;
			if( break9_g15.x > break11_g15.x )
				ifLocalVar1_g15 = ifLocalVar14_g15;
			float ifLocalVar18_g15 = 0;
			if( (( _DiscardUVTile10 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g15 = ifLocalVar1_g15;
			float2 break9_g16 = DiscardUV237;
			float2 temp_output_24_0_g16 = floor( float2( 1,1 ) );
			float2 break11_g16 = temp_output_24_0_g16;
			float2 break13_g16 = ( temp_output_24_0_g16 + float2( 1,1 ) );
			float ifLocalVar16_g16 = 0;
			if( break11_g16.y < break13_g16.y )
				ifLocalVar16_g16 = ( 0.0 / 0.0 );
			float ifLocalVar15_g16 = 0;
			if( break9_g16.x < break13_g16.x )
				ifLocalVar15_g16 = ifLocalVar16_g16;
			float ifLocalVar14_g16 = 0;
			if( break9_g16.y > break11_g16.y )
				ifLocalVar14_g16 = ifLocalVar15_g16;
			float ifLocalVar1_g16 = 0;
			if( break9_g16.x > break11_g16.x )
				ifLocalVar1_g16 = ifLocalVar14_g16;
			float ifLocalVar18_g16 = 0;
			if( (( _DiscardUVTile11 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g16 = ifLocalVar1_g16;
			float2 break9_g17 = DiscardUV237;
			float2 temp_output_24_0_g17 = floor( float2( 1,2 ) );
			float2 break11_g17 = temp_output_24_0_g17;
			float2 break13_g17 = ( temp_output_24_0_g17 + float2( 1,1 ) );
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
			if( (( _DiscardUVTile12 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g17 = ifLocalVar1_g17;
			float2 break9_g18 = DiscardUV237;
			float2 temp_output_24_0_g18 = floor( float2( 1,3 ) );
			float2 break11_g18 = temp_output_24_0_g18;
			float2 break13_g18 = ( temp_output_24_0_g18 + float2( 1,1 ) );
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
			if( (( _DiscardUVTile13 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g18 = ifLocalVar1_g18;
			float2 break9_g20 = DiscardUV237;
			float2 temp_output_24_0_g20 = floor( float2( 2,0 ) );
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
			if( (( _DiscardUVTile20 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g20 = ifLocalVar1_g20;
			float2 break9_g21 = DiscardUV237;
			float2 temp_output_24_0_g21 = floor( float2( 2,1 ) );
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
			if( (( _DiscardUVTile21 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g21 = ifLocalVar1_g21;
			float2 break9_g22 = DiscardUV237;
			float2 temp_output_24_0_g22 = floor( float2( 2,2 ) );
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
			if( (( _DiscardUVTile22 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g22 = ifLocalVar1_g22;
			float2 break9_g23 = DiscardUV237;
			float2 temp_output_24_0_g23 = floor( float2( 2,3 ) );
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
			if( (( _DiscardUVTile23 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g23 = ifLocalVar1_g23;
			float2 break9_g24 = DiscardUV237;
			float2 temp_output_24_0_g24 = floor( float2( 3,0 ) );
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
			if( (( _DiscardUVTile30 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g24 = ifLocalVar1_g24;
			float2 break9_g25 = DiscardUV237;
			float2 temp_output_24_0_g25 = floor( float2( 3,1 ) );
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
			if( (( _DiscardUVTile31 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g25 = ifLocalVar1_g25;
			float2 break9_g26 = DiscardUV237;
			float2 temp_output_24_0_g26 = floor( float2( 3,2 ) );
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
			if( (( _DiscardUVTile32 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g26 = ifLocalVar1_g26;
			float2 break9_g27 = DiscardUV237;
			float2 temp_output_24_0_g27 = floor( float2( 3,3 ) );
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
			if( (( _DiscardUVTile33 )?( 1.0 ):( 0.0 )) == 1.0 )
				ifLocalVar18_g27 = ifLocalVar1_g27;
			float UVTileDiscard232 = ( ( ifLocalVar18_g10 + ifLocalVar18_g11 + ifLocalVar18_g12 + ifLocalVar18_g13 ) + ( ifLocalVar18_g15 + ifLocalVar18_g16 + ifLocalVar18_g17 + ifLocalVar18_g18 ) + ( ifLocalVar18_g20 + ifLocalVar18_g21 + ifLocalVar18_g22 + ifLocalVar18_g23 ) + ( ifLocalVar18_g24 + ifLocalVar18_g25 + ifLocalVar18_g26 + ifLocalVar18_g27 ) );
			float3 temp_cast_0 = (UVTileDiscard232).xxx;
			v.vertex.xyz += temp_cast_0;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_normalMap = i.uv_texcoord * _normalMap_ST.xy + _normalMap_ST.zw;
			float3 normalMap35 = UnpackNormal( tex2D( _normalMap, uv_normalMap ) );
			o.Normal = normalMap35;
			float2 uv_mainTex = i.uv_texcoord * _mainTex_ST.xy + _mainTex_ST.zw;
			float4 mainTex26 = tex2D( _mainTex, uv_mainTex );
			o.Albedo = mainTex26.rgb;
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 Emission39 = ( tex2D( _Emission, uv_Emission ) * _EmissionStrength1 );
			float3 normalizeResult9 = normalize( i.viewDir );
			float dotResult10 = dot( UnpackNormal( tex2D( _RimNormalMap, i.uv_texcoord ) ) , normalizeResult9 );
			float4 temp_cast_1 = (1.0).xxxx;
			float4 lerpResult118 = lerp( temp_cast_1 , mainTex26 , _RimBaseColorStrength);
			float4 Rim16 = ( ( pow( ( 1.0 - saturate( dotResult10 ) ) , ( 10.0 - _RimPower ) ) * _RimEnergy ) * lerpResult118 );
			float4 EmissionFinal29 = ( Emission39 + Rim16 );
			o.Emission = EmissionFinal29.rgb;
			float2 uv_MultiMap = i.uv_texcoord * _MultiMap_ST.xy + _MultiMap_ST.zw;
			float4 multiMap90 = tex2D( _MultiMap, uv_MultiMap );
			float4 break95 = multiMap90;
			o.Metallic = break95;
			o.Smoothness = break95.g;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows vertex:vertexDataFunc 

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
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
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
Node;AmplifyShaderEditor.CommentaryNode;256;1781.625,-1763.974;Inherit;False;890.788;756.407;Comment;7;95;32;36;33;92;233;0;Output;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;255;226.5768,-1809.824;Inherit;False;420.8079;185;Comment;2;186;187;Declare NaN;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;254;-742.4367,481.1946;Inherit;False;485.198;209;Comment;2;236;237;Discard UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;188;715.9604,-75.1355;Inherit;False;3225.433;1511.546;Comment;54;232;205;228;229;230;231;227;224;225;226;221;218;217;216;215;213;209;211;212;214;168;174;192;190;195;197;202;201;200;199;204;171;184;183;182;181;178;167;238;239;240;241;242;243;244;245;246;247;248;249;250;251;252;253;UV Tile Discard;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;72;-1745.04,-4819.045;Inherit;False;641.9634;172.3457;Comment;3;49;48;50;Time;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-1965.349,-2029.931;Inherit;False;628.8561;285.3137;Comment;2;35;34;Normal Map;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;31;-839.0011,-1985.27;Inherit;False;648.9465;356.8036;Comment;4;29;30;108;28;Emission Combination;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;27;-1891.004,-2474.635;Inherit;False;604.8932;280;Comment;2;25;26;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1;-2449.5,-704.6942;Inherit;False;2056.529;957.1146;Comment;19;4;119;128;16;120;118;113;87;12;8;9;10;88;7;15;14;13;11;131;Rim;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;35;-1560.493,-1979.931;Inherit;False;normalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;34;-1915.349,-1974.617;Inherit;True;Property;_normalMap;normalMap;2;0;Create;True;0;0;0;False;0;False;-1;13ce54de7ec2bdd45a3ceb8a5e5e4cad;2104d692ecfb6c548b9894d8b46f27f8;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;38;-1868.764,-3047.971;Inherit;False;754.3419;375.3379;Comment;4;39;129;130;40;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.FractNode;49;-1506.809,-4769.045;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;48;-1695.04,-4768.258;Inherit;False;1;0;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;50;-1327.076,-4762.699;Inherit;False;Time;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;26;-1510.111,-2420.833;Inherit;False;mainTex;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;25;-1835.004,-2418.635;Inherit;True;Property;_mainTex;mainTex;1;0;Create;True;0;0;0;False;0;False;-1;0db631ddb1a2c1443b81c6ac5ce43d11;135eca2d9812d82469854770ec8b1cbe;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;89;-813.4411,-2813.33;Inherit;False;604.8932;280;R = Metalic, G = Smoothness;2;91;90;MultiMap;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;90;-424.5481,-2761.528;Inherit;False;multiMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;91;-795.4411,-2748.33;Inherit;True;Property;_MultiMap;MultiMap;3;0;Create;True;0;0;0;False;0;False;-1;01e8d4996fddd0a448744957657de587;625d9feb77ca39242ba429b178a2e3db;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;130;-1849.367,-2771.687;Inherit;False;Property;_EmissionStrength1;Emission Strength;7;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;129;-1500.392,-2884.797;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;-1330.767,-2973.63;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
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
Node;AmplifyShaderEditor.RangedFloatNode;12;-2070.835,-228.9134;Float;False;Property;_RimPower;Rim Power;5;0;Create;True;0;0;0;False;0;False;2.07;3.39;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;113;-1466.542,100.4863;Inherit;False;Property;_RimBaseColorStrength;Rim Base Color Strength;8;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;118;-1142.086,-49.99364;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-852.0566,-208.7814;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;128;-1522.135,-55.94977;Inherit;False;Constant;_Float0;Float 0;10;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;119;-1381.133,28.2931;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;4;-2388.392,-585.3505;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;87;-1314.283,-215.7726;Inherit;False;Property;_RimEnergy;Rim Energy;6;0;Create;True;0;0;0;False;0;False;0.345;0.25;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;131;-2404.824,-375.8046;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DotProductOpNode;10;-1811.64,-545.5266;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;8;-2139.788,-626.5024;Inherit;True;Property;_RimNormalMap;Rim Normal Map;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;40;-1842.205,-2996.167;Inherit;True;Property;_Emission;Emission;4;0;Create;True;0;0;0;False;0;False;-1;83f90c05f51ea5c469ceb2c4218b09a7;83f90c05f51ea5c469ceb2c4218b09a7;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;182;1041.812,618.2679;Inherit;False;UV Tile Discard;-1;;11;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;183;1029.812,885.2676;Inherit;False;UV Tile Discard;-1;;12;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,2;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;184;1034.812,1129.267;Inherit;False;UV Tile Discard;-1;;13;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;171;1365.896,891.0529;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;204;2153.255,925.3552;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;199;1804.688,403.3784;Inherit;False;UV Tile Discard;-1;;15;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;1,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;200;1801.848,632.3688;Inherit;False;UV Tile Discard;-1;;16;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;1,1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;201;1793.848,902.3688;Inherit;False;UV Tile Discard;-1;;17;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;1,2;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;202;1797.848,1145.369;Inherit;False;UV Tile Discard;-1;;18;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;1,3;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;197;1546.696,353.2704;Inherit;False;Property;_DiscardUVTile10;Discard UV Tile 1,0;13;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;195;1543.956,576.0448;Inherit;False;Property;_DiscardUVTile11;Discard UV Tile 1,1;14;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;190;1528.996,839.2423;Inherit;False;Property;_DiscardUVTile12;Discard UV Tile 1,2;15;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;192;1535.897,1086.859;Inherit;False;Property;_DiscardUVTile13;Discard UV Tile 1,3;16;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;174;772.8617,1070.758;Inherit;False;Property;_DiscardUVTile03;Discard UV Tile 0,3;12;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;214;2949.443,799.1026;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;212;2325.181,849.4329;Inherit;False;Property;_DiscardUVTile22;Discard UV Tile 2,2;19;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;211;2325.31,609.9644;Inherit;False;Property;_DiscardUVTile21;Discard UV Tile 2,1;18;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;209;2330.016,372.3592;Inherit;False;Property;_DiscardUVTile20;Discard UV Tile 2,0;17;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;213;2332.082,1097.05;Inherit;False;Property;_DiscardUVTile23;Discard UV Tile 2,3;20;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;215;2586.043,439.8979;Inherit;False;UV Tile Discard;-1;;20;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;2,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;216;2583.57,664.9885;Inherit;False;UV Tile Discard;-1;;21;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;2,1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;217;2586.134,908.6589;Inherit;False;UV Tile Discard;-1;;22;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;2,2;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;218;2594.034,1155.559;Inherit;False;UV Tile Discard;-1;;23;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;2,3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;221;3744.535,797.0673;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;226;3125.108,370.3239;Inherit;False;Property;_DiscardUVTile30;Discard UV Tile 3,0;21;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;225;3120.402,607.929;Inherit;False;Property;_DiscardUVTile31;Discard UV Tile 3,1;22;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;224;3120.273,848.3976;Inherit;False;Property;_DiscardUVTile32;Discard UV Tile 3,2;23;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;227;3127.174,1095.014;Inherit;False;Property;_DiscardUVTile33;Discard UV Tile 3,3;24;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;231;3389.126,1153.523;Inherit;False;UV Tile Discard;-1;;27;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;3,3;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;230;3381.226,906.6238;Inherit;False;UV Tile Discard;-1;;26;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;3,2;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;229;3378.661,662.9531;Inherit;False;UV Tile Discard;-1;;25;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;3,1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;228;3381.135,437.8626;Inherit;False;UV Tile Discard;-1;;24;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;3,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;205;2186.408,96.57933;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;232;2500.037,90.75496;Inherit;False;UVTileDiscard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;234;-1887.185,-3642.682;Half;False;Property;_CullMode;Cull Mode;25;1;[Enum];Create;True;0;3;Front;0;Back;1;Off;2;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;239;801.3062,674.3323;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;240;785.3062,930.3323;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;241;790.3062,1180.332;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;242;1551.485,1196.518;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;243;1546.486,950.5176;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;244;1574.485,702.5175;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;245;1558.519,464.4302;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;246;2323.202,513.3727;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;247;2345.202,741.3727;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;248;2352.202,989.3727;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;249;2350.215,1232.41;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;250;3145.751,493.304;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;251;3162.751,724.304;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;252;3131.751,960.304;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;253;3150.751,1222.304;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;186;276.5768,-1759.824;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;187;423.3846,-1758.21;Inherit;False;NaN;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;95;2053.251,-1407.737;Inherit;True;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;32;1932.747,-1538.049;Inherit;False;29;EmissionFinal;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;36;1943.01,-1626.515;Inherit;False;35;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;1918.254,-1713.974;Inherit;False;26;mainTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;92;1831.625,-1410.855;Inherit;False;90;multiMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;233;2178.718,-1136.385;Inherit;False;232;UVTileDiscard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2417.414,-1478.567;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;VoyVivika/DivorceShaders/Divorce Main;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;True;_CullMode;-1;0;False;;1;Include;Assets/AudioLink/Shaders/AudioLink.cginc;False;;Custom;False;0;0;;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;236;-691.4367,528.1946;Inherit;False;1;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;238;798.6157,455.7225;Inherit;False;237;DiscardUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;181;1042.653,386.2774;Inherit;False;UV Tile Discard;-1;;10;f1bd11510c44bc348aeb983c4528c9d5;0;3;21;FLOAT;0;False;6;FLOAT2;0,0;False;10;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;178;782.6603,338.1693;Inherit;False;Property;_DiscardUVTile00;Discard UV Tile 0,0;9;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;167;781.9202,559.9437;Inherit;False;Property;_DiscardUVTile01;Discard UV Tile 0,1;10;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;168;765.9604,824.1412;Inherit;False;Property;_DiscardUVTile02;Discard UV Tile 0,2;11;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;237;-481.2387,536.2844;Inherit;False;DiscardUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;16;-639.494,-228.4329;Float;True;Rim;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
WireConnection;35;0;34;0
WireConnection;49;0;48;0
WireConnection;50;0;49;0
WireConnection;26;0;25;0
WireConnection;90;0;91;0
WireConnection;129;0;40;0
WireConnection;129;1;130;0
WireConnection;39;0;129;0
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
WireConnection;182;21;167;0
WireConnection;182;6;239;0
WireConnection;183;21;168;0
WireConnection;183;6;240;0
WireConnection;184;21;174;0
WireConnection;184;6;241;0
WireConnection;171;0;181;0
WireConnection;171;1;182;0
WireConnection;171;2;183;0
WireConnection;171;3;184;0
WireConnection;204;0;199;0
WireConnection;204;1;200;0
WireConnection;204;2;201;0
WireConnection;204;3;202;0
WireConnection;199;21;197;0
WireConnection;199;6;245;0
WireConnection;200;21;195;0
WireConnection;200;6;244;0
WireConnection;201;21;190;0
WireConnection;201;6;243;0
WireConnection;202;21;192;0
WireConnection;202;6;242;0
WireConnection;214;0;215;0
WireConnection;214;1;216;0
WireConnection;214;2;217;0
WireConnection;214;3;218;0
WireConnection;215;21;209;0
WireConnection;215;6;246;0
WireConnection;216;21;211;0
WireConnection;216;6;247;0
WireConnection;217;21;212;0
WireConnection;217;6;248;0
WireConnection;218;21;213;0
WireConnection;218;6;249;0
WireConnection;221;0;228;0
WireConnection;221;1;229;0
WireConnection;221;2;230;0
WireConnection;221;3;231;0
WireConnection;231;21;227;0
WireConnection;231;6;253;0
WireConnection;230;21;224;0
WireConnection;230;6;252;0
WireConnection;229;21;225;0
WireConnection;229;6;251;0
WireConnection;228;21;226;0
WireConnection;228;6;250;0
WireConnection;205;0;171;0
WireConnection;205;1;204;0
WireConnection;205;2;214;0
WireConnection;205;3;221;0
WireConnection;232;0;205;0
WireConnection;187;0;186;0
WireConnection;95;0;92;0
WireConnection;0;0;33;0
WireConnection;0;1;36;0
WireConnection;0;2;32;0
WireConnection;0;3;95;0
WireConnection;0;4;95;1
WireConnection;0;11;233;0
WireConnection;181;21;178;0
WireConnection;181;6;238;0
WireConnection;237;0;236;0
WireConnection;16;0;120;0
ASEEND*/
//CHKSM=9F286DD58778B4176A4F0E2F3E0E2FA8DCCC8B21