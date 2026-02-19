local s = fsds.Scale

DEFINE_BASECLASS( "DPanel" )

local PANEL = {}

function PANEL:Init()
    self:SetTall( s(3) )

    self.title = vgui.Create( "fsds::scaling_label", self )
    self.title:Dock( FILL )
    self.title:DockMargin( 0, 0, 0, 0 )
    self.title:SetContentAlignment( 5 )
    self.title:SetText( "Free Software Derma Sculptor" )
    self.title:SetFont( fsds.Font( fsds.theme.type_sans, 4, 400 ) )
    self.title:SetTextColor( fsds.theme.text_primary )
    self.title:SizeToContentsX()

end

function PANEL:Paint( w, h )
    surface.SetDrawColor( fsds.theme.background_decoration )
    surface.DrawRect( 0, 0, w, h )
end

function PANEL:PerformLayout( w, h )
    BaseClass.PerformLayout( self, w, h )
    self:SetTall( s(3) )
end


vgui.Register( "fsds::Decoration", PANEL, "DPanel" )