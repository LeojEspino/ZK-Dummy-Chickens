--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local modoptions = Spring.GetModOptions() or {}

--------------------------------------------------------------------------------
-- system

spawnSquare				= 150	   -- size of the chicken spawn square centered on the burrow
spawnSquareIncrement	= 1		 -- square size increase for each unit spawned
burrowName				= "roost"   -- burrow unit name
maxBurrows				= 50
minBaseDistance			= 700
maxBaseDistance			= 3500
maxAge					= 5*60	  -- chicken die at this age, seconds

alwaysVisible			= false	 -- chicken are always visible

alwaysEggs				= true			--spawn limited-lifespan eggs when not in Eggs mode?
eggDecayTime			= 180
burrowEggs				= 15	   -- number of eggs each burrow spawns

gameMode				= true
endlessMode				= false

tooltipMessage			= "Kill chickens and collect their eggs to get metal."

mexesUnitDefID = {
	[-UnitDefNames.staticmex.id] = true,
}
mexes = {
	"staticmex",
}
noTarget = {
	terraunit=true,
	wolverine_mine=true,
	roost=true,
}

modes = {
	[0] = 0,
	[1] = 'Chicken: Beginner',
	[2] = 'Chicken: Very Easy',
	[3] = 'Chicken: Easy',
	[4] = 'Chicken: Normal',
	[5] = 'Chicken: Hard',
	[6] = 'Chicken: Suicidal',
	[7] = 'Chicken: Custom',
	[8] = 'Chicken: Speed'
}
defaultDifficulty = modes[2]
testBuilding 	= UnitDefNames["energypylon"].id	--testing to place burrow
testBuildingQ 	= UnitDefNames["chicken_dragon"].id	--testing to place queen

--------------------------------------------------------------------------------
-- difficulty settings

playerMalus			= 1		 -- how much harder it becomes for each additional player, exponential (playercount^playerMalus = malus)	-- used only for burrow spawn rate and queen XP

queenName				= "chickenflyerqueen"
queenMorphName			= "chickenlandqueen"
miniQueenName			= "chicken_dragon"

burrowSpawnRate			= 45		-- faster in games with many players, seconds
chickenSpawnRate		= 50
waveRatio				= 0.6	   -- waves are composed by two types of chicken, waveRatio% of one and (1-waveRatio)% of the other
baseWaveSize			= 2.5		 -- multiplied by malus, 1 = 1 squadSize of chickens
waveSizeMult			= 1
--forceBurrowRespawn	 = false	-- burrows always respawn even if the modoption is set otherwise
queenSpawnMult			= 4		 -- how many times bigger is a queen hatch than a normal burrow hatch

defensePerWave			= 0.5	-- number of turrets added to defense pool every wave, multiplied by playercount
defensePerBurrowKill	= 0.5	-- number of turrets added to defense pool for each burrow killed

gracePeriod				= 180	   -- no chicken spawn in this period, seconds
gracePenalty			= 0		-- reduced grace per player over one, seconds
gracePeriodMin			= 90
rampUpTime				= 0	-- if current time < ramp up time, wave size is multiplied by currentTime/rampUpTime; seconds

queenTime				= 60*60	-- time at which the queen appears, seconds
queenMorphTime			= {60*30, 120*30}	--lower and upper bounds for delay between morphs, gameframes
queenHealthMod			= 1
miniQueenTime			= {}		-- times at which miniqueens are spawned (multiplier of queentime)
endMiniQueenWaves		= 7		-- waves per miniqueen in PvP endgame

burrowQueenTime			= 15		-- how much killing a burrow shaves off the queen timer, seconds
burrowWaveSize			= 1.2		-- size of contribution each burrow makes to wave size (1 = 1 squadSize of chickens)
burrowRespawnChance 	= 0.15
burrowRegressTime		= 30		-- direct tech time regress from killing a burrow, divided by playercount

humanAggroPerBurrow		= 1			-- divided by playercount
humanAggroDecay			= 0.25	 -- linear rate at which aggro decreases
humanAggroMin			= -100
humanAggroMax			= 100
humanAggroWaveFactor	= 1
humanAggroWaveMax		= 5
humanAggroDefenseFactor	= 0.5	-- turrets issued per point of PAR every wave, multiplied by playercount
humanAggroTechTimeProgress	= 10	-- how much to increase chicken tech progress (* aggro), seconds
humanAggroTechTimeRegress	= 0	-- how much to reduce chicken tech progress (* aggro), seconds
humanAggroQueenTimeFactor	= 1	-- burrow queen time is multiplied by this and aggro (after clamping)
humanAggroQueenTimeMin	= 0	-- min value of aggro for queen time calc
humanAggroQueenTimeMax	= 8

techAccelPerPlayer		= 2		-- how much tech accel increases per player over one per wave, seconds
techTimeFloorFactor		= 0.5	-- tech timer can never be less than this * real time
techTimeMax				= 999999

scoreMult				= 1

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

VFS.Include("LuaRules/Utilities/tablefunctions.lua")

local function Copy(original)   -- Warning: circular table references lead to
	local copy = {}			   -- an infinite loop.
	for k, v in pairs(original) do
		if (type(v) == "table") then
			copy[k] = Copy(v)
		else
			copy[k] = v
		end
	end
	return copy
end


local function TimeModifier(d, mod)
	for chicken, t in pairs(d) do
		t.time = t.time*mod
		if (t.obsolete) then
			t.obsolete = t.obsolete*mod
		end
	end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- times in minutes
local chickenTypes = Spring.Utilities.CustomKeyToUsefulTable(Spring.GetModOptions().campaign_chicken_types_offense) or {
	chicken				=  {time = -60,  squadSize = 4, obsolete = 7.5},
-- Brawler
	chicken_warrior     =  {time = 7.5,  squadSize = 3, obsolete = 30},
	chicken_destroyer   =  {time = 15, squadSize = 1.5, obsolete = 50},
	chicken_ravager     =  {time = 30, squadSize = 0.75},
-- Marksman
	chicken_gunner      =  {time = 7.5,  squadSize = 3, obsolete = 30},
	chicken_mercenary   =  {time = 15, squadSize = 1.5, obsolete = 50},
	chicken_sniper      =  {time = 30, squadSize = 0.75},
-- Assasin
	chicken_thief       =  {time = 7.5,  squadSize = 3, obsolete = 30},
	chicken_stalker     =  {time = 15, squadSize = 1.5, obsolete = 50},
	chicken_trickster   =  {time = 30, squadSize = 0.75},
-- Burst
	chicken_mage        =  {time = 7.5,  squadSize = 3, obsolete = 30},
	chicken_grenadier   =  {time = 15, squadSize = 1.5, obsolete = 50},
	chicken_bomber      =  {time = 30, squadSize = 0.75},
-- Tank
	chicken_defender    =  {time = 7.5,  squadSize = 3, obsolete = 30},
	chicken_juggernaut  =  {time = 15, squadSize = 1.5, obsolete = 50},
	chicken_admiral     =  {time = 30, squadSize = 0.75},
	--chicken_pigeon		=  {time = 6,  squadSize = 1.4, obsolete = 35},
	--chickens			=  {time = 12,  squadSize = 1, obsolete = 35},
	--chickena			=  {time = 18,  squadSize = 0.5, obsolete = 40},
	--chickenr			=  {time = 24,  squadSize = 1.2, obsolete = 45},
	--chicken_leaper	=  {time = 24,  squadSize = 2, obsolete = 45},
	--chickenwurm			=  {time = 28,  squadSize = 0.7},
	--chicken_roc			=  {time = 28,  squadSize = 0.4},
	--chicken_sporeshooter=  {time = 32,  squadSize = 0.5},
	--chickenf			=  {time = 32,  squadSize = 0.5},
	--chickenc			=  {time = 40,  squadSize = 0.5},
	--chickenblobber		=  {time = 40,  squadSize = 0.3},
	--chicken_blimpy		=  {time = 48,  squadSize = 0.2},
	--chicken_tiamat		=  {time = 55,  squadSize = 0.2},
}

local defenders = Spring.Utilities.CustomKeyToUsefulTable(Spring.GetModOptions().campaign_chicken_types_defense) or {
  chicken_lotus         = {time = 7.5, squadSize = 1, cost = 1, obsolete = 15 },
  chicken_picket        = {time = 7.5, squadSize = 1, cost = 1, obsolete = 15 },
  chicken_stardust      = {time = 15, squadSize = 1, cost = 2, obsolete = 30 },
  chicken_faraday       = {time = 15, squadSize = 1, cost = 2, obsolete = 30 },
  chicken_razor         = {time = 15, squadSize = 1, cost = 2, obsolete = 30 },
  chicken_hacksaw       = {time = 15, squadSize = 1, cost = 2, obsolete = 30 },
  chicken_stinger       = {time = 30, squadSize = 1, cost = 3, obsolete = 50 },
  chicken_gauss         = {time = 30, squadSize = 1, cost = 3, obsolete = 50 },
  chicken_thresher      = {time = 30, squadSize = 1, cost = 3, obsolete = 50 },
  chicken_desolator     = {time = 50, squadSize = 1, cost = 5 },
  chicken_lucifer       = {time = 50, squadSize = 1, cost = 5 },
  chicken_chainsaw      = {time = 50, squadSize = 1, cost = 5 },
  chicken_artemis       = {time = 50, squadSize = 1, cost = 5 },
  chicken_aegis         = {time = 50, squadSize = 1/12, cost = 5 },
  chicken_cerberus      = {time = 9000, squadSize = 1, cost = 5}, --Used for spawning eggs
  chicken_bigbertha     = {time = 9000, squadSize = 1, cost = 5}, --Used for spawning eggs
}

local supporters = Spring.Utilities.CustomKeyToUsefulTable(Spring.GetModOptions().campaign_chicken_types_support) or {
  --chickenspire =  {time = 50, squadSize = 0.1},
  --chicken_shield =  {time = 30, squadSize = 0.4},
  chicken_swift         = {time = 10, squadSize = 1.25, obsolete = 30},
  chicken_raptor        = {time = 30, squadSize = 0.75},
  chicken_caretaker     = {time = 30, squadSize = 0.25},
  chicken_aspis         = {time = 30, squadSize = 1/12},
  seismic               = {time = 30, squadSize = 0.1},
  --chicken_spidermonkey =  {time = 20, squadSize = 0.6},
}

-- TODO
-- cooldown is in waves
local specialPowers = Spring.Utilities.CustomKeyToUsefulTable(Spring.GetModOptions().campaign_chicken_types_special) or {
	--{name = "Digger Ambush", maxAggro = -2, time = 15, obsolete = 40, unit = "chicken_digger", burrowRatio = 1.25, minDist = 100, maxDist = 450, cooldown = 3, targetHuman = true},
	--{name = "Wurmsign", maxAggro = -3, time = 40, unit = "chickenwurm", burrowRatio = 0.2, cooldown = 4},
	{name = "Dummy Cerberus Pop-ups", maxAggro = -3, time = 30, unit = "chicken_cerberus", burrowRatio = 0.15, tieToBurrow = true, cooldown = 3},
	{name = "Dummy Big Bertha Creation", maxAggro = -8, time = 30, unit = "chicken_bigbertha", burrowRatio = 1/15, tieToBurrow = true, cooldown = 5},
	--{name = "Rising Dragon", maxAggro = -8, time = 30, unit = "chicken_dragon", burrowRatio = 1/12, minDist = 250, maxDist = 1200, cooldown = 5, targetHuman = true},
	--{name = "Dino Killer", maxAggro = -12, time = 40, unit = "chicken_silo", minDist = 1500},
}

local function SetCustomMiniQueenTime()
	if modoptions.miniqueentime then
		if modoptions.miniqueentime == 0 then return nil
		else return modoptions.miniqueentime end
	else
		return 0.6
	end
end
	
difficulties = {
	['Chicken: Beginner'] = {
		chickenSpawnRate = 180,
		burrowSpawnRate  = 180,
		gracePeriod      = 450,
		rampUpTime       = 1200,
		waveSizeMult     = 0.3,
		timeSpawnBonus   = 0.010, -- how much each time level increases spawn size
		queenTime        = 60*60,
		queenHealthMod	 = 0.25,
		maxBurrows       = 4,
		specialPowers    = {},
		techAccelPerPlayer = 1,
		techTimeFloorFactor = 0.2,
		scoreMult        = 0.25,
	},
	
	['Chicken: Very Easy'] = {
		chickenSpawnRate = 90,
		burrowSpawnRate  = 90,
		gracePeriod	  = 300,
		rampUpTime	   = 900,
		waveSizeMult	 = 0.6,
		timeSpawnBonus   = .025,	 -- how much each time level increases spawn size
		queenTime		 = 40*60,
		queenHealthMod	 = 0.33,
		maxBurrows	   = 10,
		specialPowers	 = {},
		techAccelPerPlayer = 1.5,
		techTimeFloorFactor = 0.4,
		scoreMult		 = 0.5,
	},

	['Chicken: Easy'] = {
		chickenSpawnRate = 60,
		burrowSpawnRate  = 50,
		gracePeriod	  = 180,
		rampUpTime	   = 480,
		waveSizeMult	 = 0.8,
		timeSpawnBonus   = .03,
		queenHealthMod	 = 0.5,
		techAccelPerPlayer = 2,
		scoreMult		 = 1,
	},

	['Chicken: Normal'] = {
	    waveSizeMult	 = 1,
		chickenSpawnRate = 50,
		burrowSpawnRate  = 45,
		timeSpawnBonus   = .04,
		miniQueenTime	= {0.6},
		scoreMult = 1.5
	},

	['Chicken: Hard'] = {
		chickenSpawnRate = 45,
		burrowSpawnRate  = 45,
		waveSizeMult	 = 1.1,
		timeSpawnBonus   = .05,
		burrowWaveSize	 = 1.3,
		queenHealthMod	 = 1.5,
		queenSpawnMult   = 5,
		miniQueenTime	 = {0.5},
		techAccelPerPlayer	= 3,
		burrowRegressTime   = 60,
		scoreMult		 = 2,
		timeModifier	 = 0.85,
	},
	
	['Chicken: Suicidal'] = {
		chickenSpawnRate = 30,
		burrowSpawnRate  = 30,
		waveSizeMult	 = 1.15,
		timeSpawnBonus   = .06,
		burrowWaveSize	 = 1.3,
		burrowRespawnChance = 0.25,
		--burrowRegressTime	= 25,
		queenSpawnMult   = 5,
		queenTime		 = 50*60,
		queenHealthMod	 = 2,
		miniQueenTime	 = {0.45}, --{0.37, 0.75},
		endMiniQueenWaves	= 6,
		techAccelPerPlayer	= 3,
		burrowRegressTime   = 90,
		timeModifier	 = 0.70,
		scoreMult		 = 3,
	},

	['Chicken: Custom'] = {
		chickenSpawnRate = modoptions.chickenspawnrate or 50,
		burrowSpawnRate  = modoptions.burrowspawnrate or 45,
		waveSizeMult    = modoptions.wavesizemult or 1,
		timeSpawnBonus   = .04,
	--	chickenTypes	 = Copy(chickenTypes),
	--	defenders		= Copy(defenders),
		queenTime		= (modoptions.queentime or 60)*60,
		miniQueenTime	= { SetCustomMiniQueenTime() },
		gracePeriod		= (modoptions.graceperiod and modoptions.graceperiod * 60) or 180,
		gracePenalty	= 0,
		gracePeriodMin	= 30,
		burrowQueenTime	= (modoptions.burrowqueentime) or 15,
		queenHealthMod	= modoptions.queenhealthmod or 1,
		timeModifier	= modoptions.techtimemult or 1,
		scoreMult		= 0,
	},
}

-- minutes to seconds
TimeModifier(chickenTypes, 60)
TimeModifier(defenders, 60)
TimeModifier(supporters, 60)
TimeModifier(specialPowers, 60)

--[[
for chicken, t in pairs(chickenTypes) do
	t.timeBase = t.time
end
for chicken, t in pairs(supporters) do
	t.timeBase = t.time
end
for chicken, t in pairs(defenders) do
	t.timeBase = t.time
end
]]--

for _, d in pairs(difficulties) do
	d.timeSpawnBonus = (d.timeSpawnBonus or 0)/60
	d.chickenTypes = Copy(chickenTypes)
	d.defenders = Copy(defenders)
	d.supporters = Copy(supporters)
	d.specialPowers = d.specialPowers or Copy(specialPowers)

	if modoptions.speedchicken == "1" then
		d.timeModifier = (d.timeModifier or 1)*0.5
		d.waveSizeMult = (d.waveSizeMult or waveSizeMult)*0.85
		d.gracePeriod = (d.gracePeriod or gracePeriod)*0.5
		d.gracePenalty = (d.gracePenalty or gracePenalty)*0.5
		d.gracePeriodMin = (d.gracePeriodMin or gracePeriodMin)*0.5
		d.timeSpawnBonus = (d.timeSpawnBonus or 1)*1.5
		d.queenTime = (d.queenTime or queenTime)*0.5
		d.queenHealthMod = (d.queenHealthMod or 1)*0.4
		d.miniQueenTime = {}
		d.endMiniQueenWaves = (d.endMiniQueenWaves or endMiniQueenWaves) - 1
		d.burrowQueenTime = (d.burrowQueenTime or burrowQueenTime)*0.5
		d.techAccelPerPlayer = (d.techAccelPerPlayer or techAccelPerPlayer)*0.5
		d.humanAggroTechTimeProgress = (d.humanAggroTechTimeProgress or humanAggroTechTimeProgress)*0.5
		d.burrowRegressTime = (d.burrowRegressTime or burrowRegressTime)*0.5
		d.queenSpawnMult = (d.queenSpawnMult or queenSpawnMult)*0.4
	end

	TimeModifier(d.chickenTypes, d.timeModifier or 1)
	TimeModifier(d.defenders, d.timeModifier or 1)
	TimeModifier(d.supporters, d.timeModifier or 1)
end

--difficulties['Chicken: Very Easy'].chickenTypes.chicken_tiamat.time = 999999

--difficulties['Chicken: Beginner'].chickenTypes.chicken_tiamat.time = 999999

defaultDifficulty = 'Chicken: Normal'

-- special config (used by campaign)
if modoptions.chicken_nominiqueen then
	for _, d in pairs(difficulties) do
		d.miniQueenTime = {}
	end
end
if modoptions.chicken_minaggro then
	humanAggroMin = tonumber(modoptions.chicken_minaggro)
end
if modoptions.chicken_maxaggro then
	humanAggroMax = tonumber(modoptions.chicken_maxaggro)
end
if modoptions.chicken_maxtech then
	techTimeMax = tonumber(modoptions.chicken_maxtech)
end
if modoptions.chicken_endless then
	endlessMode = Spring.Utilities.tobool(modoptions.chicken_endless)
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
