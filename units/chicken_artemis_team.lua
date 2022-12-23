return { chicken_artemis_team = {
  unitname                      = [[chicken_artemis_team]],
  name                          = [[Dummy Artemis]],
  description                   = [[Long-Range Gauss Anti-Air Turret - Power by connecting to a 50 energy grid]],
  buildCostMetal                = 1800,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 0,
  buildingGroundDecalSizeY      = 0,
  buildingGroundDecalType       = [[turretaaheavy_aoplane.dds]],
  buildPic                      = [[artemisclone.png]],
  category                      = [[SINK]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[74 74 74]],
  collisionVolumeType           = [[ellipsoid]],
  corpse                        = [[DEAD]],

  customParams                  = {
    neededlink     = 50,
    pylonrange     = 50,
	keeptooltip = [[any string I want]],
    bait_level_default = 2,
	priority_misc  = 1, -- Medium
  },

  explodeAs                     = [[LARGE_BUILDINGEX]],
  footprintX                    = 4,
  footprintZ                    = 4,
  iconType                      = [[heavysam]],
  losEmitHeight                 = 40,
  maxDamage                     = 3500,
  maxSlope                      = 18,
  maxVelocity                   = 0,
  maxWaterDepth                 = 5000,
  noAutoFire                    = false,
  noChaseCategory               = [[FIXEDWING LAND SINK TURRET SHIP SATELLITE SWIM GUNSHIP FLOAT SUB HOVER]],
  objectName                    = [[artemisclone_team.dae]],
  script                        = [[chicken_artemis_team.lua]],
  selfDestructAs                = [[LARGE_BUILDINGEX]],
  sightDistance                 = 848,
  useBuildingGroundDecal        = true,
  workerTime                    = 0,
  yardMap                       = [[oooooooooooooooo]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:light_red_short]],
      [[custom:light_green_short]],
      [[custom:light_blue_short]],
    },
	
   },

  weapons                       = {

    {
      def                = [[GAUSS]],
      badTargetCategory  = [[GUNSHIP]],
      onlyTargetCategory = [[FIXEDWING GUNSHIP]],
    },
	
  },


  weaponDefs                    = {

    GAUSS         = {
      name                    = [[Gauss]],
      alphaDecay              = 0.12,
      areaOfEffect            = 128,
      avoidfeature            = false,
	  avoidFriendly           = false,
	  collideFriendly         = false,
	  canattackground         = false,
      bouncerebound           = 0.15,
      bounceslip              = 1,
      cegTag                  = [[gauss_tag_h]],
      craterBoost             = 0,
      craterMult              = 0,
	  
      customParams = {
	  single_hit = true,
	  },

      damage                  = {
        default = 200.1,
		planes  = 2000.1,
      },

      explosionGenerator      = [[custom:gauss_hit_h]],
      fireTolerance           = 4000,
      groundbounce            = 1,
      impulseBoost            = 0,
      impulseFactor           = 0,
      interceptedByShieldType = 1,
      noExplode               = true,
      noSelfDamage            = true,
      numbounce               = 40,
      range                   = 1800,
      reloadtime              = 2.5,
      rgbColor                = [[0.5 1 1]],
      separation              = 0.5,
      size                    = 2.0,
      soundHit                = [[weapon/gauss_hit]],
      soundStart              = [[weapon/gauss_fire]],
      tolerance               = 4000,
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 1800,
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
