---------------
---- INPUT ----
---------------

hl.config({
    input = {
	    kb_layout  = "es",

        follow_mouse = 1,

        sensitivity = -0.2,
	    accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})