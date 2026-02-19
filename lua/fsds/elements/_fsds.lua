local s = fsds.Scale

local PANEL = {}

function PANEL:Init()
    fsds.menu = self

    self.AllowAutoRefresh = true
    self:MakePopup()
    self:SetSize( ScrW(), ScrH() )
    self:SetPos( 0, 0 )

    self:MakeDecoration()
    self:MakeStatus()
    self:MakeSideBar()
    self:MakeExplorer()
end

function PANEL:MakeDecoration()
    self.decoration = vgui.Create( "fsds::Decoration", self )
    self.decoration:Dock( TOP )

    hook.Run( "greywater::fsds_Decoration", self, self.decoration )
end

function PANEL:MakeStatus()
    self.status = vgui.Create( "fsds::Status", self )
    self.status:Dock( BOTTOM )

    hook.Run( "greywater::fsds_Status", self, self.status )
end

function PANEL:MakeSideBar()
    self.sideBar = vgui.Create( "fsds::SideBar", self )
    self.sideBar:Dock( LEFT )

    hook.Run( "greywater::fsds_SideBar", self, self.sideBar )
end

function PANEL:MakeExplorer()
    self.explorer = vgui.Create( "fsds::Explorer", self )
    self.explorer:Dock( LEFT )

    hook.Run( "greywater::fsds_Explorer", self, self.explorer )
end


function PANEL:Paint( w, h )
    surface.SetDrawColor( fsds.theme.background_editor )
    surface.DrawRect( 0, 0, w, h )
end

function PANEL:PostAutoRefresh()
    if IsValid( self ) then self:Remove() end

    timer.Simple( 0.1, function()
        vgui.Create( "greywater::dermasculptor" )
    end )
end

function PANEL:OnKeyCodePressed( key )
    if key == KEY_TAB then
        self:Remove()
        return
    end

    if input.IsKeyDown( KEY_LCONTROL ) then
        if key == KEY_EQUAL then
            fsds.IncrementScale()
        elseif key == KEY_MINUS then
            fsds.DecrementScale()
        end
    end
end


derma.DefineControl(
    "greywater::dermasculptor",
    "A free software tool for easily making Derma elements.",
    PANEL,
    "EditablePanel"
)