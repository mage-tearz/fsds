local s = fsds.Scale

DEFINE_BASECLASS( "DPanel" )

local PANEL = {}

function PANEL:Init()
    self:SetWide( s(4.5) )
end

function PANEL:Paint( w, h )
    surface.SetDrawColor( fsds.theme.background_menu )
    surface.DrawRect( 0, 0, w, h )
end

function PANEL:PerformLayout( w, h )
    BaseClass.PerformLayout( self, w, h )
    self:SetWide( s(4.5) )
end


vgui.Register( "fsds::SideBar", PANEL, "DPanel" )