
include "constants.lua"

local body = piece 'body' 
local head = piece 'head' 
local larm = piece 'larm'
local rarm = piece 'rarm'
local lleg = piece 'lleg'
local rleg = piece 'rleg'
local mace = piece 'mace'
local ability = piece 'ability'

local step = true
local aiming = false
local ability1 = false
local cooldown1 = false


local SIG_Walk = 2
local SIG_Aim = 4

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

local function WreckingBall()
	local x, y, z
	cooldown1 = true
	ability1 = true
	x, y, z = Spring.GetUnitPosition(unitID)
	Spring.PlaySoundFile("sounds/dummy/chargemace.wav", 10.5, x, y, z, 1, 1, 1, 1)
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 0.5)
	GG.UpdateUnitAttributes(unitID)
	
	Turn(body, z_axis, math.rad(-45), 6)
	Turn(head, z_axis, math.rad(45), 6)
	Turn(larm, x_axis, math.rad(30), 6)
	Turn(larm, y_axis, math.rad(0), 6)
	Turn(larm, z_axis, math.rad(-90), 6)
	Turn(rarm, x_axis, math.rad(30), 6)
	Turn(rarm, y_axis, math.rad(0), 6)
	Turn(rarm, z_axis, math.rad(-90), 6)
	Sleep(200)
	Turn(body, z_axis, math.rad(-90), 3)
	Turn(head, z_axis, math.rad(90), 3)
	Turn(larm, x_axis, math.rad(180), 3)
	Turn(larm, y_axis, math.rad(0), 3)
	Turn(larm, z_axis, math.rad(-90), 3)
	Turn(rarm, x_axis, math.rad(180), 3)
	Turn(rarm, y_axis, math.rad(0), 3)
	Turn(rarm, z_axis, math.rad(-90), 3)
	Sleep(800)
	EmitSfx(ability, GG.Script.FIRE_W2)
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1)
	GG.UpdateUnitAttributes(unitID)
	
	Turn(body, z_axis, math.rad(89.9), 24)
	Turn(head, z_axis, math.rad(-89.9), 24)
	Turn(larm, x_axis, math.rad(15), 12)
	Turn(rarm, x_axis, math.rad(15), 12)
	Sleep(500)
	ability1 = false
	StartThread(RestoreAfterDelay)
	Sleep(3500)
	cooldown1 = false
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_Aim)
	aiming = true

	if not cooldown1 then
	    StartThread(WreckingBall)
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
		WaitForTurn(body, z_axis)
		WaitForTurn(rarm, y_axis)
		WaitForTurn(rarm, z_axis)
		StartThread(RestoreAfterDelay)
		return true
	else
	    return false
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
    Explode(body, SFX.FALL)
	Explode(head, SFX.FALL)
	Explode(larm, SFX.FALL)
	Explode(rarm, SFX.FALL)
	Explode(lleg, SFX.FALL)
	Explode(rleg, SFX.FALL)
	Explode(mace, SFX.FALL)
end