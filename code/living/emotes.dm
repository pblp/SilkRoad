var/wait = 1

/mob/living/verb/what()
	set name = "Ask something"
	set category = "Roleplay"
	if(wait)
		view(7) << "<B>[src.name]</B> asks, 'What?'"
		wait = 0
		spawn(10)
			wait = 1
	else
		return

/mob/living/verb/go()
	set name = "Please move"
	set category = "Roleplay"
	if(wait)
		view(7) << "<B>[src.name]</B> says, <B>'GO MOVE YOU FUCKING CUNT'</B>"
		wait = 0
		spawn(10)
			wait = 1
	else
		return

/mob/living/verb/moan()
	set name = "Moan"
	set category = "Roleplay"
	if(wait)
		view(7) << "<B>[src.name] moans like a little girl.</B>"
		wait = 0
		spawn(10)
			wait = 1
	else
		return

/mob/living/verb/cry()
	set name = "Tears"
	set category = "Roleplay"
	if(wait)
		view(7) << "<B>[src.name] cries!</B>"
		wait = 0
		spawn(10)
			wait = 1
	else
		return

/mob/living/verb/sigh()
	set name = "Sigh"
	set category = "Roleplay"
	if(wait)
		view(7) << "<B>[src.name] sighs.</B>"
		wait = 0
		spawn(10)
			wait = 1
	else
		return