if SERVER then
	include('server/serverlua.lua')
	AddCSLuaFile('client/clientlua.lua')
end

if CLIENT then
	include('client/clientlua.lua')
end