
#define DEBUG

HealthMeter
	parent_type = /HudGroup

	// all objects in this group will use this icon and layer
	icon = 'hud.dmi'
	layer = MOB_LAYER + 5

	New()
		..()

		// add eight objects to this group
		for(var/i = 1 to 8)

			// the objects are placed in a row, 16 pixels apart, starting at 0,0
			var/px = i * 16 - 16
			var/py = 0
			add(px, py, "health")

	proc
		// updates the eight screen objects in the group to represent the new health value
		update(value)
			for(var/i = 1 to 8)

				// the objects list is the list of screen objects in this group
				var/HudObject/h = objects[i]

				// the value var holds the number of screen objects we want to
				// have the "health" state, any extra ones get the "empty" state
				if(i <= value)
					h.icon_state = "health"
				else
					// if they're transitioning from full to empty, play an animation
					if(h.icon_state == "health")
						flick("hurt", h)

					h.icon_state = "empty"
