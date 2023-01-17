return { chicken_stardust_team = {
  unitname                      = [[chicken_stardust_team]],
  name                          = [[Dummy Stardust]],
  description                   = [[Cannon Turret]],
  activateWhenBuilt             = true,
  buildCostMetal                = 300,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 5,
  buildingGroundDecalSizeY      = 5,
  buildingGroundDecalType       = [[turretriot_aoplane.dds]],
  buildPic                      = [[stardustclone.png]],
  category                      = [[FLOAT TURRET]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[45 45 45]],
  collisionVolumeType           = [[ellipsoid]],
  corpse                        = [[DEAD]],

  customParams                  = {
    bait_level_target = 4,
    aimposoffset   = [[0 12 0]],
    midposoffset   = [[0 4 0]],
    aim_lookahead  = 50,
  },

  explodeAs                     = [[LARGE_BUILDINGEX]],
  floater                       = true,
  footprintX                    = 3,
  footprintZ                    = 3,
  iconType                      = [[defenseriot]],
  levelGround                   = false,
  maxDamage                     = 1750,
  maxSlope                      = 18,
  noChaseCategory               = [[FIXEDWING LAND SHIP SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[stardustclone_team.dae]],
  script                        = [[chicken_stardust_team.lua]],
  selfDestructAs                = [[LARGE_BUILDINGEX]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:WARMUZZLE]],
      [[custom:DEVA_SHELLS]],
    },

  },

  sightDistance                 = 488,
  useBuildingGroundDecal        = true,
  yardMap                       = [[ooo ooo ooo]],

  weapons                       = {

    {
      def                = [[turretriot_WEAPON]],
      badTargetCategory  = [[FIXEDWING]],
      onlyTargetCategory = [[FIXEDWING LAND SINK TURRET SHIP SWIM FLOAT GUNSHIP HOVER]],
      mainDir            = [[0 1 0]],
      maxAngleDif        = 240,
    },

  },

  weaponDefs                    = {

    turretriot_WEAPON = {
      name                    = [[Impulse Cannon]],
      areaOfEffect            = 144,
      avoidFeature            = true,
      avoidFriendly           = false,
	  collideFriendly         = false,
      burnblow                = true,

      customParams            = {
      },
      
      damage                  = {
        default = 275,
        planes  = 275,
      },

      edgeEffectiveness       = 0.75,
      explosionGenerator      = [[custom:FLASH64]],
      impulseBoost            = 30,
      impulseFactor           = 0.6,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
      range                   = 400,
      reloadtime              = 1.7 + 2/30,
      soundHit                = [[weapon/cannon/generic_cannon]],
      soundStart              = [[weapon/cannon/outlaw_gun]],
      soundStartVolume        = 3,
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 750,
    },

  },

  featureDefs                   = {
    DEAD  = {
      blocking         = false,
      footprintX       = 3,
      footprintZ       = 3,
      object           = [[stud3.dae]],
    },
  },

} }
