return { chicken_aegis = {
  unitname                      = [[chicken_aegis]],
  name                          = [[Dummy Aegis]],
  description                   = [[Area Armor Field]],
  activateWhenBuilt             = true,
  buildCostMetal                = 1250,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 4,
  buildingGroundDecalSizeY      = 4,
  buildingGroundDecalType       = [[staticshield_aoplane.dds]],
  buildPic                      = [[aegisclone.png]],
  canMove                       = true, -- for queuing orders during morph to mobile
  category                      = [[SINK UNARMED]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[34 59 34]],
  collisionVolumeType           = [[box]],
  corpse                        = [[DEAD]],
  explodeAs                     = [[BIG_UNITEX]],
  floater                       = true,
  footprintX                    = 2,
  footprintZ                    = 2,
  iconType                      = [[defenseshield]],
  levelGround                   = false,
  maxDamage                     = 1700,
  maxSlope                      = 36,
  maxVelocity                   = 0,
  noAutoFire                    = false,
  objectName                    = [[aegisclone.dae]],
  onoffable                     = true,
  script                        = [[chicken_aegis.lua]],
  selfDestructAs                = [[BIG_UNITEX]],
  sightDistance                 = 200,
  useBuildingGroundDecal        = true,
  workerTime                    = 0,
  yardMap                       = [[oooo]],

  customParams        = {
    removewait     = 1,

    morphto = [[chicken_aspis]],
    morphtime = [[30]],

    priority_misc = 1, -- Medium
    unarmed       = true,
    addfight       = 1,
    addpatrol      = 1,
  },
  
  weapons                = {

    {
      def = [[BLAST]],
    },

  },

  weaponDefs             = {

    BLAST    = {
      name                    = [[Armor Field]],
      areaOfEffect            = 750,
      craterBoost             = 0,
      craterMult              = 0,
	  edgeEffectiveness       = 1,

      damage                  = {
        default = 1,
      },
	  
      customParams           = {
	    grants_armor = 0.33,
		armor_duration = 12,
		needsCaching = 1,
		noScaling = 1,
		noStacking = 1,
		lups_noshockwave = [[1]],
      },
	  
      explosionGenerator      = [[custom:armorfield2]],
      explosionSpeed          = 7.5,
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


  featureDefs                   = {
  },

} }
