-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 1,
        gaps_out = 5,

        border_size = 1,

        col = {
            active_border   = "rgba(cba6f7aa)",
            inactive_border = "rgba(3a3535aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 0,
        active_opacity   = 1.0,
        inactive_opacity = 0.9,

        shadow = { enabled = false },

        blur = {
            enabled   = true,
            size      = 4,
            passes    = 3,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = false,
    },
    dwindle = {
        preserve_split = true,
        force_split = 2
    }
})