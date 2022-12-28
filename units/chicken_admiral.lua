return { chicken_admiral = {
  unitname            = [[chicken_admiral]],
  name                = [[Dummy Admiral]],
  description         = [[Elite Tank]],
  acceleration        = 1.08,
  activateWhenBuilt   = true,
  brakeRate           = 1.23,
  buildCostEnergy     = 0,
  buildCostMetal      = 900,
  builder             = false,
  buildPic            = [[admiral.png]],
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
  iconType            = [[c_admiral]],
  idleAutoHeal        = 20,
  idleTime            = 300,
  maxDamage           = 3450,
  maxSlope            = 36,
  maxVelocity         = 2.5,
  movementClass       = [[AKBOT2]],
  noAutoFire          = false,
  noChaseCategory     = [[SHIP FLOAT SWIM TERRAFORM FIXEDWING SATELLITE GUNSHIP]],
  objectName          = [[admiral.dae]],
  script              = [[chicken_admiral.lua]],
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
      def                = [[CRT]],
      mainDir            = [[0 0 1]],
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER]],
    },
    {
      def                = [[ATK]],
      mainDir            = [[0 0 1]],
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER FIXEDWING GUNSHIP]],
    },
	{
      def                = [[ATK]],
      mainDir            = [[0 0 1]],
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER FIXEDWING GUNSHIP]],
    },
	{
      def                = [[AB1]],
      mainDir            = [[0 0 1]],
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER FIXEDWING GUNSHIP]],
    },

  },


  weaponDefs          = {

    ATK = {
      name                    = [[Primary Cannons]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  burst                   = 2,
	  burstRate               = 0.2,
      craterBoost             = 0,
      craterMult              = 0,
	  turret                  = true,

      damage                  = {
        default = 120,
      },

      explosionGenerator      = [[custom:NONE]],
	  model                   = [[admiralshot1.dae]],
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      range                   = 700,
      reloadtime              = 1,
      size                    = 5,
      soundStart              = [[dummy/shipdualshot]],
	  soundTrigger            = true,
      targetborder            = 10,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 500,
    },
	AB1 = {
      name                    = [[Air Support]],
      avoidFeature            = false,
	  avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,	  
	  turret                  = true,
	  interceptedByShieldType = 0,
	  
	  damage                  = {
        default = 20,
      },
	  customparams = {
		spawns_name = "air_support",
        spawns_expire = 60,
	  },

	  model                   = [[admiralplane.dae]],
      targetborder            = 10,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
    },
	CRT = {
      name                    = [[High Explosive Rounds]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  areaOfEffect            = 200,
	  projectiles             = 4,
	  turret                  = true,
	  
	  customParams            = {
	    nofriendlyfire = 1,
      },

      damage                  = {
        default = 150,
      },

      explosionGenerator      = [[custom:high_explosive_rounds]],
	  model                   = [[admiralshot2.dae]],
      range                   = 1200,
      reloadtime              = 4,
      size                    = 5,
      soundStart              = [[dummy/shipartilleryshot]],
	  soundTrigger            = true,
      targetborder            = 10,
      tolerance               = 5000,
	  sprayangle              = 1600,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 1000,
	  myGravity               = 1,
    },
  },

} }
