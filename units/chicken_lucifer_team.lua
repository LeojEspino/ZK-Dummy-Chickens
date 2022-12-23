return { chicken_lucifer_team = {
  unitname                      = [[chicken_lucifer_team]],
  name                          = [[Dummy Lucifer]],
  description                   = [[Rapid-Fire Laser Tower - Power by connecting to a 50 energy grid]],
  activateWhenBuilt             = true,
  buildCostMetal                = 1800,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 6,
  buildingGroundDecalSizeY      = 6,
  buildingGroundDecalType       = [[turretantiheavy_aoplane.dds]],
  buildPic                      = [[luciferclone.png]],
  category                      = [[SINK TURRET]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[75 100 75]],
  collisionVolumeType           = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
    bait_level_default = 1,
    bait_level_target_armor = 1,

    neededlink     = 50,
    pylonrange     = 50,
	keeptooltip = [[any string I want]],

    aimposoffset   = [[0 32 0]],
    midposoffset   = [[0 0 0]],
  },

  explodeAs                     = [[ESTOR_BUILDING]],
  footprintX                    = 4,
  footprintZ                    = 4,
  iconType                      = [[fixedtachyon]],
  losEmitHeight                 = 65,
  maxDamage                     = 5000,
  maxSlope                      = 18,
  maxWaterDepth                 = 0,
  noChaseCategory               = [[FIXEDWING LAND SHIP SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[luciferclone_team.dae]],
  script                        = [[chicken_lucifer_team.lua]],
  selfdestructas                = [[ESTOR_BUILDING]],
  sightDistance                 = 660,
  useBuildingGroundDecal        = true,
  yardMap                       = [[oooo oooo oooo oooo]],

  weapons                       = {

    {
      def                = [[ATA]],
      badTargetCategory  = [[FIXEDWING GUNSHIP]],
      onlyTargetCategory = [[SWIM LAND SHIP SINK TURRET FLOAT GUNSHIP FIXEDWING HOVER]],
    },

  },

  weaponDefs                    = {

    ATA = {
      name                    = [[Laserbeam]],
      areaOfEffect            = 8,
      avoidFeature            = false,
      canattackground         = true,
      collideFriendly         = false,
      coreThickness           = 0.5,
      craterBoost             = 0,
      craterMult              = 0,

      customParams        = {
        light_camera_height = 1800,
        light_radius = 160,
      },

      damage                  = {
        default = 50,
      },

      explosionGenerator      = [[custom:BEAMWEAPON_HIT_RED]],
      fireStarter             = 50,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      range                   = 1000,
      reloadtime              = 0.1,
      rgbColor                = [[1 1 1]],
      soundHit                = [[weapon/laser/lasercannon_hit]],
      soundStart              = [[weapon/laser/heavylaser_fire2]],
      soundTrigger            = true,
      thickness               = 3.25,
      tolerance               = 10000,
      turret                  = true,
      weaponType              = [[LaserCannon]],
      weaponVelocity          = 1000,
    },

  },

  featureDefs                   = {
    DEAD  = {
      blocking         = false,
      footprintX       = 4,
      footprintZ       = 4,
      object           = [[stud5.dae]],
    },
  },

} }
