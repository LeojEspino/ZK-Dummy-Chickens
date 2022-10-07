return { chicken_grenadier = {
  unitname            = [[chicken_grenadier]],
  name                = [[Dummy Grenadier]],
  description         = [[Advanced Burst]],
  acceleration        = 1.08,
  activateWhenBuilt   = true,
  brakeRate           = 1.23,
  buildCostEnergy     = 0,
  buildCostMetal      = 200,
  builder             = false,
  buildPic            = [[grenadier.png]],
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
  iconType            = [[chicken]],
  idleAutoHeal        = 20,
  idleTime            = 300,
  maxDamage           = 1250,
  maxSlope            = 36,
  maxVelocity         = 2.5,
  movementClass       = [[AKBOT2]],
  noAutoFire          = false,
  noChaseCategory     = [[SHIP FLOAT SWIM TERRAFORM FIXEDWING SATELLITE GUNSHIP]],
  objectName          = [[grenadier.dae]],
  script              = [[chicken_grenadier.lua]],
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

  },


  weaponDefs          = {

    WEAPON = {
      name                    = [[Grenade Launcher]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  areaOfEffect            = 300,
	  turret                  = true,
	  groundBounce            = true,
	  numBounce               = 3,

      damage                  = {
        default = 100,
        planes  = 100,
      },
	  customparams = {
	    nofriendlyfire = 1,
	  },

      explosionGenerator      = [[custom:grenade_launcher]],
	  model                   = [[grenadelauncher.dae]],
      range                   = 600,
      reloadtime              = 0.6,
      soundStart              = [[dummy/grenadeshot]],
      targetborder            = 10,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 500,
	  myGravity               = 1,
    },
	ABILITY = {
      name                    = [[Gunpowder Blast]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  areaOfEffect            = 150,
	  projectiles             = 5,
	  turret                  = true,
	  groundBounce            = true,
	  numBounce               = 3,

      damage                  = {
        default = 50,
        planes  = 50,
      },
	  customparams = {
	    nofriendlyfire = 1,
	  },

      explosionGenerator      = [[custom:magic_wand]],
	  model                   = [[magicwand.dae]],
      range                   = 600,
      reloadtime              = 5.0,
      soundStart              = [[dummy/grenadeshot]],
      targetborder            = 10,
      tolerance               = 5000,
	  sprayangle              = 3800,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 500,
	  myGravity               = 1,
    },

  },

} }
