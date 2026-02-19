local s = fsds.Scale

local PANEL = {}

DEFINE_BASECLASS( "DLabel" )

function PANEL:Init()
	BaseClass.Init( self )

	self.is_laying_out = false
	self.autoResize = false
end

function PANEL:SetFont( font )
	BaseClass.SetFont( self, font )
	if self.is_laying_out then return end

	local type, size, weight = font:match( "(.+):(.+):(.+)" )
	self.fontType = type
	self.fontSize = size
	self.fontWeight = weight
end

function PANEL:PerformLayout( w, h )
	BaseClass.PerformLayout( self, w, h )

	if self.is_laying_out then return end
	self.is_laying_out = true
	self:SetFont( fsds.Font(
		self.fontType,
		(self.fontSize / 3) * (fsds.GetMenuScale()),
		self.fontWeight
	) )
	if self.autoResize then
		self:SizeToContents()
	end
	self.is_laying_out = false
end


vgui.Register( "fsds::scaling_label", PANEL, "DLabel" )