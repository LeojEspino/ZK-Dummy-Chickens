return { chicken_aspis = {
  unitname               = [[chicken_aspis]],
  name                   = [[Dummy Aspis]],
  description            = [[Armor Field Walker]],
  acceleration           = 0.75,
  activateWhenBuilt      = true,
  brakeRate              = 4.5,
  buildCostMetal         = 1500,
  buildPic               = [[aspisclone.png]],
  canGuard               = true,
  canMove                = true,
  canPatrol              = true,
  category               = [[LAND UNARMED]],
  collisionVolumeOffsets = [[0 0 0]],
  collisionVolumeScales  = [[34 49 29]],
  collisionVolumeType    = [[box]],
  corpse                 = [[DEAD]],

  customParams           = {
    modelradius    = [[18]],
    
	 morphto = [[chicken_aegis]],
    morphtime = 30,
    priority_misc = 1, -- Medium

    outline_x = 80,
    outline_y = 80,
    outline_yoff = 12.5,
	extradrawrange = 300,
  },

  explodeAs              = [[BIG_UNITEX]],
  footprintX             = 2,
  footprintZ             = 2,
  iconType               = [[walkershield]],
  leaveTracks            = true,
  maxDamage              = 1300,
  maxSlope               = 36,
  maxVelocity            = 1.8,
  maxWaterDepth          = 5000,
  movementClass          = [[AKBOT2]],
  moveState              = 0,
  objectName             = [[aspisclone.dae]],
  onoffable              = true,
  pushResistant          = 0,
  script                 = [[chicken_aspis.lua]],
  selfDestructAs         = [[BIG_UNITEX]],
  sightDistance          = 300,
  trackOffset            = 0,
  trackStrength          = 8,
  trackStretch           = 1,
  trackType              = [[ChickenTrackPointy]],
  trackWidth             = 30,
  turnRate               = 2520,
  upright                = false,

  weapons                = {

    {
      def = [[BLAST]],
    },

  },

  weaponDefs             = {

    BLAST    = {
      name                    = [[Armor Field]],
      areaOfEffect            = 600,
      craterBoost             = 0,
      craterMult              = 0,
	  edgeEffectiveness       = 1,

      damage                  = {
        default = 1,
      },
	  
      customParams           = {
	    grants_armor = 0.33,
		armor_duration = 8,
		needsCaching = 1,
		noScaling = 1,
		noStacking = 1,
		lups_noshockwave = [[1]],
      },
	  
      explosionGenerator      = [[custom:armorfield1]],
      explosionSpeed          = 6,
      impulseBoost            = 0,
      impulseFactor           = 0,
      interceptedByShieldType = 1,
      myGravity               = 10,
      noSelfDamage            = true,
      range                   = 0,
      reloadtime              = 2,
      soundHitVolume          = 1,
      turret                  = true,
      weaponType              = [[Cannon]],
      weaponVelocity          = 230,
    },

  },

  featureDefs            = {
  },

} }
