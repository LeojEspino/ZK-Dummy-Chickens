
include "constants.lua"

local spawn = piece 'spawn'
local body = piece 'body' 
local head = piece 'head' 
local larm = piece 'larm'
local rarm = piece 'rarm'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local sword = piece 'sword'

local step = true
local aiming = false
local swung = false
local spawned = false

local SIG_Walk = 2
local SIG_Aim = 4

function script.Create()
    local x, y, z
    local healthToRemove = UnitDefs[unitDefID].health * 0.25
    local healthToAdd = UnitDefs[unitDefID].health - healthToRemove
    Spring.SetUnitHealth(unitID, healthToRemove)
    Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 0)
    GG.UpdateUnitAttributes(unitID)
   
    Hide(body)
    Hide(head)
    Hide(larm)
    Hide(rarm)
    Hide(lleg)
    Hide(rleg)
    Hide(sword)
   
    Sleep(5000)
    x, y, z = Spring.GetUnitPosition(unitID)
    Spring.AddUnitDamage(unitID, -healthToAdd)
    Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1)
    GG.UpdateUnitAttributes(unitID)
    Spring.SpawnCEG ("spawning1", x, y, z, 10, 1, 1, 1, 0)
    spawned = true
   
    Hide(spawn)
    Show(body)
    Show(head)
    Show(larm)
    Show(rarm)
    Show(lleg)
    Show(rleg)
    Show(sword)
end

local function Walk()
    Signal(SIG_Walk)
	SetSignalMask(SIG_Walk)

	while true do
	    if step then
		    if not aiming then
			    Turn(rarm, x_axis, math.rad(30), 6)
				Turn(larm, x_axis, math.rad(-45), 6)
			end
	        Turn(lleg, x_axis, math.rad(45), 6)
		    Turn(rleg, x_axis, math.rad(-45), 6)
			WaitForTurn(rleg, x_axis)
		    Sleep(100)
			step = false
		else
		    if not aiming then
			    Turn(rarm, x_axis, math.rad(-30), 6)
				Turn(larm, x_axis, math.rad(45), 6)
			end
		    Turn(lleg, x_axis, math.rad(-45), 6)
		    Turn(rleg, x_axis, math.rad(45), 6)
			WaitForTurn(lleg, x_axis)
		    Sleep(100)
			step = true
		end
	end
end

local function StopWalk()
    Signal(SIG_Walk)
	
    Turn(lleg, x_axis, math.rad(0), 6)
    Turn(rleg, x_axis, math.rad(0), 6)
    Turn(larm, x_axis, math.rad(0), 6)
    Turn(rarm, x_axis, math.rad(0), 6)
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
    
	Turn(body, z_axis, math.rad(0), 6)
	Turn(head, z_axis, math.rad(0), 6)
	Turn(larm, y_axis, math.rad(0), 6)
	Turn(rarm, y_axis, math.rad(0), 6)
	Turn(rarm, x_axis, math.rad(0), 6)
	Turn(sword, x_axis, math.rad(0), 12)
end

function script.QueryWeapon(num)
	return sword
end

function script.AimFromWeapon(num)
	return body
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_Aim)
	SetSignalMask(SIG_Aim)
	aiming = true
    if not spawned then
	    return false
	else
	    if not swung then
	        Turn(body, z_axis, heading - 120, 6)
		    Turn(head, z_axis, math.rad(30), 6)
	        Turn(larm, y_axis, math.rad(30), 6)
		    Turn(rarm, x_axis, math.rad(0), 6)
		    Turn(rarm, y_axis, math.rad(-90), 6)
		    Turn(sword, x_axis, math.rad(180), 12)
		    WaitForTurn(body, z_axis)
		    WaitForTurn(rarm, x_axis)
		    WaitForTurn(sword, x_axis)
		    StartThread(RestoreAfterDelay)
		    return true
	    elseif swung then
	        Turn(body, z_axis, heading - 30, 6)
		    Turn(head, z_axis, math.rad(-60), 6)
		    Turn(larm, y_axis, math.rad(30), 6)
		    Turn(rarm, x_axis, math.rad(90), 6)
		    Turn(rarm, y_axis, math.rad(-90), 6)
		    Turn(sword, x_axis, math.rad(0.1), 12)
		    WaitForTurn(body, z_axis)
		    WaitForTurn(rarm, y_axis)
		    WaitForTurn(rarm, x_axis)
		    WaitForTurn(sword, x_axis)
		    StartThread(RestoreAfterDelay)
		    return true
	    else
	        return false
	    end
	end
end

function script.FireWeapon(num)
    if not swung then
	    swung = true
	    Turn(body, z_axis, math.rad(30), 12)
		Turn(head, z_axis, math.rad(-30), 12)
		Turn(rarm, x_axis, math.rad(135), 12)
	elseif swung then
	    swung = false
		Turn(body, z_axis, math.rad(-15), 12)
		Turn(head, z_axis, math.rad(15), 12)
		Turn(rarm, x_axis, math.rad(0), 12)
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
	    Explode(sword, SFX.FALL)
	else
	    Explode(spawn, SFX.FALL)
	end
end