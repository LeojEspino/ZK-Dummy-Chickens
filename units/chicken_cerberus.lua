return { chicken_cerberus = {
  unitname                      = [[chicken_cerberus]],
  name                          = [[Dummy Cerberus]],
  description                   = [[Plasma Artillery Battery]],
  activateWhenBuilt             = true,
  buildCostMetal                = 1800,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 4,
  buildingGroundDecalSizeY      = 4,
  buildingGroundDecalType       = [[staticarty_aoplane.dds]],
  buildPic                      = [[cerberusclone.png]],
  category                      = [[SINK]],
  corpse                        = [[DEAD]],

  customParams                  = {
    aimposoffset   = [[0 26 0]],
    midposoffset   = [[0 10 0]],
  },

  explodeAs                     = [[LARGE_BUILDINGEX]],
  footprintX                    = 5,
  footprintZ                    = 5,
  iconType                      = [[staticarty]],
  maxDamage                     = 3000,
  maxSlope                      = 18,
  maxVelocity                   = 0,
  maxWaterDepth                 = 0,
  noAutoFire                    = false,
  noChaseCategory               = [[FIXEDWING LAND SHIP SATELLITE SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[cerberusclone.dae]],
  script                        = [[chicken_cerberus.lua]],
  selfDestructAs                = [[LARGE_BUILDINGEX]],
  
  sfxtypes               = {

    explosiongenerators = {
      [[custom:LARGE_MUZZLE_FLASH_FX]],
    },

  },
  sightDistance                 = 660,
  useBuildingGroundDecal        = true,
  workerTime                    = 0,
  yardMap                       = [[ooooo ooooo ooooo ooooo ooooo]],

  weapons                       = {

    {
      def                = [[PLASMA]],
      badTargetCategory  = [[GUNSHIP]],
      onlyTargetCategory = [[SWIM LAND SINK TURRET FLOAT SHIP HOVER GUNSHIP]],
    },

  },


  weaponDefs                    = {

    PLASMA = {
      name                    = [[Long-Range Plasma Battery]],
	  accuracy                = 180,
      areaOfEffect            = 128,
      avoidFeature            = false,
      avoidGround             = true,
      burst                   = 3,
      burstRate               = 0.133,
      craterBoost             = 1,
      craterMult              = 2,

      customParams            = {
        light_color = [[1.4 0.8 0.3]],
      },

      damage                  = {
        default = 601,
        planes  = 601,
      },

      edgeEffectiveness       = 0.5,
      explosionGenerator      = [[custom:330rlexplode]],
      fireStarter             = 120,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      range                   = 1700,
      reloadtime              = 12,
      soundHit                = [[explosion/ex_large4]],
      soundStart              = [[explosion/ex_large5]],
      sprayangle              = 180,
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 750,
    },

  },


  featureDefs                   = {
  },

} }
