function gadget:GetInfo()
  return {
    name = "CMD Upgrade",
    desc = "upgrade cmd for units",
    author = "PetTurtle",
    date = "2021",
    license = "GNU GPL, v2 or later",
    layer = 0,
    enabled = true,
  }
end

if gadgetHandler:IsSyncedCode() then


local UPDATE_FRAME = 5

local upgrades = {}

local externalFunctions = {}

function gadget:GameFrame(frame)
    if frame % UPDATE_FRAME == 0 then
        for unitID, upgrade in pairs(upgrades) do

        end
    end
end

externalFunctions.Append = function(unitID, buildSpeed, metalCost, energyCost, onDone)

    upgrades[unitID] = {
        buildSpeed = buildSpeed,
        metalCost = metalCost,
        energyCost = energyCost,
        metalUsed = 0,
        energyUsed = 0,
        onDone = onDone
    }
end

externalFunctions.Cancel = function(unitID)
    upgrades[unitID] = nil
end

function gadget:Initialize()
    _G.upgrades = upgrades

    GG.CMDUpgrade = externalFunctions
end


else -- ----- Unsynced -----





end
