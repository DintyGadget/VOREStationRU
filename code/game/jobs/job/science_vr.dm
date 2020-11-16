/datum/job/rd
	disallow_jobhop = TRUE
	pto_type = PTO_SCIENCE
	dept_time_required = 60

	access = list(access_rd, access_heads, access_tox, access_genetics, access_morgue,
			            access_tox_storage, access_teleporter,
			            access_research, access_robotics, access_xenobiology, access_ai_upload, access_tech_storage,
			            access_RC_announce, access_keycard_auth, access_tcomsat, access_xenoarch, access_eva, access_network, access_xenobotany)
	minimal_access = list(access_rd, access_heads, access_tox, access_genetics, access_morgue,
			            access_tox_storage, access_teleporter,
			            access_research, access_robotics, access_xenobiology, access_ai_upload, access_tech_storage,
			            access_RC_announce, access_keycard_auth, access_tcomsat, access_xenoarch, access_eva, access_network, access_xenobotany)
	alt_titles = list("Научный руководитель" = /datum/alt_title/research_supervisor, "Менеджер исследований" = /datum/alt_title/research_manager,
						"Главный технолог" = /datum/alt_title/head_of_development,"Старший учёный" = /datum/alt_title/head_scientist)

/datum/alt_title/research_manager
	title = "Менеджер исследований"

/datum/alt_title/head_of_development
	title = "Главный технологий"

/datum/alt_title/head_scientist
	title = "Старший учёный"


/datum/job/scientist
	spawn_positions = 5
	pto_type = PTO_SCIENCE
	alt_titles = list("Лаборант" = /datum/alt_title/lab_assistant, "Ксеноархеолог" = /datum/alt_title/xenoarch, "Ксенопалеонтолог" = /datum/alt_title/xenopaleontologist, \
						"Аномалист" = /datum/alt_title/anomalist, "Исследователь форона" = /datum/alt_title/phoron_research, \
						"Программист микросхем" = /datum/alt_title/circuit_designer)


	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_xenoarch, access_xenobotany)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenoarch)					// Unchanged (for now?), mostly here for reference

/datum/alt_title/lab_assistant
	title = "Лаборант"
	title_blurb = "Лаборант -- самый младший по званию ученый, чья работа состоит в оказании помощи другим ученым и вместе с этим набирании опыта."

/datum/alt_title/xenopaleontologist
	title = "Ксенопалеонтолог"
	title_blurb = "Ксенопалеонтолог посещает места раскопок в поисках артефактов инопланетного происхождения. Эти места часто встречаются в вакууме и других необитаемых \
					местностях, и в связи с этим ксенопалеонтолог должен быть способен выдержать суровые условия среды."

/datum/alt_title/circuit_designer
	title = "Программист микросхем"
	title_blurb = "Программист микросхем является учёным, который специализируется на разработке интегральных микросхем. Он знаком с принципами работы этих схем и их программирования. \
				   Используя их возможности, программист создаёт всевозможные полезные гаджеты."

/datum/job/xenobiologist
	spawn_positions = 3
	pto_type = PTO_SCIENCE
	alt_titles = list("Ксенозоолог" = /datum/alt_title/xenozoologist, "Ксеноантрополог" = /datum/alt_title/xenoanthropologist)

/datum/alt_title/xenozoologist
	title = "Ксенозоолог"

/datum/alt_title/xenoanthropologist
	title = "Ксеноантрополог"
	title_blurb = "Ксеноантрополог также изучает инопланетные формы жизни, однако специализируется именно на разумных."

//////////////////////////////////
//			Xenobotanist
//////////////////////////////////
/datum/job/xenobotanist
	title = "Ксеноботаник"
	flag = XENOBOTANIST
	departments = list(DEPARTMENT_RESEARCH)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Директором Исследований"
	selection_color = "#633D63"
	economic_modifier = 7
	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobotany, access_hydroponics)
	minimal_access = list(access_research, access_xenobotany, access_hydroponics, access_tox_storage)
	pto_type = PTO_SCIENCE

	minimal_player_age = 14

	outfit_type = /decl/hierarchy/outfit/job/science/xenobiologist
	job_description = "Ксеноботаник выращивает и ухаживает за ассортиментом необычайных и порой даже опасных растений. \
					Если результаты таких экспериментов безопасны и даже полезны для персонала, ксеноботаник может поделиться своей находкой с остальным персоналом."
	alt_titles = list("Ксенофлорист" = /datum/alt_title/xenoflorist)

/datum/alt_title/xenoflorist
	title = "Ксенофлорист"
