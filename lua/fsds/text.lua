
fsds.fontCache = {}

local font_format = "%s:%i:%i"
function fsds.Font( type, size, weight )
    type = type or fsds.theme.type_sans
    size = size or 18
    weight = weight or 400

    local name = font_format:format( type, size, weight )

    if fsds.fontCache[name] then
        return name
    end

    surface.CreateFont( name, {
        font = type,
        size = size,
        weight = weight,
        antialias = true,
    } )

    fsds.fontCache[name] = true
    return name
end

function fsds.GetIdealFontSize( size )
    local scale = fsds.GetMenuScale()
    local a = scale * size

    return math.Round( a / 12 ) * 12
end


-- `font' here is a table.
-- {
--  type: string,
--  size: number,
--  weight: number,
-- }
function fsds.DrawText( text, font, x, y, color, xa, ya )
    local idealFont = fsds.Font(
        font.type, font.size, font.weight
    )

    return draw.SimpleText( text, idealFont, x, y, color, xa, ya )
end