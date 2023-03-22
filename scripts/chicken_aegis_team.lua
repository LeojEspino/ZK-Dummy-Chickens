--by Chris Mackey

include "constants.lua"

local ALLY_ACCESS = {allied = true}

--pieces
local base = piece "base"
local glow = piece "glow"
local circle = piece "circle"

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

--signals
local aim = 2
local SIG_Flutter = 1
local SIG_ACTIVATE = 4

local function Flutter()
	Signal(SIG_Flutter)
	SetSignalMask(SIG_Flutter)
	while true do
	    Spin(circle, z_axis, 0.75)
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

function script.Killed(recentDamage, maxHealth)
    return 1
end