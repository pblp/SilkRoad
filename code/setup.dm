world/proc/title_pick()

	var/f_word = pick("Sensitive", "Lonely", "Stinky", "Strong", "Silly", "Crying", "Plastic", "Russian", "Dumb", "Green", "Dead", "Salty", "Missing", "Disgusting", "Precious", "Personal", "Sad", "Stressed", "Endless")
	var/s_word = pick("Krasnogrib", "Vampires", "Lifeweb", "Potatoes", "Jokes", "Kotowasiy", "Chromosomes", "Eyes", "Cocks", "Hitler", "Virgin", "Pig", "Jesus", "Heroin", "Dancer", "Ratfucker", "Gmyza", "Love", "Memes", "Lesbians", "Excuses", "Nights", "Enemy")

	world.name = "Silk Road: [f_word] [s_word]"

world
	fps = 30
	icon_size = 32
	view = 7
mob
	step_size = 32
	var/speeding = 0
	var/rundelay = 1.9
obj
	step_size = 32

client/Move()
	if(mob.speeding <= 0)
		mob.speeding = 1
		..()
		sleep(mob.rundelay)
		mob.speeding = 0
	else
		return

mob/Login()
	speeding = 0
	..()

world/New()
	title_pick()