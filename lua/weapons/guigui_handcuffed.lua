if CLIENT then

local lang = GetConVar( "gmod_language" ):GetString()

cvars.AddChangeCallback( "gmod_language", function( convar, oldValue, newValue )
	lang = newValue
end, "player_connect_notify" )

if lang == "fr" then
	SWEP.PrintName = "Menottes"
elseif lang == "de" then
	SWEP.PrintName = "Handschellen"
else
	SWEP.PrintName = "Handcuffs"
end

end

SWEP.Author = "Guillaume"
SWEP.Contact = "steamcommunity.com/id/guillaume_"
SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.Spawnable = false
SWEP.ViewModelFOV = 62
SWEP.WorldModel = ""
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "rpg"
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = false
SWEP.UseHands = true
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"
SWEP.DrawAmmo = false

function SWEP:Initialize()
	self:SetHoldType("normal")
end

function SWEP:Deploy()
	self:gnPosBones()
    return true
end

function SWEP:PreDrawViewModel()
    return true
end

function SWEP:gnPosBones()
local ply = self.Owner
	if ply:Alive() then
	ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_L_UpperArm"), Angle(20, 8.8, 0))
	ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_L_Forearm"), Angle(15, 0, 0))
	ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_L_Hand"), Angle(0, 0, 75))
	ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_R_Forearm"), Angle(-15, 0, 0))
	ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_R_Hand"), Angle(0, 0, -75))
	ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_R_UpperArm"), Angle(-20, 16.6, 0))
	end
end

function SWEP:Holster()
	return false
end

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

function SWEP:Reload()
end
