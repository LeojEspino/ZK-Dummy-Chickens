return { chicken_thresher = {
  unitname                      = [[chicken_thresher]],
  name                          = [[Dummy Thresher]],
  description                   = [[Anti-Air Flak Gun]],
  buildCostMetal                = 600,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 5,
  buildingGroundDecalSizeY      = 5,
  buildingGroundDecalType       = [[turretaaflak_aoplane.dds]],
  buildPic                      = [[thresherclone.png]],
  category                      = [[FLOAT]],
  collisionVolumeOffsets        = [[0 11 -4]],
  collisionVolumeScales         = [[50 86 50]],
  collisionVolumeType            = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
    aimposoffset   = [[0 16 0]],
    bait_level_default = 0,
  },

  explodeAs                     = [[MEDIUM_BUILDINGEX]],
  floater                       = true,
  footprintX                    = 3,
  footprintZ                    = 3,
  iconType                      = [[staticaa]],
  levelGround                   = false,
  maxDamage                     = 3500,
  maxSlope                      = 18,
  maxVelocity                   = 0,
  maxWaterDepth                 = 5000,
  noAutoFire                    = false,
  noChaseCategory               = [[FIXEDWING LAND SINK TURRET SHIP SATELLITE SWIM GUNSHIP FLOAT SUB HOVER]],
  objectName                    = [[thresherclone.dae]],
  script                        = [[chicken_thresher.lua]],
  selfDestructAs                = [[MEDIUM_BUILDINGEX]],
  
  sfxtypes               = {

  explosiongenerators = {
      [[custom:HEAVY_CANNON_MUZZLE]],
    },

  },
  sightDistance                 = 1024,
  useBuildingGroundDecal        = true,
  workerTime                    = 0,
  yardMap                       = [[ooo ooo ooo]],

  weapons                       = {

    {
      def                = [[ARMFLAK_GUN]],
      --badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING GUNSHIP]],
    },

  },


  weaponDefs                    = {

    ARMFLAK_GUN = {
      name                    = [[Flak Cannon]],
      accuracy                = 500,
      areaOfEffect            = 192,
      burnblow                = true,
      canattackground         = false,
      cegTag                  = [[flak_trail]],
      craterBoost             = 0,
      craterMult              = 0,
      cylinderTargeting       = 1,

      customParams              = {
        isaa = [[1]],
      },

      damage                  = {
        default = 50.1,
        planes  = 500.1,
      },

      edgeEffectiveness       = 0.5,
      explosionGenerator      = [[custom:flakplosion]],
      impulseBoost            = 0,
      impulseFactor           = 0,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
      range                   = 1000,
      reloadtime              = 2,
      size                    = 0.01,
      soundHit                = [[weapon/missile/heavy_aa_hit]],
      soundStart              = [[weapon/flak_fire]],
	  soundStartVolume        = 100,
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 2000,
    },

  },


  featureDefs                   = {
  },

} }
