local s = fsds.Scale

DEFINE_BASECLASS( "DPanel" )

local PANEL = {}

function PANEL:Init()
    self:SetTall( s(4) )
end

function PANEL:Paint( w, h )
    surface.SetDrawColor( fsds.theme.background_panel )
    surface.DrawRect( 0, 0, w, h )
end

function PANEL:PerformLayout( w, h )
    BaseClass.PerformLayout( self, w, h )
    self:SetTall( s(4) )
end


vgui.Register( "fsds::Decoration", PANEL, "DPanel" )