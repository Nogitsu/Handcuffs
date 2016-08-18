hook.Add("PlayerSwitchWeapon", "guigui_Handcuffs", function(ply)
	if ply:HasWeapon("guigui_handcuffed") then
		timer.Simple(0, function() ply:SelectWeapon("guigui_handcuffed") end)
	end
end)