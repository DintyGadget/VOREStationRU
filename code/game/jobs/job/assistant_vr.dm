//////////////////////////////////
//		Intern
//////////////////////////////////

/datum/job/intern
	title = "Стажёр"
	flag = INTERN
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = ENGSEC // Ran out of bits
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "всем персоналом станции и закрепленным за Вам отделом"
	selection_color = "#666666"
	economic_modifier = 2
	access = list()			//See /datum/job/intern/get_access()
	minimal_access = list()	//See /datum/job/intern/get_access()
	outfit_type = /decl/hierarchy/outfit/job/assistant/intern
	alt_titles = list("Стажёр" = /datum/alt_title/intern,
					  "Инженер-практикант" = /datum/alt_title/intern_eng,
					  "Врач-интерн" = /datum/alt_title/intern_med,
					  "Научный лаборант" = /datum/alt_title/intern_sci,
					  "Кадет службы безопасности" = /datum/alt_title/intern_sec,
					  "Младший грузчик" = /datum/alt_title/intern_crg,
					  "Младший скаут" = /datum/alt_title/intern_exp,
					  "Официант" = /datum/alt_title/server)
	job_description = "Стажёр делает все, что от него требуется, выполняя работу в процессе изучения другой профессии. Хотя он и является частью экипажа, у него нет никакой реальной власти."
	timeoff_factor = 0 // Interns, noh

/datum/alt_title/intern
	title = "Стажёр"

/datum/alt_title/intern_eng
	title = "Инженер-практикант"
	title_blurb = "Инженер-практикант пытается выполнять все, что нужно инженерному отделу. Он не является настоящим инженером, а лишь набирается опыта на практике, чтобы им стать. Инженер-практикант не имеет не имеет реальной власти."
	title_outfit = /decl/hierarchy/outfit/job/assistant/engineer

/datum/alt_title/intern_med
	title = "Врач-интерн"
	title_blurb = "Врач-интерн пытается выполнять все, что необходимо медицинскому отделу. Он не является настоящими доктором. Врач-интерн не имеет реальной власти."
	title_outfit = /decl/hierarchy/outfit/job/assistant/medic

/datum/alt_title/intern_sci
	title = "Научный лаборант"
	title_blurb = "Научный лаборант обязан оказывать помощь исследовательскому отделу. Он не является настоящим ученым, а всего лишь проходит практику, чтобы им стать. Научный лаборант не имеет реальной власти."
	title_outfit = /decl/hierarchy/outfit/job/assistant/scientist

/datum/alt_title/intern_sec
	title = "Кадет службы безопасности"
	title_blurb = "Кадет службы безопасности обязан оказывать помощь службе безопасности. Он не является настоящим офицером, а лишь набирается опыта, чтобы им стать. Кадет службы безопасности не имеет реальной власти."
	title_outfit = /decl/hierarchy/outfit/job/assistant/officer

/datum/alt_title/intern_crg
	title = "Младший грузчик"
	title_blurb = "Младший грузчик обязан оказывать помощь отделу снабжения. Он не является настоящим грузчиком, а лишь проходит обучение, чтобы им стать. Младший грузчик не имеет реальной власти."
	title_outfit = /decl/hierarchy/outfit/job/assistant/cargo

/datum/alt_title/intern_exp
	title = "Младший скаут"
	title_blurb = "Младший скаут обязан оказывать помощь отделу экспедиций. Он не является настоящим искателем, а всего лишь проходит обучение, чтобы им стать. У младшего скаута нет реальной власти."
	title_outfit = /decl/hierarchy/outfit/job/assistant/explorer

/datum/alt_title/server
	title = "Официант"
	title_blurb = "Официант оказывает помощь работникам бара и кафе, в общем случае с доставкой еды. У официанта нет какой-либо реальной власти."
	title_outfit = /decl/hierarchy/outfit/job/service/server

/datum/job/intern/New()
	..()
	if(config)
		total_positions = config.limit_interns
		spawn_positions = config.limit_interns

/datum/job/intern/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()


//////////////////////////////////
//		Visitor
//////////////////////////////////

/datum/job/assistant		// Visitor
	title = USELESS_JOB
	supervisors = "... никем, в прочем. Вы тут не работаете."
	job_description = "Гость всего лишь посещает это место. У него авторитета или ответственности."
	timeoff_factor = 0
	alt_titles = list("Посетитель" = /datum/alt_title/guest, "Путешественник" = /datum/alt_title/traveler)

/datum/job/assistant/New()
	..()
	if(config)
		total_positions = config.limit_visitors
		spawn_positions = config.limit_visitors

/datum/job/assistant/get_access()
	return list()

/datum/alt_title/guest
	title = "Посетитель"

/datum/alt_title/traveler
	title = "Путешественник"
