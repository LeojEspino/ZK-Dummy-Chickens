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

eggDefs.chicken_dodo_egg = MergeTable(defaultEgg, {
  metal       = 30,
  reclaimTime = 30,
  object      = [[chickeneggcrimson.s3o]],
})

--Turrets

eggDefs.chicken_lotus_egg = MergeTable(defaultEgg, {
  metal       = 40,
  reclaimTime = 40,
  object      = [[stud2.dae]],
})

eggDefs.chicken_picket_egg = MergeTable(defaultEgg, {
  metal       = 40,
  reclaimTime = 40,
  object      = [[stud2.dae]],
})

eggDefs.chicken_stardust_egg = MergeTable(defaultEgg, {
  metal       = 80,
  reclaimTime = 80,
  object      = [[stud3.dae]],
})

eggDefs.chicken_faraday_egg = MergeTable(defaultEgg, {
  metal       = 80,
  reclaimTime = 80,
  object      = [[stud3.dae]],
})

eggDefs.chicken_razor_egg = MergeTable(defaultEgg, {
  metal       = 80,
  reclaimTime = 80,
  object      = [[stud3.dae]],
})

eggDefs.chicken_hacksaw_egg = MergeTable(defaultEgg, {
  metal       = 80,
  reclaimTime = 80,
  object      = [[stud3.dae]],
})

eggDefs.chicken_stinger_egg = MergeTable(defaultEgg, {
  metal       = 240,
  reclaimTime = 240,
  object      = [[stud4.dae]],
})

eggDefs.chicken_gauss_egg = MergeTable(defaultEgg, {
  metal       = 240,
  reclaimTime = 240,
  object      = [[stud4.dae]],
})

eggDefs.chicken_thresher_egg = MergeTable(defaultEgg, {
  metal       = 240,
  reclaimTime = 240,
  object      = [[stud4.dae]],
})

eggDefs.chicken_desolator_egg = MergeTable(defaultEgg, {
  metal       = 720,
  reclaimTime = 720,
  object      = [[stud5.dae]],
})

eggDefs.chicken_lucifer_egg = MergeTable(defaultEgg, {
  metal       = 720,
  reclaimTime = 720,
  object      = [[stud5.dae]],
})

eggDefs.chicken_chainsaw_egg = MergeTable(defaultEgg, {
  metal       = 720,
  reclaimTime = 720,
  object      = [[stud5.dae]],
})

eggDefs.chicken_artemis_egg = MergeTable(defaultEgg, {
  metal       = 720,
  reclaimTime = 720,
  object      = [[stud5.dae]],
})

eggDefs.chicken_cerberus_egg = MergeTable(defaultEgg, {
  metal       = 720,
  reclaimTime = 720,
  object      = [[stud5.dae]],
})

eggDefs.chicken_bigbertha_egg = MergeTable(defaultEgg, {
  metal       = 4320,
  reclaimTime = 4320,
  object      = [[bigberthaclonedead.dae]],
})

--The Dummy

eggDefs.chicken_egg = MergeTable(defaultEgg, {
  metal       = 20,
  reclaimTime = 20,
  object      = [[stud1.dae]],
})

--Basic Tier
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

eggDefs.chicken_defender_egg = MergeTable(defaultEgg, {
  metal       = 40,
  reclaimTime = 40,
  object      = [[stud2.dae]],
})

eggDefs.chicken_thief_egg = MergeTable(defaultEgg, {
  metal       = 40,
  reclaimTime = 40,
  object      = [[stud2.dae]],
})

--Advanced Tier
eggDefs.chicken_mercenary_egg = MergeTable(defaultEgg, {
  metal       = 80,
  reclaimTime = 80,
  object      = [[stud3.dae]],
})

eggDefs.chicken_destroyer_egg = MergeTable(defaultEgg, {
  metal       = 80,
  reclaimTime = 80,
  object      = [[stud3.dae]],
})

eggDefs.chicken_juggernaut_egg = MergeTable(defaultEgg, {
  metal       = 80,
  reclaimTime = 80,
  object      = [[stud3.dae]],
})

eggDefs.chicken_grenadier_egg = MergeTable(defaultEgg, {
  metal       = 80,
  reclaimTime = 80,
  object      = [[stud3.dae]],
})

eggDefs.chicken_stalker_egg = MergeTable(defaultEgg, {
  metal       = 80,
  reclaimTime = 80,
  object      = [[stud3.dae]],
})

eggDefs.chicken_pigeon_egg = MergeTable(defaultEgg, {
  metal       = 15,
  reclaimTime = 15,
  object      = [[chickeneggblue.s3o]],
})

eggDefs.chicken_sporeshooter_egg = MergeTable(defaultEgg, {
  metal       = 60,
  reclaimTime = 60,
  object      = [[chickeneggyellow.s3o]],
})

eggDefs.chickena_egg = MergeTable(defaultEgg, {
  metal       = 100,
  reclaimTime = 100,
  object      = [[chickeneggred.s3o]],
})

eggDefs.chickenc_egg = MergeTable(defaultEgg, {
  metal       = 200,
  reclaimTime = 200,
  object      = [[chickeneggaqua.s3o]],
})

eggDefs.chickend_egg = MergeTable(defaultEgg, {
  metal       = 125,
  reclaimTime = 125,
  object      = [[chickeneggaqua.s3o]],
})

eggDefs.chickenf_egg = MergeTable(defaultEgg, {
  metal       = 100,
  reclaimTime = 100,
  object      = [[chickeneggyellow.s3o]],
})

eggDefs.chickenr_egg = MergeTable(defaultEgg, {
  metal       = 80,
  reclaimTime = 80,
  object      = [[chickeneggblue.s3o]],
})

eggDefs.chickens_egg = MergeTable(defaultEgg, {
  metal       = 30,
  reclaimTime = 30,
  object      = [[chickenegggreen.s3o]],
})

eggDefs.chicken_leaper_egg = MergeTable(defaultEgg, {
  metal       = 20,
  reclaimTime = 20,
  object      = [[chickeneggbrown.s3o]],
})

eggDefs.chickenspire_egg = MergeTable(defaultEgg, {
  metal       = 300,
  reclaimTime = 300,
  object      = [[chickenegggreen_big.s3o]],
})

eggDefs.chicken_blimpy_egg = MergeTable(defaultEgg, {
  metal       = 150,
  reclaimTime = 150,
  object      = [[chickeneggaqua.s3o]],
})

eggDefs.chickenblobber_egg = MergeTable(defaultEgg, {
  metal       = 200,
  reclaimTime = 200,
  object      = [[chickeneggblue.s3o]],
})

eggDefs.chickenwurm_egg = MergeTable(defaultEgg, {
  metal       = 150,
  reclaimTime = 150,
  object      = [[chickeneggbrown.s3o]],
})

eggDefs.chicken_roc_egg = MergeTable(defaultEgg, {
  metal       = 175,
  reclaimTime = 175,
  object      = [[chickenegggreen.s3o]],
})

eggDefs.chicken_shield_egg = MergeTable(defaultEgg, {
  metal       = 150,
  reclaimTime = 150,
  object      = [[chickenegggreen_big.s3o]],
})

eggDefs.chicken_tiamat_egg = MergeTable(defaultEgg, {
  metal       = 300,
  reclaimTime = 300,
  object      = [[chickeneggwhite.s3o]],
})

eggDefs.chicken_spidermonkey_egg = MergeTable(defaultEgg, {
  metal       = 150,
  reclaimTime = 150,
  object      = [[chickenegg.s3o]],
})

eggDefs.chicken_rafflesia_egg = MergeTable(defaultEgg, {
  metal       = 150,
  reclaimTime = 150,
  object      = [[chickenegg.s3o]],
})

eggDefs.chicken_dragon_egg = MergeTable(defaultEgg, {
  metal       = 1000,
  reclaimTime = 1000,
  object      = [[chickeneggblue_huge.s3o]],
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
