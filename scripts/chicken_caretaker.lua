
include "constants.lua"

local base = piece 'base'
local body = piece 'body'
local flare = piece 'flare'

local SIG_Aim = 2

function script.StartBuilding(heading, pitch)
    SetUnitValue(COB.INBUILDSTANCE, 1)
end

function script.StopBuilding()
    SetUnitValue(COB.INBUILDSTANCE, 0)
end

function script.QueryNanoPiece()
    return flare
end