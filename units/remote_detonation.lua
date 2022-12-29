return { remote_detonation = {
  unitname               = [[remote_detonation]],
  name                   = [[Square Bomb]],
  description            = [[Proximity Mine]],
  activateWhenBuilt      = false,
  buildCostMetal         = 0,
  builder                = false,
  buildPic               = [[remote_detonation.png]],
  canGuard               = false,
  canMove                = false,
  canPatrol              = false,
  category               = [[FLOAT MINE STUPIDTARGET]],
  cloakCost              = 0,
  collisionVolumeOffsets = [[0 0 0]],
  collisionVolumeScales  = [[30 30 30]],
  collisionVolumeType    = [[ellipsoid]],
  usePieceSelectionVolumes = true,

  customParams           = {
    bait_level_default = 0,
    bait_level_target  = 1, -- Just for safety.
    dontcount = [[1]],
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
  maxDamage              = 250,
  maxSlope               = 255,
  maxVelocity            = 0,
  noAutoFire             = false,
  noChaseCategory        = [[FIXEDWING LAND SINK TURRET SHIP SATELLITE SWIM GUNSHIP FLOAT SUB HOVER]],
  objectName             = [[bombershot2.dae]],
  onoffable              = false,
  reclaimable            = false,
  repairable             = false, -- mostly not to waste constructor attention on area-repair; has regen anyway
  script                 = [[remote_detonation.lua]],
  selfDestructAs         = [[BOMB]],
  selfDestructCountdown  = 0,
  kamikaze               = true,
  kamikazeDistance       = 150,
  sightDistance          = 150,
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
      areaOfEffect       = 300,
	  explosionSpeed     = 300,
      edgeEffectiveness  = 1,
      explosionGenerator = [[custom:grenade_launcher]],
      name               = [[Remote Detonation]],
      soundHit           = [[dummy/bombexplode]],
      damage = {
        default          = 250.1,
      },
	  customparams = {
	    nofriendlyfire = 1,
	  },
    },

  },

} }
