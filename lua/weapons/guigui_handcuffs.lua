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
SWEP.Category = "Guillaume's weapons"
SWEP.Instructions = "Left click to cuffed\nRight click to uncuffed"
SWEP.Contact = "steamcommunity.com/id/guillaume_"
SWEP.Slot = 0
SWEP.SlotPos = 4
SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.ViewModelFOV = 62
SWEP.WorldModel = ""
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "rpg"
SWEP.UseHands = true
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic =true
SWEP.Secondary.Ammo = "none"
SWEP.DrawAmmo = false

function SWEP:Initialize()
	self:SetHoldType("normal")
end

function SWEP:Deploy()
    return true
end

function SWEP:PreDrawViewModel()
    return true
end

local lang = GetConVar( "gmod_language" ):GetString()

cvars.AddChangeCallback( "gmod_language", function( convar, oldValue, newValue )
	lang = newValue
end, "player_connect_notify" )

local Cuffed = ""
local Uncuffed = ""

if lang == "fr" then
	Cuffed = "Menotté"
	Uncuffed = "Démenotté"
elseif lang == "de" then
	Cuffed = "Gefesselt"
	Uncuffed = "Frei"
else
	Cuffed = "Cuffed"
	Uncuffed = "Uncuffed"
end

function SWEP:PrimaryAttack()
	if SERVER then 
		local ply = self.Owner
		local ent = ply:GetEyeTrace().Entity
		if ply:GetPos():DistToSqr(ent:GetPos())<22500 then
			local wep = ent:GetActiveWeapon():GetClass()
			if ent:IsValid() and ent:IsPlayer() then
				if wep == "weapon_physgun" or wep == "weapon_physcannon" or wep == "gmod_tool" or wep == "weapon_fists" or wep == "keys" or wep == "pocket" then
					ent:Give("guigui_handcuffed")
					ent:SelectWeapon("guigui_handcuffed")
					local speed = ent:GetWalkSpeed()/2
					ent:SetWalkSpeed(speed)
					ent:SetRunSpeed(speed)
					ent:ManipulateBoneAngles(ent:LookupBone("ValveBiped.Bip01_L_UpperArm"), Angle(20, 8.8, 0))
					ent:ManipulateBoneAngles(ent:LookupBone("ValveBiped.Bip01_L_Forearm"), Angle(15, 0, 0))
					ent:ManipulateBoneAngles(ent:LookupBone("ValveBiped.Bip01_L_Hand"), Angle(0, 0, 75))
					ent:ManipulateBoneAngles(ent:LookupBone("ValveBiped.Bip01_R_Forearm"), Angle(-15, 0, 0))
					ent:ManipulateBoneAngles(ent:LookupBone("ValveBiped.Bip01_R_Hand"), Angle(0, 0, -75))
					ent:ManipulateBoneAngles(ent:LookupBone("ValveBiped.Bip01_R_UpperArm"), Angle(-20, 16.6, 0))
					ply:PrintMessage(4, Cuffed ) 
				end
			end
		end
	end
end

function SWEP:SecondaryAttack()
	if CLIENT then return end
	local ply = self.Owner
	local ent = ply:GetEyeTrace().Entity
	if ply:GetPos():DistToSqr(ent:GetPos())<22500 then
		if ent:IsValid() and ent:IsPlayer() then
			local wep = ent:GetActiveWeapon():GetClass()
			if wep == "guigui_handcuffed" then
				ent:StripWeapon("guigui_handcuffed")
				local speed = ent:GetWalkSpeed()*2
				ent:SetWalkSpeed(speed)
				ent:SetRunSpeed(speed)
				ent:ManipulateBoneAngles(ent:LookupBone("ValveBiped.Bip01_L_UpperArm"), Angle(0, 0, 0))
				ent:ManipulateBoneAngles(ent:LookupBone("ValveBiped.Bip01_L_Forearm"), Angle(0, 0, 0))
				ent:ManipulateBoneAngles(ent:LookupBone("ValveBiped.Bip01_L_Hand"), Angle(0, 0, 0))
				ent:ManipulateBoneAngles(ent:LookupBone("ValveBiped.Bip01_R_Forearm"), Angle(0, 0, 0))
				ent:ManipulateBoneAngles(ent:LookupBone("ValveBiped.Bip01_R_Hand"), Angle(0, 0, 0))
				ent:ManipulateBoneAngles(ent:LookupBone("ValveBiped.Bip01_R_UpperArm"), Angle(0, 0, 0))
				ply:PrintMessage(4, Uncuffed) 
			end
		end
	end
end
