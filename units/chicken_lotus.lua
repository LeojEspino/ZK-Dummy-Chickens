return { chicken_lotus = {
  unitname                      = [[chicken_lotus]],
  name                          = [[Dummy Lotus]],
  description                   = [[Burst Laser Tower]],
  buildCostMetal                = 100,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 4,
  buildingGroundDecalSizeY      = 4,
  buildingGroundDecalType       = [[turretlaser_aoplane.dds]],
  buildPic                      = [[lotusclone.png]],
  category                      = [[FLOAT TURRET CHEAP]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[30 90 30]],
  collisionVolumeType           = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
  },

  explodeAs                     = [[SMALL_BUILDINGEX]],
  footprintX                    = 2,
  footprintZ                    = 2,
  iconType                      = [[defense]],
  levelGround                   = false,
  maxDamage                     = 800,
  maxSlope                      = 36,
  maxVelocity                   = 0,
  noAutoFire                    = false,
  noChaseCategory               = [[FIXEDWING LAND SHIP SATELLITE SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[lotusclone.dae]],
  script                        = [[chicken_lotus.lua]],
  selfDestructAs                = [[SMALL_BUILDINGEX]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:BEAMWEAPON_MUZZLE_BLUE]],
    },

  },
  sightDistance                 = 512,
  useBuildingGroundDecal        = true,
  waterline                     = 5,
  workerTime                    = 0,
  yardMap                       = [[oooo]],

  weapons                       = {

    {
      def                = [[LASER]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK TURRET SHIP SWIM FLOAT GUNSHIP HOVER]],
    },

  },


  weaponDefs                    = {

    LASER = {
      name                    = [[Laser Shot]],
	  avoidFriendly           = false,
	  collideFriendly         = false,
      areaOfEffect            = 32,
      beamdecay               = 0.9,
      beamTime                = 1/30,
      beamttl                 = 30,
      coreThickness           = 0.25,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
          default = 300,
      },

      explosionGenerator      = [[custom:NONE]],
      fireStarter             = 30,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0,
      interceptedByShieldType = 1,
      largeBeamLaser          = true,
      minIntensity            = 1,
      noSelfDamage            = true,
      range                   = 460,
      reloadtime              = 4,
      rgbColor                = [[1 1 1]],
      soundStart              = [[weapon/laser/heavy_laser5]],
      soundTrigger            = true,
      texture1                = [[largelaser]],
      texture2                = [[flare]],
      texture3                = [[flare]],
      texture4                = [[smallflare]],
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
