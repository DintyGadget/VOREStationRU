var/const/PATHFINDER 		=(1<<11)
var/const/EXPLORER 			=(1<<12)
var/const/PILOT 			=(1<<13)
var/const/SAR 				=(1<<14)

/obj/item/weapon/card/id/medical/sar
	assignment = "Военврач"
	rank = "Военврач"
	icon_state = "cyan"
	primary_color = rgb(47,189,189)
	secondary_color = rgb(127,223,223)

/obj/item/weapon/card/id/explorer
	name = "идентификационная карта"
	desc = "Карта, выданная геологоразведочным работникам станции."
	icon_state = "cyan"
	primary_color = rgb(47,189,189)
	secondary_color = rgb(127,223,223)

/obj/item/weapon/card/id/explorer/head
	name = "идентификационная карта"
	desc = "Карта, которая представляет открытие неизвестного."
	icon_state = "cyanGold"
	primary_color = rgb(47,189,189)
	secondary_color = rgb(127,223,223)

/datum/department/planetside
	name = DEPARTMENT_PLANET
	color = "#bab421"
	sorting_order = 2 // Same as cargo in importance.



/datum/job/pathfinder
	title = "Первопроходец"
	flag = PATHFINDER
	departments = list(DEPARTMENT_PLANET)
	departments_managed = list(DEPARTMENT_PLANET)
	sorting_order = 1 // above the other explorers
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Главой персонала"
	selection_color = "#d6d05c"
	economic_modifier = 8
	minimal_player_age = 7
	pto_type = PTO_EXPLORATION
	dept_time_required = 20

	access = list(access_eva, access_maint_tunnels, access_external_airlocks, access_pilot, access_explorer, access_gateway)
	minimal_access = list(access_eva, access_maint_tunnels, access_external_airlocks, access_pilot, access_explorer, access_gateway)
	outfit_type = /decl/hierarchy/outfit/job/pathfinder
	job_description = "Работа Первопроходца заключается в проведении экспедиций, в которых он занимает роль лидера."
	alt_titles = list("Ведущий скаут" = /datum/alt_title/expedition_lead, "Руководитель экспедиций" = /datum/alt_title/exploration_manager)

/datum/alt_title/expedition_lead
	title = "Ведущий скаут"

/datum/alt_title/exploration_manager
	title = "Руководитель экспедиций"


/datum/job/pilot
	title = "Пилот"
	flag = PILOT
	departments = list(DEPARTMENT_PLANET)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Первопроходцем и Главой персонала"
	selection_color = "#999440"
	economic_modifier = 5
	minimal_player_age = 3
	pto_type = PTO_EXPLORATION
	access = list(access_pilot)
	minimal_access = list(access_pilot)
	outfit_type = /decl/hierarchy/outfit/job/pilot
	job_description = "Пилот управляет различными шаттлами в системе Дева-Эригон."
	alt_titles = list("Военный пилот" = /datum/alt_title/co_pilot, "Navigator" = /datum/alt_title/navigator)

/datum/alt_title/co_pilot
	title = "Военный пилот"
	title_blurb = "A Co-Pilot is there primarily to assist main pilot as well as learn from them"

/datum/alt_title/navigator
	title = "Navigator"


/datum/job/explorer
	title = "Искатель"
	flag = EXPLORER
	departments = list(DEPARTMENT_PLANET)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Первопроходцем и Главой персонала"
	selection_color = "#999440"
	economic_modifier = 6
	pto_type = PTO_EXPLORATION
	access = list(access_explorer, access_external_airlocks, access_eva)
	minimal_access = list(access_explorer, access_external_airlocks, access_eva)
	outfit_type = /decl/hierarchy/outfit/job/explorer2
	job_description = "Искатель ищет на планетах интересные вещи и приносит их на станцию."
	alt_titles = list("Surveyor" = /datum/alt_title/surveyor, "Offsite Scout" = /datum/alt_title/offsite_scout)

/datum/alt_title/surveyor
	title = "Surveyor"

/datum/alt_title/offsite_scout
	title = "Offsite Scout"


/datum/job/sar
	title = "Военврач"
	flag = SAR
	departments = list(DEPARTMENT_PLANET, DEPARTMENT_MEDICAL)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Pathfinder and the Chief Medical Officer"
	selection_color = "#999440"
	economic_modifier = 6
	minimal_player_age = 3
	pto_type = PTO_EXPLORATION
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_eva, access_maint_tunnels, access_external_airlocks, access_pilot)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_pilot)
	outfit_type = /decl/hierarchy/outfit/job/medical/sar
	job_description = "A Field medic works as the field doctor of expedition teams."
	alt_titles = list("Expedition Medic" = /datum/alt_title/expedition_medic)

/datum/alt_title/expedition_medic
	title = "Expedition Medic"
