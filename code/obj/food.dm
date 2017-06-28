/obj/food
	icon = 'nutriments.dmi'

/obj/food/mushroom
	var/powdertype = null

/obj/food/powders/sleeping
	name = "sleeping powder"
	icon_state = "spowder"

/obj/food/powders/boletus
	name = "boletus powder"
	icon_state = "bpowder"

/obj/food/vampiresblood
	name = "blood"
	icon_state = "blood"

/obj/food/blood
	name = "blood"
	icon_state = "blood"

/obj/food/mushroom/boletus
	name = "boletus"
	icon_state = "boletus"
	powdertype = /obj/food/powders/boletus

/obj/food/mushroom/redshroom
	name = "krasnogrib"
	icon_state = "redshroom"
	powdertype = /obj/food/powders/sleeping

/obj/food/vampiresblood/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.isvampire == 0)
			view(7) << "<B>\red [H.name] drinks blood from the floor!</B>"
			usr << "<B>Your body transforms...</B>"
			H.isvampire = 1
			H.vampire_check()
			del(src)
		else
			usr << "<B>\red It's too late.</B>"

/obj/food/blood/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.isvampire == 1)
			view(7) << "<B>\red [H.name] drinks blood from the floor!</B>"
			usr << "<B>\blue Delicious.</B>"
			usr << "<B>\blue +5 BP.</B>"
			H.bloodlevel += 5
			del(src)
		else
			return

/obj/food/mushroom/redshroom/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.isvampire == 1)
			view(7) << "<B>\red [H.name] eats [src]!</B>"
			usr << "<B>\blue +2 BP.</B>"
			H.bloodlevel += 2
			del(src)
		else
			view(7) << "<B>\red [H.name] licks [src]!</B>"

/obj/food/mushroom/boletus/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		view(7) << "<B>\red [H.name] eats [src]!</B>"
		usr << "<B><font size=3 color=red>O-OH LORD MY STOMACH!</font></B>"
		H.HurtStomach(50)
		del(src)


