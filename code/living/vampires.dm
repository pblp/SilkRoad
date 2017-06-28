/mob/vampire/verb/vomit(var/mob/living/H = client)
	set category = "Vampire"
	set name = "Regurgitate Blood (10)"
	if(H.isvampire == 1)
		if(H.bloodlevel >= 10)
			view(7) << "<B>\red [H.name] vomits up the blood!</B>"
			view(7) << vomitsound
			H.bloodlevel -= 10
			new /obj/food/vampiresblood/(H.loc,1)
		else
			usr << "<B>\red Not enough blood points.</B>"

var/avlb = 1

/mob/vampire/verb/callelders()
	set category = "Vampire"
	set name = "Call the Elders (0)"
	if(avlb)
		view(7) << "<B>[usr] calls the elders!</B>"
		view(7) << callelders
		avlb = 0
		spawn(50)
			avlb = 1
	else
		return

/mob/vampire/verb/invis(var/mob/living/H = client)
	set category = "Vampire"
	set name = "Reflection (5)"
	if(H.bloodlevel >= 5)
		H.bloodlevel -= 5
		usr.alpha = 5
		usr << discipline
		spawn(500)
			usr.alpha = 255
	else
		usr << "<B>\red Not enough blood points.</B>"

/mob/vampire/verb/celerity(var/mob/living/H = client)
	set category = "Vampire"
	set name = "Celerity (5)"
	if(H.bloodlevel >= 5)
		H.bloodlevel -= 5
		usr << discipline
		H.rundelay = 0.5
		usr << "<B>Everything around me seems so slow...</B>"
		spawn(500)
			H.rundelay = 1.9
			usr << "<B>World becomes fast again.</B>"
	else
		usr << "<B>\red Not enough blood points.</B>"

/mob/vampire/verb/regeneration(var/mob/living/H = client)
	set category = "Vampire"
	set name = "Recovery (10)"
	if(H.bloodlevel >= 10)
		if(H.stomach < 100)
			H.stomach += 20
		if(H.blood < 100)
			H.blood += 20
		if(H.health < 100)
			H.health += 20
		H.bloodlevel -= 10
		usr << discipline
	else
		usr << "<B>\red Not enough blood points.</B>"
/*
/mob/vampire/verb/eldersritual(var/mob/living/H = client)
	set category = "Vampire"
	set name = "Ritual of Elders (30)"
	if(H.bloodlevel >= 30)
		if(humanitywon == 0)
			world << ending
			world << "<B><font size=4 color=red>Colony is in ruins. Vampires performed the ritual of Elders and succeed!</font></B>"
			autoreboot=1
			H.bloodlevel -= 30
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
	else
		usr << "<B>\red Not enough blood points.</B>"
*/
/mob/living/proc/vampire_check()
	if(src.isvampire == 0)
		usr << "<B>• You are a human.</B>"
	else
		usr << "<B>• You're already dead.</B>"
		usr.verbs+=new/mob/vampire/verb/vomit
		usr.verbs+=new/mob/vampire/verb/callelders
		usr.verbs+=new/mob/vampire/verb/invis
		usr.verbs+=new/mob/vampire/verb/regeneration
		usr.verbs+=new/mob/vampire/verb/celerity