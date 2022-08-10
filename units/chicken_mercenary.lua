return { chicken_mercenary = {
  unitname            = [[chicken_mercenary]],
  name                = [[Dummy Mercenary]],
  description         = [[Advanced Marksman]],
  acceleration        = 1.08,
  activateWhenBuilt   = true,
  brakeRate           = 1.23,
  buildCostEnergy     = 0,
  buildCostMetal      = 200,
  builder             = false,
  buildPic            = [[gunner.png]],
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
  objectName          = [[mercenary.dae]],
  script              = [[chicken_mercenary.lua]],
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
      def                = [[WEAPON2]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 120,
      onlyTargetCategory = [[SWIM LAND SUB SINK TURRET FLOAT SHIP HOVER FIXEDWING GUNSHIP]],
    },

  },


  weaponDefs          = {

    WEAPON = {
      name                    = [[Hi Power Shot]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,
	  turret                  = true,

      damage                  = {
        default = 180,
        planes  = 180,
      },

      explosionGenerator      = [[custom:NONE]],
	  model                   = [[mercenaryshot.dae]],
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      range                   = 550,
      reloadtime              = 0.5,
      size                    = 5,
      soundStart              = [[dummy/gunshoot2]],
      targetborder            = 10,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 750,
    },
	WEAPON2 = {
      name                    = [[Hi Power Shot (Buffed)]],
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFeature          = false,
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,
	  turret                  = true,

      damage                  = {
        default = 255,
        planes  = 255,
      },

      explosionGenerator      = [[custom:NONE]],
	  model                   = [[mercenaryshot.dae]],
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      range                   = 550,
      reloadtime              = 0.5,
      size                    = 5,
      soundStart              = [[dummy/gunshoot2]],
      targetborder            = 10,
      tolerance               = 5000,
      turret                  = true,
      waterWeapon             = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 750,
    },

  },

} }
