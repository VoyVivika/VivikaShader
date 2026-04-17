// Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEditor;

namespace Voy.VivikaShader
{
    class VivikaShaderGUI : ShaderGUI
    {
        public float currentMode = 0;
        
        public static readonly string[] DisallowedNames =
        {
            "_SrcBlend",
            "_DstBlend",
            "_ZWrite"
        };

        public static readonly string[] AudioLinkNames =
        {
            "_ALEmitifInactive",
            "_ALDelayMap",
            "_ALUVDelayMaxDelay",
            "_ALTimeScale",
            "_AL_Mask",
            "_ALDelayUVMap"
        };

        public static readonly string[] AlphaMapNames =
        {
            "_AlphaMap",
            "_AlphaMapStrength"
        };

        public static readonly string[] VertexDiscardNames =
        {
            "_DontRenderinSocialVRMirrors",
            "_DontRenderInSocialVRCameras",
            "_UDIMDiscardAll",
            "_DiscardUVMap"
        };

        public static readonly string[] RimLightingNames =
        {
            "_RimPower",
            "_RimEnergy",
            "_RimBaseColorStrength"

        };

        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
        {
            base.OnGUI(materialEditor, ParseProperties(properties, materialEditor));
        }

        public MaterialProperty[] ParseProperties(MaterialProperty[] properties, MaterialEditor materialEditor)
        {
            bool multiTarget = materialEditor.targets.Length > 1;
            
            bool isCutout = false;
            bool isTransparent = false;
            bool AudioLink = false;
            bool AlphaMap = false;
            bool VertexDiscard = false;
            bool RimLighting = false;
            Material material = materialEditor.target as Material;
            
            List<MaterialProperty> newProperties = new List<MaterialProperty>();

            foreach (MaterialProperty prop in properties)
            {
                if (!multiTarget)
                {
                    if (prop.name == "_Mode")
                    {
                        if (prop.floatValue == 1) isCutout = true;
                        if (prop.floatValue > 0) isTransparent = true;
                        if (prop.floatValue != currentMode)
                        {
                            bool success = false;
                            switch (prop.floatValue)
                            {
                                case 0: // Opaque
                                    material.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.One);
                                    material.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.Zero);
                                    material.SetFloat("_ZWrite", 1.0f);
                                    material.SetFloat("_Cutoff", 0.5f);
                                    material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Geometry;
                                    success = true;
                                    break;
                                case 1: // Cutout
                                    material.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.One);
                                    material.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.Zero);
                                    material.SetFloat("_ZWrite", 1.0f);
                                    material.SetFloat("_Cutoff", 0.5f);
                                    material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.AlphaTest;
                                    success = true;
                                    break;
                                case 2: // Transparent Cutout
                                    material.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.One);
                                    material.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.Zero);
                                    material.SetFloat("_ZWrite", 1.0f);
                                    material.SetFloat("_Cutoff", 0.5f);
                                    material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.AlphaTest;
                                    success = true;
                                    break;
                                case 3: // Transparent
                                    material.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.One);
                                    material.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                                    material.SetFloat("_ZWrite", 0.0f);
                                    material.SetFloat("_Cutoff", 0.0f);
                                    material.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent;
                                    success = true;
                                    break;
                            }
                            if (success) currentMode = prop.floatValue;
                        }

                    }

                    if (prop.name == "_EnableAudioLink" && prop.floatValue == 1) AudioLink = true;
                    if (prop.name == "_UseAlphaMap" && prop.floatValue == 1) AlphaMap = true;
                    if (prop.name == "_EnableVertexDiscarding" && prop.floatValue == 1) VertexDiscard = true;
                    if (prop.name == "_EnableRimLighting" && prop.floatValue == 1) RimLighting = true;
                }
                if (!isTransparent && prop.name == "_UseAlphaMap") continue;
                if(DisallowedNames.Contains(prop.name)) continue;
                if(!AudioLink && AudioLinkNames.Contains(prop.name) ) continue;
                if((!isTransparent | !AlphaMap) && AlphaMapNames.Contains(prop.name)) continue;
                if(!VertexDiscard && (prop.name.StartsWith("_UDIMDiscardRow") | VertexDiscardNames.Contains(prop.name) )) continue;
                if(!isCutout && prop.name == "_Cutoff") continue;
                if(!RimLighting && RimLightingNames.Contains(prop.name)) continue;
                
                newProperties.Add(prop);
            }
            
            return newProperties.ToArray();
            
        }
    }
} // namespace UnityEditor
