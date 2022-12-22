return { chicken_juggernaut = {
  unitname            = [[chicken_juggernaut]],
  name                = [[Dummy Juggernaut]],
  description         = [[Advanced Tank]],
  acceleration        = 1.08,
  activateWhenBuilt   = true,
  brakeRate           = 1.23,
  buildCostEnergy     = 0,
  buildCostMetal      = 200,
  builder             = false,
  buildPic            = [[juggernaut.png]],
  buildTime           = 200,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  category            = [[LAND SINK SMALL]],
  collisionVolumeScales  = [[36 56 36]],
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
  iconType            = [[c_juggernaut]],
  idleAutoHeal        = 20,
  idleTime            = 300,
  maxDamage           = 2650,
  maxSlope            = 36,
  maxVelocity         = 2.0,
  movementClass       = [[AKBOT2]],
  noAutoFire          = false,
  noChaseCategory     = [[SHIP FLOAT SWIM TERRAFORM FIXEDWING SATELLITE GUNSHIP]],
  objectName          = [[juggernaut.dae]],
  script              = [[chicken_juggernaut.lua]],
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
  sightDistance       = 1024,
  sonarDistance       = 1024,
  turnRate            = 3000,
  upright             = true,
  workerTime          = 0,

  weapons             = {

    {
      def                = [[WEAPON]],
      mainDir            = [[0 0 1]],
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER FIXEDWING GUNSHIP]],
    },
	{
      def                = [[ABILITY]],
      mainDir            = [[0 0 1]],
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER FIXEDWING GUNSHIP]],
    },

  },


  weaponDefs          = {

    WEAPON = {
      name                    = [[Morning Star]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,
	  turret                  = true,

      damage                  = {
        default = 300,
        planes  = 300,
      },

      explosionGenerator      = [[custom:NONE]],
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 0,
      range                   = 150,
      reloadtime              = 1,
      size                    = 0,
      soundStart              = [[dummy/heavyswing]],
      targetborder            = 1,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 500,
    },
	ABILITY = {
	  name                    = [[Wrecking Ball]],
	  explosionGenerator      = [[custom:wrecking_ball]],
	  avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  range                   = 0,
	  size                    = 0,
	  reloadtime              = 5,
      areaOfEffect            = 200,
      craterBoost             = 0,
      craterMult              = 1,
      explosionSpeed          = 10,
      soundHit                = [[dummy/macethunk]],
      damage = {
        default               = 600,
      },
	  customparams = {
	    nofriendlyfire = 1,
		extra_damage = 1200,
	  },
	  turret                  = true,
	  waterWeapon             = true,
      weaponType              = [[Cannon]],
	  weaponVelocity          = 100,
	  myGravity               = 10,
	  paralyzeTime            = 1,
    },
  },

} }
