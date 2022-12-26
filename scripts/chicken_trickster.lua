
include "constants.lua"

local base = piece 'base'
local body = piece 'body' 
local head = piece 'head' 
local larm = piece 'larm'
local rarm = piece 'rarm'
local lknife = piece 'lknife'
local rknife = piece 'rknife'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local emitter = piece 'emitter'

local step = true
local aiming = false
local swung = false
local armed = false
local cooldown1 = false
local cooldown2 = false
local ab1 = false

local SIG_Walk = 2
local SIG_Aim = 4
local SIG_Vanish = 8

function script.Create()
    Hide(lknife)
	Hide(rknife)
end

local function KnifeParty()
    local x, y, z
    ab1 = true
	cooldown1 = true
	x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/dummy/knifeready.wav", 5, x, y, z, 1, 1, 1, 1)
	
	Turn(rarm, x_axis, math.rad(30), 18)
	Turn(rarm, y_axis, math.rad(75), 18)
	Turn(larm, x_axis, math.rad(30), 18)
	Turn(larm, y_axis, math.rad(-75), 18)
	Turn(body, x_axis, math.rad(0), 6)
	Turn(body, z_axis, math.rad(-45), 6)
	Turn(head, x_axis, math.rad(0), 6)
	Turn(head, y_axis, math.rad(0), 6)
	Turn(head, z_axis, math.rad(45), 6)
	Sleep(250)
	Show(lknife)
	Show(rknife)
	Turn(rarm, x_axis, math.rad(0), 18)
	Turn(rarm, y_axis, math.rad(-90), 18)
	Turn(larm, x_axis, math.rad(0), 18)
	Turn(larm, y_axis, math.rad(90), 18)
	Turn(body, x_axis, math.rad(0), 6)
	Turn(body, z_axis, math.rad(-45), 6)
	Turn(head, x_axis, math.rad(0), 6)
	Turn(head, y_axis, math.rad(0), 6)
	Turn(head, z_axis, math.rad(45), 6)
	Sleep(250)
	ab1 = false
	armed = true
	aiming = false
	
	Turn(larm, x_axis, math.rad(0), 12)
	Turn(larm, y_axis, math.rad(15), 12)
	Turn(larm, z_axis, math.rad(0), 24)
    Turn(rarm, x_axis, math.rad(0), 12)
	Turn(rarm, y_axis, math.rad(-15), 12)
	Turn(rarm, z_axis, math.rad(0), 24)
	Sleep(2500)
	cooldown1 = false
end

local function VanishingAct()
    SetSignalMask(SIG_Vanish)
	if not cooldown1 and not armed then
	    aiming = true
	    StartThread(KnifeParty)
	end
    cooldown2 = true
	Spring.SetUnitCloak(unitID, 2)
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1.5)
	GG.UpdateUnitAttributes(unitID)
	EmitSfx(base, GG.Script.UNIT_SFX1)
	Sleep(1500)
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1)
	GG.UpdateUnitAttributes(unitID)
	Sleep(3000)
	cooldown2 = false
end

local function Walk()
    Signal(SIG_Walk)
	SetSignalMask(SIG_Walk)

	while true do
	    if not cooldown2 then
		    StartThread(VanishingAct)
		end
	    if not aiming then
		    Turn(base, z_axis, math.rad(0), 10)
	        Turn(body, x_axis, math.rad(-15), 6)
		    Turn(head, x_axis, math.rad(15), 6)
		    Turn(larm, x_axis, math.rad(-45), 12)
		    Turn(larm, y_axis, math.rad(45), 12)
		    Turn(rarm, x_axis, math.rad(-45), 12)
		    Turn(rarm, y_axis, math.rad(-45), 12)
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
		Turn(larm, z_axis, math.rad(0), 24)
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
	Turn(larm, z_axis, math.rad(0), 24)
    Turn(rarm, x_axis, math.rad(0), 12)
	Turn(rarm, y_axis, math.rad(-15), 12)
	Turn(rarm, z_axis, math.rad(0), 24)
end

function script.QueryWeapon(num)
	return emitter
end

function script.AimFromWeapon(num)
	return body
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_Aim)
	aiming = true
	
    Turn(base, z_axis, heading, 10)
    Turn(body, x_axis, math.rad(0), 6)
	Turn(head, x_axis, math.rad(0), 6)
	if armed and not ab1 and num == 2 then
	    SetSignalMask(SIG_Aim)
		Turn(rarm, y_axis, math.rad(-90), 24)
		Turn(larm, y_axis, math.rad(90), 24)
		WaitForTurn(rarm, y_axis)
	    StartThread(RestoreAfterDelay)
	    return true
	elseif not cooldown1 and not armed then
	    StartThread(KnifeParty)
		return false
	elseif cooldown1 and not armed then
	    if not swung and num == 1 then
	        SetSignalMask(SIG_Aim)
	        Turn(body, z_axis, math.rad(-90), 12)
	    	Turn(head, z_axis, math.rad(90), 12)
	    	Turn(rarm, x_axis, math.rad(0), 12)
	    	Turn(rarm, y_axis, math.rad(-90), 24)
	    	Turn(rarm, z_axis, math.rad(0), 24)
	    	Turn(larm, x_axis, math.rad(0), 12)
	        Turn(larm, y_axis, math.rad(90), 12)
	    	Turn(larm, z_axis, math.rad(0), 24)
	    	WaitForTurn(base, z_axis)
	    	WaitForTurn(body, z_axis)
	    	WaitForTurn(rarm, y_axis)
	    	WaitForTurn(rarm, z_axis)
	    	StartThread(RestoreAfterDelay)
	    	return true
	    elseif swung and num == 1 then
	        SetSignalMask(SIG_Aim)
	        Turn(body, z_axis, math.rad(90), 12)
	    	Turn(head, z_axis, math.rad(-90), 12)
	    	Turn(rarm, x_axis, math.rad(0), 12)
	    	Turn(rarm, y_axis, math.rad(-90), 12)
	    	Turn(rarm, z_axis, math.rad(0), 24)
	    	Turn(larm, x_axis, math.rad(0), 12)
	    	Turn(larm, y_axis, math.rad(90), 24)
	    	Turn(larm, z_axis, math.rad(0), 24)
	    	WaitForTurn(base, z_axis)
	    	WaitForTurn(body, z_axis)
	    	WaitForTurn(rarm, y_axis)
	    	WaitForTurn(rarm, z_axis)
	    	StartThread(RestoreAfterDelay)
	    	return true
	    end
	end
end

function script.FireWeapon(num)
    if num == 2 then
	    armed = false
		Sleep(1)
		Turn(rarm, y_axis, math.rad(-90), 24)
		Turn(larm, y_axis, math.rad(90), 24)
	    Turn(body, z_axis, math.rad(-45), 24)
	    Turn(head, z_axis, math.rad(45), 6)
	    WaitForTurn(body, z_axis)
	    Turn(body, z_axis, math.rad(-224.9), 24)
		Hide(lknife)
	    WaitForTurn(body, z_axis)
		Turn(body, z_axis, math.rad(-44.5), 24)
		Hide(rknife)
    elseif not swung and num == 1 then
	    swung = true
		Move(body, y_axis, 10, 60)
	    Turn(body, z_axis, math.rad(89.9), 24)
		Turn(head, z_axis, math.rad(-89.9), 24)
		Turn(rarm, x_axis, math.rad(75), 48)
		Sleep(300)
		Move(body, y_axis, 0, 30)
	elseif swung and num == 1 then
	    swung = false
		Move(body, y_axis, 10, 60)
		Turn(body, z_axis, math.rad(-89.9), 24)
		Turn(head, z_axis, math.rad(89.9), 24)
		Turn(larm, x_axis, math.rad(75), 48)
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
end