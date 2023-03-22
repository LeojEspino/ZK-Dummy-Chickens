--by Chris Mackey

include "constants.lua"

local ALLY_ACCESS = {allied = true}

--pieces
local base = piece "base"
local glow = piece "glow"

local lf_ball = piece "lf_ball"
local lf_thigh = piece "lf_thigh"
local lf_knee = piece "lf_knee"
local lf_foot = piece "lf_foot"

local lb_ball = piece "lb_ball"
local lb_thigh = piece "lb_thigh"
local lb_knee = piece "lb_knee"
local lb_foot = piece "lb_foot"

local rf_ball = piece "rf_ball"
local rf_thigh = piece "rf_thigh"
local rf_knee = piece "rf_knee"
local rf_foot = piece "rf_foot"

local rb_ball = piece "rb_ball"
local rb_thigh = piece "rb_thigh"
local rb_knee = piece "rb_knee"
local rb_foot = piece "rb_foot"

--constants
local sleep = 250

local PACE = 3

local legRaiseSpeed = math.rad(45)*PACE
local legRaiseAngle = math.rad(20)
local legLowerSpeed = math.rad(50)*PACE

local legForwardSpeed = math.rad(40)*PACE
local legForwardAngle = -math.rad(20)
local legBackwardSpeed = math.rad(35)*PACE
local legBackwardAngle = math.rad(45)
local legBackwardAngleMinor = math.rad(10)

--signals
local walk = 2
local aim = 4
local SIG_Flutter = 1
local SIG_ACTIVATE = 8

local function Walk()
    Signal(walk)
	SetSignalMask(walk)
	while true do
		-- Spring.Echo("left fore and right back move, left back and right fore anchor")
		Turn(lf_ball, x_axis, legRaiseAngle, legRaiseSpeed)	-- LF leg up
		Turn(lf_ball, z_axis, legForwardAngle, legForwardSpeed)	-- LF leg forward
		--Turn(lb_ball, x_axis, 0, legLowerSpeed)	-- LB leg down
		Turn(lb_ball, z_axis, legBackwardAngle, legBackwardSpeed)	-- LB leg back
		
		--Turn(rf_ball, x_axis, 0, legLowerSpeed)	-- RF leg down
		Turn(rf_ball, z_axis, -legBackwardAngleMinor, legBackwardSpeed)	-- RF leg back
		Turn(rb_ball, x_axis, -legRaiseAngle, legRaiseSpeed)	-- RB leg up
		Turn(rb_ball, z_axis, 0, legForwardSpeed)	-- RB leg forward
		
		WaitForTurn(lf_ball, x_axis)
		WaitForTurn(lf_ball, z_axis)
		Sleep(0)
		
		-- Spring.Echo("lower left fore and right back")
		Turn(lf_ball, x_axis, 0, legLowerSpeed)	-- LF leg down
		Turn(rb_ball, x_axis, 0, legLowerSpeed)	-- RB leg down
		Sleep(0)
		WaitForTurn(lf_ball, x_axis)
		
		-- Spring.Echo("left back and right fore move, left fore and right back anchor")
		--Turn(lf_ball, x_axis, 0, legLowerSpeed)	-- LF leg down
		Turn(lf_ball, z_axis, legBackwardAngleMinor, legBackwardSpeed)	-- LF leg back
		Turn(lb_ball, x_axis, legRaiseAngle, legRaiseSpeed)	-- LB leg up
		Turn(lb_ball, z_axis, 0, legForwardSpeed)	-- LB leg forward
		
		Turn(rf_ball, x_axis, -legRaiseAngle, legRaiseSpeed)	-- RF leg up
		Turn(rf_ball, z_axis, -legForwardAngle, legForwardSpeed)	-- RF leg forward
		--Turn(rb_ball, x_axis, 0, legLowerSpeed)	-- RB leg down
		Turn(rb_ball, z_axis, -legBackwardAngle, legBackwardSpeed)	-- RB leg back
		WaitForTurn(rf_ball, x_axis)
		WaitForTurn(rf_ball, z_axis)
		Sleep(0)

		-- Spring.Echo("lower left back and right fore")
		Turn(lb_ball, x_axis, 0, legLowerSpeed)	-- LB leg down
		Turn(rf_ball, x_axis, 0, legLowerSpeed)	-- RF leg down
		Sleep(0)
		WaitForTurn(lb_ball, x_axis)
	end
end

local function Flutter()
	Signal(SIG_Flutter)
	SetSignalMask(SIG_Flutter)
	while true do
		Spin(glow, z_axis, 1)
		Move(glow, z_axis, math.random(1,5), 2)
		WaitForMove(glow, z_axis)
		Sleep (200)
		Move(glow, z_axis, math.random(-6,-1), 2)
	end
end

function script.Create()
	Spring.SetUnitRulesParam(unitID, "unitActiveOverride", 1)	-- don't lose jitter effect with on/off button

	StartThread(GG.Script.SmokeUnit, unitID, {glow})
	StartThread(Flutter)
end

function AutoAttack_Thread()
	Signal(SIG_ACTIVATE)
	SetSignalMask(SIG_ACTIVATE)
	while true do
	    Sleep(2000)
		EmitSfx(glow, GG.Script.FIRE_W1)
	end
end

function script.Activate()
	StartThread(AutoAttack_Thread)
end

function script.Deactivate()
	Signal(SIG_ACTIVATE)
end

local function Stopping()
	Signal(walk)
	SetSignalMask(walk)
	--Spin(glow, y_axis, 1)
	Move(base, y_axis, 0, 15)
	Turn(base, y_axis, 0, 1)
	
	Turn(lf_ball, y_axis, 0, 1)
	Turn(rf_ball, y_axis, 0, 1)
	Turn(lb_ball, y_axis, 0, 1)
	Turn(rb_ball, y_axis, 0, 1)
		
	Turn(lf_knee, x_axis, 0, 1)
	Turn(lf_knee, z_axis, 0, 1)
	Turn(rf_knee, x_axis, 0, 1)
	Turn(rf_knee, z_axis, 0, 1)
	Turn(lb_knee, x_axis, 0, 1)
	Turn(lb_knee, z_axis, 0, 1)
	Turn(rb_knee, x_axis, 0, 1)
	Turn(rb_knee, z_axis, 0, 1)
end

function script.StartMoving()
	--StopSpin(glow, y_axis)
	--Turn(glow, y_axis, 0, 1)
	StartThread(Walk)
end

function script.StopMoving()
	StartThread(Stopping)
end
