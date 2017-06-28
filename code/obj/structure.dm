/obj/structure/window
	name = "window"
	icon = 'structures.dmi'
	icon_state = "windows"
	density = 1
	opacity = 0
	layer = 8

/obj/structure/cemetery
	name = "cemetery gates"
	icon = 'structures.dmi'
	icon_state = "cemetery"
	density = 1

/obj/structure/gates
	name = "gates"
	icon = 'structures.dmi'
	icon_state = "gates"

/obj/structure/grave
	name = "grave"
	icon = 'structures.dmi'
	icon_state = "grave"

var/humanitywon = 0

/obj/structure/altar
	name = "Ancient Altar"
	icon = 'structures.dmi'
	icon_state = "bloodaltar"
	density = 1
/*
/obj/structure/altar/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(humanitywon == 0)
			world << ending
			world << "<B><font size=4 color=blue>Colony won!</font></B>"
			humanitywon = 1
			autoreboot=1
			world<<"<b><font color = red>Automatic Reboot Commencing in 30 Seconds."
			spawn(250)
				world << "<b><font color = red>World will reboot in 5 seconds!"
				sleep(10)
				world << "<b><font color = red>World will reboot in 4 seconds!"
				sleep(10)
				world << "<b><font color = red>World will reboot in 3 seconds!"
				sleep(10)
				world << "<b><font color = red>World will reboot in 2 seconds!"
				sleep(10)
				world << "<b><font color = red>World will reboot in 1 second!"
				sleep(10)
				if(autoreboot==1)
					world.Reboot()
		else
			return
*/
/obj/structure/decals/smallrock
	name = "small rock"
	icon = 'structures.dmi'
	icon_state = "smallrock"

	New()
		icon_state = "smallrock[pick("1","2","3","4","5")]"
		..()

/obj/structure/decals/bush
	name = "bush"
	icon = 'structures.dmi'
	icon_state = "bush1"

	New()
		icon_state = "bush[pick("1","2","3","4","5","6")]"
		..()

/obj/structure/decals/roots
	name = "roots"
	icon = 'structures.dmi'
	icon_state = "roots1"
	layer = 10
	density = 1
	var/health = 100

	New()
		icon_state = "roots[pick("1","2")]"
		..()

/obj/structure/decals/roots/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.axeskill == 0)
			if(H.hasaxe == 1)
				view(7) << "<B>\blue [H.name] tries to cut the roots, applying a gargantuan amount of effort!</B>"
				src.health -= 5
				H.alearning += 1
		if(H.axeskill == 1)
			if(H.hasaxe == 1)
				view(7) << "<B>\red [H.name] attacks the roots!</B>"
				src.health -= 15
		if(H.axeskill == 2)
			if(H.hasaxe == 1)
				view(7) << "<B>\red [H.name] attacks the roots!</B>"
				src.health -= 25
		if(H.axeskill == 3)
			if(H.hasaxe == 1)
				view(7) << "<B>\red [H.name] attacks the roots!</B>"
				src.health -= 35
		if(H.axeskill == 4)
			if(H.hasaxe == 1)
				view(7) << "<B>\red [H.name] attacks the roots!</B>"
				src.health -= 45
		if(H.axeskill == 5)
			if(H.hasaxe == 1)
				view(7) << "<B>\red [H.name] attacks the roots!</B>"
				src.health -= 55
		if(H.axeskill == 6)
			if(H.hasaxe == 1)
				view(7) << "<B>\red [H.name] attacks the roots!</B>"
				src.health -= 80
		if(H.axeskill == 0)
			if(H.alearning == 3)
				H.axeskill += 1
			else
				return
		if(src.health <= 0)
			del src


/obj/structure/grille
	name = "grille"
	icon = 'structures.dmi'
	icon_state = "grille"
	density = 1
	opacity = 0

/obj/structure/table
	name = "table"
	icon = 'structures.dmi'
	icon_state = "table"
	density = 1

/obj/structure/table/bar
	name = "table"
	icon_state = "bar_table"

/obj/structure/chair
	name = "chair"
	icon = 'structures.dmi'
	icon_state = "chair"

/obj/structure/sign/barsign
	name = "bar sign"
	icon = 'barsigns.dmi'
	icon_state = "theouterspess"
	layer = 12