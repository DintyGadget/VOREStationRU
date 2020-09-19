//////////////////////////////////
//		Intern
//////////////////////////////////

/datum/job/intern
	title = "Интерн"
	flag = INTERN
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = ENGSEC // Ran out of bits
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "всем персоналом станции и отделом в котором вы работаете"
	selection_color = "#555555"
	economic_modifier = 2
	access = list()			//See /datum/job/intern/get_access()
	minimal_access = list()	//See /datum/job/intern/get_access()
	outfit_type = /decl/hierarchy/outfit/job/assistant/intern
	alt_titles = list("Интерн" = /datum/alt_title/intern,
					  "Ученик Инженера" = /datum/alt_title/intern_eng,
					  "Медицинский Интерн" = /datum/alt_title/intern_med,
					  "Лаборант" = /datum/alt_title/intern_sci,
					  "Кадет СБ" = /datum/alt_title/intern_sec,
					  "Млад. Грузчик" = /datum/alt_title/intern_crg,
					  "Млад. Исследователь" = /datum/alt_title/intern_exp,
					  "Server" = /datum/alt_title/server)
	job_description = "Интерн делает все, что от него требуется, выполняя работу в процессе изучения другой профессии. Хотя они и являются частью экипажа, у них нет реальной власти."
	timeoff_factor = 0 // Interns, noh

/datum/alt_title/intern
	title = "Интерн"

/datum/alt_title/intern_eng
	title = "Ученик Инженера"
	title_blurb = "Ученик Инженера пытается выполнять все, что нужно инженерному отделу. Он не является настоящим инженером и часто проходит подготовку, чтобы стать инженером. Ученик инженера не имеет никаких реальных полномочий."
	title_outfit = /decl/hierarchy/outfit/job/assistant/engineer

/datum/alt_title/intern_med
	title = "Медицинский Интерн"
	title_blurb = "Медицинский Интерн пытается выполнять все, что необходимо медицинскому отделу. Он не является настоящими доктором. Медицинский Интерн не имеет реальной власти."
	title_outfit = /decl/hierarchy/outfit/job/assistant/medic

/datum/alt_title/intern_sci
	title = "Лаборант"
	title_blurb = "Лаборант пытается предоставить все, что нужно исследовательскому отделу. Они не являются настоящими учеными и часто проходят обучение, чтобы стать учеными. Лаборант не имеет реальной власти."
	title_outfit = /decl/hierarchy/outfit/job/assistant/scientist

/datum/alt_title/intern_sec
	title = "Кадет СБ"
	title_blurb = "Кадет службы безопасности пытается предоставить все, что нужно отделу безопасности. Они не настоящие Офицеры и часто проходят подготовку, чтобы стать Офицерами. Кадет службы безопасности не имеет реальной власти."
	title_outfit = /decl/hierarchy/outfit/job/assistant/officer

/datum/alt_title/intern_crg
	title = "Млад. Грузчик"
	title_blurb = "Млад. Грузчик пытается предоставить все, что нужно грузовому отделу. Они не являются надлежащими специалистами по грузовым перевозкам и часто проходят обучение, чтобы стать техниками по грузовым перевозкам. Млад. Грузчик не имеет реальной власти."
	title_outfit = /decl/hierarchy/outfit/job/assistant/cargo

/datum/alt_title/intern_exp
	title = "Млад. Исследователь"
	title_blurb = "Младший исследователь пытается предоставить все, что нужно отделу разведки. Они не являются настоящими исследователями и часто проходят обучение, чтобы стать исследователями. У младшего исследователя нет настоящего авторитета."
	title_outfit = /decl/hierarchy/outfit/job/assistant/explorer

/datum/alt_title/server
	title = "Server"
	title_blurb = "A Server helps out kitchen and diner staff with various tasks, primarily food delivery. A Server has no real authority."
	title_outfit = /decl/hierarchy/outfit/job/service/server


//////////////////////////////////
//		Visitor
//////////////////////////////////

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

/datum/job/assistant		// Visitor
	title = USELESS_JOB
	supervisors = ", а перед кем? Вы тут не работаете."
	job_description = "A Visitor is just there to visit the place. They have no real authority or responsibility."
	timeoff_factor = 0

/datum/job/assistant/New()
	..()
	if(config)
		total_positions = config.limit_visitors
		spawn_positions = config.limit_visitors

/datum/job/assistant/get_access()
	return list()
