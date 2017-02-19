hook.Add("PlayerSwitchWeapon", "guigui_Handcuffs", function(ply)
	if ply:HasWeapon("guigui_handcuffed") then
	ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_L_UpperArm"), Angle(20, 8.8, 0))
	ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_L_Forearm"), Angle(15, 0, 0))
	ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_L_Hand"), Angle(0, 0, 75))
	ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_R_Forearm"), Angle(-15, 0, 0))
	ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_R_Hand"), Angle(0, 0, -75))
	ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_R_UpperArm"), Angle(-20, 16.6, 0))
	timer.Simple(0, function() ply:SelectWeapon("guigui_handcuffed") end)
	end
end)

hook.Add("PostPlayerDeath", "ResetPlayer", function(ply)
	if ply:HasWeapon("guigui_handcuffed") then
		ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_L_UpperArm"), Angle(0, 0, 0))
		ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_L_Forearm"), Angle(0, 0, 0))
		ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_L_Hand"), Angle(0, 0, 0))
		ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_R_Forearm"), Angle(0, 0, 0))
		ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_R_Hand"), Angle(0, 0, 0))
		ply:ManipulateBoneAngles(ply:LookupBone("ValveBiped.Bip01_R_UpperArm"), Angle(0, 0, 0))
	end
end)
