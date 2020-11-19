/datum/job/captain
	disallow_jobhop = TRUE
	pto_type = PTO_CIVILIAN
	dept_time_required = 80 //Pending something more complicated
	alt_titles = list("Смотритель"= /datum/alt_title/overseer, "Руководитель станции" = /datum/alt_title/facility_director, "Главный супервайзер" = /datum/alt_title/chief_supervisor)

/datum/alt_title/facility_director
	title = "Руководитель станции"

/datum/alt_title/chief_supervisor
	title = "Главный супервайзер"


/datum/job/hop
	disallow_jobhop = TRUE
	pto_type = PTO_CIVILIAN
	departments = list(DEPARTMENT_COMMAND, DEPARTMENT_CIVILIAN)
	departments_managed = list(DEPARTMENT_CIVILIAN, DEPARTMENT_CARGO, DEPARTMENT_PLANET)
	dept_time_required = 60

	alt_titles = list("Менеджер экипажа" = /datum/alt_title/cro, "Директор по кадрам" = /datum/alt_title/deputy_manager, "Кадровый менеджер" = /datum/alt_title/staff_manager,
						"Замдиректор Колонии" = /datum/alt_title/facility_steward)

	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth)

/datum/alt_title/deputy_manager
	title = "Директор по кадрам"

/datum/alt_title/staff_manager
	title = "Кадровый менеджер"

/datum/alt_title/facility_steward
	title = "Замдиректор колонии"


/datum/job/secretary
	disallow_jobhop = TRUE
	pto_type = PTO_CIVILIAN
	alt_titles = list("Связист командования" = /datum/alt_title/command_liaison, "Секретарь мостика" = /datum/alt_title/bridge_secretary,
						"Ассистент командования" = /datum/alt_title/command_assistant, "Стажёр командования" = /datum/alt_title/command_intern)

/datum/alt_title/command_liaison
	title = "Связист командования"

/datum/alt_title/bridge_secretary
	title = "Секретарь мостика"

/datum/alt_title/command_assistant
	title = "Ассистент командования"

/datum/alt_title/command_intern
	title = "Стажёр командования"