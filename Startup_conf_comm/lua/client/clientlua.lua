print('Client lua loading!')

concommand.Add( "testavatar", function()

	local Panel = vgui.Create( "DFrame" )
	Panel:SetPos( 200, 200 )
	Panel:SetSize( 500, 500 )
	Panel:SetTitle( "Avatar Test" )
	Panel:MakePopup()

	local Avatar = vgui.Create( "AvatarImage", Panel )
	Avatar:SetSize( 64, 64 )
	Avatar:SetPos( 4, 30 )
	Avatar:SetPlayer( LocalPlayer(), 64 )

end )