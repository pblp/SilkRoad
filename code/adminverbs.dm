var/autoreboot=0
var/reboottime=0

mob/admin/verb/Reboot(sec as num)
	set category = "Admin"
	autoreboot=1
	world << "<b><font color = red>World will reboot in [sec] seconds! - [ckey]"
	sleep(sec*10)
	if(autoreboot==1)
		world.Reboot()

mob/admin/verb/disableOOC()
	set category = "Admin"
	set name = "Disable OOC"
	if(ooc == 1)
		world << "<B>OOC was disabled.</B>"
		ooc = 0
	else
		world << "<B>OOC was enabled.</B>"
		ooc = 1

mob/admin/verb/Announce(message as message)
	set category = "Admin"
	set name = "Announce"
	if(message)
		for(var/client/C)
			C.mob << "<center><br><b><font color=red>[message] - [ckey]</font></center>"
	else
		usr << "<B>Even admins shouldnt spam.</B>"

proc/autostuff()
	if(reboottime==0)
		return
	spawn(reboottime)
		if(reboottime==0)
			return
		autoreboot=1
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