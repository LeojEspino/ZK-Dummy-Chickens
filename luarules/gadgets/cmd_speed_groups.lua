function gadget:GetInfo()
    return {
        name = "CMD Speed Groups",
        desc = "units match speed of group",
        author = "petturtle",
        date = "2021",
        license = "GNU GPL, v2 or later",
        layer = 0,
        enabled = true,
        handler = true
    }
end

if not gadgetHandler:IsSyncedCode() then
    return false
end
local spGetTeamList = Spring.GetTeamList
local spFindUnitCmdDesc = Spring.FindUnitCmdDesc
local spEditUnitCmdDesc = Spring.EditUnitCmdDesc
local spInsertUnitCmdDesc = Spring.InsertUnitCmdDesc
local spRemoveUnitCmdDesc = Spring.RemoveUnitCmdDesc

VFS.Include("LuaRules/Configs/customcmds.h.lua")

local DEFAULT_STATE = 1
local CMD_COUNT = 5
local CMD_SPEED_GROUPS = {}
local CMD_ID_TO_STATE = {}

local TOOLTIPS = {
  "Always keep unit at max speed",
  "Match speed with units in Group 1",
  "Match speed with units in Group 2",
  "Match speed with units in Group 3",
  "Match speed with units in Group 4",
}

local TEXTURES = {
  "LuaUI/Images/commands/states/bulb_off.png",
  "LuaUI/Images/commands/states/bait_4.png",
  "LuaUI/Images/commands/states/bait_3.png",
  "LuaUI/Images/commands/states/bait_2.png",
  "LuaUI/Images/commands/states/bait_1.png",
}

local CMDDESC = {
  type    = CMDTYPE.ICON,
  name    = "Speed Groups",
  cursor  = "speedgroups",
  action  = "speedgroups",
}

local teams = {}
local groups = {}
local unitToState = {}

local function GetCmdDesc(state)
  CMDDESC.id = CMD_SPEED_GROUPS[state]
  CMDDESC.tooltip = TOOLTIPS[state]
  CMDDESC.texture = TEXTURES[state]
  return CMDDESC
end

local function GetGroupID(unitTeam, state)
  return teams[unitTeam] * (CMD_COUNT - 1) + state - 1
end

local function AddUnitToGroup(unitID, unitDefID, unitTeam)
  local state = unitToState[unitID]
  local groupID = GetGroupID(unitTeam, state)
  local group = groups[groupID]
  group.unitCount = group.unitCount + 1
  group.units[group.unitCount] = unitID
  local unitSpeed = UnitDefs[unitDefID].speed
  if unitSpeed < group.minSpeed then
  group.minSpeed = unitSpeed
  end
end

local function RemoveUnitFromGroup(unitID, unitDefID, unitTeam)
  local state = unitToState[unitID]
  local groupID = GetGroupID(unitTeam, state)
  local group = groups[groupID]
  local uID, uDefID, newMinSpeed = 0, 0, math.maxinteger
  for i = 1, #group.unitCount - 1 do
    uID = group.units[i]
    if uID == unitID then
      group.units[i] = group.units[group.unitCount]
    end

    uDefID = Spring.GetUnitDefID(uID)
    if UnitDefs[uDefID].speed < newMinSpeed then
      newMinSpeed = UnitDefs[uDefID].speed
    end
  end

  group.units[group.unitCount] = nil
  group.unitCount = group.unitCount - 1
  group.minSpeed = newMinSpeed
end

function gadget:UnitCommand(unitID, unitDefID, unitTeam, cmdID)
  local state = CMD_ID_TO_STATE[cmdID]
  if state and unitToState[unitID] == state then
    local cmdDescID = spFindUnitCmdDesc(unitID, cmdID)

    if state ~= DEFAULT_STATE then
      RemoveUnitFromGroup(unitID, unitDefID, unitTeam)
    end

    state = state % CMD_COUNT + 1
    unitToState[unitID] = state
    spEditUnitCmdDesc(unitID, cmdDescID, GetCmdDesc(state))

    if state ~= DEFAULT_STATE then
      AddUnitToGroup(unitID, unitDefID, unitTeam)
    end
  end
end

local external = {}

external.InsertCmd = function(unitID)
  unitToState[unitID] = DEFAULT_STATE
  spInsertUnitCmdDesc(unitID, GetCmdDesc(DEFAULT_STATE))
end

external.RemoveCmd = function(unitID, unitDefID, unitTeam)

end

function gadget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)

end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)

end

function gadget:Initialize()
  -- generate speed group cmds
  local cmdID
  local cmdGen = GG.CMDGenerator.Generate
  for i = 1, CMD_COUNT do
    cmdID = cmdGen("SPEED_GROUPS_" .. i)
    CMD_SPEED_GROUPS[i] = cmdID
    CMD_ID_TO_STATE[cmdID] = i
  end

  -- init teams
  local teamList = spGetTeamList()
  for i = 1, #teamList do
    teams[teamList[i]] = i
  end

  -- init groups
  for i = 1, #teamList * (CMD_COUNT - 1) do
    groups[i] = {
      units = {},
      unitCount = 0,
      minSpeed = math.maxinteger
    }
  end

  GG.SpeedGroups = external
end

