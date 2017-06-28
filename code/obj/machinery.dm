/obj/machinery/door
	name = "futuristic door"
	icon = 'mechanisms.dmi'
	icon_state = "door_closed"
	var/mydoor = "door"
	density = 1
	var/close = 1
	opacity = 1

/obj/machinery/door/woodendoor
	name = "wooden door"
	icon_state = "woodendoor_closed"
	mydoor = "woodendoor"

/obj/machinery/door/Click()
	for(var/mob/living in range(1, src))
		if(close == 1)
			icon_state = "[mydoor]_opened"
			close = 0
			density = 0
			opacity = 0
		else
			icon_state = "[mydoor]_closed"
			close = 1
			density = 1
			opacity = 1

/obj/machinery/door/proc/open()
	icon_state = "door_opened"
	close = 0
	density = 0
	opacity = 0

/obj/machinery/door/proc/close()
	icon_state = "door_closed"
	close = 1
	density = 1
	opacity = 1