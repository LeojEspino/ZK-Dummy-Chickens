
include "constants.lua"

local spawn1 = piece 'spawn1'
local spawn2 = piece 'spawn2'
local base = piece 'base'
local body = piece 'body' 
local head = piece 'head' 
local larm = piece 'larm'
local rarm = piece 'rarm'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local wand = piece 'wand'
local book = piece 'book'
local emitter = piece 'emitter'

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
    Hide(wand)
    Hide(book)
   
    Sleep(10000)
    x, y, z = Spring.GetUnitPosition(unitID)
    Spring.AddUnitDamage(unitID, -healthToAdd)
    Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1)
    GG.UpdateUnitAttributes(unitID)
    Spring.SpawnCEG ("spawning2_burst", x, y, z, 10, 1, 1, 1, 0)
    spawned = true
   
    Hide(spawn1)
    Hide(spawn2)
    Show(body)
    Show(head)
    Show(larm)
    Show(rarm)
    Show(lleg)
    Show(rleg)
    Show(wand)
    Show(book)
end

local function Walk()
    Signal(SIG_Walk)
	SetSignalMask(SIG_Walk)

	while true do
	    if not aiming then
	        Turn(body, x_axis, math.rad(-15), 6)
		    Turn(head, x_axis, math.rad(15), 6)
		    Turn(larm, x_axis, math.rad(45), 12)
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
	Sleep(2000)
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
    Turn(rarm, x_axis, math.rad(0), 12)
	Turn(rarm, y_axis, math.rad(-15), 12)
	Turn(rarm, z_axis, math.rad(0), 24)
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
        Turn(base, z_axis, heading, 10)
        Turn(body, x_axis, math.rad(0), 6)
	    Turn(head, x_axis, math.rad(0), 6)
        Turn(larm, x_axis, math.rad(15), 12)
	    Turn(larm, y_axis, math.rad(75), 12)
	    if not swung then
	        Turn(body, z_axis, math.rad(-75), 12)
		    Turn(head, z_axis, math.rad(75), 12)
		    Turn(rarm, x_axis, math.rad(0), 12)
		    Turn(rarm, y_axis, math.rad(-90), 24)
		    Turn(rarm, z_axis, math.rad(-180), 24)
		    WaitForTurn(base, z_axis)
		    WaitForTurn(body, z_axis)
		    WaitForTurn(rarm, y_axis)
		    WaitForTurn(rarm, z_axis)
		    StartThread(RestoreAfterDelay)
		    return true
	    elseif swung then
	        Turn(body, z_axis, math.rad(90), 12)
		    Turn(head, z_axis, math.rad(-90), 12)
		    Turn(rarm, x_axis, math.rad(90), 12)
		    Turn(rarm, y_axis, math.rad(-90), 12)
		    Turn(rarm, z_axis, math.rad(0), 24)
		    WaitForTurn(base, z_axis)
		    WaitForTurn(body, z_axis)
		    WaitForTurn(rarm, y_axis)
		    WaitForTurn(rarm, z_axis)
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
		Move(body, y_axis, 10, 60)
	    Turn(body, z_axis, math.rad(90), 24)
		Turn(head, z_axis, math.rad(-90), 24)
		Turn(rarm, x_axis, math.rad(90), 48)
		Sleep(300)
		Move(body, y_axis, 0, 30)
	elseif swung then
	    swung = false
		Move(body, y_axis, 10, 60)
		Turn(body, z_axis, math.rad(-60), 24)
		Turn(head, z_axis, math.rad(60), 24)
		Turn(rarm, x_axis, math.rad(0), 48)
		Sleep(300)
		Move(body, y_axis, 0, 30)
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
	    Explode(wand, SFX.FALL)
	    Explode(book, SFX.FALL)
    else
	    Explode(spawn1, SFX.FALL)
		Explode(spawn2, SFX.FALL)
	end
end