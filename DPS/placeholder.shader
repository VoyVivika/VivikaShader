// Made with Amplify Shader Editor v1.9.9.7
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "placeholder"
{
	Properties
	{
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
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.5
		#define ASE_VERSION 19907
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			half filler;
		};

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback Off
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
}
/*ASEBEGIN
Version=19907
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1;-665.7906,-411.0901;Inherit;False;356;883;Comment;10;11;10;9;8;7;6;5;4;3;2;DPS Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2;-601.7906,-283.0901;Inherit;False;Property;_SqueezeDist;Squeeze Smoothness;1;0;Fetch;False;0;0;0;True;0;False;0;0;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3;-601.7906,-203.0901;Inherit;False;Property;_BulgePower;Bulge Amount;2;0;Fetch;False;0;0;0;True;0;False;0;0;0;0.01;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;4;-601.7906,-123.0901;Inherit;False;Property;_BulgeOffset;Bulge Length;3;0;Fetch;False;0;0;0;True;0;False;0;0;0;0.3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5;-601.7906,116.9099;Inherit;False;Property;_Curvature;Curvature;6;0;Fetch;False;0;0;0;True;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;6;-601.7906,196.9099;Inherit;False;Property;_ReCurvature;ReCurvature;7;0;Fetch;False;0;0;0;True;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;7;-601.7906,276.9099;Inherit;False;Property;_Wriggle;Wriggle Amount;8;0;Fetch;False;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;8;-601.7906,-43.09015;Inherit;False;Property;_Length;Length of Penetrator Model;4;0;Fetch;False;0;0;0;True;0;False;0;0.1073551;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;9;-601.7906,36.90985;Inherit;False;Property;_EntranceStiffness;Entrance Stiffness;5;0;Fetch;False;0;0;0;True;0;False;0.01;0.01;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;10;-601.7906,356.9099;Inherit;False;Property;_WriggleSpeed;Wriggle Speed;9;0;Fetch;False;0;0;0;True;0;False;0.28;0.28;0.1;30;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;11;-601.7906,-363.0901;Inherit;False;Property;_Squeeze;Squeeze Minimum Size;0;1;[Header];Fetch;False;1;DPS Penetrator Settings;0;0;True;0;False;0;0;0;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;0;0,0;Float;False;True;-1;3;AmplifyShaderEditor.MaterialInspector;0;0;Standard;placeholder;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;0;False;;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
ASEEND*/
//CHKSM=C15B386CCB667F5A44F8107D86E5A71A844EB597