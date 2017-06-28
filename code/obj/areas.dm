area
	var/music
	icon = 'areas.dmi'

	Entered(mob/m)
/*
		In this procedure, we use the argument m of the type mob.
		We then use the built-in procedure ismob() to make sure
		that m really is a mob. If it isn't, we return the proc
		which causes it to do nothing.
*/
		if(!ismob(m))
			return
/*
		If we made it this far, that means the m that Entered()
		the area was indeed a mob. We output to them the area's
		description and play them some cool tunes.
*/
		m << desc

		m << sound(music, 1, channel = 1, volume = 50)

/area/colony
	icon_state = "colony"
	music = 'jazzy.mid'
	desc = "<B>Nice and jazzy here.</B>"

/area/lobby

/area/caves
	icon_state = "caves"
	music = 'caves.ogg'
	desc = "<B><I>YOU WANT TO TURN BACK.</I></B>"