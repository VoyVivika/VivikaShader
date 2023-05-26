# VoyVivika's Divorce Shaders
![Shader Preview](https://github.com/VoyVivika/DivorceShaders/blob/main/README%20ASSETS/Unity_Xwahnfhmvv.gif?raw=true)

[3D  Model Showcased is my Personal Edit of Murdoc the Rat by Skully Hellfire](https://skullyhellfire.gumroad.com/l/skullysmurdoc)

The Divorce Shaders are a Suite of Shaders created by VoyVivika in Unity3D with the Amplify Shader Editor. I made these for my Personal ChilloutVR Avatar after N3X15 told me to be part of the *"Not Using Poiyomi Gang."*, ended up being a fun project of experimenting with Shaders Honestly.
## Features
- AudioLink Support
	- Requires AudioLink to be Present in the Project, [You can get it here!](https://github.com/llealloo/vrc-udon-audio-link)
	- Emission Mask with 4 Colors that Represent each Band, the Colors Combine Together to Become White.
	- If AudioLink is Absent, the Bass Band Emission will remain on.
- Vertex UV Tile Discard
- Vertex UV Range Discard
	- In the Shader this is stored as a Vector 4. X and Y are the starting UVs, Z and W are the ending UVs
- Rim Lighting
- 2 Lighting Types
	- Standard (Acts like Unity Standard Shader)
	- Flat Lit (Attempts to be Lit uniformly across the Mesh)
	- Flat Shade (Attempts to include a stylized shadowing)
### MultiMap
MultiMap is a Texture which contains multiple maps in 1
Currently the Spec for the Divorce Shader Multi-Map is
- Red Channel = Metalic
- Green Channel = Smoothness
## Amplify Functions
This Repo contains some Amplify Shader Editor Functions useful for Shader Creators, namely:
- UV Range Discard
	- Returns NaN if the supplied UV is in the Supplied UV Range, otherwise Returns 0.
- UV Tile Discard
	- Returns NaN if the supplied UV is on the Supplied UV Tile, otherwise Returns 0.
- UV Range Check
	- Returns 1 if the supplied UV is in the Supplied UV Range, otherwise Returns 0.
- UV Tile Check
	- Returns 1 if the supplied UV is on the Supplied UV Tile, otherwise Returns 0.
## Why are they called "Divorce Shaders"
*In short: I thought it'd be funny.*

I made a Prop in ChilloutVR that's literally just a jpeg of a Divorce Agreement Document, then I said to a friend "I'm going to make the Divorce Shaders" so I decided to give that name to these Shaders.
