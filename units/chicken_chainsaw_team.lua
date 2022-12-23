return { chicken_chainsaw_team = {
  unitname                      = [[chicken_chainsaw_team]],
  name                          = [[Dummy Chainsaw]],
  description                   = [[Long-Range Disrupting Anti-Air Turret]],
  buildCostMetal                = 1800,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 3.6,
  buildingGroundDecalSizeY      = 3.6,
  buildingGroundDecalType       = [[turretaafar_aoplane.dds]],
  buildPic                      = [[chainsawclone.png]],
  category                      = [[FLOAT]],
  collisionVolumeOffsets        = [[0 12 0]],
  collisionVolumeScales         = [[58 66 58]],
  collisionVolumeType            = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
  },

  explodeAs                     = [[LARGE_BUILDINGEX]],
  floater                       = true,
  footprintX                    = 4,
  footprintZ                    = 4,
  iconType                      = [[staticskirmaa]],
  losEmitHeight                 = 40,
  maxDamage                     = 4000,
  maxSlope                      = 18,
  maxVelocity                   = 0,
  maxWaterDepth                 = 5000,
  noAutoFire                    = false,
  noChaseCategory               = [[FIXEDWING LAND SINK TURRET SHIP SATELLITE SWIM GUNSHIP FLOAT SUB HOVER]],
  objectName                    = [[chainsawclone_team.dae]],
  script                        = [[chicken_chainsaw.lua]],
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
      def                = [[LASER]],
      badTargetCategory  = [[GUNSHIP]],
      onlyTargetCategory = [[FIXEDWING GUNSHIP]],
    },
	
  },


  weaponDefs                    = {

    LASER = {
      name                    = [[Disruption Laser]],
	  avoidFriendly           = false,
	  collideFriendly         = false,
	  canattackground         = false,
      areaOfEffect            = 64,
      beamDecay               = 0.85,
      beamTime                = 1/30,
      beamttl                 = 45,
      coreThickness           = 0.5,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
          default = 60,
      },
	  
	  customParams           = {
        timeslow_damagefactor = 2,
      },

      explosionGenerator      = [[custom:NONE]],
      fireStarter             = 30,
      impulseBoost            = 0,
      impulseFactor           = 0,
      interceptedByShieldType = 1,
      minIntensity            = 1,
      noSelfDamage            = true,
      range                   = 2000,
      reloadtime              = 0.1,
      rgbColor                = [[0.3 0 0.4]],
      soundStart              = [[weapon/laser/mini_laser]],
      soundTrigger            = true,
      thickness               = 12,
      tolerance               = 18000,
      turret                  = true,
      weaponType              = [[BeamLaser]],
      weaponVelocity          = 500,
    },

  },


  featureDefs                   = {
  },

} }
