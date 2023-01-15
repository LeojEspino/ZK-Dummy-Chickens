return { chicken_bomber = {
  unitname            = [[chicken_bomber]],
  name                = [[Dummy Bomber]],
  description         = [[Elite Burst]],
  acceleration        = 1.08,
  activateWhenBuilt   = true,
  brakeRate           = 1.23,
  buildCostEnergy     = 0,
  buildCostMetal      = 900,
  builder             = false,
  buildPic            = [[bomber.png]],
  buildTime           = 900,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  category            = [[LAND SINK SMALL]],
  collisionVolumeScales  = [[45 70 45]],
  collisionVolumeType    = [[cylY]],
  usePieceSelectionVolumes = true,

  customParams        = {
    outline_x = 70,
    outline_y = 70,
    outline_yoff = 15,
  },

  explodeAs           = [[NOWEAPON]],
  footprintX          = 2,
  footprintZ          = 2,
  iconType            = [[c_bomber]],
  idleAutoHeal        = 20,
  idleTime            = 300,
  maxDamage           = 2750,
  maxSlope            = 36,
  maxVelocity         = 1.5,
  movementClass       = [[AKBOT2]],
  noAutoFire          = false,
  noChaseCategory     = [[SHIP FLOAT SWIM TERRAFORM FIXEDWING SATELLITE GUNSHIP]],
  objectName          = [[bomber.dae]],
  script              = [[chicken_bomber.lua]],
  power               = 100,
  reclaimable         = false,
  selfDestructAs      = [[NOWEAPON]],

  sfxtypes            = {

    explosiongenerators = {
    },

  },
  sightDistance       = 660,
  sonarDistance       = 660,
  turnRate            = 3000,
  upright             = true,
  workerTime          = 0,

  weapons             = {

    {
      def                = [[LMB1]],
      mainDir            = [[0 0 1]],
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER]],
    },
	{
      def                = [[AB1]],
      mainDir            = [[0 0 1]],
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER]],
    },
	{
      def                = [[CRT]],
      mainDir            = [[0 0 1]],
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER]],
    },

  },


  weaponDefs          = {

    LMB1 = {
      name                    = [[Bouncing Bomb]],
      avoidFeature            = false,
	  avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  areaOfEffect            = 200,
	  edgeEffectiveness       = 1,
	  turret                  = true,
	  groundBounce            = true,
	  numBounce               = 3,

      damage                  = {
        default = 75,
      },
	  
	  customparams = {
	    nofriendlyfire = 1,
	  },

      explosionGenerator      = [[custom:bouncing_bomb]],
	  model                   = [[bombershot1.dae]],
      range                   = 400,
      reloadtime              = 0.6,
      soundStart              = [[dummy/knifethrow]],
      targetborder            = 10,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 500,
    },
	AB1 = {
      name                    = [[Remote Detonation]],
      avoidFeature            = false,
	  avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  turret                  = true,
	  impactOnly              = true,
	  interceptedByShieldType = 0,
	  accuracy                = 1000,

      damage                  = {
        default = 20,
        planes  = 20,
      },
	  customparams = {
	    nofriendlyfire = 1,
		spawns_name = "remote_detonation",
        spawns_expire = 60,
	  },

	  model                   = [[bombershot2.dae]],
      range                   = 400,
      reloadtime              = 5,
	  soundStart              = [[dummy/knifethrow]],
      targetborder            = 10,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 500,
    },
	CRT = {
      name                    = [[Cross Explosion]],
      avoidFeature            = false,
	  avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,	  
	  turret                  = true,
	  impactOnly              = true,
	  interceptedByShieldType = 0,
	  accuracy                = 1000,

      damage                  = {
        default = 20,
        planes  = 20,
      },
	  customparams = {
	    nofriendlyfire = 1,
		spawns_name = "cross_explosion",
        spawns_expire = 60,
	  },

	  model                   = [[bombershot3.dae]],
      range                   = 400,
      reloadtime              = 6,
	  soundStart              = [[dummy/knifethrow]],
      targetborder            = 10,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 500,
    },
  },

} }
