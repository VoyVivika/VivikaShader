# VoyVivika's Personal Shader
![Shader Preview](https://github.com/VoyVivika/DivorceShaders/blob/main/README%20ASSETS/Unity_Xwahnfhmvv.gif?raw=true)

[3D  Model Showcased is my Personal Edit of Murdoc the Rat by Skully Hellfire](https://skullyhellfire.gumroad.com/l/skullysmurdoc)

The Vivika Shader (Formerly the "Divorce Shader" after an inside joke) is a Shader created by VoyVivika in Unity3D with the Amplify Shader Editor. I made these for my Personal ChilloutVR Avatars with some in-game encouragement from N3X15, ended up being a fun project for experimenting with Amplify Shaders Honestly, figured out how UV Discarding worked (and it's honestly a personal favorite feature despite not using it very much).
## Features
- AudioLink Support (NOT OPTIONAL)
	- Requires DomNomNom's ChilloutVR Specific Fork of AudioLink to be Present in the Project, [You can get it here!](https://github.com/DomNomNomVR/cvr-audio-link/)
		- This is specifically for the AudioLink.cginc file.
		- May also want to keep the Amplify Folder if you intend on Editing the Shader in Amplify.
	- Emission Mask with 4 Colors that Represent each Band, the Colors Combine Together to Become White.
	- If AudioLink is Absent in the Enviornment, the Bass Band Emission will remain on.
	- UV Based Delay
		- Three Modes
			- Off (None at all)
			- UV Vertial (From the Top of the UV Map to the Bottom)
			- Distance (Distance out from a Position)
		- This uses UV Map 3 on your Model
- UV Based Vertex Discarding
	- Discards Verticies within Certain UV Coordinates
	- This uses UV Map 2 on your Model
	- Two Types
		- Vertex UV Tile Discard
			- This Treats UV Coordinates like Tiles (U 1.0 to 2.0, V 1.0 to 2.0 is considered Tile 1, 1)
		- Vertex UV Range Discard
			- This will Discard Verticies within a Specified UV Range.
			- This uses a Vector 4
				- X and Y are the Starting UVs (Example: 1.0, 1.0)
				- Z and W are the Ending UVs (Example: 2.0, 2.0)
- Rim Lighting
- 2 Lighting Types
	- Standard (Acts like Unity Standard Shader)
	- Toon (Stylized Lighting, I'm currently demotivated to work on this)
### MultiMap
MultiMap is a Texture which contains multiple maps in a Single RGB Texture intended for use with DXT1 Encoded Textures
Currently the Spec for the Divorce Shader Multi-Map is
- Red Channel = Metalic
- Green Channel = Smoothness
### Texture Ramp (Toon Lighting)
- Left is Darkest, Right is Lightest
- For best results on your Texture Ramp switch the Wrap Mode from "Repeat" to "Clamp"
## Amplify Functions
This Repo contains some Amplify Shader Editor Functions useful for Shader Creators, namely:
- Distance
	- A Basic Implementation of a Distance Function
- UV Range Discard
	- Returns NaN if the supplied UV is in the Supplied UV Range, otherwise Returns 0.
- UV Tile Discard
	- Returns NaN if the supplied UV is on the Supplied UV Tile, otherwise Returns 0.
- UV Range Check
	- Returns 1 if the supplied UV is in the Supplied UV Range, otherwise Returns 0.
- UV Tile Check
	- Returns 1 if the supplied UV is on the Supplied UV Tile, otherwise Returns 0.