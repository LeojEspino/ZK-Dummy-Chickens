return { chicken_desolator_team = {
  unitname                      = [[chicken_desolator_team]],
  name                          = [[Dummy Desolator]],
  description                   = [[Hard-Hitting Defence Fortress]],
  activateWhenBuilt             = true,
  buildCostMetal                = 1800,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 5,
  buildingGroundDecalSizeY      = 5,
  buildingGroundDecalType       = [[turretheavy_aoplane.dds]],
  buildPic                      = [[desolatorclone.png]],
  category                      = [[SINK TURRET]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[60 100 60]],
  collisionVolumeType           = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
    bait_level_default = 1,
    bait_level_target_armor = 1,
    neededlink     = 50,
    pylonrange     = 50,
    extradrawrange = 430,
    aimposoffset   = [[0 30 0]],
    midposoffset   = [[0 0 0]],

    outline_x = 130,
    outline_y = 150,
    outline_yoff = 47.5,
  },

  damageModifier                = 0.333,
  explodeAs                     = [[ESTOR_BUILDING]],
  footprintX                    = 4,
  footprintZ                    = 4,
  iconType                      = [[staticassaultriot]],
  levelGround                   = false,
  losEmitHeight                 = 70,
  maxDamage                     = 10000,
  maxSlope                      = 18,
  maxVelocity                   = 0,
  maxWaterDepth                 = 0,
  noChaseCategory               = [[FIXEDWING LAND SHIP SATELLITE SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[desolatorclone_team.dae]],
  onoffable                     = true,
  script                        = [[chicken_desolator.lua]],
  selfDestructAs                = [[ESTOR_BUILDING]],

  sfxtypes            = {

    explosiongenerators = {
      [[custom:LARGE_MUZZLE_FLASH_FX]],
    },

  },
  sightDistance                 = 763,
  useBuildingGroundDecal        = true,
  workerTime                    = 0,
  yardMap                       = [[oooo oooo oooo]],

  weapons                       = {
    
    {
      def                = [[PLASMA]],
      badTargetCategory  = [[FIXEDWING GUNSHIP]],
      onlyTargetCategory = [[FIXEDWING SWIM LAND SINK TURRET FLOAT SHIP HOVER GUNSHIP]],
    },
	
  },


  weaponDefs                    = {

    PLASMA  = {
      name                    = [[Heavy Plasma Cannon]],
      areaOfEffect            = 192,
      avoidFeature            = false,
      burnBlow                = true,
      craterBoost             = 0.7,
      craterMult              = 1.2,

      customParams            = {
        light_color = [[2.2 1.6 0.9]],
        light_radius = 550,
      },

      damage                  = {
        default = 750.1,
      },

      edgeEffectiveness       = 0.7,
      explosionGenerator      = [[custom:FLASHSMALLBUILDING]],
      fireStarter             = 99,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
      proximityPriority       = 6,
      range                   = 650,
      reloadtime              = 1,
      soundHit                = [[weapon/cannon/cannon_hit4]],
      soundStart              = [[weapon/cannon/heavy_cannon2]],
      sprayangle              = 768,
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 750,
    },

  },


  featureDefs                   = {
  },

} }
