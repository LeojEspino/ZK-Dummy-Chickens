return {
    ["magic_wand"] = {
        usedefaultexplosions = false,
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater         = true,
            properties = {
                alpha              = 0.9, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.3, 0.1, 0.8]], -- change color here. RGBA
                expansionspeed     = 5, -- how fast it expands
                ttl                = 10, -- how long it lives
            },
        },
    },
	["dauntless_spirit"] = {
        usedefaultexplosions = false,
		groundflash = {
            alwaysvisible      = true,
            circlealpha        = 1,
            circlegrowth       = 40,
            flashalpha         = 1,
            flashsize          = 10,
            ttl                = 10,
            color              = [[0.0, 0.5, 0.8]],
        },
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater         = true,
            properties = {
                alpha              = 1, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.0, 0.5, 0.8]], -- change color here. RGBA
                expansionspeed     = 20, -- how fast it expands
                ttl                = 10, -- how long it lives
            },
        },
    },
	["brutal_swing"] = {
        usedefaultexplosions = false,
		groundflash = {
            alwaysvisible      = true,
            circlealpha        = 0.5,
            circlegrowth       = 20,
            flashalpha         = 0.5,
            flashsize          = 5,
            ttl                = 10,
            color              = [[1.0, 1.0, 1.0]],
        },
    },
	["wrecking_ball"] = {
        usedefaultexplosions = false,
		groundflash = {
            alwaysvisible      = true,
            circlealpha        = 1,
            circlegrowth       = 10,
            flashalpha         = 1,
            flashsize          = 5,
            ttl                = 20,
            color              = [[0.0, 1.0, 0.0]],
        },
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater         = true,
            properties = {
                alpha              = 1, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.0, 1.0, 0.0]], -- change color here. RGBA
                expansionspeed     = 5, -- how fast it expands
                ttl                = 20, -- how long it lives
            },
        },
    },
	["grenade_launcher"] = {
        usedefaultexplosions = false,
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater         = true,
            properties = {
                alpha              = 0.9, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.3, 0.1, 0.8]], -- change color here. RGBA
                expansionspeed     = 15, -- how fast it expands
                ttl                = 10, -- how long it lives
            },
        },
    },
	["gunpowder_blast"] = {
        usedefaultexplosions = false,
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater         = true,
            properties = {
                alpha              = 0.9, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.3, 0.1, 0.8]], -- change color here. RGBA
                expansionspeed     = 7.5, -- how fast it expands
                ttl                = 10, -- how long it lives
            },
        },
    },
	["lethality_edge"] = {
        usedefaultexplosions = false,
		groundflash = {
            alwaysvisible      = true,
            circlealpha        = 0.5,
            circlegrowth       = 20,
            flashalpha         = 0.5,
            flashsize          = 5,
            ttl                = 5,
            color              = [[1.0, 1.0, 1.0]],
        },
    },
	["turret_disruption_bomb"] = {
		usedefaultexplosions = false,
		groundflash = {
			alwaysvisible      = true,
			circlealpha        = 0.4,
			circlegrowth       = 4.5,
			flashalpha         = 0.5,
			flashsize          = 160,
			ttl                = 64,
			color = {
				[1]  = 1,
				[2]  = 0,
				[3]  = 1,
			},
		},
		sphere = {
			air                = true,
			class              = [[CSpherePartSpawner]],
			count              = 1,
			ground             = true,
			water              = true,
			underwater         = true,
			properties = {
				alpha              = 0.5,
				color              = [[1,0,1]],
				expansionspeed     = 3,
				ttl                = 45,
			},
		},
	},
	["gunlance_stab"] = {
        usedefaultexplosions = false,
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater         = true,
            properties = {
                alpha              = 0.9, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.8, 0.5, 0.2]], -- change color here. RGBA
                expansionspeed     = 5, -- how fast it expands
                ttl                = 10, -- how long it lives
            },
        },
    },
	["shellshock"] = {
        usedefaultexplosions = false,
		groundflash = {
            alwaysvisible      = true,
            circlealpha        = 0.5,
            circlegrowth       = 20,
            flashalpha         = 0.5,
            flashsize          = 5,
            ttl                = 10,
            color              = [[1.0, 1.0, 1.0]],
        },
    },
	["wyvern_blast"] = {
        usedefaultexplosions = false,
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater         = true,
            properties = {
                alpha              = 0.9, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.8, 0.5, 0.2]], -- change color here. RGBA
                expansionspeed     = 10, -- how fast it expands
                ttl                = 10, -- how long it lives
            },
        },
    },
	["sniper_rifle"] = {
        usedefaultexplosions = false,
		groundflash = {
            alwaysvisible      = true,
            circlealpha        = 1,
            circlegrowth       = 10,
            flashalpha         = 1,
            flashsize          = 10,
            ttl                = 5,
            color              = [[0.0, 0.5, 0.8]],
        },
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater         = true,
            properties = {
                alpha              = 1, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.0, 0.5, 0.8]], -- change color here. RGBA
                expansionspeed     = 5, -- how fast it expands
                ttl                = 5, -- how long it lives
            },
        },
    },
	["headhunter"] = {
        usedefaultexplosions = false,
		groundflash = {
            alwaysvisible      = true,
            circlealpha        = 1,
            circlegrowth       = 30,
            flashalpha         = 1,
            flashsize          = 10,
            ttl                = 5,
            color              = [[0.0, 0.5, 0.8]],
        },
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater         = true,
            properties = {
                alpha              = 1, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.0, 0.5, 0.8]], -- change color here. RGBA
                expansionspeed     = 15, -- how fast it expands
                ttl                = 5, -- how long it lives
            },
        },
    },
	["vanishing_act"] = {
        usedefaultexplosions = false,
		groundflash = {
            alwaysvisible      = true,
            circlealpha        = 0.5,
            circlegrowth       = 15,
            flashalpha         = 0,
            flashsize          = 5,
            ttl                = 5,
            color              = [[1.0, 1.0, 1.0]],
        },
    },
	["bouncing_bomb"] = {
        usedefaultexplosions = false,
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater         = true,
            properties = {
                alpha              = 0.9, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.3, 0.1, 0.8]], -- change color here. RGBA
                expansionspeed     = 10, -- how fast it expands
                ttl                = 10, -- how long it lives
            },
        },
    },
	["cross_explosion"] = {
        usedefaultexplosions = false,
		groundflash = {
            alwaysvisible      = true,
            circlealpha        = 1,
            circlegrowth       = 40,
            flashalpha         = 1,
            flashsize          = 10,
            ttl                = 10,
            color              = [[0.0, 0.5, 0.8]],
        },
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater         = true,
            properties = {
                alpha              = 1, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.3, 0.1, 0.8]], -- change color here. RGBA
                expansionspeed     = 10, -- how fast it expands
                ttl                = 30, -- how long it lives
            },
        },
    },
	["high_explosive_rounds"] = {
        usedefaultexplosions = false,
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater         = true,
            properties = {
                alpha              = 0.9, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.0, 1.0, 0.0]], -- change color here. RGBA
                expansionspeed     = 10, -- how fast it expands
                ttl                = 10, -- how long it lives
            },
        },
    },
	["armorfield1"] = {
        usedefaultexplosions = false, -- TODO: Remove groundflashes and replace with dynlighting
		groundflash = {
			alwaysvisible      = false,
			circlealpha        = 0.1,
			circlegrowth       = 3.6,
			flashalpha         = 0.1,
			flashsize          = 600,
			ttl                = 90,
			color = {
				[1]  = 0.41960784,
				[2]  = 0.73333333,
				[3]  = 0.89019608,
			},
		},
		ring1 = {
			air                = true,
			useAirLos 		   = true,
			class              = [[CBitmapMuzzleFlame]],
			ground             = true,
			water              = true,
			unit               = true,
			count              = 1,
			properties = {
				colormap           = [[0.41960784 0.73333333 0.89019608 0.1   0.443137 0.6 0.851 .2    0.2784313 0.3568627 0.4784313 0.1   0 0 0 0]],
				dir                = [[-0.01 r0.01, 1, -0.01 r0.01]],
				frontoffset        = 0,
				fronttexture       = [[shockwave]],
				sidetexture        = [[null]],
				length             = 1,
				pos                = [[0, 0, 0]],
				size               = 1,
				sizegrowth         = 300,
				ttl                = 30,
			},
		},
    },
	["armorfield2"] = {
        usedefaultexplosions = false, -- TODO: Remove groundflashes and replace with dynlighting
		groundflash = {
			alwaysvisible      = false,
			circlealpha        = 0.1,
			circlegrowth       = 3.6,
			flashalpha         = 0.1,
			flashsize          = 600,
			ttl                = 90,
			color = {
				[1]  = 0.41960784,
				[2]  = 0.73333333,
				[3]  = 0.89019608,
			},
		},
		ring1 = {
			air                = true,
			useAirLos 		   = true,
			class              = [[CBitmapMuzzleFlame]],
			ground             = true,
			water              = true,
			unit               = true,
			count              = 1,
			properties = {
				colormap           = [[0.41960784 0.73333333 0.89019608 0.1   0.443137 0.6 0.851 .2    0.2784313 0.3568627 0.4784313 0.1   0 0 0 0]],
				dir                = [[-0.01 r0.01, 1, -0.01 r0.01]],
				frontoffset        = 0,
				fronttexture       = [[shockwave]],
				sidetexture        = [[null]],
				length             = 1,
				pos                = [[0, 0, 0]],
				size               = 1,
				sizegrowth         = 375,
				ttl                = 30,
			},
		},
    },
}