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
  
  energyMake        = 5,
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
  metalMake         = 2.5,
  noAutoFire        = false,
  objectName        = [[spawner.dae]],
  script            = [[roost.lua]],
  selfDestructAs    = [[MEDIUM_BUILDINGEX]],
  sightDistance     = 512,
  upright           = false,
  waterline         = 0,
  workerTime        = 0,
  yardMap           = [[yyyyyyyyy]],

  featureDefs       = {
  },

} }
