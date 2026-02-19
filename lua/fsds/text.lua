
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
    local a = size

    return math.floor( a / 12 ) * 12
end


-- `font' here is a table.
-- {
--  type: string,
--  size: number,
--  weight: number,
-- }

local m = Matrix()
local pos_vec = Vector()
local scale_vec = Vector()
function fsds.DrawText( text, font, x, y, color, xa, ya )
    font.size = font.size * fsds.GetMenuScale()
    local idealFont = fsds.Font(
        font.type,
        24,
        font.weight
    )


    local state = surface.GetPanelPaintState()
    x = x + state.translate_x
    y = y + state.translate_y

    local size = 1  --font.size


    pos_vec:SetUnpacked( x, y, 0 )
    scale_vec:SetUnpacked( size, size, 1 )
    m:SetTranslation( pos_vec )
    m:SetScale( scale_vec )
    cam.PushModelMatrix( m, true )
        draw.SimpleText( text, idealFont, 0, 0, color, xa, ya )
    cam.PopModelMatrix()
end