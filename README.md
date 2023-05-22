# VoyVivika's Divorce Shaders
![Shader Preview](https://github.com/VoyVivika/DivorceShaders/blob/main/README%20ASSETS/Unity_Xwahnfhmvv.gif?raw=true)

[Avatar Showcased is my Personal Edit of Murdoc the Rat by Skully Hellfire](https://skullyhellfire.gumroad.com/l/skullysmurdoc)

The Divorce Shaders are a Suite of Shaders created by VoyVivika in Unity3D with the Amplify Shader Editor, it's designed to essentially be "Standard Shader with some more Bells and Whistles". I made these for my Personal Avatar after N3X15 told me to be part of the *"Not Using Poiyomi Gang."*
## Features
- AudioLink Support
	- Emission Mask with 4 Colors that Represent each Band, the Colors Combine Together to Become White.
	- If AudioLink is Absent, the Bass Band Emission will remain on.
- Vertex UV Tile Discard
- Vertex UV Range Discard
	- In the Shader this is stored as a Vector 4. X and Y are the starting UVs, Z and W are the ending UVs
- Rim Lighting
### MultiMap
MultiMap is a Texture which contains multiple maps in 1
Currently the Spec for the Divorce Shader Multi-Map is
- Red Channel = Metalic
- Green Channel = Smoothness
## Amplify Functions
This Repo contains some Amplify Shader Editor Functions useful for Shader Creators, namely:
- UV Range Discard
	- Discards Vertices in a UV Range
- UV Tile Discard
	- Discards Vertices in the Specified UV Tile (Supplied UV Tile is Floored and is increased by 1 for the Range)
## Why are they called "Divorce Shaders"
*In short: I thought it'd be funny.*

I made a Prop in ChilloutVR that's literally just a jpeg of a Divorce Agreement Document, then I said to a friend "I'm going to make the Divorce Shaders" so I decided to give that name to these Shaders.
