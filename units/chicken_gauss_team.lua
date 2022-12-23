return { chicken_gauss_team = {
  unitname                      = [[chicken_gauss_team]],
  name                          = [[Dummy Gauss]],
  description                   = [[Popup Explosive Tower]],
  buildCostMetal                = 600,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 4,
  buildingGroundDecalSizeY      = 4,
  buildingGroundDecalType       = [[gauss_aoplate.dds]],
  buildPic                      = [[gaussclone.png]],
  canMove                       = false,
  category                      = [[SINK TURRET]],
  collisionVolumeOffsets        = [[0 15 0]],
  collisionVolumeScales         = [[60 20 60]],
  collisionVolumeType           = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
    bait_level_default = 1,
    bait_level_target_armor = 1,
    midposoffset   = [[0 15 0]],
    aimposoffset   = [[0 36 0]],
    armored_regen  = [[10]],
  },

  explodeAs                     = [[SMALL_BUILDINGEX]],
  footprintX                    = 3,
  footprintZ                    = 3,
  iconType                      = [[defense]],
  levelGround                   = false,
  maxDamage                     = 4500,
  maxSlope                      = 18,
  maxVelocity                   = 0,
  maxWaterDepth                 = 0, -- model-derived would be 305: 35 elmo legs + 6x45 elmo pillar segments should be enough for everyone
  noAutoFire                    = false,
  noChaseCategory               = [[FIXEDWING LAND SHIP SATELLITE SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[gaussclone_team.dae]],
  script                        = [[chicken_gauss_team.lua]],
  selfDestructAs                = [[SMALL_BUILDINGEX]],
 
  sfxtypes               = {
    explosiongenerators = {
      [[custom:flashmuzzle1]],
    },
  },

  sightDistance                 = 488,
  useBuildingGroundDecal        = true,
  yardmap                       = [[ooooooooo]],

  weapons                       = {

    {
      def                = [[DEPTHCHARGE]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK TURRET SUB SHIP SWIM FLOAT GUNSHIP HOVER]],
    },

  },


  weaponDefs                    = {

    DEPTHCHARGE = {
      name                    = [[Depth Charge]],
      areaOfEffect            = 160,
      avoidFriendly           = false,
      bounceSlip              = 0.94,
      bounceRebound           = 0.8,
      collideFriendly         = false,
      craterBoost             = 1,
      craterMult              = 2,
      cegTag                  = [[torpedo_trail]],
	  burst                   = 3,
	  sprayangle              = 1600,

      customParams = {
      },

      damage                  = {
        default = 330.1,
      },

      edgeEffectiveness       = 0.4,
      explosionGenerator      = [[custom:TORPEDOHITHUGE]],
      flightTime              = 2.3,
      groundBounce            = true,
      heightMod               = 0,
      impulseBoost            = 0.2,
      impulseFactor           = 0.9,
      interceptedByShieldType = 1,
      leadLimit               = 0,
      model                   = [[depthcharge_big.s3o]],
      myGravity               = 0.2,
      noSelfDamage            = true,
      numbounce               = 3,
      range                   = 400,
      reloadtime              = 3.2,
      soundHitDry             = [[explosion/mini_nuke]],
      soundHitWet             = [[explosion/wet/ex_underwater]],
      soundStart              = [[weapon/torp_land]],
      soundStartVolume        = 8.5,
      soundHitVolume          = 11,
      startVelocity           = 5,
      tolerance               = 1000000,
      tracks                  = true,
      turnRate                = 60000,
      waterWeapon             = true,
	  turret                  = true,
      weaponAcceleration      = 25,
      weaponType              = [[Cannon]],
      weaponVelocity          = 400,
    },

  },


  featureDefs                   = {
    DEAD  = {
      blocking         = false,
      footprintX       = 3,
      footprintZ       = 3,
      object           = [[stud4.dae]],
    },
  },

} }
