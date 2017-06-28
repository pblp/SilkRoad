/mob/living
	var/stomach = 100
	var/health = 100
	var/sanity = 100
	var/blood = 100
	var/strength = 0
	var/intelligence = 0
	var/dexterity = 0
	var/partyskill = 0
	var/minerskill = 0
	var/axeskill = 0
	var/mlearning = 0
	var/alearning = 0
//	var/HealthMeter/health_meter
	var/haspickaxe = 0
	var/hasaxe = 0
	var/mreaded = 0
	var/isvampire = 0
	var/bloodlevel = 0
	var/f_name
	var/l_name
	var/dressed = 0
	var/spawnloc = null
	var/isGM = 0
	layer = 9

/mob/living/dummy
	name = "BYOND"
	icon = 'mob.dmi'
	icon_state = "human"

/world/mob = /mob/default //Изначально моб другой, в лобби сидит

/mob/default/Login() //Когда изначальный моб активируется - пишет следующий текст и делает role_pick()
    usr << "<h1>SILK \red ROAD</h1>"
    world<<"<b>[usr] has logged in!"
    loc = locate(/area/lobby)

/mob/default/verb/join()
	set name = "Enter the Game"
	set category = "Lobby"
	var/pick = input("Join the game?") in list ("Yes") as text|null
	if(pick)
		switch(pick)
			if("Yes")
				setup()

/mob/default/proc/setup()
	sleep(10)
	usr << "<B>Customize your character.</B>"
	backstory_pick()
	role_pick()

/mob/living/proc/name_pick()

	var/f_name = pick("Ivan", "Urist", "Randy", "Daniel", "Oscar", "Ottar", "Colton", "Dagon", "Michael", "Jew", "Darius", "Luther", "John", "Junkie", "Hooman", "Yurka", "Heh")
	var/l_name = pick("Rambold", "McDwarf", "Ratfucker", "Sandy", "Deadwood", "Shepard", "Smith", "Hitler", "Cobb", "Robustovich", "Shulgin", "Shaleez", "Rana", "Krasnogribov", "Stalin", "Huang")
	var/pick = input("Your name was generated") in list("Ok") as text|null
	if(pick)
		switch(pick)
			if("Ok")
				src.name = "[f_name] [l_name]"

/mob/default/proc/role_pick() //У изначального моба есть такой прок, как роль пик. Можно написать кучу таких и активировать их фразочкой сверху.

    var/pick = input("Character Creation") in list("Human") as text|null
    if(pick)
        var/mob/char = null
        switch(pick)
           	if("Human")
                char = new /mob/living/human
        if(char)
           	char.ckey = src.ckey
           	del(src)

/mob/default/proc/backstory_pick()

	var/pick = input("Character's Backstory") in list("Mechanic", "Aferist") as text|null
	if(pick)
		switch(pick)
			if("Mechanic")
				usr << "<B>• After the Great Migration from earth you recieved an order to repair some stuff on this colony. You don't think it'll be as hard as you first thought.</B>"
			if("Aferist")
				usr << "<B>• You've managed to fool the NanoTrasen Incorporation and get a free ticket to the colony. But what for?</B>"

/mob/living/Stat(var/mob/living/H = usr)
	..()
	if(statpanel("Status"))
		stat(null, "Health: [health]")
		stat(null, "ST: [strength]")
		stat(null, "IN: [intelligence]")
		stat(null, "DX: [dexterity]")
		if(H.isvampire == 1)
			stat(null, "Blood: [bloodlevel]")
/*
obj/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		usr << "<B>You picked [src] up.</B>"
		Move(usr)

obj/verb/drop()
   set category = "Objects"
   usr << "<B>You drop [src].</B>"
   Move(usr.loc)
*/
/mob/living/verb/Check_Condition()
	set name = "Check Condition"
	set category = "Character"
	usr << "<B>*---------*</B>"
	usr << "<B>\blue Sanity - [sanity]</B>"
	usr << "<B>\blue Stomach - [stomach]</B>"
	usr << "<B>\blue Blood - [blood]</B>"
	usr << "<B>*---------*</B>"

/mob/living/verb/Check_Stats()
	set name = "About Me"
	set category = "Character"
	usr << "<B>*---------*</B>"
	usr << "About me:"
	usr << "<B><font color=purple>Partying - [partyskill]</B>"
	usr << "<B><font color=purple>Mining - [minerskill]</B>"
	usr << "<B><font color=purple>Uprooting - [axeskill]</B>"
	if(src.isvampire == 1)
		usr << "<B>\red My soul is black. Humanity is alien to me. </B>"
	usr << "<B>*---------*</B>"

/mob/living/verb/Unequip_Pickaxe()
	set name = "Unequip Pickaxe"
	set category = "Inventory"
	if(src.haspickaxe == 1)
		new /obj/items/tools/pickaxe(usr.loc,1)
		src.haspickaxe = 0
		view(7) << "<B>\blue [usr.name] unequips his tools!</B>"
		view(7) << drop
	else
		usr << "<B>\red Try to find some tools first, dummy.</B>"

/mob/living/verb/Unequip_Axe()
	set name = "Unequip Axe"
	set category = "Inventory"
	if(src.hasaxe == 1)
		new /obj/items/tools/axe(usr.loc,1)
		src.hasaxe = 0
		view(7) << "<B>\blue [usr.name] unequips his tools!</B>"
		view(7) << drop
	else
		usr << "<B>\red Try to find some tools first, dummy.</B>"
