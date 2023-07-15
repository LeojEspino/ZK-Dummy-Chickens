
include "constants.lua"

local spawn = piece 'spawn'
local base = piece 'base'
local body = piece 'body' 
local head = piece 'head' 
local larm = piece 'larm'
local rarm = piece 'rarm'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local sword = piece 'sword'

local step = true
local aiming = false
local ability1 = false
local cooldown1 = false
local spawned = true

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
    
    Sleep(40000)
    x, y, z = Spring.GetUnitPosition(unitID)
    Spring.AddUnitDamage(unitID, -healthToAdd)
    Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1)
    GG.UpdateUnitAttributes(unitID)
    Spring.SpawnCEG ("spawning3_brawler", x, y, z, 10, 1, 1, 1, 0)
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
	    if not aiming then
	        Turn(body, x_axis, math.rad(-15), 6)
		    Turn(head, x_axis, math.rad(15), 6)
		    Turn(larm, x_axis, math.rad(60), 12)
		    Turn(larm, z_axis, math.rad(-90), 12)
		    Turn(rarm, x_axis, math.rad(60), 12)
		    Turn(rarm, z_axis, math.rad(-90), 24)
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
        Turn(larm, x_axis, math.rad(30), 12)
	    Turn(larm, y_axis, math.rad(0), 12)
	    Turn(larm, z_axis, math.rad(-45), 12)
        Turn(rarm, x_axis, math.rad(30), 12)
	    Turn(rarm, y_axis, math.rad(0), 12)
	    Turn(rarm, z_axis, math.rad(-90), 24)
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
	Turn(body, z_axis, math.rad(-75), 6)
	Turn(head, x_axis, math.rad(0), 6)
	Turn(head, y_axis, math.rad(0), 6)
	Turn(head, z_axis, math.rad(75), 6)
    Turn(lleg, x_axis, math.rad(-15), 12)
	Turn(lleg, y_axis, math.rad(0), 12)
    Turn(rleg, x_axis, math.rad(15), 12)
	Turn(rleg, y_axis, math.rad(0), 12)
    Turn(larm, x_axis, math.rad(30), 12)
	Turn(larm, y_axis, math.rad(0), 12)
	Turn(larm, z_axis, math.rad(-45), 12)
    Turn(rarm, x_axis, math.rad(30), 12)
	Turn(rarm, y_axis, math.rad(0), 12)
	Turn(rarm, z_axis, math.rad(-90), 24)
end

function script.QueryWeapon(num)
	return body
end

function script.AimFromWeapon(num)
	return body
end

local function BrutalSwing()
	local x, y, z
	cooldown1 = true
	ability1 = true
	
	Turn(body, z_axis, math.rad(105), 12)
	Turn(head, z_axis, math.rad(-104.9), 12)
	Turn(larm, x_axis, math.rad(15), 12)
	Turn(larm, y_axis, math.rad(75), 12)
	Turn(larm, z_axis, math.rad(0), 12)
	Turn(rarm, x_axis, math.rad(75), 12)
	Turn(rarm, y_axis, math.rad(0), 12)
	Turn(rarm, z_axis, math.rad(90), 24)
	Sleep(500)
	x, y, z = Spring.GetUnitPosition(unitID)
	EmitSfx(body, GG.Script.FIRE_W2)
    Spring.SpawnCEG ("brutal_swing", x, y, z, 10, 1, 1, 1, 0)
	
	Turn(rarm, x_axis, math.rad(105), 12)
	Turn(body, z_axis, math.rad(-75), 24)
	Turn(head, z_axis, math.rad(75), 6)
	WaitForTurn(body, z_axis)
	Turn(body, z_axis, math.rad(105.1), 24)
	WaitForTurn(body, z_axis)
	Turn(body, z_axis, math.rad(-74.9), 24)
	Sleep(300)
	ability1 = false
	StartThread(RestoreAfterDelay)
    Sleep(8750)
    cooldown1 = false
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
	    if not cooldown1 then
	        StartThread(BrutalSwing)
		    return false
	    elseif num == 1 and not ability1 then
	        SetSignalMask(SIG_Aim)
	        Turn(body, z_axis, math.rad(-90), 12)
		    Turn(head, z_axis, math.rad(90), 12)
		    Turn(larm, x_axis, math.rad(90), 12)
		    Turn(larm, y_axis, math.rad(0), 12)
		    Turn(larm, z_axis, math.rad(-90), 12)
		    Turn(rarm, x_axis, math.rad(90), 12)
		    Turn(rarm, y_axis, math.rad(0), 24)
		    Turn(rarm, z_axis, math.rad(-90), 24)
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
    if num == 2 then
    elseif num == 1 then
	    swung = true
		Move(body, y_axis, 10, 60)
	    Turn(body, z_axis, math.rad(89.9), 24)
		Turn(head, z_axis, math.rad(-89.9), 24)
		Turn(larm, x_axis, math.rad(75), 24)
		Turn(rarm, x_axis, math.rad(75), 24)
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
	    Explode(sword, SFX.FALL)
	else
	    Explode(spawn, SFX.FALL)
	end
end