/mob/new_player/proc/spawn_checks_vr(var/rank)
	var/pass = TRUE
	var/datum/job/J = SSjob.get_job(rank)

	if(!J)
		log_debug("Couldn't find job: [rank] for spawn_checks_vr, panic-returning that it's fine to spawn.")
		return TRUE

	//No Flavor Text
	if (config.require_flavor && !client?.prefs?.flavor_texts["general"] && !(J.mob_type & JOB_SILICON))
		to_chat(src,"<span class='warning'>Пожалуйста, установите общее описание персонажа. Установите его с помощью кнопки \"Установить описание\" на вкладке \"Внешность\" в настройке персонажа.</span>")
		pass = FALSE

	//No OOC notes
	if (config.allow_Metadata && (!client?.prefs?.metadata || length(client.prefs.metadata) < 15))
		to_chat(src,"<span class='warning'>Please set informative OOC notes related to RP/ERP preferences. Set them using the 'OOC Notes' button on the 'General' tab in character setup.</span>")
		pass = FALSE

	//Are they on the VERBOTEN LIST?
	if (prevent_respawns.Find(client?.prefs?.real_name))
		to_chat(src,"<span class='warning'>Вы уже вышли из раунда в качестве этого персонажа. Вы не можете вернуться сейчас, когда освободили свое рабочее место. Играйте за другого персонажа или ждите следующего раунда.</span>")
		pass = FALSE

	//Do they have their scale properly setup?
	if(!client?.prefs?.size_multiplier)
		pass = FALSE
		to_chat(src,"<span class='warning'>Вы еще не установили свой размер. Сделайте это на вкладке Д.Н.П в разделе настройки персонажа.</span>")

	//Can they play?
	if(!is_alien_whitelisted(src,GLOB.all_species[client?.prefs?.species]) && !check_rights(R_ADMIN, 0))
		pass = FALSE
		to_chat(src,"<span class='warning'>Вам не разрешается спавниться в качестве этого вида.</span>")

	//Custom species checks
	if (client?.prefs?.species == "Custom Species")

		//Didn't name it
		if(!client?.prefs?.custom_species)
			pass = FALSE
			to_chat(src,"<span class='warning'>Вы должны назвать свой собственный вид. Сделайте это на вкладке Д.Н.П в разделе настройки персонажа.</span>")

		//Check traits/costs
		var/list/megalist = client.prefs.pos_traits + client.prefs.neu_traits + client.prefs.neg_traits
		var/points_left = client.prefs.starting_trait_points
		var/traits_left = client.prefs.max_traits
		for(var/T in megalist)
			var/cost = traits_costs[T]

			if(cost)
				traits_left--

			//A trait was removed from the game
			if(isnull(cost))
				pass = FALSE
				to_chat(src,"<span class='warning'>Your custom species is not playable. One or more traits appear to have been removed from the game or renamed. Enter character setup to correct this.</span>")
				break
			else
				points_left -= traits_costs[T]

		//Went into negatives
		if(points_left < 0 || traits_left < 0)
			pass = FALSE
			to_chat(src,"<span class='warning'>Ваш пользовательский вид не играбелен. Переконфигурируйте свои черты на вкладке Д.Н.П.</span>")

	//Final popup notice
	if (!pass)
		spawn()
			alert(src,"Возникли проблемы с спавном вашего персонажа. Проверьте свой журнал сообщений для получения подробной информации.","Error","OK")
	return pass
