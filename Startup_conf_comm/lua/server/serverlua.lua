print('Server Lua Loading!')
hook.Add( "PlayerSay", "CoinFlip", function( ply, text )
	if ( string.lower( text ) == "/flip" ) then
		local PlayerFlip = math.random( 2 )
		local PlayerRes = string
		if PlayerFlip == 1 then
			PlayerRes = ' и выпала решка.'
		else
			PlayerRes = ' и выпал орёл.'
		end
		PrintMessage( HUD_PRINTTALK, ply:Nick() .. " подбросил пистолет вверх" .. PlayerRes )
		print(ply:Nick().. " подбросил пистолет вверх " .. PlayerRes)
		return ""
	end
end )

hook.Add( "PlayerSay", "RespawnCommand", function( ply, text, public )
	if ( string.lower( text ) == "/respawn" ) and ply:Nick() == 'Spike Spiegel' then
	
		--ply:Kill()
		print(ply:Nick() .. 'перереспавнился.')
		ply:Spawn()
		return ""
	end
end )

hook.Add( "PlayerSay", "RollCommand", function( ply, text, public )
	if ( string.lower( text ) == "/roll" ) then
		if ply:Nick('Spike Spiegel') then
			PrintMessage( HUD_PRINTTALK, ply:Nick() .. " заролил " .. (math.random(70,100)))
		else
		
		PrintMessage( HUD_PRINTTALK, ply:Nick() .. " заролил " .. (math.random(100)))
		end
		return ""
	end
end )

hook.Add( "PlayerSay", "MeCommand", function( ply, text, public )
	if ( string.StartWith( string.lower( text ), "/me")) then
		local FinalTextMe = string.gsub(text, "/me", "", 1)
		PrintMessage( HUD_PRINTTALK, ply:Nick() .. FinalTextMe)
		print( HUD_PRINTTALK, ply:Nick() .. FinalTextMe)
		return ""
	end
end )

hook.Add( "PlayerSay", "DoCommand", function( ply, text, public )
	if ( string.StartWith( string.lower( text ), "/do")) then
		local FinalTextDo = string.gsub(text, "/do", "")
		PrintMessage(HUD_PRINTTALK, FinalTextDo .. ' ((' .. ply:Nick() .. '))')
		print(FinalTextDo .. ' ((' .. ply:Nick() .. '))')
		return ""
	end
end )

local function WhenPlayerSaid(ply, text)
	ply:ChatPrint('Ваше сообщение было доставлено')
end

hook.Add('PlayerSay', 'playersaidany', WhenPlayerSaid)
