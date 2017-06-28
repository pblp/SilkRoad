/obj/decals/hitler
	name = "corpse"
	icon = 'critter.dmi'
	icon_state = "hitler"

/obj/decals/coffin
	name = "coffin"
	icon = 'decals.dmi'
	icon_state = "coffin"
	density = 1

/obj/decals/hitler/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		view(7) << "<B>\red [H.name] stares at the corpse.</B>"

/obj/decals/poster/hitlerposter
	name = "poster"
	icon = 'decals.dmi'
	icon_state = "hitlerposter"
	layer = 12

/obj/decals/board
	name = "board"
	icon = 'decals.dmi'
	icon_state = "board"
	layer = 12

/obj/decals/board/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		usr << "<B>\blue**Good News**</B>"
		usr << pick("<B><font color=purple>Caution! Some sort of virus was detected near the colony!</B>", "<B><font color=purple>The government sent a spy. If your friend, boyfriend, neighbor or colleague behaves suspiciously - inform the administration.</B>", "<B><font color=purple>Boy missing after the Great Migration. He was wearing white socks and ushanka. Please, contact the authorities if you discover anyone matching this discription.</B>", "<B><font color=purple>Poor male prostitute by the name of Morgan James, the universal favorite, died in outer space.</B>")
		return