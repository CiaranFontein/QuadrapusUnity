Shader "Custom/SpriteWithHole" {
	Properties {
		[PerRendererData]  _MainTex ("Sprite Texture", 2D) = "white" { }
		_Color ("Color", Color) = (1,1,1,1)
		[MaterialToggle]  PixelSnap ("Pixel snap", Float) = 0.000000
	}
	SubShader {
		Tags { "RenderType"="Transparent" "Queue"="Geometry" "CanUseSpriteAtlas"="true" "IGNOREPROJECTOR"="true" "PreviewType"="Plane"}

		Stencil{
			Ref 1
			Comp notequal
			Pass keep
		}

		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;
		fixed4 _Color;

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
