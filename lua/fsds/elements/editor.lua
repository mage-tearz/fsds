local s = fsds.Scale

DEFINE_BASECLASS( "DPanel" )

local PANEL = {}

function PANEL:Init()
end

function PANEL:Paint( w, h )
    surface.SetDrawColor( fsds.theme.background_editor )
    surface.DrawRect( 0, 0, w, h )
end

function PANEL:PerformLayout( w, h )
    BaseClass.PerformLayout( self, w, h )
end


vgui.Register( "fsds::Editor", PANEL, "DPanel" )