return { roost = {
  unitname          = [[roost]],
  name              = [[Spawner]],
  description       = [[Spawns Dummies]],
  activateWhenBuilt = true,
  buildCostMetal    = 700,
  builder           = false,
  buildPic          = [[spawner.png]],
  category          = [[SINK]],
  useCollisionSelectionVolumes = true,
  usePieceSelectionVolumes = true,

  customParams      = {
  },
  
  energyMake        = 2,
  explodeAs         = [[MEDIUM_BUILDINGEX]],
  footprintX        = 4,
  footprintZ        = 4,
  iconType          = [[special]],
  idleAutoHeal      = 20,
  idleTime          = 300,
  levelGround       = false,
  maxDamage         = 4000,
  maxSlope          = 36,
  maxVelocity       = 0,
  metalMake         = 1,
  noAutoFire        = false,
  objectName        = [[spawner.dae]],
  script            = [[roost.lua]],
  selfDestructAs    = [[MEDIUM_BUILDINGEX]],
  sightDistance     = 273,
  upright           = false,
  waterline         = 0,
  workerTime        = 0,
  yardMap           = [[yyyyyyyyy]],

  featureDefs       = {
  },

} }
