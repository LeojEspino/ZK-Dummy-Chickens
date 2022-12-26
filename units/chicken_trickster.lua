return { chicken_trickster = {
  unitname            = [[chicken_trickster]],
  name                = [[Dummy Trickster]],
  description         = [[Elite Assassin]],
  acceleration        = 1.08,
  activateWhenBuilt   = true,
  brakeRate           = 1.23,
  buildCostEnergy     = 0,
  buildCostMetal      = 900,
  builder             = false,
  buildPic            = [[trickster.png]],
  buildTime           = 900,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canCloak            = true,
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
  iconType            = [[c_trickster]],
  idleAutoHeal        = 20,
  idleTime            = 300,
  maxDamage           = 1900,
  maxSlope            = 36,
  maxVelocity         = 3.0,
  initCloaked         = true,
  minCloakDistance    = 200,
  movementClass       = [[AKBOT2]],
  noAutoFire          = false,
  noChaseCategory     = [[SHIP FLOAT SWIM TERRAFORM FIXEDWING SATELLITE GUNSHIP]],
  objectName          = [[trickster.dae]],
  script              = [[chicken_trickster.lua]],
  power               = 100,
  reclaimable         = false,
  selfDestructAs      = [[NOWEAPON]],

  sfxtypes            = {

    explosiongenerators = {
	  [[custom:vanishing_act]],
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

  },


  weaponDefs          = {

    LMB1 = {
      name                    = [[Lethal Knife]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,
	  turret                  = true,

      damage                  = {
        default = 150,
      },

      explosionGenerator      = [[custom:NONE]],
	  model                   = [[trickstershot.dae]],
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      range                   = 350,
      reloadtime              = 0.3,
      size                    = 5,
      soundStart              = [[dummy/knifethrow]],
      targetborder            = 10,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 750,
    },
	AB1 = {
      name                    = [[Knife Party]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  projectiles             = 3,
	  burst                   = 2,
	  burstrate               = 0.2,
      craterBoost             = 0,
      craterMult              = 0,
	  turret                  = true,

      damage                  = {
        default = 150,
      },

      explosionGenerator      = [[custom:NONE]],
	  model                   = [[trickstershot.dae]],
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      range                   = 350,
      reloadtime              = 1,
      size                    = 5,
      soundStart              = [[dummy/knifedouble]],
	  soundTrigger            = true,
      targetborder            = 10,
      tolerance               = 5000,
	  sprayangle              = 1600,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 750,
    },
  },

} }
