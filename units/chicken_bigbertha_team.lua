return { chicken_bigbertha_team = {
  unitname                      = [[chicken_bigbertha_team]],
  name                          = [[Dummy Big Bertha]],
  description                   = [[Destructive Quake Cannon - Power by connecting to a 50 energy grid]],
  buildCostMetal                = 10800,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 6,
  buildingGroundDecalSizeY      = 6,
  buildingGroundDecalType       = [[staticheavyarty_aoplane.dds]],
  buildPic                      = [[bigberthaclone.png]],
  category                      = [[SINK]],
  collisionVolumeOffsets        = [[0 0 -7]],
  collisionVolumeScales         = [[65 194 65]],
  collisionVolumeType           = [[cylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
    bait_level_default = 1,
    aimposoffset = [[0 50 -7]],
    modelradius    = [[35]],
    selectionscalemult = 1,
	neededlink  = 50,
    pylonrange  = 50,
	keeptooltip = [[any string I want]],

    outline_x = 270,
    outline_y = 270,
    outline_yoff = 90,
  },

  explodeAs                     = [[ATOMIC_BLAST]],
  footprintX                    = 4,
  footprintZ                    = 4,
  iconType                      = [[lrpc]],
  levelGround                   = false,
  losEmitHeight                 = 90,
  maxDamage                     = 6400,
  maxSlope                      = 18,
  maxWaterDepth                 = 0,
  noChaseCategory               = [[FIXEDWING LAND SHIP SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[bigberthaclone_team.dae]],
  script                        = [[chicken_bigbertha_team.lua]],
  selfDestructAs                = [[ATOMIC_BLAST]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:staticheavyarty_SHOCKWAVE]],
      [[custom:staticheavyarty_SMOKE]],
      [[custom:staticheavyarty_FLARE]],
    },

  },

  sightDistance                 = 660,
  useBuildingGroundDecal        = true,
  yardMap                       = [[oooo oooo oooo oooo]],

  weapons                       = {

    {
      def                = [[PLASMA]],
      badTargetCategory  = [[GUNSHIP LAND SHIP HOVER SWIM]],
      onlyTargetCategory = [[SWIM LAND SINK TURRET FLOAT SHIP HOVER GUNSHIP]],
    },

  },

  weaponDefs                    = {

    PLASMA = {
      name                    = [[Very Heavy Quake Cannon]],
      accuracy                = 600,
      areaOfEffect            = 256,
      avoidFeature            = false,
      avoidGround             = false,
      cegTag                  = [[vulcanfx]],
	  
      customParams            = {
        gatherradius = [[416]],
        smoothradius = [[320]],
        detachmentradius = [[320]],
        smoothmult   = [[1]],
        smoothexponent = [[0.45]],
        movestructures = [[1]],
        
        light_color = [[2.4 1.5 0.6]],
      },
      
      damage                  = {
        default = 4000.1,
      },

      explosionGenerator      = [[custom:bull_fade]],
      fireTolerance           = 1820, -- 10 degrees
      impulseBoost            = 0.5,
      impulseFactor           = 0.2,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
      range                   = 6300,
      reloadtime              = 15,
      soundHit                = [[explosion/ex_large4]],
      soundStart              = [[weapon/cannon/big_begrtha_gun_fire]],
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 1050,
    },

  },

  featureDefs                   = {
    DEAD  = {
      blocking         = false,
      footprintX       = 4,
      footprintZ       = 4,
      object           = [[bigberthaclonedead.dae]],
    },
  },

} }
