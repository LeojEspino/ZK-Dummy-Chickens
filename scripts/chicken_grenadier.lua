
include "constants.lua"

local spawn = piece 'spawn'
local base = piece 'base'
local body = piece 'body' 
local head = piece 'head' 
local larm = piece 'larm'
local rarm = piece 'rarm'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local launcher = piece 'launcher'
local emitter = piece 'emitter'

local step = true
local aiming = false
local spawned = false

local isTurning = false
local SIG_Walk = 2
local SIG_Aim = 4

function script.Create()
    local x, y, z
    local healthToRemove = UnitDefs[unitDefID].health * 0.25
    local healthToAdd = UnitDefs[unitDefID].health - healthToRemove
    Spring.SetUnitHealth(unitID, healthToRemove)
    Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 0)
    GG.UpdateUnitAttributes(unitID)
	
    Turn(rarm, x_axis, math.rad(15), 15)
	Turn(rarm, z_axis, math.rad(75), 75)
	Move(rarm, y_axis, 5, 50)
	Hide(body)
    Hide(head)
    Hide(larm)
    Hide(rarm)
    Hide(lleg)
    Hide(rleg)
    Hide(launcher)
   
    Sleep(40000)
    x, y, z = Spring.GetUnitPosition(unitID)
    Spring.AddUnitDamage(unitID, -healthToAdd)
    Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1)
    GG.UpdateUnitAttributes(unitID)
    Spring.SpawnCEG ("spawning3_burst", x, y, z, 10, 1, 1, 1, 0)
    spawned = true
   
    Hide(spawn)
    Show(body)
    Show(head)
    Show(larm)
    Show(rarm)
    Show(lleg)
    Show(rleg)
    Show(launcher)
end

local function Walk()
    Signal(SIG_Walk)
	SetSignalMask(SIG_Walk)

	while true do
	    if not aiming then
	        Turn(body, x_axis, math.rad(-15), 6)
		    Turn(head, x_axis, math.rad(15), 6)
		    Turn(rarm, z_axis, math.rad(60), 6)
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
	    Turn(body, z_axis, math.rad(-75), 6)
	    Turn(head, x_axis, math.rad(0), 6)
	    Turn(head, y_axis, math.rad(0), 6)
	    Turn(head, z_axis, math.rad(75), 6)
	    Turn(rarm, z_axis, math.rad(75), 6)
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
	Sleep(2000)
	aiming = false
    
	Turn(base, z_axis, math.rad(0), 10)
	Move(body, z_axis, 0, 60)
	Turn(body, x_axis, math.rad(0), 6)
	Turn(body, z_axis, math.rad(-75), 6)
	Turn(head, x_axis, math.rad(0), 6)
	Turn(head, y_axis, math.rad(0), 6)
	Turn(head, z_axis, math.rad(75), 6)
    Turn(lleg, x_axis, math.rad(-15), 12)
	Turn(lleg, y_axis, math.rad(0), 12)
	Turn(lleg, z_axis, math.rad(0), 12)
	Move(lleg, y_axis, 0, 60)
	Move(lleg, z_axis, 0, 60)
    Turn(rleg, x_axis, math.rad(15), 12)
	Turn(rleg, y_axis, math.rad(0), 12)
	Move(rleg, y_axis, 0, 60)
	Turn(rarm, z_axis, math.rad(75), 6)
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
	
	if not spawned then
	    return false
	else
	    Turn(base, z_axis, heading, 10)
	    Turn(body, x_axis, math.rad(0), 6)
	    Turn(head, x_axis, math.rad(0), 6)
        if num == 2 then
	        SetSignalMask(SIG_Aim)
	        Turn(body, z_axis, math.rad(-75), 12)
		    Move(body, z_axis, 0, 60)
	        Turn(head, z_axis, math.rad(75), 12)
		    Turn(rarm, z_axis, math.rad(75), 6)
		    WaitForTurn(base, z_axis)
	        WaitForTurn(body, z_axis)
	        WaitForTurn(body, z_axis)
	        StartThread(RestoreAfterDelay)
	        return true
	    elseif num == 1 then
	        SetSignalMask(SIG_Aim)
	        Turn(body, z_axis, math.rad(-75), 12)
		    Move(body, z_axis, 0, 60)
	        Turn(head, z_axis, math.rad(75), 12)
		    Turn(rarm, z_axis, math.rad(75), 6)
		    WaitForTurn(base, z_axis)
	        WaitForTurn(body, z_axis)
	        WaitForTurn(body, z_axis)
	        StartThread(RestoreAfterDelay)
	        return true
	    else
	        return false
	    end
	end
end

function script.BlockShot(num)
    return isTurning
end

function script.FireWeapon(num)
    if num == 1 then
        Turn(body, x_axis, math.rad(15), 6)
		Turn(head, y_axis, math.rad(-15), 6)
	    Move(body, y_axis, -15, 120)
	    Sleep(250)
	    Move(body, y_axis, 0, 60)
	    Turn(body, x_axis, math.rad(0), 6)
		Turn(head, y_axis, math.rad(0), 6)
	end
	if num == 2 then
        Turn(body, x_axis, math.rad(45), 12)
		Turn(head, y_axis, math.rad(-45), 12)
	    Move(body, y_axis, -5, 60)
	    Sleep(250)
	    Move(body, y_axis, 0, 30)
	    Turn(body, x_axis, math.rad(0), 12)
		Turn(head, y_axis, math.rad(0), 12)
	end
end

function script.Killed(recentDamage, maxHealth)
    if spawned then
        Explode(body, SFX.FALL)
	    Explode(head, SFX.FALL)
	    Explode(larm, SFX.FALL)
	    Explode(rarm, SFX.FALL)
	    Explode(lleg, SFX.FALL)
	    Explode(rleg, SFX.FALL)
	    Explode(launcher, SFX.FALL)
	else
	    Explode(spawn, SFX.FALL)
	end
end