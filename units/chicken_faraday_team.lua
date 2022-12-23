return { chicken_faraday_team = {
  unitname                      = [[chicken_faraday_team]],
  name                          = [[Dummy Faraday]],
  description                   = [[Disruption Turret]],
  buildCostMetal                = 200,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 4,
  buildingGroundDecalSizeY      = 4,
  buildingGroundDecalType       = [[turretemp_aoplane.dds]],
  buildPic                      = [[faradayclone.png]],
  category                      = [[SINK TURRET]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[32 75 32]],
  collisionVolumeType           = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
  },

  damageModifier                = 0.333,
  explodeAs                     = [[MEDIUM_BUILDINGEX]],
  footprintX                    = 2,
  footprintZ                    = 2,
  iconType                      = [[defensespecial]],
  levelGround                   = false,
  maxDamage                     = 1600,
  maxSlope                      = 36,
  maxWaterDepth                 = 0,
  noChaseCategory               = [[FIXEDWING LAND SHIP SWIM GUNSHIP SUB HOVER]],
  objectName                    = [[faradayclone_team.dae]],
  script                        = [[chicken_faraday.lua]],
  selfDestructAs                = [[MEDIUM_BUILDINGEX]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:YELLOW_LIGHTNING_MUZZLE]],
      [[custom:YELLOW_LIGHTNING_GROUNDFLASH]],
    },

  },

  sightDistance                 = 512,
  useBuildingGroundDecal        = true,
  yardMap                       = [[oo oo]],

  weapons                       = {

    {
      def                = [[BLAST]],
      onlyTargetCategory = [[SWIM LAND SINK TURRET FLOAT SHIP HOVER FIXEDWING GUNSHIP]],
    },

  },

  weaponDefs                    = {

    BLAST    = {
      name                    = [[Disruption Bomb]],
	  collideFriendy          = false,
      areaOfEffect            = 256,
      craterBoost             = 0,
      craterMult              = 0,
	  range                   = 450,

      damage                  = {
        default = 30,
        planes  = 30,
      },

      customParams           = {
        light_radius = 0,
        lups_explodespeed = 1,
        lups_explodelife = 0.6,
        nofriendlyfire = 1,
        timeslow_damagefactor = 10,
      },

      size                    = 5,
      edgeeffectiveness       = 0.6,
      explosionGenerator      = [[custom:turret_disruption_bomb]],
      explosionSpeed          = 5,
      impulseBoost            = 0,
      impulseFactor           = 0,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
	  soundHit                = [[weapon/aoe_aura2]],
	  rgbColor				  = "0.9 0.1 0.9",
      reloadtime              = 4,
      soundHitVolume          = 1,
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 250,
    },

  },

  featureDefs                   = {
  },

} }
