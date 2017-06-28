/obj/items/books
	icon = 'books.dmi'

/obj/items/books/torah
	name = "torah"
	icon_state = "torah"

/obj/items/books/mining
	name = "book of mining"
	icon_state = "miningbook"

/obj/items/books/torah/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		view(7) << "<B>\blue [H.name] stares into [src]!</B>"
		usr << "<I>... Potato Curse ...</I>"
		usr << ambushsound
		usr.icon_state = "potato"

/obj/items/books/mining/Click(var/mob/living/H = usr)
	for(H in range(1, src))
		if(H.minerskill <= 5)
			if(H.mreaded == 0)
				view(7) << "<B>\blue [H.name] reads a whole book in one second!</B>"
				usr << pick("<I>... Just dig it ...</I>", "<I>... Do everything as quickly as possible ...</I>", "<I>... Pray ...</I>")
				usr << "<B>Now i know some mining-secrets!</B>"
				H.mreaded = 1
				H.minerskill += 1
			else
				usr << "<B>\red You already know this things, dummy.</B>"
		else
			usr << "<B>\red You already know this things, dummy.</B>"
