/mob/living/human
	icon = 'mob.dmi'
	icon_state = "human"
	Login() //При заходе
		strength = rand(3, 10)
		intelligence = rand(3, 10)
		dexterity = rand(3, 10)
		partyskill = rand(0, 6)
		minerskill = rand(0, 6)
		axeskill = rand(0, 6)
//		health_meter = new(src)
		isvampire = 0
		name_pick()
		loc = locate(/turf/floors/start/colonist)//Спавн на турфе/старт/грейтайдер
		if(prob(20))
			isvampire = 1
		vampire_check()

var/ooc = 1

/mob/living/verb/OOC(msg as text)
	set category = "OOC"
	if(ooc == 1)
		world << "<B>\blue OOC: [ckey]: [msg]</B>"
	else
		usr << "<B>Unavailable.</B>"

/mob/living/verb/adminverbs()
	set category = "Admin"
	set name = "Admin Verbs"
	if(usr.key == "difilex")
		GM_check()
	if(usr.key == "dvacheroldfag")
		GM_check()
	else
		src << "Don't touch that."

/mob/living/proc/GM_check()
	usr << "<B>• Adding verbs.</B>"
	usr.verbs+=new/mob/admin/verb/Reboot
	usr.verbs+=new/mob/admin/verb/Announce
	usr.verbs+=new/mob/admin/verb/disableOOC

