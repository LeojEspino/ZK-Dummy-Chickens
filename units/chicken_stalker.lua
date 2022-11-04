return { chicken_stalker = {
  unitname            = [[chicken_stalker]],
  name                = [[Dummy Stalker]],
  description         = [[Advanced Assassin]],
  acceleration        = 1.08,
  activateWhenBuilt   = true,
  brakeRate           = 1.23,
  buildCostEnergy     = 0,
  buildCostMetal      = 200,
  builder             = false,
  buildPic            = [[stalker.png]],
  buildTime           = 200,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canCloak            = true,
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
  iconType            = [[chicken]],
  idleAutoHeal        = 20,
  idleTime            = 300,
  maxDamage           = 800,
  maxSlope            = 36,
  maxVelocity         = 2.9,
  initCloaked         = true,
  minCloakDistance    = 150,
  movementClass       = [[AKBOT2]],
  noAutoFire          = false,
  noChaseCategory     = [[SHIP FLOAT SWIM TERRAFORM FIXEDWING SATELLITE GUNSHIP]],
  objectName          = [[stalker.dae]],
  script              = [[chicken_stalker.lua]],
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
  turnRate            = 967,
  upright             = true,
  workerTime          = 0,

  weapons             = {

    {
      def                = [[WEAPON]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 120,
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER FIXEDWING GUNSHIP]],
    },
	{
      def                = [[ABILITY]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 120,
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER FIXEDWING GUNSHIP]],
    },
	{
      def                = [[ABILITY2]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 120,
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER FIXEDWING GUNSHIP]],
    },

  },


  weaponDefs          = {

    WEAPON = {
      name                    = [[Killer Blade]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,
	  turret                  = true,

      damage                  = {
        default = 200,
        planes  = 200,
      },

      explosionGenerator      = [[custom:NONE]],
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 0,
      range                   = 100,
      reloadtime              = 0.4,
      size                    = 0,
      soundStart              = [[dummy/swordswing]],
      targetborder            = 1,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 500,
    },
	ABILITY = {
	  name                    = [[Lethality Edge]],
	  explosionGenerator      = [[custom:NONE]],
	  avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  range                   = 0,
	  size                    = 0,
	  reloadtime              = 5,
      areaOfEffect            = 200,
      craterBoost             = 0,
      craterMult              = 0,
      edgeEffectiveness       = 1,
      explosionSpeed          = 10,
      soundHit                = [[dummy/stalkerswing]],
      damage = {
        default               = 200,
      },
	  customparams = {
	    nofriendlyfire = 1,
	  },
	  turret                  = true,
	  waterWeapon             = true,
      weaponType              = [[Cannon]],
	  weaponVelocity          = 100,
    },
	ABILITY2 = {
	  name                    = [[Lethality Edge (Second Swing)]],
	  explosionGenerator      = [[custom:NONE]],
	  avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  range                   = 0,
	  size                    = 0,
	  reloadtime              = 5,
      areaOfEffect            = 200,
      craterBoost             = 0,
      craterMult              = 0,
      edgeEffectiveness       = 1,
      explosionSpeed          = 10,
      damage = {
        default               = 800,
      },
	  customparams = {
	    nofriendlyfire = 1,
	  },
	  turret                  = true,
	  waterWeapon             = true,
      weaponType              = [[Cannon]],
	  weaponVelocity          = 100,
    },

  },

} }
