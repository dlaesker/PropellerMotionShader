/************************
* Author: Denis Laesker *   
* ***********************

Filename: Spiral.shader

Description: This file implements a shader designed to simulate a propeller and its motion. 

The inspiration and part of the math hereby used were obtained at :
    https://en.wikipedia.org/wiki/Archimedean_spiral
    https://gamedev.stackexchange.com/questions/188814/how-to-create-a-spiral-brightness-gradient


How to use:
1. Import this file (the shader) into your Unity project.
2. Attach the shader to a material.
3. Attach the material to an object.
4. Done :)

*/

Shader "Custom/Spiral"{
    Properties{
        _Aspect ("Squish Factor", Range(0, 10)) = 4 
    }
    SubShader{
        Tags { "RenderType"="Opaque" }
        Pass{
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct appdata{
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f{
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v){
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            float _Aspect, _Blades;

            float rand(float2 p){
                return frac(sin(dot(p, float2(12.9898, 4.1414))) * 43758.5453);
            }

            float createPropeller(float2 p){
                float theta = (atan2(p.y, p.x) / UNITY_PI) / .4;
                return theta;
            }

            // inspired by https://en.wikipedia.org/wiki/Archimedean_spiral
            fixed4 frag (v2f i) : SV_Target{
                float4 col = 0;

                // Centered and squished UV
                float2 uv = (i.uv -.5) * _Aspect;

                // Reset t every 2 hours
                float t = fmod(_Time.y, 7200);
                
                
                
                float r = length(uv); // Radius
                
                /* Creates a flower instead :) */
                // col += r; 
                
                // Go forward
                float propeller = t + createPropeller(uv);
                
                // Go backwards
                // float propeller = -t + createPropeller(uv);
                
                propeller += floor(r - propeller);
                col += propeller;

                /* Uncomment for something mesmerizing */
                // col *= rand(uv);

                /* We have color! */
                // col.b = 1;
                // col.r = .1;

                /* Invert Colors */
                // col = -col;
                return col;
            }
            ENDCG
        }
    }
}
