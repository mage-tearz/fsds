-- Free Software Derma Sculptor

local root = "fsds/"

local function addFile( f, dir )
    if SERVER then
        AddCSLuaFile( dir..f )
    else
        include( dir..f )
    end
end

local function addDir( dir )
    local files, dirs = file.Find( dir.."*", "LUA" )

    for _, file in ipairs( files ) do
        if string.EndsWith( file, ".lua" ) then
            addFile( file, dir )
        end
    end

    for _, dir in ipairs( dirs ) do
        addDir( dir )
    end
end