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

/mob/living/carbon/human/verb/toggle_eyes_layer()
	set name = "Сменить Слой Глаз/Монитора"
	set desc = "Переключить отображение глаз/монитора поверх особенностей тела."
	set category = "IC"

	if(stat)
		to_chat(src, "<span class='warning'>Вам нужно быть на ногах, чтобы это сделать!</span>")
		return
	var/obj/item/organ/external/head/vr/H = organs_by_name[BP_HEAD]
	if(!H)
		to_chat(src, "<span class='warning'>Похоже, у Вас нет головы!</span>")
		return

	H.eyes_over_markings = !H.eyes_over_markings
	update_icons_body()

	var/datum/robolimb/robohead = all_robolimbs[H.model]
	if(robohead.monitor_styles && robohead.monitor_icon)
		to_chat(src, "<span class='notice'>Вы перенастраиваете отображение своего лица.</span>")

	return TRUE
