
include "constants.lua"

local base = piece 'base'
local body = piece 'body' 
local head = piece 'head' 
local larm = piece 'larm'
local rarm = piece 'rarm'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local gunlance = piece 'gunlance'
local flare1 = piece 'flare1'
local flare2 = piece 'flare2'
local flare3 = piece 'flare3'
local flare4 = piece 'flare4'
local flare5 = piece 'flare5'
local flare6 = piece 'flare6'
local armorValue = UnitDefs[unitDefID].armoredMultiple

local step = true
local aiming = false
local shot1 = false
local shot2 = false
local lmb2 = false
local ab1 = false
local cooldown1 = false
local ab2 = false
local cooldown2 = false
local ab2aim = false

local SIG_Walk = 2
local SIG_Aim = 4

local function Walk()
    Signal(SIG_Walk)
	SetSignalMask(SIG_Walk)

	while true do
	    if not aiming then
		    Turn(base, z_axis, math.rad(0), 10)
	        Turn(body, x_axis, math.rad(-15), 6)
		    Turn(head, x_axis, math.rad(15), 6)
		    Turn(larm, x_axis, math.rad(45), 12)
		    Turn(larm, y_axis, math.rad(45), 12)
		    Turn(rarm, x_axis, math.rad(-45), 12)
		    Turn(rarm, y_axis, math.rad(-45), 12)
			Turn(rarm, z_axis, math.rad(0), 12)
		end
		Turn(lleg, y_axis, math.rad(-15), 12)
		Turn(rleg, y_axis, math.rad(15), 12)
	    if step then
		    if not aiming then
			    Move(body, z_axis, 1, 10)
			    Turn(body, z_axis, math.rad(15), 6)
				Turn(head, y_axis, math.rad(-4), 6)
				Turn(head, z_axis, math.rad(-15), 6)
			end
	        Turn(lleg, x_axis, math.rad(60), 12)
		    Turn(rleg, x_axis, math.rad(-60), 12)
			WaitForTurn(lleg, x_axis)
			if not aiming then
			    Move(body, z_axis, -1, 10)
			end
		    Sleep(200)
			step = false
		else
		    if not aiming then
			    Move(body, z_axis, 1, 10)
			    Turn(body, z_axis, math.rad(-15), 6)
				Turn(head, y_axis, math.rad(4), 6)
				Turn(head, z_axis, math.rad(15), 6)
			end
		    Turn(lleg, x_axis, math.rad(-60), 12)
		    Turn(rleg, x_axis, math.rad(60), 12)
			WaitForTurn(rleg, x_axis)
		    Sleep(200)
			if not aiming then
			    Move(body, z_axis, -1, 10)
			end
			step = true
		end
	end
end

local function StopWalk()
    Signal(SIG_Walk)
	
	if not aiming then
	    Move(body, z_axis, 0, 60)
	    Turn(body, x_axis, math.rad(0), 6)
	    Turn(body, z_axis, math.rad(-45), 6)
	    Turn(head, x_axis, math.rad(0), 6)
	    Turn(head, y_axis, math.rad(0), 6)
	    Turn(head, z_axis, math.rad(45), 6)
        Turn(larm, x_axis, math.rad(0), 12)
	    Turn(larm, y_axis, math.rad(15), 12)
        Turn(rarm, x_axis, math.rad(0), 12)
	    Turn(rarm, y_axis, math.rad(-15), 12)
	    Turn(rarm, z_axis, math.rad(0), 24)
	end
	Turn(lleg, x_axis, math.rad(-15), 12)
	Turn(lleg, y_axis, math.rad(0), 12)
    Turn(rleg, x_axis, math.rad(15), 12)
	Turn(rleg, y_axis, math.rad(0), 12)
end

function script.StartMoving()
	StartThread(Walk)
end

function script.StopMoving()
	StartThread(StopWalk)
end

local function RestoreAfterDelay()
	Sleep(1000)
	aiming = false
    
	Turn(base, z_axis, math.rad(0), 10)
	Move(body, z_axis, 0, 60)
	Turn(body, x_axis, math.rad(0), 6)
	Turn(body, z_axis, math.rad(-45), 6)
	Turn(head, x_axis, math.rad(0), 6)
	Turn(head, y_axis, math.rad(0), 6)
	Turn(head, z_axis, math.rad(45), 6)
    Turn(lleg, x_axis, math.rad(-15), 12)
	Turn(lleg, y_axis, math.rad(0), 12)
    Turn(rleg, x_axis, math.rad(15), 12)
	Turn(rleg, y_axis, math.rad(0), 12)
    Turn(larm, x_axis, math.rad(0), 12)
	Turn(larm, y_axis, math.rad(15), 12)
	Turn(larm, z_axis, math.rad(0), 12)
    Turn(rarm, x_axis, math.rad(0), 12)
	Turn(rarm, y_axis, math.rad(-15), 12)
	Turn(rarm, z_axis, math.rad(0), 24)
end

function script.QueryWeapon(num)
	return body
end

function script.AimFromWeapon(num)
	return body
end

local function Shellshock()
	local x, y, z
	lmb2 = true
	aiming = true
	Signal(SIG_Aim)
	
	Turn(body, x_axis, math.rad(0), 6)
    Turn(head, x_axis, math.rad(0), 6)
	Turn(body, z_axis, math.rad(-45), 12)
	Turn(head, z_axis, math.rad(45), 12)
	Turn(larm, x_axis, math.rad(15), 12)
	Turn(larm, y_axis, math.rad(75), 12)
	Turn(rarm, x_axis, math.rad(0), 6)
	Turn(rarm, y_axis, math.rad(-90), 6)
	Turn(rarm, z_axis, math.rad(15), 12)
	Sleep(100)
	x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/dummy/gunlancejab2.wav", 10, x, y, z, 1, 1, 1, 1)
	EmitSfx(body, GG.Script.FIRE_W2)
    Spring.SpawnCEG ("shellshock", x, y, z, 10, 1, 1, 1, 0)
	
	Move(body, y_axis, 10, 60)
	Turn(body, z_axis, math.rad(-75), 24)
	Turn(rarm, x_axis, math.rad(0), 6)
	Turn(rarm, y_axis, math.rad(-90), 6)
	Turn(rarm, z_axis, math.rad(15), 12)
	WaitForTurn(body, z_axis)
	EmitSfx(body, GG.Script.FIRE_W2)
	Spring.SpawnCEG ("shellshock", x, y, z, 10, 1, 1, 1, 0)
	Move(body, y_axis, 10, 60)
	Turn(body, z_axis, math.rad(105.1), 24)
	WaitForTurn(body, z_axis)
	EmitSfx(body, GG.Script.FIRE_W2)
	Spring.SpawnCEG ("shellshock", x, y, z, 10, 1, 1, 1, 0)
	Turn(body, z_axis, math.rad(-74.9), 24)
	Sleep(200)
	shot2 = false
	lmb2 = false
	aiming = false
	Sleep(100)
	Move(body, y_axis, 0, 30)
end

local function Bastion()
    cooldown1 = true
	aiming = true
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 0.5)
	GG.UpdateUnitAttributes(unitID)
	Signal(SIG_Aim)
	
	Turn(body, x_axis, math.rad(0), 6)
    Turn(head, x_axis, math.rad(0), 6)
    Turn(body, z_axis, math.rad(-75), 12)
	Turn(head, z_axis, math.rad(75), 12)
	Turn(larm, x_axis, math.rad(90), 12)
	Turn(larm, y_axis, math.rad(30), 12)
	Turn(rarm, x_axis, math.rad(15), 6)
	Turn(rarm, y_axis, math.rad(0), 6)
	Turn(rarm, z_axis, math.rad(75), 12)
	Sleep(200)
	ab1 = true
	GG.SetUnitArmor(unitID, armorValue)
	
	Turn(body, x_axis, math.rad(0), 6)
    Turn(head, x_axis, math.rad(0), 6)
    Turn(body, z_axis, math.rad(-75), 12)
	Turn(head, z_axis, math.rad(75), 12)
	Turn(larm, x_axis, math.rad(90), 12)
	Turn(larm, y_axis, math.rad(30), 12)
	Turn(rarm, x_axis, math.rad(15), 6)
	Turn(rarm, y_axis, math.rad(0), 6)
	Turn(rarm, z_axis, math.rad(75), 12)
	Sleep(3000)
	ab1 = false
	GG.SetUnitArmor(unitID, 1.0)
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1)
	GG.UpdateUnitAttributes(unitID)
	Signal(SIG_Aim)
	Sleep(100)
	aiming = false
	
	Move(body, z_axis, 0, 60)
	Turn(body, x_axis, math.rad(0), 6)
	Turn(body, z_axis, math.rad(-45), 6)
	Turn(head, x_axis, math.rad(0), 6)
	Turn(head, y_axis, math.rad(0), 6)
	Turn(head, z_axis, math.rad(45), 6)
    Turn(lleg, x_axis, math.rad(-15), 12)
	Turn(lleg, y_axis, math.rad(0), 12)
    Turn(rleg, x_axis, math.rad(15), 12)
	Turn(rleg, y_axis, math.rad(0), 12)
    Turn(larm, x_axis, math.rad(0), 12)
	Turn(larm, y_axis, math.rad(15), 12)
	Turn(larm, z_axis, math.rad(0), 12)
    Turn(rarm, x_axis, math.rad(0), 12)
	Turn(rarm, y_axis, math.rad(-15), 12)
	Turn(rarm, z_axis, math.rad(0), 24)
	Sleep(3900)
	cooldown1 = false
end

local function WyvernBlast()
    ab2 = true
	aiming = true
	cooldown2 = true
	ab2aim = true
	Signal(SIG_Aim) 
	
	Sleep(100)
	Spring.PlaySoundFile("sounds/dummy/gunlanceaoe.wav", 10, x, y, z, 1, 1, 1, 1)
	Turn(body, x_axis, math.rad(0), 6)
	Turn(head, x_axis, math.rad(0), 6)
	Turn(body, z_axis, math.rad(-75), 12)
	Turn(head, z_axis, math.rad(75), 12)
	Turn(larm, x_axis, math.rad(0), 12)
	Turn(larm, y_axis, math.rad(75), 12)
	Turn(rarm, x_axis, math.rad(0), 12)
	Turn(rarm, y_axis, math.rad(-180), 12)
	Turn(rarm, z_axis, math.rad(-75), 12)
	Sleep(100)
	Turn(body, x_axis, math.rad(0), 6)
	Turn(head, x_axis, math.rad(0), 6)
	Turn(body, z_axis, math.rad(-75), 12)
	Turn(head, z_axis, math.rad(75), 12)
	Turn(larm, x_axis, math.rad(0), 12)
	Turn(larm, y_axis, math.rad(75), 12)
	Turn(rarm, x_axis, math.rad(0), 12)
	Turn(rarm, y_axis, math.rad(-180), 12)
	Turn(rarm, z_axis, math.rad(-75), 12)
	Sleep(900)
	Turn(body, z_axis, math.rad(90), 24)
	Turn(head, z_axis, math.rad(-90), 24)
	Turn(rarm, x_axis, math.rad(0), 12)
	Turn(rarm, y_axis, math.rad(-90), 12)
	Turn(rarm, z_axis, math.rad(90), 24)
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 0)
	GG.UpdateUnitAttributes(unitID)
	ab2aim = false
	Sleep(100)
	EmitSfx(flare1, GG.Script.FIRE_W4)
	Sleep(100)
	EmitSfx(flare2, GG.Script.FIRE_W4)
	Sleep(100)
	EmitSfx(flare3, GG.Script.FIRE_W4)
	Sleep(100)
	EmitSfx(flare4, GG.Script.FIRE_W4)
	Sleep(100)
	EmitSfx(flare5, GG.Script.FIRE_W4)
	Sleep(100)
	EmitSfx(flare6, GG.Script.FIRE_W4)
	Sleep(500)
	ab2 = false
	aiming = false
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1)
	GG.UpdateUnitAttributes(unitID)
	Sleep(7000)
	cooldown2 = false
end

function script.AimWeapon(num, heading, pitch)
	if ab1 and num == 3 then
	    Signal(SIG_Aim)
	    SetSignalMask(SIG_Aim)
	    Turn(base, z_axis, heading, 10)
		Turn(body, x_axis, math.rad(0), 6)
        Turn(head, x_axis, math.rad(0), 6)
        Turn(body, z_axis, math.rad(-75), 12)
	    Turn(head, z_axis, math.rad(75), 12)
	    Turn(larm, x_axis, math.rad(90), 12)
	    Turn(larm, y_axis, math.rad(30), 12)
	    Turn(rarm, x_axis, math.rad(15), 6)
	    Turn(rarm, y_axis, math.rad(0), 6)
	    Turn(rarm, z_axis, math.rad(75), 12)
		WaitForTurn(base, z_axis)
	    return true
    elseif not cooldown1 and not lmb2 and not ab2 and num == 3 then
	    aiming = true
	    StartThread(Bastion)
		return false
    elseif not cooldown2 and not lmb2 and not ab2 and num == 3 then
	    StartThread(WyvernBlast)
	    return false
	elseif ab2aim then
	    Turn(base, z_axis, heading, 10)
		return false
	elseif shot2 and not lmb2 and not ab1 and not ab2 and num == 1 then
	    aiming = true
	    Turn(base, z_axis, heading, 10)
		WaitForTurn(base, z_axis)
	    StartThread(Shellshock)
	    return false
	elseif not lmb2 and not ab1 and not ab2 and num == 1 then
	    aiming = true
	    Signal(SIG_Aim)
	    SetSignalMask(SIG_Aim)
		Turn(base, z_axis, heading, 10)
        Turn(body, x_axis, math.rad(0), 6)
	    Turn(head, x_axis, math.rad(0), 6)
        Turn(larm, x_axis, math.rad(15), 12)
	    Turn(larm, y_axis, math.rad(75), 12)
	    Turn(body, z_axis, math.rad(-75), 12)
	    Turn(head, z_axis, math.rad(75), 12)
	    Turn(rarm, x_axis, math.rad(30), 6)
	    Turn(rarm, y_axis, math.rad(-30), 6)
	    Turn(rarm, z_axis, math.rad(60), 12)
	    WaitForTurn(base, z_axis)
	    WaitForTurn(body, z_axis)
	    WaitForTurn(rarm, y_axis)
	    WaitForTurn(rarm, z_axis)
	    StartThread(RestoreAfterDelay)
	    return true
    end
end

function script.FireWeapon(num)
    if num == 3 then
	    Move(body, y_axis, -10, 60)
		Turn(larm, y_axis, math.rad(15), 6)
		Sleep(300)
	    Move(body, y_axis, 0, 30)
		Turn(larm, y_axis, math.rad(30), 3)
    elseif shot1 and num == 1 then
	    shot1 = false
	    shot2 = true
	    Move(body, y_axis, 10, 60)
	    Turn(body, z_axis, math.rad(75), 24)
	    Turn(head, z_axis, math.rad(-75), 24)
	    Turn(rarm, x_axis, math.rad(-30), 24)
	    Turn(rarm, y_axis, math.rad(-15), 24)
	    Turn(rarm, z_axis, math.rad(-60), 20)
	    Sleep(300)
	    Move(body, y_axis, 0, 30)
    elseif num == 1 then
	    shot1= true
        Move(body, y_axis, 10, 60)
	    Turn(body, z_axis, math.rad(75), 24)
	    Turn(head, z_axis, math.rad(-75), 24)
	    Turn(rarm, x_axis, math.rad(-30), 24)
	    Turn(rarm, y_axis, math.rad(-15), 24)
	    Turn(rarm, z_axis, math.rad(-60), 20)
	    Sleep(300)
	    Move(body, y_axis, 0, 30)
	end
end

function script.Killed(recentDamage, maxHealth)
    Explode(body, SFX.FALL)
	Explode(head, SFX.FALL)
	Explode(larm, SFX.FALL)
	Explode(rarm, SFX.FALL)
	Explode(lleg, SFX.FALL)
	Explode(rleg, SFX.FALL)
	Explode(gunlance, SFX.FALL)
end
