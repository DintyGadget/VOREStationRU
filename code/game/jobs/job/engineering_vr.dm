/datum/job/chief_engineer
	disallow_jobhop = TRUE
	pto_type = PTO_ENGINEERING
	dept_time_required = 60

	access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)

	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)
	alt_titles = list("Старший инженер" = /datum/alt_title/head_engineer, "Главный конструктор" = /datum/alt_title/foreman, "Главный техобслуживающий" = /datum/alt_title/maintenance_manager)

/datum/alt_title/head_engineer
	title = "Старший инженер"

/datum/alt_title/foreman
	title = "Главный конструктор"

/datum/alt_title/maintenance_manager
	title = "Главный техобслуживающий"


/datum/job/engineer
	pto_type = PTO_ENGINEERING
	alt_titles = list("Ремонтник" = /datum/alt_title/maint_tech, "Инженер двигателей" = /datum/alt_title/engine_tech,
						"Электрик" = /datum/alt_title/electrician, "Инженер-конструктор" = /datum/alt_title/construction_engi)

/datum/alt_title/construction_engi
	title = "Инженер-конструктор"
	title_blurb = "Инженер-конструктор имеет схожие обязанности с остальными инженерами, но обычно проводит свободное время за постройкой дополнительных комнат \
					и ремонтом заброшенных мест."



/datum/job/atmos
	spawn_positions = 3
	pto_type = PTO_ENGINEERING
	alt_titles = list("Техобслуживающий атмосферы" = /datum/alt_title/atmos_maint, "Заведующий по выбросам" = /datum/alt_title/disposals_tech)

/datum/alt_title/atmos_maint
	title = "Техобслуживающий атмосферы"

/datum/alt_title/disposals_tech
	title = "Заведующий по выбросам"
	title_blurb = "Заведующий по выбросам занимается тем же, что и атмосферный техник, однако специализируется на работе системы выбросов."