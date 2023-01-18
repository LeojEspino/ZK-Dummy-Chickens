return { chicken_raptor = {
  unitname               = [[chicken_raptor]],
  name                   = [[Dummy Raptor]],
  description            = [[Alpha Strike Fighter]],
  brakerate              = 0.4,
  buildCostMetal         = 450,
  buildPic               = [[raptorclone.png]],
  canFly                 = true,
  canGuard               = true,
  canMove                = true,
  canPatrol              = true,
  canSubmerge            = false,
  category               = [[FIXEDWING]],
  collide                = false,
  collisionVolumeOffsets = [[0 0 5]],
  collisionVolumeScales  = [[38 15 64]],
  collisionVolumeType    = [[ellipsoid]],
  selectionVolumeOffsets = [[0 0 10]],
  selectionVolumeScales  = [[60 60 80]],
  selectionVolumeType    = [[cylZ]],
  corpse                 = [[DEAD]],
  crashDrag              = 0.01,
  cruiseAlt              = 250,

  customParams           = {
    bait_level_default = 0,
    bait_level_target  = 3,

    midposoffset   = [[0 3 0]],
    aimposoffset   = [[0 3 0]],
    modelradius    = [[10]],
    refuelturnradius = [[120]],
    selection_scale = 1.4,

    outline_x = 120,
    outline_y = 120,
    outline_yoff = 20,
  },

  explodeAs              = [[GUNSHIPEX]],
  fireState              = 2,
  floater                = true,
  footprintX             = 2,
  footprintZ             = 2,
  frontToSpeed           = 0.1,
  iconType               = [[stealthfighter]],
  maxAcc                 = 0.605,
  maxAileron             = 0.02,
  maxDamage              = 750,
  maxElevator            = 0.015,
  maxRudder              = 0.008,
  maxVelocity            = 11.5,
  mygravity              = 1,
  noChaseCategory        = [[TERRAFORM LAND SINK TURRET SHIP SWIM FLOAT SUB HOVER]],
  objectName             = [[raptorclone.dae]],
  script                 = [[chicken_raptor.lua]],
  selfDestructAs         = [[GUNSHIPEX]],
  sightDistance          = 750,
  speedToFront           = 0.5,
  turnRadius             = 160,

  weapons                = {

    {
      def                = [[LASER]],
      badTargetCategory  = [[GUNSHIP]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 90,
      onlyTargetCategory = [[FIXEDWING GUNSHIP]],
    },
	{
	  def                = [[MISSILE]],
	  badTargetCategory  = [[GUNSHIP]],
	  maxAngleDif        = 90,
	  onlyTargetCategory = [[FIXEDWING GUNSHIP]],
	},

  },


  weaponDefs             = {

    LASER = {
      name                    = [[Anti-Air Laser Battery]],
      areaOfEffect            = 12,
      avoidFriendly           = false,
      beamDecay               = 0.736,
      beamTime                = 1/30,
      beamttl                 = 15,
      canattackground         = false,
      canAttackGround         = 0,
      collideFriendly         = false,
      coreThickness           = 0.5,
      craterBoost             = 0,
      craterMult              = 0,
      cylinderTargeting       = 1,

      customParams            = {
        isaa = [[1]],
      },

      damage                  = {
        default = 12.5,
        planes  = 12.5,
      },

      explosionGenerator      = [[custom:flash_teal7]],
      fireStarter             = 100,
      impactOnly              = true,
      impulseFactor           = 0,
      interceptedByShieldType = 1,
      laserFlareSize          = 2.9,
      minIntensity            = 1,
      range                   = 750,
      reloadtime              = 0.2,
      rgbColor                = [[1 0 0]],
      soundStart              = [[weapon/laser/small_laser_fire4]],
      thickness               = 1.95,
      tolerance               = 8192,
      turret                  = true,
      weaponType              = [[BeamLaser]],
      weaponVelocity          = 2200,
    },
	
	MISSILE = {
      name                    = [[Heavy Missile]],
      areaOfEffect            = 128,
      avoidFriendly           = true,
      canattackground         = false,
      cegTag                  = [[turretaaheavytrail]],
      collideFriendly         = false,
      craterBoost             = 1,
      craterMult              = 2,
      cylinderTargeting       = 6,

      customParams              = {
        burst = Shared.BURST_RELIABLE,

        isaa = [[1]],
        light_color = [[0.5 0.6 0.6]],
      },

      damage                  = {
        default = 50.1,
        planes  = 500.1,
      },

      explosionGenerator      = [[custom:WEAPEXP_PUFF]],
      fireStarter             = 70,
      flightTime              = 3,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 2,
      metalpershot            = 0,
      model                   = [[raptorcloneshot.dae]],
      noSelfDamage            = true,
      range                   = 1000,
      reloadtime              = 15,
      smokeTrail              = true,
      soundHit                = [[weapon/missile/heavy_aa_hit]],
      soundStart              = [[weapon/missile/heavy_aa_fire2]],
      startVelocity           = -1600,
      texture1                = [[flarescale01]],
      texture2                = [[AAsmoketrail]],
      tolerance               = 22000,
      tracks                  = true,
      turnRate                = 60000,
      weaponAcceleration      = 1600,
      weaponType              = [[MissileLauncher]],
      weaponVelocity          = 1600,
    },

  },


  featureDefs            = {

    DEAD = {
      blocking         = true,
      featureDead      = [[HEAP]],
      footprintX       = 2,
      footprintZ       = 2,
      collisionVolumeOffsets = [[0 0 5]],
      collisionVolumeScales  = [[35 15 45]],
      collisionVolumeType    = [[box]],
      object           = [[fighter2_dead.s3o]],
    },


    HEAP = {
      blocking         = false,
      footprintX       = 2,
      footprintZ       = 2,
      object           = [[debris2x2b.s3o]],
    },

  },

} }
