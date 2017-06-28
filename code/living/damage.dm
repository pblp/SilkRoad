/mob/living/proc/HurtMe(D)
	health = health - D
	if(health <= 0)
		die()

/mob/living/proc/HurtStomach(D)
	stomach = stomach - D
	if(stomach <= 50)
		stomachinjury()
	if(stomach <= 0)
		stomachdie()

/mob/living/proc/stomachdie()
	if(src.isvampire == 0)
		view(7) << "<B>\red[src] vomits up the blood!</B>"
		view(7) << vomitsound
		usr << "<B><font size=3 color=red>MY STOMACH!!!</font></B>"
		new /obj/food/blood(usr.loc,1)
		bloodloss(50)
		HurtMe(20)
	else
		view(7) << "<B>\red[src] vomist up the blood!</B>"
		view(7) << vomitsound
		usr << "<B><font size =3 color=red>MY STOMACH!!!</font></B>"
		usr << "<B>\red -5 BP.</B>"
		new /obj/food/vampiresblood(usr.loc,1)
		bloodloss(50)
		src.bloodlevel -= 5

/mob/living/proc/stomachinjury()
	if(src.isvampire == 0)
		view(7) << "<B>\red[src] vomits up the blood!</B>"
		view(7) << vomitsound
		bloodloss(30)
		new /obj/food/blood(usr.loc,1)
		HurtMe(5)
	else
		view(7) << "<B>\red[src] vomits up the blood!</B>"
		usr << "<B>\red -5 BP.</B>"
		view(7) << vomitsound
		bloodloss(30)
		new /obj/food/vampiresblood(usr.loc,1)
		src.bloodlevel -= 5

/mob/living/proc/bloodloss(D)
	blood = blood - D
	if(blood == 50)
		usr << "\red You feel faint."
		HurtMe(5)
	if(blood <= 0)
		usr << "\red You can lose consciousness at any moment."
		HurtMe(10)

/mob/living/proc/die()
	if(src.hasaxe == 1)
		new /obj/items/tools/axe(usr.loc,1)
	else
		return
	if(src.haspickaxe == 1)
		new /obj/items/tools/pickaxe(usr.loc,1)
	else
		return
	view(7) << "<B>\red[src] melts!</B>"
	new /mob/ghost(usr.loc,1)
	del src