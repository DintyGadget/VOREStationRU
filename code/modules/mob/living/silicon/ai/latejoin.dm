var/global/list/empty_playable_ai_cores = list()

/hook/roundstart/proc/spawn_empty_ai()
	for(var/obj/effect/landmark/start/S in landmarks_list)
		if(S.name != "ИИ")
			continue
		if(locate(/mob/living) in S.loc)
			continue
		empty_playable_ai_cores += new /obj/structure/AIcore/deactivated(get_turf(S))

	return 1

/mob/living/silicon/ai/verb/store_core()
	set name = "Отключение Ядра"
	set category = "OOC"
	set desc = "Отправить своё ядро на длительное хранение. Это равноценно крио и освободит Ваш слот."

	if(ticker && ticker.mode && ticker.mode.name == "AI malfunction")
		to_chat(usr, "<span class='danger'>Вы не можете использовать этот глагол в этом игровом режиме. Если Вам нужно уйти, обратитесь в Админхелп.</span>")
		return

	// Guard against misclicks, this isn't the sort of thing we want happening accidentally
	if(alert("ВНИМАНИЕ: Это мгновенно освободит Ваше ядро и переведёт Вас в режим призрака, удаляя Вашего персонажа из раунда (как крио). Вы точно уверены в своём решении?",
					"Отключение Ядра", "Нет", "Нет", "Да") != "Да")
		return

	// We warned you.
	empty_playable_ai_cores += new /obj/structure/AIcore/deactivated(loc)
	global_announcer.autosay("[src] помещается в хранилище искусственного интеллекта.", "Мониторинг ИИ")

	//Handle job slot/tater cleanup.
	set_respawn_timer()
	clear_client()