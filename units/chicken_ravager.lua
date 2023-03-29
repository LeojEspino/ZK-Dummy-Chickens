return { chicken_ravager = {
  unitname            = [[chicken_ravager]],
  name                = [[Dummy Ravager]],
  description         = [[Elite Brawler]],
  acceleration        = 1.08,
  activateWhenBuilt   = true,
  brakeRate           = 1.23,
  buildCostEnergy     = 0,
  buildCostMetal      = 1200,
  builder             = false,
  buildPic            = [[ravager.png]],
  buildTime           = 1200,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  category            = [[LAND SINK SMALL]],
  collisionVolumeScales  = [[45 70 45]],
  collisionVolumeType    = [[cylY]],
  usePieceSelectionVolumes = true,

  customParams        = {
    extradrawrange = 400,
    outline_x = 70,
    outline_y = 70,
    outline_yoff = 15,
  },

  damageModifier      = 0.33,
  explodeAs           = [[NOWEAPON]],
  footprintX          = 2,
  footprintZ          = 2,
  iconType            = [[c_ravager]],
  idleAutoHeal        = 20,
  idleTime            = 300,
  maxDamage           = 3600,
  maxSlope            = 36,
  maxVelocity         = 90/52.5,
  movementClass       = [[AKBOT2]],
  noAutoFire          = false,
  noChaseCategory     = [[SHIP FLOAT SWIM TERRAFORM FIXEDWING SATELLITE GUNSHIP]],
  objectName          = [[ravager.dae]],
  script              = [[chicken_ravager.lua]],
  power               = 100,
  reclaimable         = false,
  selfDestructAs      = [[NOWEAPON]],

  sfxtypes            = {

    explosiongenerators = {
      [[custom:blood_spray]],
      [[custom:blood_explode]],
      [[custom:dirt]],
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
      def                = [[LMB2]],
      mainDir            = [[0 0 1]],
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER]],
    },
	{
      def                = [[LMB3]],
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
      name                    = [[Gunlance Stab]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,
	  turret                  = true,
	  burst                   = 2,
	  areaOfEffect            = 100,
	  edgeEffectiveness       = 1,

      damage                  = {
        default = 87.5,
        planes  = 87.5,
      },
	  
	  customparams = {
	    nofriendlyfire = 1,
	  },
      
	  noSelfDamage            = true,
      explosionGenerator      = [[custom:gunlance_stab]],
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 0,
      range                   = 150,
      reloadtime              = 0.5,
      size                    = 0,
      soundStart              = [[dummy/gunlancejab]],
	  soundTrigger            = true,
      targetborder            = 1,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 1000,
    },
	LMB2 = {
	  name                    = [[Shellshock]],
	  explosionGenerator      = [[custom:NONE]],
	  avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  burst                   = 3,
	  range                   = 0,
	  size                    = 0,
      areaOfEffect            = 300,
      craterBoost             = 0,
      craterMult              = 0,
      edgeEffectiveness       = 1,
      explosionSpeed          = 20,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      damage = {
        default               = 75,
      },
	  customparams = {
	    nofriendlyfire = 1,
	  },
	  turret                  = true,
	  waterWeapon             = true,
      weaponType              = [[Cannon]],
	  weaponVelocity          = 100,
    },
	LMB3 = {
      name                    = [[Wyvern Fire]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,
	  turret                  = true,

      damage                  = {
        default = 75,
        planes  = 75,
      },

      explosionGenerator      = [[custom:NONE]],
	  model                   = [[ravagershot.dae]],
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      range                   = 400,
      reloadtime              = 0.5,
      size                    = 5,
      soundStart              = [[dummy/gunlanceshot]],
      targetborder            = 10,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 500,
    },
	CRT = {
	  name                    = [[Wyvern Blast]],
	  explosionGenerator      = [[custom:wyvern_blast]],
	  avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  burst                   = 6,
	  range                   = 0,
	  reloadtime              = 7,
	  size                    = 0,
      areaOfEffect            = 200,
      craterBoost             = 0,
      craterMult              = 0,
      edgeEffectiveness       = 1,
      explosionSpeed          = 20,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      damage = {
        default               = 125,
      },
	  customparams = {
	    nofriendlyfire = 1,
		timeslow_damagefactor = 1,
	  },
	  turret                  = true,
	  waterWeapon             = true,
      weaponType              = [[Cannon]],
	  weaponVelocity          = -500,
    },

  },

} }
