return {
    ["magic_wand"] = {
        usedefaultexplosions = false,
        sphere = {
            air                = true,
            class              = [[CSpherePartSpawner]],
            count              = 1,
            ground             = true,
            water              = true,
            underwater          = true,
            properties = {
                alpha              = 0.9, -- how transparent it is (1 is not, 0 is transparent)
                color              = [[0.3, 0.1, 0.8]], -- change color here. RGBA
                expansionspeed     = 5, -- how fast it expands
                ttl                = 10, -- how long it lives
            },
        },
    },
}