return { chicken_stinger_team = {
  unitname                      = [[chicken_stinger_team]],
  name                          = [[Dummy Stinger]],
  description                   = [[High-Energy Laser Tower]],
  buildCostMetal                = 600,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 4,
  buildingGroundDecalSizeY      = 4,
  buildingGroundDecalType       = [[turretheavylaser_aoplane.dds]],
  buildPic                      = [[stingerclone.png]],
  category                      = [[FLOAT TURRET]],
  collisionVolumeOffsets        = [[0 17 0]],
  collisionVolumeScales         = [[36 110 36]],
  collisionVolumeType           = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
    bait_level_default = 0,
    aimposoffset   = [[0 15 0]],

    outline_x = 115,
    outline_y = 150,
    outline_yoff = 50,
  },

  explodeAs                     = [[MEDIUM_BUILDINGEX]],
  floater                       = true,
  footprintX                    = 3,
  footprintZ                    = 3,
  iconType                      = [[defenseheavy]],
  levelGround                   = false,
  losEmitHeight                 = 80,
  maxDamage                     = 3050,
  maxSlope                      = 36,
  maxVelocity                   = 0,
  noAutoFire                    = false,
  noChaseCategory               = [[FIXEDWING LAND SHIP SATELLITE SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[stingerclone_team.dae]],
  script                        = [[chicken_stinger_team.lua]],
  selfDestructAs                = [[MEDIUM_BUILDINGEX]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:HLTRADIATE0]],
      [[custom:beamlaser_hit_blue]],
    },

  },
  sightDistance                 = 708,
  useBuildingGroundDecal        = true,
  workerTime                    = 0,
  yardMap                       = [[ooo ooo ooo]],

  weapons                       = {

    {
      def                = [[LASER]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK TURRET SHIP SWIM FLOAT GUNSHIP HOVER]],
    },

  },


  weaponDefs                    = {

    LASER = {
      name                    = [[High-Energy Laserbeam]],
      areaOfEffect            = 32,
      beamTime                = 0.8,
      coreThickness           = 0.5,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = 260.1,
        planes  = 260.1,
      },

      explosionGenerator      = [[custom:flash1bluedark]],
      fireStarter             = 90,
      fireTolerance           = 8192, -- 45 degrees
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      largeBeamLaser          = true,
      laserFlareSize          = 10.4,
      leadLimit               = 18,
      minIntensity            = 1,
      noSelfDamage            = true,
      projectiles             = 1,
      range                   = 600,
      reloadtime              = 1,
      rgbColor                = [[1 1 1]],
      scrollSpeed             = 5,
      soundStart              = [[weapon/laser/heavy_laser3]],
      sweepfire               = true,
      texture1                = [[largelaser]],
      texture2                = [[flare]],
      texture3                = [[flare]],
      texture4                = [[smallflare]],
      thickness               = 10.4024486300101,
      tileLength              = 300,
      tolerance               = 10000,
      turret                  = true,
      weaponType              = [[BeamLaser]],
      weaponVelocity          = 2250,
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
