return { cross_explosion = {
  unitname               = [[cross_explosion]],
  name                   = [[Big Bomb]],
  description            = [[Explodes after 5 seconds]],
  activateWhenBuilt      = false,
  buildCostMetal         = 0,
  builder                = false,
  buildPic               = [[cross_explosion.png]],
  canGuard               = false,
  canMove                = false,
  canPatrol              = false,
  category               = [[FLOAT MINE STUPIDTARGET]],
  cloakCost              = 0,
  collisionVolumeOffsets = [[0 0 0]],
  collisionVolumeScales  = [[40 40 40]],
  collisionVolumeType    = [[ellipsoid]],
  usePieceSelectionVolumes = true,

  customParams           = {
    mobilebuilding = [[1]],
    has_parent_unit = 1,
  },

  explodeAs              = [[NOWEAPON]],
  footprintX             = 1,
  footprintZ             = 1,
  levelGround            = false,
  iconType               = [[mine]],
  idleTime               = 300,
  initCloaked            = true,
  maxDamage              = 1000,
  maxSlope               = 255,
  maxVelocity            = 0,
  noAutoFire             = false,
  noChaseCategory        = [[FIXEDWING LAND SINK TURRET SHIP SATELLITE SWIM GUNSHIP FLOAT SUB HOVER]],
  objectName             = [[bombershot3.dae]],
  onoffable              = false,
  reclaimable            = false,
  repairable             = false, -- mostly not to waste constructor attention on area-repair; has regen anyway
  script                 = [[cross_explosion.lua]],
  selfDestructAs         = [[BOMB]],
  selfDestructCountdown  = 0,
  sightDistance          = 300,
  waterline              = 1,
  workerTime             = 0,
  yardMap                = [[y]],

  weapons                = {
    {
      def                = [[BOMB]],
    },
  },


  weaponDefs             = {

    BOMB = {
      areaOfEffect       = 600,
	  explosionSpeed     = 600,
      edgeEffectiveness  = 1,
      explosionGenerator = [[custom:cross_explosion]],
      name               = [[Cross Explosion]],
      soundHit           = [[dummy/bombbigexplode]],
      damage = {
        default          = 1000.1,
      },
	  customparams = {
	    nofriendlyfire = 1,
	  },
    },

  },

} }
