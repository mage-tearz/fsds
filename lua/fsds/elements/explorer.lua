local s = fsds.Scale

DEFINE_BASECLASS( "DPanel" )

local PANEL = {}

function PANEL:Init()
    self:SetWide( s(32) )
    self:EnableResizeFrom( RIGHT )
    self:SetTolerance( s(2) )
    self:SetMinW( s(16) )

    self.lastWidth = 0
    self.layoutInProgress = false

    self:MakeTitle()
end

function PANEL:MakeTitle()
    local cont = vgui.Create( "DPanel", self )
    cont:Dock( TOP )
    cont:SetTall( s(5) )
    cont:SetPaintBackground( false )
end

function PANEL:Paint( w, h )
    surface.SetDrawColor( fsds.theme.background_window )
    surface.DrawRect( 0, 0, w, h )
end

function PANEL:PerformLayout( w, h )
    BaseClass.PerformLayout( self, w, h )
end


vgui.Register( "fsds::Explorer", PANEL, "fsds::resizable_panel" )