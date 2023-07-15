return { air_support = {
  unitname            = [[air_support]],
  name                = [[Dive Bomber]],
  description         = [[Admiral's Air Support]],
  brakerate           = 0.4,
  buildCostMetal      = 0,
  builder             = false,
  buildPic            = [[air_support.png]],
  buildTime           = 1,
  canFly              = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canSubmerge         = false,
  category            = [[FIXEDWING]],
  collide             = false,
  collisionVolumeOffsets = [[0 0 0]],
  collisionVolumeScales  = [[45 30 45]],
  collisionVolumeType    = [[cylZ]],
  corpse              = [[DEAD]],
  usePieceSelectionVolume = true,
  cruiseAlt           = 200,

  customParams        = {
    bait_level_default = 2,
    has_parent_unit = 1,
  },

  explodeAs           = [[BOMB]],
  floater             = true,
  footprintX          = 2,
  footprintZ          = 2,
  iconType            = [[scoutplane]],
  maxAcc              = 0.5,
  maxDamage           = 500,
  maxAileron          = 0.05,
  maxElevator         = 0.05,
  maxRudder           = 0.05,
  maxPitch            = 0.8,
  maxVelocity         = 13,
  mygravity           = 1,
  noAutoFire          = false,
  noChaseCategory     = [[TERRAFORM FIXEDWING SATELLITE GUNSHIP TOOFAST]],
  objectName          = [[admiralplane.dae]],
  script              = [[air_support.lua]],
  selfDestructAs      = [[BOMB]],
  kamikaze            = true,
  kamikazeDistance    = 100,
  sightDistance       = 660,
  turnRadius          = 0,
  turnRate            = 3000,
  workerTime          = 0,
  
  weapons             = {

    {
      def                = [[BOMB]],
      onlyTargetCategory = [[SWIM LAND SINK SUB TURRET FLOAT SHIP HOVER]],
    },

  },
  
  weaponDefs          = {
    BOMB = {
      name                    = [[Bomb]],
      areaOfEffect            = 300,
	  explosionSpeed          = 300,
	  edgeEffectiveness       = 1,
      avoidFeature            = false,
      avoidFriendly           = false,
      burnblow                = true,
      cegTag                  = [[raventrail]],
      collideFriendly         = false,

      customParams            = {
	    nofriendlyfire = 1,
      },

      damage                  = {
        default = 187.5,
      },

      explosionGenerator      = [[custom:high_explosive_rounds]],
      fireStarter             = 100,
      flightTime              = 3,
      interceptedByShieldType = 2,
	  reloadtime              = 10,
      model                   = [[admiralshot2.dae]],
      range                   = 300,
      reloadtime              = 1,
      smokeTrail              = false,
      soundHit                = [[dummy/shipplane]],
      tolerance               = 16000,
      tracks                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 400,
    },
  },

  featureDefs         = {
  },

} }
