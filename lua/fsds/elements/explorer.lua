local s = fsds.Scale

DEFINE_BASECLASS( "DPanel" )

local PANEL = {}

function PANEL:Init()
    self:SetWide( s(20) )
    self:EnableResizeFrom( RIGHT )
    self:SetTolerance( s(1) )
    self:SetMinW( s(17) )

    self.lastWidth = 0
    self.layoutInProgress = false

    self:MakeTitle()
    self:MakeTree()
end

function PANEL:MakeTitle()
    local cont = vgui.Create( "DPanel", self )
    cont:Dock( TOP )
    cont:SetTall( s(3) )
    cont:SetPaintBackground( false )

    local label = vgui.Create( "fsds::scaling_label", cont )
    label:Dock( LEFT )
    label:DockMargin( s(2), s(1), 0, 0 )
    label:SetText( "SAVED PROJECTS" )
    label:SetFont( fsds.Font( fsds.theme.type_sans, 4, 400 ) )
    label:SetTextColor( fsds.theme.text_secondary )
    label:SizeToContents()
    label.autoResize = true
end

function PANEL:AddFile( name, scope, parent )
    local node = vgui.Create( "fsds::tree_node", parent or self )
    node:Dock( TOP )
    node:SetText( name )

    if IsValid( parent ) then
        parent:AddChildNode( node )
    end
end

function PANEL:AddDir( name, parentDir, scope, parent )
    local files, dirs = file.Find( parentDir.."/*", "DATA" )
    local initialScope = scope

    for _, dir in ipairs( dirs ) do
        local newParent = vgui.Create( "fsds::tree_node", parent or self )
        newParent:Dock( TOP )
        newParent:SetText( name )
        if IsValid( parent ) then
            parent:AddChildNode( newParent )
        end

        self:AddDir( dir, parentDir.."/"..dir, scope + 1, newParent )
    end

    for _, file in ipairs( files ) do
        self:AddFile( file, initialScope, parent )
    end

    return scope
end

function PANEL:MakeTree()
    self.root = vgui.Create( "fsds::tree_node", self )
    self.root:Dock( TOP )
    self.root:SetText( "" )

    local files, dirs = file.Find( "fsds/*", "DATA" )

    for _, dir in ipairs( dirs ) do
        self:AddDir( dir, "fsds", 0, self.root )
    end

    for _, file in ipairs( files ) do
        self:AddFile( file, "fsds", self.root )
    end
end

function PANEL:Paint( w, h )
    surface.SetDrawColor( fsds.theme.background_window )
    surface.DrawRect( 0, 0, w, h )
end

function PANEL:PerformLayout( w, h )
    BaseClass.PerformLayout( self, w, h )
end


vgui.Register( "fsds::Explorer", PANEL, "fsds::resizable_panel" )