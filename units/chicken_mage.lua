return { chicken_mage = {
  unitname            = [[chicken_mage]],
  name                = [[Dummy Mage]],
  description         = [[Basic Burst]],
  acceleration        = 1.08,
  activateWhenBuilt   = true,
  brakeRate           = 1.23,
  buildCostEnergy     = 0,
  buildCostMetal      = 100,
  builder             = false,
  buildPic            = [[mage.png]],
  buildTime           = 100,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  category            = [[LAND SINK SMALL]],
  collisionVolumeScales  = [[27 42 27]],
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
  iconType            = [[c_mage]],
  idleAutoHeal        = 20,
  idleTime            = 300,
  maxDamage           = 400,
  maxSlope            = 36,
  maxVelocity         = 2.0,
  movementClass       = [[AKBOT2]],
  noAutoFire          = false,
  noChaseCategory     = [[SHIP FLOAT SWIM TERRAFORM FIXEDWING SATELLITE GUNSHIP]],
  objectName          = [[mage.dae]],
  script              = [[chicken_mage.lua]],
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
  sightDistance       = 512,
  sonarDistance       = 512,
  turnRate            = 3000,
  upright             = true,
  workerTime          = 0,

  weapons             = {

    {
      def                = [[WEAPON]],
      mainDir            = [[0 0 1]],
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER FIXEDWING GUNSHIP]],
    },

  },


  weaponDefs          = {

    WEAPON = {
      name                    = [[Magic Wand]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
	  areaOfEffect            = 100,
	  turret                  = true,

      damage                  = {
        default = 50,
      },
      customparams = {
	    nofriendlyfire = 1,
      },

      explosionGenerator      = [[custom:magic_wand]],
	  model                   = [[magicwand.dae]],
      range                   = 350,
      reloadtime              = 0.5,
      soundStart              = [[dummy/magicshot]],
      targetborder            = 10,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 500,
    },

  },

} }
