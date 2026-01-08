// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VoyVivika/VivikaShader/Testing"
{
	Properties
	{
		_MainTex("Albedo", 2D) = "white" {}
		_Decal0Texture("Decal", 2D) = "black" {}
		_Decal0PositionScale("Decal 0 Position & Scale", Vector) = (0.5,0.5,0.2,0.2)
		_Decal0Rotation("Decal 0 Rotation", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Decal0Texture;
		uniform float4 _Decal0PositionScale;
		uniform float _Decal0Rotation;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 break2_g27 = i.uv_texcoord;
			float2 appendResult136 = (float2(_Decal0PositionScale.x , _Decal0PositionScale.y));
			float2 temp_output_4_0_g26 = appendResult136;
			float4 temp_output_9_0_g26 = float4( 0,0,0,0 );
			float4 break12_g26 = temp_output_9_0_g26;
			float4 appendResult15_g26 = (float4(( 0.0 - break12_g26.x ) , break12_g26.y , ( 0.0 - break12_g26.z ) , break12_g26.w));
			float4 break17_g26 = appendResult15_g26;
			float2 appendResult25_g26 = (float2(( ( break17_g26.x + break17_g26.y ) / 2.0 ) , ( ( break17_g26.z + break17_g26.w ) / 2.0 )));
			float2 break7_g27 = ( temp_output_4_0_g26 + appendResult25_g26 );
			float temp_output_6_0_g27 = ( break2_g27.x - break7_g27.x );
			float mulTime32_g26 = _Time.y * 0.0;
			float temp_output_29_0_g26 = radians( ( _Decal0Rotation + mulTime32_g26 ) );
			float temp_output_4_0_g27 = cos( temp_output_29_0_g26 );
			float temp_output_9_0_g27 = ( break2_g27.y - break7_g27.y );
			float temp_output_5_0_g27 = sin( temp_output_29_0_g26 );
			float2 appendResult19_g27 = (float2(( ( ( temp_output_6_0_g27 * temp_output_4_0_g27 ) - ( temp_output_9_0_g27 * temp_output_5_0_g27 ) ) + break7_g27.x ) , ( ( ( temp_output_6_0_g27 * temp_output_5_0_g27 ) + ( temp_output_9_0_g27 * temp_output_4_0_g27 ) ) + break7_g27.y )));
			float2 appendResult137 = (float2(_Decal0PositionScale.z , _Decal0PositionScale.w));
			float2 temp_output_8_0_g28 = ( appendResult137 / float2( 2,2 ) );
			float2 temp_output_3_0_g28 = temp_output_4_0_g26;
			float4 break10_g28 = appendResult15_g26;
			float2 appendResult11_g28 = (float2(break10_g28.x , break10_g28.z));
			float2 appendResult19_g28 = (float2(break10_g28.y , break10_g28.w));
			float2 temp_output_15_0_g21 = (float2( 0,0 ) + (appendResult19_g27 - ( ( float2( 0,0 ) - temp_output_8_0_g28 ) + temp_output_3_0_g28 + appendResult11_g28 )) * (float2( 1,1 ) - float2( 0,0 )) / (( temp_output_8_0_g28 + temp_output_3_0_g28 + appendResult19_g28 ) - ( ( float2( 0,0 ) - temp_output_8_0_g28 ) + temp_output_3_0_g28 + appendResult11_g28 )));
			float4 tex2DNode12_g21 = tex2D( _Decal0Texture, temp_output_15_0_g21 );
			float4 break25_g21 = tex2DNode12_g21;
			float2 break7_g21 = temp_output_15_0_g21;
			float lerpResult27_g21 = lerp( ( max( sign( ( break7_g21.x - 0.0 ) ) , 0.0 ) * max( sign( ( break7_g21.y - 0.0 ) ) , 0.0 ) * max( sign( ( 1.0 - break7_g21.x ) ) , 0.0 ) * max( sign( ( 1.0 - break7_g21.y ) ) , 0.0 ) ) , 1.0 , 0.0);
			float4 appendResult26_g21 = (float4(break25_g21.r , break25_g21.g , break25_g21.b , ( tex2DNode12_g21.a * lerpResult27_g21 )));
			float4 temp_output_131_0 = appendResult26_g21;
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float layeredBlendVar6 = temp_output_131_0.a;
			float4 layeredBlend6 = ( lerp( tex2D( _MainTex, uv_MainTex ),temp_output_131_0 , layeredBlendVar6 ) );
			o.Albedo = layeredBlend6.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19303
Node;AmplifyShaderEditor.Vector4Node;134;-1408,480;Inherit;False;Property;_Decal0PositionScale;Decal 0 Position & Scale;2;0;Create;False;0;0;0;False;0;False;0.5,0.5,0.2,0.2;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;133;-1328,288;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;136;-1136,432;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;137;-1136,560;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;138;-1168,672;Inherit;False;Property;_Decal0Rotation;Decal 0 Rotation;3;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;130;-1312,96;Inherit;True;Property;_Decal0Texture;Decal;1;0;Create;False;0;0;0;False;0;False;f252400acbce3344d9a8ff021bc795ef;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.FunctionNode;131;-880,288;Inherit;True;Decal;-1;;21;bf1cb85174fd5da468f92155e5f5701f;0;8;28;FLOAT;0;False;24;SAMPLER2D;0;False;16;FLOAT2;0,0;False;17;FLOAT2;0.5,0.5;False;18;FLOAT2;1,1;False;19;FLOAT;0;False;20;FLOAT;0;False;22;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1;-656,-64;Inherit;True;Property;_MainTex;Albedo;0;0;Create;False;0;0;0;False;0;False;-1;ceeb42ea375ac424389b5d6585f9794e;ceeb42ea375ac424389b5d6585f9794e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;139;-528,384;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.LayeredBlendNode;6;-290,236.5;Inherit;True;6;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;16,96;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;VoyVivika/VivikaShader/Testing;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;136;0;134;1
WireConnection;136;1;134;2
WireConnection;137;0;134;3
WireConnection;137;1;134;4
WireConnection;131;24;130;0
WireConnection;131;16;133;0
WireConnection;131;17;136;0
WireConnection;131;18;137;0
WireConnection;131;19;138;0
WireConnection;139;0;131;0
WireConnection;6;0;139;3
WireConnection;6;1;1;0
WireConnection;6;2;131;0
WireConnection;0;0;6;0
ASEEND*/
//CHKSM=7AAE66EFB30090D47541D338CD2D6B4680B00AE9