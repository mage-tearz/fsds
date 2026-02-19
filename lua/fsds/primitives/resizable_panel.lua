local s = fsds.Scale

DEFINE_BASECLASS( "DPanel" )


local PANEL = {}

AccessorFunc( PANEL, "tolerance", "Tolerance", FORCE_NUMBER )
AccessorFunc( PANEL, "minW", "MinW", FORCE_NUMBER )
AccessorFunc( PANEL, "minH", "MinH", FORCE_NUMBER )

function PANEL:Init()
    BaseClass.Init( self )

    self.tolerance = 12
    self.minW = 48
    self.minH = 48
    self.resizable_from = {}

    self.lastX = 0
    self.lastY = 0

    self.deltaX = 0
    self.deltaY = 0
end

function PANEL:CursorWithin( x1, y1, x2, y2 )
    if self.sizing then
        return true
    end

    local cx, cy = self:LocalCursorPos()
    return
        (cx >= x1 and cx < x2)
        and (cy >= y1 and cy < y2)
end

function PANEL:GetCursor()
    local w, h = self:GetSize()

    if self:IsResizableFrom( LEFT ) and self:CursorWithin( 0, 0, self.tolerance, h ) then
        return "sizewe"
    elseif self:IsResizableFrom( RIGHT ) and self:CursorWithin( w - self.tolerance, 0, w, h ) then
        return "sizewe"
    elseif self:IsResizableFrom( TOP ) and self:CursorWithin( 0, 0, w, self.tolerance ) then
        return "sizens"
    elseif self:IsResizableFrom( BOTTOM ) and self:CursorWithin( 0, h - self.tolerance, w, h ) then
        return "sizens"
    end

    return "none"
end

function PANEL:Think()
    local mx, my = self:LocalCursorPos()

    self.deltaX = mx - self.lastX
    self.deltaY = my - self.lastY

    self.lastX = mx
    self.lastY = my

    local w, h = self:GetSize()
    local cursor = self:GetCursor()

    local resizing = ( cursor ~= "none" ) and input.IsMouseDown( MOUSE_LEFT )
    self:SetCursor( cursor )
    self:SetIsSizing( resizing )

    if not resizing then
        return
    end

    if self:IsResizableFrom( LEFT ) then
        local newWidth = w - self.deltaX
        self:SetNewWidth( newWidth )
    elseif self:IsResizableFrom( RIGHT ) then
        local newWidth = w + self.deltaX
        self:SetNewWidth( newWidth )
    elseif self:IsResizableFrom( TOP ) then
        local newHeight = h + self.deltaY
        self:SetNewTall( newHeight )
    elseif self:IsResizableFrom( BOTTOM ) then
        local newHeight = h - self.deltaY
        self:SetNewTall( newHeight )
    end
end

function PANEL:EnableResizeFrom( dir )
    self.resizable_from[dir] = true
end

function PANEL:DisableResizeFrom( dir )
    self.resizable_from[dir] = nil
end

function PANEL:IsResizableFrom( dir )
    return self.resizable_from[dir]
end

function PANEL:SetIsSizing( bool )
    self:MouseCapture( bool )
    self.sizing = bool
end

function PANEL:SetNewWidth( w )
    self:SetWide( math.max( w, self.minW ) )
end

function PANEL:SetNewHeight( h )
    self:SetTall( math.max( h, self.minH ) )
end


vgui.Register( "fsds::resizable_panel", PANEL, "DPanel" )