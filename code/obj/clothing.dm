/obj/clothing
	icon = 'clothing.dmi'
	var/texture = ""
	var/path = ""

/obj/clothing/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.dressed == 0)
			view(7) << "<B>\blue [H.name] puts on [src].</B>"
			usr.icon_state = texture
			Move(usr)
			H.dressed = 1
		else
			usr << "<B>\red Remove your clothes first!</B>"
/*
/obj/clothing/verb/get(var/mob/living/H = usr)
	set name = "Equip"
	set category = "Objects"
	set src in oview(0)
	for(H in range(0, src))
		if(H.dressed == 0)
			usr << "You put on [src]."
			usr.icon_state = texture
			Move(usr)
			H.dressed = 1
		else
			usr << "<B>\red Remove your clothes first!</B>"
*/
/obj/clothing/verb/drop(var/mob/living/H = usr)
	set name = "Unequip"
	set category = "Inventory"
	for(H in range(0, src))
		usr << "You take off [src]."
		view(7) << drop
		usr.icon_state = "human"
		H.dressed = 0
		Move(usr.loc)

/*
/obj/clothing/blacksuit/verb/equip(var/mob/living/H = usr)
	set name = "Equip"
	set src in oview(0)
	set category = "Objects"
	if(H.dressed == 0)
		view(7) << "<B>\blue [H.name] puts on the black suit.</B>"
		usr.icon_state = "black_suit"
		H.dressed = 1
		Move(usr)
	else
		usr << "<B>\red Remove your clothes first!</B>"
*/
/*
/obj/clothing/nazisuit/verb/equip(var/mob/living/H = usr)
	set name = "Equip"
	set src in oview(0)
	set category = "Objects"
	if(H.dressed == 0)
		view(7) << "<B>\blue [H.name] puts on the nazi suit.</B>"
		usr.icon_state = "hitler_suit"
		H.dressed = 1
		Move(usr)
	else
		usr << "<B>\red Remove your clothes first!</B>"
*/
/obj/clothing/greysuit
	name = "grey suit"
	icon_state = "greysuit"
	texture = "grey_suit"
	path = "/obj/clothing/greysuit"

/obj/clothing/nazisuit
	name = "nazi suit"
	icon_state = "nazisuit"
	texture = "hitler_suit"
	path = "/obj/clothing/nazisuit"
/*
/obj/clothing/blacksuit/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.dressed == 0)
			usr.icon_state = "black_suit"
			view(7) << "<B>\blue [H.name] puts on [src].</B>"
			H.dressed = 1
			del src
			Move(usr)
		else
			usr << "<B>\red Take off your clothes first.</B>"
*/
/obj/clothing/commandantsuit
	name = "commandant's suit"
	icon_state = "redsuit"
/*
/obj/clothing/commandantsuit/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.dressed == 0)
			usr.icon_state = "red_suit"
			view(7) << "<B>\blue [H.name] puts on [src].</B>"
			H.dressed = 1
			del src
			Move(usr)
		else
			usr << "<B>\red Take off your clothes first.</B>"
*/
/*
/obj/clothing/verb/drop(var/mob/living/H = usr)
	set name = "Unequip Clothes"
	set category = "Inventory"
	view(7) << "<B>\blue [H.name] takes off his clothes.</B>"
	usr.icon_state = "human"
	H.dressed = 0
	Move(usr.loc)
*/