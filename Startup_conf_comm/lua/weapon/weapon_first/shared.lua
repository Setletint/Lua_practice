print('123')

AddCSLuaFile()

SWEP.DrawWeaponInfoBox           = true
SWEP.Author                      = 'Me'
SWEP.Base                        = 'weapon_base'
SWEP.Contact                     = 'Track'
SWEP.Purpose                     = 'Yes'
SWEP.Instructions                = 'idk'

SWEP.Category                    = 'Other'
SWEP.Spawnable                   = true
SWEP.AdminSpawnable              = false
SWEP.Primary.Sound               = Sound('jojos-bizarre-adventure-ay-ay-ay-ay-_-sound-effect.mp3')

SWEP.Primary.Delay               = 0.1
SWEP.Primary.Recoil              = 0
SWEP.Primary.Damage              = 10
SWEP.Primary.NumShots            = 1
SWEP.Primary.Cone                = 0
SWEP.Primary.ClipSize            = -1
SWEP.Primary.DefaultClip         = -1
SWEP.Primary.Ammo                = 'none'
SWEP.Primary.Automatic           = true

SWEP.Secondary.ClipSize          = -1
SWEP.Secondary.DefaultClip       = -1
SWEP.Secondary.Automatic         = false
SWEP.Secondary.Ammo              = 'none'
SWEP.Secondary.Delay             = 10

SWEP.ViewModel = Model('models/props_phx/mechanics/biggear.mdl')

if (SERVER) then
	SWEP.HoldType = 'slam'
	function SWEP:Initialize()
		self:SetWeaponHoldType(self.HoldType)
	end

	function SWEP:DrawWorldModel()
	end

	function SWEP:Reload()
	end

	function SWEP:Think()
	end

	function SWEP:PrimaryAttack()

		local ply = self.Owner
		local trace = ply:GetEyeTrace().HitPos
		
		ply:ChatPrint( trace:Distance( ply:GetPos() ) )

	end

	function SWEP:SecondaryAttack()

	end

	function SWEP:Deploy()
	end
end