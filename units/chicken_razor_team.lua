return { chicken_razor_team = {
  unitname                      = [[chicken_razor_team]],
  name                          = [[Dummy Razor]],
  description                   = [[Hardened Anti-Air Cluster Missile]],
  buildCostMetal                = 200,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 5,
  buildingGroundDecalSizeY      = 5,
  buildingGroundDecalType       = [[turretaalaser_aoplane.dds]],
  buildPic                      = [[razorclone.png]],
  category                      = [[FLOAT UNARMED STUPIDTARGET]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[50 36 50]],
  collisionVolumeType           = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
    bait_level_target  = 2,
    bait_level_target_armor = 1,
    bait_level_default = 0,
  },

  damageModifier                = 0.333,
  explodeAs                     = [[SMALL_BUILDINGEX]],
  floater                       = true,
  footprintX                    = 3,
  footprintZ                    = 3,
  iconType                      = [[defenseaa]],
  levelGround                   = false,
  maxDamage                     = 3000,
  maxSlope                      = 18,
  noAutoFire                    = false,
  noChaseCategory               = [[FIXEDWING LAND SINK TURRET SHIP SATELLITE SWIM GUNSHIP FLOAT SUB HOVER]],
  objectName                    = [[razorclone_team.dae]],
  selfDestructAs                = [[SMALL_BUILDINGEX]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:BEAMWEAPON_MUZZLE_RED]],
    },

  },

  script                        = [[chicken_razor.lua]],
  sightDistance                 = 660,
  useBuildingGroundDecal        = true,
  workerTime                    = 0,
  yardMap                       = [[ooooooooo]],

  weapons                       = {

    {
      def                = [[MISSILE]],
      --badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING GUNSHIP]],
    },

  },


  weaponDefs                    = {

    MISSILE = {
      name                    = [[Homing Cluster Missiles]],
      areaOfEffect            = 24,
	  burst                   = 13,
      burstrate               = 0.033,
      canattackground         = false,
	  avoidFriendly           = false,
      cegTag                  = [[missiletrailbluebig]],
      craterBoost             = 0,
      craterMult              = 0,
	  accuracy                = 32768,
	  sprayAngle              = 32768,

      damage                  = {
        default = 5.0,
        planes  = 60.1,
      },

      explosionGenerator      = [[custom:FLASH2]],
      flightTime              = 5,
      impactOnly              = true,
      model                   = [[wep_b_fabby.s3o]],
      noSelfDamage            = true,
      range                   = 700,
      reloadtime              = 4,
      smokeTrail              = true,
      soundHit                = [[explosion/ex_med5]],
	  soundHitVolume          = 5,
      soundStart              = [[weapon/missile/sabot_fire_short]],
	  soundStartVolume        = 9,
	  soundTrigger            = 1,
      startVelocity           = 300,
      texture1                = [[flarescale01]],
      texture2                = [[AAsmoketrail]],
      tracks                  = true,
	  startVelocity           = 100,
      turnRate                = 15000,
      turret                  = true,
      weaponType              = [[MissileLauncher]],
	  weaponAcceleration      = 200,
      weaponVelocity          = 1000,
    },

  },


  featureDefs                   = {
  },

} }
