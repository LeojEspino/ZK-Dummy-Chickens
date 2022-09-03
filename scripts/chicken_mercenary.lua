
include "constants.lua"

local body = piece 'body' 
local head = piece 'head' 
local larm = piece 'larm'
local rarm = piece 'rarm'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local gun = piece 'gun'
local knife = piece 'knife'
local emitter = piece 'emitter'

local step = true
local aiming = false
local buff = false
local ability1 = false
local cooldown1 = false

local isTurning = false
local SIG_Walk = 2
local SIG_Aim = 4

local function Walk()
    Signal(SIG_Walk)
	SetSignalMask(SIG_Walk)

	while true do
	    if not aiming then
	        Turn(body, x_axis, math.rad(-15), 6)
		    Turn(head, x_axis, math.rad(15), 6)
		    Turn(larm, x_axis, math.rad(45), 12)
		    Turn(larm, y_axis, math.rad(-75), 12)
		    Turn(larm, z_axis, math.rad(-135), 12)
		    Move(larm, x_axis, 7.5, 60)
		    Move(larm, y_axis, 7.5, 60)
		    Turn(rarm, x_axis, math.rad(179.9), 12)
		    Turn(rarm, y_axis, math.rad(0), 12)
		    Move(rarm, y_axis, 7.5, 60)
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
	    Turn(larm, z_axis, math.rad(0), 12)
        Turn(rarm, x_axis, math.rad(0), 12)
	    Move(larm, x_axis, 0, 60)
	    Move(larm, y_axis, 0, 60)
	    Turn(rarm, y_axis, math.rad(-15), 12)
	    Turn(rarm, z_axis, math.rad(0), 24)
	    Move(rarm, y_axis, 0, 60)
	    Move(rarm, z_axis, 0, 60)
	end
	Turn(lleg, x_axis, math.rad(-15), 12)
	Turn(lleg, y_axis, math.rad(0), 12)
	Turn(lleg, z_axis, math.rad(0), 12)
	Move(lleg, y_axis, 0, 60)
	Move(lleg, z_axis, 0, 60)
    Turn(rleg, x_axis, math.rad(15), 12)
	Turn(rleg, y_axis, math.rad(0), 12)
	Move(rleg, y_axis, 0, 60)
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
    
	Move(body, z_axis, 0, 60)
	Turn(body, x_axis, math.rad(0), 6)
	Turn(body, z_axis, math.rad(-45), 6)
	Turn(head, x_axis, math.rad(0), 6)
	Turn(head, y_axis, math.rad(0), 6)
	Turn(head, z_axis, math.rad(45), 6)
    Turn(lleg, x_axis, math.rad(-15), 12)
	Turn(lleg, y_axis, math.rad(0), 12)
	Turn(lleg, z_axis, math.rad(0), 12)
	Move(lleg, y_axis, 0, 60)
	Move(lleg, z_axis, 0, 60)
    Turn(rleg, x_axis, math.rad(15), 12)
	Turn(rleg, y_axis, math.rad(0), 12)
	Move(rleg, y_axis, 0, 60)
    Turn(larm, x_axis, math.rad(0), 12)
	Turn(larm, y_axis, math.rad(15), 12)
	Turn(larm, z_axis, math.rad(0), 12)
    Turn(rarm, x_axis, math.rad(0), 12)
	Move(larm, x_axis, 0, 60)
	Move(larm, y_axis, 0, 60)
	Turn(rarm, y_axis, math.rad(-15), 12)
	Turn(rarm, z_axis, math.rad(0), 24)
	Move(rarm, y_axis, 0, 60)
	Move(rarm, z_axis, 0, 60)
end

function script.QueryWeapon(num)
	return emitter
end

function script.AimFromWeapon(num)
	return body
end

local function GunBuff()
    local x, y, z
	Signal(SIG_Aim)
    cooldown1 = true
	ability1 = true
	
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 0)
	GG.UpdateUnitAttributes(unitID)
	Move(body, z_axis, 0, 60)
	Turn(body, x_axis, math.rad(0), 6)
	Turn(body, z_axis, math.rad(-60), 12)
	Turn(head, x_axis, math.rad(0), 6)
	Turn(head, y_axis, math.rad(0), 6)
	Turn(head, z_axis, math.rad(60), 12)
    Turn(lleg, x_axis, math.rad(15), 12)
	Turn(lleg, y_axis, math.rad(0), 12)
	Turn(lleg, z_axis, math.rad(45), 12)
    Turn(rleg, x_axis, math.rad(-30), 12)
	Turn(rleg, y_axis, math.rad(0), 12)
    Turn(larm, x_axis, math.rad(-30), 12)
	Turn(larm, y_axis, math.rad(30), 12)
	Turn(larm, z_axis, math.rad(0), 12)
	Move(larm, x_axis, 0, 60)
	Move(larm, y_axis, 0, 60)
	Turn(rarm, x_axis, math.rad(120), 12)
	Turn(rarm, y_axis, math.rad(0), 12)
	Turn(rarm, z_axis, math.rad(0), 24)
	Move(rarm, y_axis, 0, 60)
	Sleep(700)
	Turn(body, z_axis, math.rad(90), 24)
	Turn(head, z_axis, math.rad(-90), 24)
	Turn(rarm, x_axis, math.rad(179.9), 48)
	Turn(rarm, y_axis, math.rad(0), 48)
	Turn(rarm, z_axis, math.rad(60), 48)
	Move(rarm, y_axis, -5, 30)
	Turn(rleg, x_axis, math.rad(-15), 12)
	Sleep(200)
	x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/dummy/mercenarybuff.wav", 10.5, x, y, z, 1, 1, 1, 1)
	Spring.SpawnCEG ("dauntless_spirit", x, y, z, 10, 1, 1, 1, 0)
	Spring.AddUnitDamage (unitID, -100, 0, 0, 0, 0 , 0 , 0)
	buff = true
	aiming = false
	
	Move(body, z_axis, -5, 60)
	Move(rarm, z_axis, -5, 60)
	Turn(lleg, x_axis, math.rad(-15), 12)
	Turn(lleg, z_axis, math.rad(0), 24)
	Move(lleg, y_axis, 10, 120)
	Move(lleg, z_axis, 5, 60)
	Turn(rleg, x_axis, math.rad(-60), 12)
	Move(rleg, y_axis, 10, 120)
	StartThread(RestoreAfterDelay)
	Sleep(100)
	Spring.AddUnitDamage (unitID, -100, 0, 0, 0, 0 , 0 , 0)
	Sleep(200)
	Spring.AddUnitDamage (unitID, -100, 0, 0, 0, 0 , 0 , 0)
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1)
	GG.UpdateUnitAttributes(unitID)
	ability1 = false
	
	Sleep(2800)
	buff = false
	Sleep(4000)
	cooldown1 = false
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_Aim)
	aiming = true
	
	if not cooldown1 then
	    StartThread(GunBuff)
		return false
    elseif num == 1 and not buff and not ability1 then
	    SetSignalMask(SIG_Aim)
		Turn(body, x_axis, math.rad(0), 6)
	    Turn(head, x_axis, math.rad(0), 6)
	    Turn(body, z_axis, math.rad(90), 24)
		Move(body, z_axis, 0, 60)
	    Turn(head, z_axis, math.rad(-90), 24)
	    Turn(larm, x_axis, math.rad(0), 12)
	    Turn(larm, y_axis, math.rad(45), 12)
	    Turn(larm, z_axis, math.rad(0), 12)
	    Turn(rarm, x_axis, math.rad(0), 24)
	    Turn(rarm, y_axis, math.rad(-90), 24)
	    Turn(rarm, z_axis, math.rad(-90), 24)
		Move(rarm, y_axis, 0, 30)
		Move(rarm, z_axis, 0, 60)
	    WaitForTurn(body, z_axis)
	    WaitForTurn(body, z_axis)
	    StartThread(RestoreAfterDelay)
	    return true
	elseif num == 2 and buff and not ability1 then
	    SetSignalMask(SIG_Aim)
		Turn(body, x_axis, math.rad(0), 6)
	    Turn(head, x_axis, math.rad(0), 6)
	    Turn(body, z_axis, math.rad(90), 24)
		Move(body, z_axis, 0, 60)
	    Turn(head, z_axis, math.rad(-90), 24)
	    Turn(larm, x_axis, math.rad(0), 12)
	    Turn(larm, y_axis, math.rad(45), 12)
	    Turn(larm, z_axis, math.rad(0), 12)
	    Turn(rarm, x_axis, math.rad(0), 24)
	    Turn(rarm, y_axis, math.rad(-90), 24)
	    Turn(rarm, z_axis, math.rad(-90), 24)
		Move(rarm, y_axis, 0, 30)
		Move(rarm, z_axis, 0, 60)
	    WaitForTurn(body, z_axis)
	    WaitForTurn(body, z_axis)
	    StartThread(RestoreAfterDelay)
	    return true
	else
	    return false
	end
end

function script.BlockShot(num)
    return isTurning
end

function script.FireWeapon(num)
	Move(body, y_axis, -5, 60)
	Turn(rarm, y_axis, math.rad(-105), 24)
	Sleep(250)
	Move(body, y_axis, 0, 30)
end

function script.Killed(recentDamage, maxHealth)
    Explode(body, SFX.FALL)
	Explode(head, SFX.FALL)
	Explode(larm, SFX.FALL)
	Explode(rarm, SFX.FALL)
	Explode(lleg, SFX.FALL)
	Explode(rleg, SFX.FALL)
	Explode(gun, SFX.FALL)
	Explode(knife, SFX.FALL)
end