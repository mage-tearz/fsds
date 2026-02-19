fsds.version = "26w08a"

fsds.menuScale = fsds.menuScale or cookie.GetNumber( "fsds::scale", 12 )

function fsds.GetMenuScale()
    return fsds.menuScale
end

function fsds.GetMenuScalePercent()
    return (math.Round((fsds.menuScale - 6) / 12, 2) * 100).."%"
end

function fsds.SetMenuScale( s )
    fsds.menuScale = s
    cookie.Set( "fsds::scale", s )

    if IsValid( fsds.menu ) then
        fsds.menu:InvalidateChildren( true )
    end
end

function fsds.IncrementScale()
    local s = fsds.GetMenuScale()
    s = math.min( s + 2, 18 )
    fsds.SetMenuScale( s )
end

function fsds.DecrementScale()
    local s = fsds.GetMenuScale()
    s = math.max( s - 2, 6 )
    fsds.SetMenuScale( s )
end

function fsds.Scale( n )
    return fsds.GetMenuScale() * n
end