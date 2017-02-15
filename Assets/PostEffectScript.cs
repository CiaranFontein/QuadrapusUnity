using System.Collections;
using UnityEngine;

public class PostEffectScript : MonoBehaviour {

	public Material mat;

	[ExecuteInEditMode]
	void OnRenderImage(RenderTexture src, RenderTexture dest){
		Graphics.Blit (src, dest, mat);
	}

}
