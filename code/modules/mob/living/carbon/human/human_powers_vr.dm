/mob/living/carbon/human/proc/reagent_purge()
	set name = "Очиститься От Реагентов"
	set desc = "Вычистить из себя все употреблённые или затронутые реагенты."
	set category = "IC"

	if(stat == DEAD) return

	to_chat(src, "<span class='notice'>Начинается операция очистки от реагентов, пожалуйста, подождите...</span>")
	sleep(50)
	src.bloodstr.clear_reagents()
	src.ingested.clear_reagents()
	src.touching.clear_reagents()
	to_chat(src, "<span class='notice'>Реагенты вычищены!</span>")

	return TRUE
	
