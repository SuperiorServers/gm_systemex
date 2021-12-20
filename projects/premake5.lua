local osname = os.target()

workspace "systemex"
	configurations { "Release", "Debug" }
	platforms { "DLL" }

	language "C++"
	cppdialect "C++17"

	location ( osname .."-".. _ACTION )
	
	flags { "NoPCH", "MultiProcessorCompile" }

	editandcontinue "Off"
	vectorextensions "SSE"
	staticruntime "Off"
	defines { "NDEBUG", "GMMODULE"}
	optimize "On"
	floatingpoint "Fast"
	warnings "Off"

	kind "SharedLib"
	includedirs { "../include/GarrysMod" }
	files { "../src/**.*", "../include/GarrysMod/**.*" }

	if osname == "linux" then
		buildoptions { "-Wl,-z,defs" }			
	end

	targetprefix "gmsv_"
	targetname "systemex_"
	targetextension ".dll"
	
	project "systemex_x86"
		architecture "x86"
		targetsuffix (osname == "windows" and "win32" or osname)
		targetdir ("../bin/x86/")
		filter "Debug"
			symbols "On"
		filter "Release"
			symbols "Off"

	project "systemex_x64"
		architecture "x86_64"
		targetsuffix (osname == "windows" and "win64" or osname)
		targetdir ("../bin/x64/")
		filter "Debug"
			symbols "On"
		filter "Release"
			symbols "Off"