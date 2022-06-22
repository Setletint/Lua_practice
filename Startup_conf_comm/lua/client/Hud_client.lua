print('Loading HUD Lua...')
--[[
local function HUDHide ( HLHUD )
	for k, v in pairs('CHudHealth', 'CHudBattery', 'CHudAmmo') do
		if HLHUD == v then return false end
	end
end

hook.Add('HUDShouldDraw', 'HudHideF', HUDHide)
]]

local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudAmmo"] = true
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then
		return false
	end

	-- Don't return anything here, it may break other addons that rely on this hook.
end )

myHUDX = 26
myHUDY = ScrH() - 30

surface.CreateFont('FontForSHUD', {
	font = 'Default',
	size = 24,
	weight = 600	
	} )
	
	
local function ServerHUD()

	local ply = LocalPlayer()
	local hp = ply:Health() or 0
	local maxhp = ply:GetMaxHealth() or 0
	local armor = ply:Armor() or 0
	local wep = ply:GetActiveWeapon()
	if ( !IsValid(wep)) then return 0 end
	local tammo = ply:GetAmmoCount( wep:GetPrimaryAmmoType() ) or 0
	local ammo_in_clip = ply:GetActiveWeapon():Clip1()
	if ammo_in_clip == -1 then ammo_in_clip = 0 end
	local tammo_in_clip = ply:GetActiveWeapon():GetMaxClip1()
	if tammo_in_clip == -1 then tammo_in_clip = 0 end
	
	
	draw.RoundedBox(5, myHUDX, myHUDY, 320, 20, Color(290, 295, 295, 100))
	draw.RoundedBox(5, myHUDX, myHUDY, math.Clamp(hp, 1 , 320)*3.19, 20, Color(290, 295, 295, 400))
	draw.SimpleText('HP: ' .. hp .. '/' .. maxhp, 'FontForSHUD', myHUDX + 105, myHUDY - 25, Color (290, 295, 295, 400), TEXT_ALIGN_TOP)
	draw.SimpleText('Ammo: ' .. ammo_in_clip .. '/' .. tammo_in_clip .. '|' .. tammo , 'FontForSHUD', myHUDX + 105, myHUDY - 55, Color (290, 295, 295, 400), TEXT_ALIGN_TOP)
end

hook.Add('HUDPaint', 'FirstHUD', ServerHUD)
