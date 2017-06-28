/turf/floors
	icon = 'floors.dmi'

/turf/floors/inside
	name = "floor"
	icon_state = "floor"

/turf/lobby
	icon = 'fullscreen.dmi'
	icon_state = "title"
	layer = 100

/turf/floors/start/colonist
	name = "floor"
	icon_state = "floor"

/turf/floors/start/savage
	name = "dirt"
	icon_state = "dirt"

/turf/floors/start/oldvampire
	name = "floor"
	icon_state = "graveyard"

/turf/floors/inside/stonefloor
	name = "floor"
	icon_state = "stonefloor1"

	New()
		icon_state = "stonefloor[pick("1","2","3")]"
		..()

/turf/floors/outside/dirt
	name = "dirt"
	icon_state = "dirt"

/turf/floors/outside/dirt/New()
  if(prob(2))
    new /obj/structure/decals/smallrock(src)
  if(prob(2))
    new /obj/structure/decals/bush(src)
  if(prob(2))
    new /obj/structure/decals/roots(src)
  if(prob(0.5))
    new /obj/food/mushroom/redshroom(src)
  if(prob(0.5))
    new /obj/food/mushroom/boletus(src)
  if(prob(2))
    new /obj/walls/cave(src)

/turf/floors/inside/plating
	name = "plating"
	icon_state = "plating"

/obj/walls
	icon = 'walls.dmi'
	density = 1
	opacity = 1
	layer = 11
	var/health = 100

/obj/walls/r_wall
	name = "wall"
	icon_state = "r_wall"
	health = 300

/obj/walls/inside
	name = "wall"
	icon_state = "wall"
	health = 300

/obj/walls/stonewall
	name = "wall"
	icon_state = "stonewall"
	health = 300

/obj/walls/inside/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.minerskill == 7)
			if(H.haspickaxe == 1)
				view(7) << "<B>\red [H.name] attacks the wall!</B>"
				src.health -= 50
			else
				usr << "<B>Try to find some tools.</B>"
			if(src.health <= 0)
				del src

/obj/walls/stonewall/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.minerskill == 7)
			if(H.haspickaxe == 1)
				view(7) << "<B>\red [H.name] attacks the wall!</B>"
				src.health -= 50
			else
				usr << "<B>Try to find some tools.</B>"
			if(src.health <= 0)
				del src

/obj/walls/cave
	name = "rock"
	icon_state = "caves"
	health = 100
/*
/obj/walls/cave/Click()
	var/mob/living/H = usr
	if(istype(H))
		if(H.minerskill == 0)
			usr << "НЕ ПОНИМАЮ!"
		else
			usr << "Начинаем копать..."
			sleep(50)
			usr << "Готово!"
			sleep(5)
			del src
*/
/obj/walls/cave/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.minerskill == 0)
			if(H.haspickaxe == 1)
				view(7) << "<B>\blue [H.name] tries to break the wall, applying a gargantuan amount of effort!</B>"
				src.health -= 5
				H.mlearning += 1
		if(H.minerskill == 1)
			if(H.haspickaxe == 1)
				view(7) << "<B>\red [H.name] attacks the rock!</B>"
				src.health -= 15
		if(H.minerskill == 2)
			if(H.haspickaxe == 1)
				view(7) << "<B>\red [H.name] attacks the rock!</B>"
				src.health -= 25
		if(H.minerskill == 3)
			if(H.haspickaxe == 1)
				view(7) << "<B>\red [H.name] attacks the rock!</B>"
				src.health -= 35
		if(H.minerskill == 4)
			if(H.haspickaxe == 1)
				view(7) << "<B>\red [H.name] attacks the rock!</B>"
				src.health -= 45
		if(H.minerskill == 5)
			if(H.haspickaxe == 1)
				view(7) << "<B>\red [H.name] attacks the rock!</B>"
				src.health -= 55
		if(H.minerskill == 6)
			if(H.haspickaxe == 1)
				view(7) << "<B>\red [H.name] attacks the rock!</B>"
				src.health -= 80
		if(H.minerskill == 0)
			if(H.mlearning == 3)
				H.minerskill += 1
			else
				return
		if(src.health <= 0)
			del src