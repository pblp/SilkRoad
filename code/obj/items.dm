/obj/items
	icon = 'items.dmi'

/obj/items/tools/pickaxe
	name = "pickaxe"
	icon_state = "pickaxe"

/obj/items/tools/axe
	name = "axe"
	icon_state = "axe"

/obj/items/tools/axe/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.hasaxe == 0)
			view(7) << "<B>\blue [H.name] equips [src]!</B>"
			H.hasaxe = 1
			del src
		else
			usr << "<B>\red You already have one!</B>"

/obj/items/tools/pickaxe/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.haspickaxe == 0)
			view(7) << "<B>\blue [H.name] equips [src]!</B>"
			H.haspickaxe = 1
			del src
		else
			usr << "<B>\red You already have one!</B>"