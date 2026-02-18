fsds = {}

function fsds.AddFile( File, directory )
    if SERVER then
        AddCSLuaFile( directory .. File )
    elseif CLIENT then
        include( directory .. File )
		print("including", directory..File )
    end
end

function fsds.IncludeDir( directory )
	directory = directory .. "/"

	local files, directories = file.Find( directory .. "*", "LUA" )

	for _, v in ipairs( files ) do
		if string.EndsWith( v, ".lua" ) then
			fsds.AddFile( v, directory )
		end
	end

	for _, v in ipairs( directories ) do
		fsds.IncludeDir( directory .. v )
	end
end

fsds.AddFile( "lib.lua", "fsds/" )
fsds.AddFile( "text.lua", "fsds/" )