-- $Id$

local eggDefs = {}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local defaultEgg = {
  description = [[Stud]],
  blocking    = false,
  damage      = 10000,
  reclaimable = true,
  energy      = 0,
  footprintx  = 1,
  footprintz  = 1,

  customParams = {
    mod = true,
  },
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local type  = type
local pairs = pairs
local function CopyTable(outtable,intable)
  for i,v in pairs(intable) do
    if (type(v)=='table') then
      if (type(outtable[i])~='table') then outtable[i] = {} end
      CopyTable(outtable[i],v)
    else
      outtable[i] = v
    end
  end
end
local function MergeTable(table1,table2)
  local ret = {}
  CopyTable(ret,table2)
  CopyTable(ret,table1)
  return ret
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

eggDefs.chicken_egg = MergeTable(defaultEgg, {
  metal       = 20,
  reclaimTime = 20,
  object      = [[stud1.dae]],
})

eggDefs.chicken_warrior_egg = MergeTable(defaultEgg, {
  metal       = 40,
  reclaimTime = 40,
  object      = [[stud2.dae]],
})

eggDefs.chicken_gunner_egg = MergeTable(defaultEgg, {
  metal       = 40,
  reclaimTime = 40,
  object      = [[stud2.dae]],
})

eggDefs.chicken_mage_egg = MergeTable(defaultEgg, {
  metal       = 40,
  reclaimTime = 40,
  object      = [[stud2.dae]],
})

-- specify origin unit (for tooltip/contextmenu)
for name,data in pairs(eggDefs) do
	local unitname = name
	local truncate = unitname:find("_egg")
	unitname = unitname:sub(1, truncate)
	data.customParams.unit = unitname
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return lowerkeys( eggDefs )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
