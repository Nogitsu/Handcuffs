surface.CreateFont("guigui_HandcuffsHUD",{
	font="Arial",
	size=50,
	antialias=true,
	weight=750,
	shadow=true
})

surface.CreateFont("guigui_HandcuffsDraw",{
	font="Arial",
	size=25,
	antialias=true,
	weight=750,
	shadow=true
})

local lang = GetConVar( "gmod_language" ):GetString()

cvars.AddChangeCallback( "gmod_language", function( convar, oldValue, newValue )
	lang = newValue
end, "player_connect_notify" )

local HandCuffed = ""

if lang == "fr" then
HandCuffed = "MENOTTÉ"
elseif lang == "de" then
HandCuffed = "In handschellen"
else
HandCuffed = "HANDCUFFED"
end

hook.Add("PostDrawHUD", "guigui_HandcuffsHUD", function()
	local ply = LocalPlayer()
	if ply:HasWeapon("guigui_handcuffed") then
		if !ply:Alive() then return end
		draw.DrawText(HandCuffed, "guigui_HandcuffsHUD", ScrW()/2, ScrH()/1.08, Color(255, 255, 255, 255),TEXT_ALIGN_CENTER)
	end
end)

hook.Add("PostPlayerDraw", "guigui_HandcuffsDraw", function(ply)
	if ply:HasWeapon("guigui_handcuffed") then
		if !ply:Alive() then return end
		local offset = Vector(0, 0, 85)
		local ang = LocalPlayer():EyeAngles()
		local pos = ply:GetPos() + offset + ang:Up()
		ang:RotateAroundAxis(ang:Forward(), 90)
		ang:RotateAroundAxis(ang:Right(), 90)
		cam.Start3D2D( pos, Angle(0, ang.y, 90), 0.25)
			draw.DrawText(HandCuffed, "guigui_HandcuffsDraw", 2, 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
		cam.End3D2D()
	end
end)
