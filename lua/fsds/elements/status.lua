local s = fsds.Scale

DEFINE_BASECLASS( "DPanel" )

local PANEL = {}

function PANEL:Init()
    self:SetTall( s(2) )
    self:DockPadding( s(1), 0, s(1), 0 )

    self.items = {}

    self:AddIndicator( function()
        return "Scale: "..fsds.GetMenuScale()
    end )
end

function PANEL:AddIndicator( text )
    local b = vgui.Create( "DLabel", self )
    b:Dock( LEFT )
    b:SetTextColor( fsds.theme.text_primary )

    if isfunction( text ) then
        function b:Think()
            self:SetText( text() )
        end
    else
        self:SetText( text )
    end

    function b:PerformLayout( w, h )
        self:SetFont( fsds.Font( fsds.theme.type_sans, s(1.5), 400 ) )
        self:SizeToContentsX()
    end

    table.insert( self.items, b )
end

function PANEL:Paint( w, h )
    surface.SetDrawColor( fsds.theme.interact_accent )
    surface.DrawRect( 0, 0, w, h )
end

function PANEL:PerformLayout( w, h )
    BaseClass.PerformLayout( self, w, h )
    self:SetTall( s(2) )
end


vgui.Register( "fsds::Status", PANEL, "DPanel" )