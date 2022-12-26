
include "constants.lua"

local base = piece 'base'
local body = piece 'body' 
local head = piece 'head' 
local larm = piece 'larm'
local rarm = piece 'rarm'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local rifle = piece 'rifle'
local emitter = piece 'emitter'

local step = true
local aiming = false
local recoil = false
local delay = false
local delaying = false
local cooldown1 = false
local cooldown2 = false
local lmbaim = false
local crtaim = false

local SIG_Walk = 2
local SIG_Aim = 4
local SIG_Delay = 8

function script.Create()
    Move(larm, y_axis, -5, 1000)
	Move(rarm, x_axis, -5, 1000)
    Move(rarm, y_axis, 5, 1000)
	Move(rarm, z_axis, -5, 1000)
	Turn(larm, x_axis, math.rad(60), 12)
	Turn(larm, y_axis, math.rad(-60), 12)
	Turn(larm, z_axis, math.rad(0), 12)
    Turn(rarm, x_axis, math.rad(30), 12)
	Turn(rarm, y_axis, math.rad(75), 12)
	Turn(rarm, z_axis, math.rad(90), 24)
end
local function Walk()
    Signal(SIG_Walk)
	SetSignalMask(SIG_Walk)

	while true do
	    if not aiming then
		    Turn(base, z_axis, math.rad(0), 10)
	        Turn(body, x_axis, math.rad(-15), 6)
		    Turn(head, x_axis, math.rad(15), 6)
		    Turn(rarm, x_axis, math.rad(30), 12)
	        Turn(rarm, y_axis, math.rad(75), 12)
	        Turn(rarm, z_axis, math.rad(90), 24)
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
	    Turn(base, z_axis, math.rad(0), 10)
	    Move(body, z_axis, 0, 60)
	    Turn(body, x_axis, math.rad(0), 6)
	    Turn(body, z_axis, math.rad(-45), 6)
	    Turn(head, x_axis, math.rad(0), 6)
	    Turn(head, y_axis, math.rad(0), 6)
	    Turn(head, z_axis, math.rad(45), 6)
        Turn(larm, x_axis, math.rad(60), 12)
	    Turn(larm, y_axis, math.rad(-60), 12)
	    Turn(larm, z_axis, math.rad(0), 12)
        Turn(rarm, x_axis, math.rad(30), 12)
	    Turn(rarm, y_axis, math.rad(75), 12)
	    Turn(rarm, z_axis, math.rad(90), 24)
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
    SetSignalMask(SIG_Delay)
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
    Turn(larm, x_axis, math.rad(60), 12)
	Turn(larm, y_axis, math.rad(-60), 12)
	Turn(larm, z_axis, math.rad(0), 12)
    Turn(rarm, x_axis, math.rad(30), 12)
	Turn(rarm, y_axis, math.rad(75), 12)
	Turn(rarm, z_axis, math.rad(90), 24)
end

function script.QueryWeapon(num)
	return emitter
end

function script.AimFromWeapon(num)
	return body
end

local function Delay1()
    lmbaim = true
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 0)
	GG.UpdateUnitAttributes(unitID)
    delaying = true
	delay = true
	Sleep(500)
	delay = false
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1)
	GG.UpdateUnitAttributes(unitID)
	Sleep(500)
	StartThread(RestoreAfterDelay)
	delaying = false
	lmbaim = false
end

local function Delay2()
    crtaim = true
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 0)
	GG.UpdateUnitAttributes(unitID)
    delaying = true
	delay = true
	Sleep(1000)
	delay = false
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1)
	GG.UpdateUnitAttributes(unitID)
	Sleep(500)
	StartThread(RestoreAfterDelay)
	delaying = false
	crtaim = false
end

local function Cooldown1()
    cooldown1 = true
    Sleep(4000)
	cooldown1 = false
end

local function Cooldown2()
    cooldown2 = true
    Sleep(4000)
	cooldown2 = false
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_Aim)
	Signal(SIG_Delay)
	aiming = true

    Turn(base, z_axis, heading, 10)
    Turn(body, x_axis, math.rad(0), 6)
	Turn(head, x_axis, math.rad(0), 6)
	if not recoil and not lmbaim and not cooldown2 and num == 3 then
	    Turn(body, z_axis, math.rad(-75), 12)
		Turn(head, z_axis, math.rad(75), 12)
		Turn(larm, x_axis, math.rad(105), 6)
	    Turn(larm, y_axis, math.rad(-90), 6)
	    Turn(larm, z_axis, math.rad(0), 6)
		Turn(rarm, x_axis, math.rad(15), 6)
	    Turn(rarm, y_axis, math.rad(90), 6)
	    Turn(rarm, z_axis, math.rad(90), 24)
		if not delaying then
		    StartThread(Delay2)
		end
		WaitForTurn(base, z_axis)
		WaitForTurn(body, z_axis)
		return not delay
	elseif not recoil and not lmbaim and not crtaim and not cooldown1 and cooldown2 and num == 2 then
	    Turn(body, z_axis, math.rad(-75), 12)
		Turn(head, z_axis, math.rad(75), 12)
		Turn(larm, x_axis, math.rad(105), 6)
	    Turn(larm, y_axis, math.rad(-90), 6)
	    Turn(larm, z_axis, math.rad(0), 6)
		Turn(rarm, x_axis, math.rad(15), 6)
	    Turn(rarm, y_axis, math.rad(90), 6)
	    Turn(rarm, z_axis, math.rad(90), 24)
		WaitForTurn(base, z_axis)
		WaitForTurn(body, z_axis)
		return true
	elseif not recoil and not crtaim and cooldown1 and cooldown2 and num == 1 then
	    Turn(body, z_axis, math.rad(-75), 12)
		Turn(head, z_axis, math.rad(75), 12)
		Turn(larm, x_axis, math.rad(105), 6)
	    Turn(larm, y_axis, math.rad(-90), 6)
	    Turn(larm, z_axis, math.rad(0), 6)
		Turn(rarm, x_axis, math.rad(15), 6)
	    Turn(rarm, y_axis, math.rad(90), 6)
	    Turn(rarm, z_axis, math.rad(90), 24)
		if not delaying then
		    StartThread(Delay1)
		end
		WaitForTurn(base, z_axis)
		WaitForTurn(body, z_axis)
		return not delay
	end
end

function script.FireWeapon(num)
    if num == 3 then
	    Signal(SIG_Aim)
		Signal(SIG_Delay)
		StartThread(Cooldown2)
		EmitSfx(emitter, GG.Script.UNIT_SFX2)
		delaying = false
		recoil = true
		Turn(larm, x_axis, math.rad(60), 12)
	    Turn(larm, y_axis, math.rad(-90), 12)
	    Turn(larm, z_axis, math.rad(0), 12)
        Turn(rarm, x_axis, math.rad(15), 6)
	    Turn(rarm, y_axis, math.rad(135), 6)
	    Turn(rarm, z_axis, math.rad(90), 6)
		Sleep(300)
		Turn(body, x_axis, math.rad(0), 3)
	    Turn(body, z_axis, math.rad(-45), 3)
	    Turn(head, x_axis, math.rad(0), 3)
	    Turn(head, y_axis, math.rad(0), 3)
	    Turn(head, z_axis, math.rad(45), 3)
        Turn(larm, x_axis, math.rad(105), 3)
	    Turn(larm, y_axis, math.rad(-75), 3)
	    Turn(larm, z_axis, math.rad(0), 3)
        Turn(rarm, x_axis, math.rad(30), 3)
	    Turn(rarm, y_axis, math.rad(75), 3)
	    Turn(rarm, z_axis, math.rad(90), 3)
		Sleep(150)
		Turn(rarm, x_axis, math.rad(45), 8)
		Turn(larm, x_axis, math.rad(75), 8)
		Sleep(150)
		Turn(rarm, x_axis, math.rad(30), 8)
		Turn(larm, x_axis, math.rad(105), 8)
		WaitForTurn(rarm, x_axis)
		recoil = false
		aiming = false
	elseif num == 2 then
	    Signal(SIG_Aim)
		Signal(SIG_Delay)
		StartThread(Cooldown1)
		recoil = true
		Move(rarm, x_axis, 5, 50)
		Sleep(50)
		Move(rarm, x_axis, -5, 25)
		Sleep(150)
		Move(rarm, x_axis, 5, 50)
		Sleep(100)
		Move(rarm, x_axis, -5, 25)
		recoil = false
		aiming = false
    elseif num == 1 then
        Signal(SIG_Aim)
		Signal(SIG_Delay)
		EmitSfx(emitter, GG.Script.UNIT_SFX1)
		delaying = false
		recoil = true
		Turn(larm, x_axis, math.rad(75), 12)
	    Turn(larm, y_axis, math.rad(-90), 12)
	    Turn(larm, z_axis, math.rad(0), 12)
        Turn(rarm, x_axis, math.rad(15), 3)
	    Turn(rarm, y_axis, math.rad(105), 3)
	    Turn(rarm, z_axis, math.rad(90), 3)
		Sleep(200)
		Turn(body, x_axis, math.rad(0), 3)
	    Turn(body, z_axis, math.rad(-45), 3)
	    Turn(head, x_axis, math.rad(0), 3)
	    Turn(head, y_axis, math.rad(0), 3)
	    Turn(head, z_axis, math.rad(45), 3)
        Turn(larm, x_axis, math.rad(105), 3)
	    Turn(larm, y_axis, math.rad(-75), 3)
	    Turn(larm, z_axis, math.rad(0), 3)
        Turn(rarm, x_axis, math.rad(30), 3)
	    Turn(rarm, y_axis, math.rad(75), 3)
	    Turn(rarm, z_axis, math.rad(90), 3)
		Sleep(150)
		Turn(rarm, x_axis, math.rad(45), 8)
		Turn(larm, x_axis, math.rad(75), 8)
		Sleep(150)
		Turn(rarm, x_axis, math.rad(30), 8)
		Turn(larm, x_axis, math.rad(105), 8)
		WaitForTurn(rarm, x_axis)
		recoil = false
		aiming = false
	end
end

function script.Killed(recentDamage, maxHealth)
    Explode(body, SFX.FALL)
	Explode(head, SFX.FALL)
	Explode(larm, SFX.FALL)
	Explode(rarm, SFX.FALL)
	Explode(lleg, SFX.FALL)
	Explode(rleg, SFX.FALL)
	Explode(rifle, SFX.FALL)
end