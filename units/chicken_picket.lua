return { chicken_picket = {
  unitname                      = [[chicken_picket]],
  name                          = [[Dummy Picket]],
  description                   = [[Light Flamethrower Tower]],
  buildCostMetal                = 100,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 4,
  buildingGroundDecalSizeY      = 4,
  buildingGroundDecalType       = [[turretmissile_aoplane.dds]],
  buildPic                      = [[picketclone.png]],
  category                      = [[FLOAT TURRET CHEAP]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[30 75 30]],
  collisionVolumeType           = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
  },

  explodeAs                     = [[SMALL_BUILDINGEX]],
  floater                       = true,
  footprintX                    = 2,
  footprintZ                    = 2,
  iconType                      = [[defense]],
  levelGround                   = false,
  losEmitHeight                 = 40,
  maxDamage                     = 600,
  maxSlope                      = 36,
  maxVelocity                   = 0,
  noAutoFire                    = false,
  noChaseCategory               = [[FIXEDWING LAND SINK TURRET SHIP SATELLITE SWIM GUNSHIP FLOAT SUB HOVER]],
  objectName                    = [[picketclone.dae]],
  script                        = [[chicken_picket.lua]],
  selfDestructAs                = [[SMALL_BUILDINGEX]],

  sfxtypes                      = {
  },
  sightDistance                 = 512,
  useBuildingGroundDecal        = true,
  workerTime                    = 0,
  yardMap                       = [[oooo]],

  weapons                       = {

    {
      def                = [[ARMRL_MISSILE]],
      --badTargetCategory  = [[HOVER SWIM LAND SINK FLOAT SHIP]],
      onlyTargetCategory = [[FIXEDWING LAND SINK TURRET SHIP SWIM FLOAT GUNSHIP HOVER]],
    },

  },


  weaponDefs                    = {

    ARMRL_MISSILE = {
      name                    = [[Disintegrator]],
      areaOfEffect            = 64,
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  collideGround           = false,
      craterBoost             = 0,
      craterMult              = 0,
	  cegTag                  = [[flamer]],
	  collisionSize           = 32,
	  interceptedByShieldType = 1,

      damage                  = {
        default = 50,
      },
	  
	  customParams            = {
	    setunitsonfire = "1",
	  },

      fireStarter             = 100,
      heightMod               = 1,
      impulseBoost            = 0,
      impulseFactor           = 0,
      leadLimit               = 80,
      noExplode               = true,
      noSelfDamage            = true,
      range                   = 300,
      reloadtime              = 1,
      size                    = 12,
      soundStart              = [[chickens/acid_fire]],
      soundTrigger            = true,
      tolerance               = 10000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[DGun]],
      weaponVelocity          = 750,
    },

  },


  featureDefs                   = {
  },

} }
