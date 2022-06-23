if SERVER then
	--[[
	include('server/serverlua.lua')
	AddCSLuaFile('client/clientlua.lua')
	]]
	local files = file.Find('server/*.lua', 'LUA')
	table.foreach(files, function(key, gui)
		include('server/' .. gui)
	end )
	local files = file.Find('client/*.lua', 'LUA')
	table.foreach(files, function(key, gui)
		AddCSLuaFile('client/' .. gui)
	end)
	
	include('weapon/weapon_first/init.lua')
	
	
	
	
	
end

if CLIENT then
--	include('client/clientlua.lua')

local files = file.Find('client/*.lua', 'LUA')
	table.foreach(files, function(key, gui)
		include('client/' .. gui)
	end )

	
	
end

print('StartUp sucsesfully loaded!')