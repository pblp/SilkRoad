/mob/living/verb/Set_Skills()
	set name = "Set Skills"
	set category = "Debug"

/mob/living/proc/skill_pick()

	var/pick = input("Скиллы") in list("Вещества", "Горное дело", "Управление топором") as text|null
    if(pick)
        var/mob/char = null
        switch(pick)
           	if("Вещества")

