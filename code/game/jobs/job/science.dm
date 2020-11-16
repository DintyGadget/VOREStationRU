//////////////////////////////////
//		Research Director
//////////////////////////////////
/datum/job/rd
	title = "Директор исследований"
	flag = RD
	departments_managed = list(DEPARTMENT_RESEARCH)
	departments = list(DEPARTMENT_RESEARCH, DEPARTMENT_COMMAND)
	sorting_order = 2
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Директором колонии"
	selection_color = "#AD6BAD"
	req_admin_notify = 1
	economic_modifier = 15
	access = list(access_rd, access_heads, access_tox, access_genetics, access_morgue,
			            access_tox_storage, access_teleporter, access_sec_doors,
			            access_research, access_robotics, access_xenobiology, access_ai_upload, access_tech_storage,
			            access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network)
	minimal_access = list(access_rd, access_heads, access_tox, access_genetics, access_morgue,
			            access_tox_storage, access_teleporter, access_sec_doors,
			            access_research, access_robotics, access_xenobiology, access_ai_upload, access_tech_storage,
			            access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network)

	minimum_character_age = 25
	minimal_player_age = 14
	ideal_character_age = 50

	outfit_type = /decl/hierarchy/outfit/job/science/rd
	job_description = "Директор исследований отвечает за научный отдел. От него требуется обеспечение безопасности всего персонала, \
						по крайней мере от всего, что связано с закрепленным за ними отделом. От них так же ожидается свовременное информирование персонала \
						об опасностях, источником которых может стать научный отдел. Директор исследований обладает достаточным знанием обо всех науках, касающихся \
						научного отдела, но ему рекомендуется позволить своим подручным выполнять свою работу самостоятельно."
	alt_titles = list("Научный руководитель" = /datum/alt_title/research_supervisor)

// Research Director Alt Titles
/datum/alt_title/research_supervisor
	title = "Научный руководитель"

//////////////////////////////////
//			Scientist
//////////////////////////////////
/datum/job/scientist
	title = "Учёный"
	flag = SCIENTIST
	departments = list(DEPARTMENT_RESEARCH)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 5
	spawn_positions = 3
	supervisors = "Директором исследований"
	selection_color = "#633D63"
	economic_modifier = 7
	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_xenoarch)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenoarch)

	minimal_player_age = 14

	outfit_type = /decl/hierarchy/outfit/job/science/scientist
	job_description = "Ученый — общее название профессий, связанных с научным отделом. Они обладают общим знанием о принципах и процессах, связанных с исследованиями и разработками, \
						а также об их экспериментальной проверке и применении."
	alt_titles = list("Ксеноархеолог" = /datum/alt_title/xenoarch, "Аномалист" = /datum/alt_title/anomalist, \
						"Исследователь форона" = /datum/alt_title/phoron_research)

// Scientist Alt Titles
/datum/alt_title/xenoarch
	title = "Ксеноархеолог"
	title_blurb = "Ксеноархеолог посещает места раскопок в поисках артефактов инопланетного происхождения. Эти места часто встречаются в вакууме и других необитаемых \
					местностях, и в связи с этим ксеноархеолог должен быть способен выдержать суровые условия среды."

/datum/alt_title/anomalist
	title = "Аномалист"
	title_blurb = "Аномалистом называется учёный, занимающийся исследованием и анализом инопланетных артефактов. Они знакомы с большинством наиболее распространненых методов \
					изучения принципов действия артефактов. Они работают вместе с ксеноархеологами или шахтерами, если таковые присутствуют на станции."

/datum/alt_title/phoron_research
	title = "Исследователь форона"
	title_blurb = "Исследователь форона специализируется на практическом применении форона и обладает знанием о его эксплуатации и связанных с ней рисков. \
					Многие исследователи форона заинтересованы во взрывных свойствах газообразного форона и его практическом применении в добыче руд."

//////////////////////////////////
//			Xenobiologist
//////////////////////////////////
/datum/job/xenobiologist
	title = "Ксенобиолог"
	flag = XENOBIOLOGIST
	departments = list(DEPARTMENT_RESEARCH)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 3
	spawn_positions = 2
	supervisors = "Директором исследований"
	selection_color = "#633D63"
	economic_modifier = 7
	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_hydroponics)
	minimal_access = list(access_research, access_xenobiology, access_hydroponics, access_tox_storage)

	minimal_player_age = 14

	outfit_type = /decl/hierarchy/outfit/job/science/xenobiologist
	job_description = "Ксенобиолог изучает инопланетные формы жизни в относительно безопасных лабораторных условиях. Они ищут способы практического применения \
						остаточных продуктов этих форм жизни, и на данный момент их основной интерес — Гигантский Слизень."
/*VR edit start
	alt_titles = list("Ксеноботаник" = /datum/alt_title/xenobot)

 Xenibiologist Alt Titles
/datum/alt_title/xenobot
	title = "Ксеноботаник"
	title_blurb = "A Xenobotanist grows and cares for a variety of abnormal, custom made, and frequently dangerous plant life. When the products of these plants \
					is both safe and beneficial to the station, they may choose to introduce it to the rest of the crew."
VR edit end*/

//////////////////////////////////
//			Roboticist
//////////////////////////////////
/datum/job/roboticist
	title = "Робототехник"
	flag = ROBOTICIST
	departments = list(DEPARTMENT_RESEARCH)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Директором исследований"
	selection_color = "#633D63"
	economic_modifier = 5
	access = list(access_robotics, access_tox, access_tox_storage, access_tech_storage, access_morgue, access_research) //As a job that handles so many corpses, it makes sense for them to have morgue access.
	minimal_access = list(access_robotics, access_tech_storage, access_morgue, access_research) //As a job that handles so many corpses, it makes sense for them to have morgue access.
	minimal_player_age = 7

	outfit_type = /decl/hierarchy/outfit/job/science/roboticist
	job_description = "Робототехник занимается обслуживанием и починкой всей синтетики станции, включая персонал с протезами. \
						Они также могут помочь станции производством как простейших роботов, так и пилотируемых экзокостюмов."
	alt_titles = list("Инженер-биомеханик" = /datum/alt_title/biomech, "Инженер-мехатроник" = /datum/alt_title/mech_tech)

// Roboticist Alt Titles
/datum/alt_title/biomech
	title = "Инженер-биомеханик"
	title_blurb = "Инженер-биомеханик работает в первую очередь над протезами, а также сопряженными с ними органическими частями тела. \
					У него могут быть знания об относительно простых хирургических операциях, необходимых для создания киборгов или присоединения протезов."

/datum/alt_title/mech_tech
	title = "Инженер-мехатроник"
	title_blurb = "Инженер-мехатроник специализируется на сооружении и обслуживании экзокостюмов, и разбирается в их применении. \
					При необходимости он может также работать и над синтетикой или протезами."