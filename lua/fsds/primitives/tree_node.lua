local s = fsds.Scale

local PANEL = {}

DEFINE_BASECLASS( "DPanel" )

function PANEL:Init()
	BaseClass.Init( self )
    self:SetPaintBackground( false )

    self.is_laying_out = false
    self.depth = 0
    self.children = {}

    self.title = vgui.Create( "DPanel", self )
    self.title:Dock( TOP )
    self.title:SetTall( s(1.3) )
    self.title:SetPaintBackground( false )
    self.title:DockPadding( s(3), 0, 0, 0 )
    function self.title:Paint( w, h )
        local icons = fsds.Font( fsds.theme.type_mono, s(1) )

        draw.SimpleText( fsds.icp.folder, icons, 0, h / 2, fsds.theme.text_primary, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
    end

    self.label = vgui.Create( "fsds::scaling_label", self.title )
    self.label:SetFont( fsds.Font( fsds.theme.type_mono, 4, 400 ) )
    self.label:Dock( TOP )

    self.cont = vgui.Create( "DPanel", self )
    self.cont:Dock( TOP )
    self.cont:SetPaintBackground( false )

    self:InvalidateLayout( true )
    self:SizeToChildren( false, true )
end

function PANEL:AddChildNode( node )
    node:SetParent( self.cont )
    node:Dock( TOP )
    node.depth = self.depth + 1

    table.insert( self.children, node )
end

function PANEL:SetText( text )
    self.label:SetText( text )
end

function PANEL:PerformLayout( w, h )
	BaseClass.PerformLayout( self, w, h )

    self:DockMargin( s(0.5) * self.depth, 0, 0, 0 )
    self.title:SetTall( s(1.3) )
    self.label:SizeToContentsY()
    self.cont:SetTall( #self.children * s(1.3) )
    self:SizeToChildren( false, true )
end


vgui.Register( "fsds::tree_node", PANEL, "DPanel" )