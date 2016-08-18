SWEP.PrintName = "Handcuffs"
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
					ply:PrintMessage(4, "cuffed" ) 
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
				ply:PrintMessage(4, "uncuffed") 
			end
		end
	end
end