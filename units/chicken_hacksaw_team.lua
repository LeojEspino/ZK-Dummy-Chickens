return { chicken_hacksaw_team = {
  unitname                      = [[chicken_hachksaw_team]],
  name                          = [[Dummy Hacksaw]],
  description                   = [[Disrupting Anti-Air Turret]],
  buildCostMetal                = 200,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 4,
  buildingGroundDecalSizeY      = 4,
  buildingGroundDecalType       = [[turretaaclose_aoplane.dds]],
  buildPic                      = [[hacksawclone.png]],
  category                      = [[FLOAT]],
  collisionVolumeOffsets        = [[0 12 0]],
  collisionVolumeScales         = [[42 53 42]],
  collisionVolumeType            = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
    bait_level_default = 1,
  },

  explodeAs                     = [[SMALL_BUILDINGEX]],
  floater                       = true,
  footprintX                    = 3,
  footprintZ                    = 3,
  iconType                      = [[defenseskirmaa]],
  levelGround                   = false,
  maxDamage                     = 1050,
  maxSlope                      = 18,
  noAutoFire                    = false,
  noChaseCategory               = [[FIXEDWING LAND SINK TURRET SHIP SATELLITE SWIM GUNSHIP FLOAT SUB HOVER]],
  objectName                    = [[hacksawclone_team.dae]],
  script                        = [[chicken_hacksaw.lua]],
  selfDestructAs                = [[SMALL_BUILDINGEX]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:STORMMUZZLE]],
      [[custom:STORMBACK]],
    },

  },
  sightDistance                 = 660,
  useBuildingGroundDecal        = true,
  waterline                     = 10,
  workerTime                    = 0,
  yardMap                       = [[ooooooooo]],

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
      beamdecay               = 0.9,
      beamTime                = 1/30,
      beamttl                 = 30,
      coreThickness           = 0.25,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
          default = 150,
      },
	  
	  customParams           = {
        timeslow_damagefactor = 2,
      },

      explosionGenerator      = [[custom:NONE]],
      fireStarter             = 30,
      impulseBoost            = 0,
      impulseFactor           = 0,
      interceptedByShieldType = 1,
      largeBeamLaser          = true,
      minIntensity            = 1,
      noSelfDamage            = true,
      range                   = 1000,
      reloadtime              = 1,
      rgbColor                = [[0.3 0 0.4]],
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
