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
	name = "identification card"
	desc = "Карта, выданная геологоразведочным работникам станции."
	icon_state = "cyan"
	primary_color = rgb(47,189,189)
	secondary_color = rgb(127,223,223)

/obj/item/weapon/card/id/explorer/head
	name = "identification card"
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
	departments_managed = list(DEPARTMENT_PLANET, DEPARTMENT_COMMAND)
	sorting_order = 1 // above the other explorers
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Главой Персонала"
	selection_color = "#d6d05c"
	economic_modifier = 8
	minimal_player_age = 7
	pto_type = PTO_EXPLORATION
	dept_time_required = 20

	access = list(access_eva, access_maint_tunnels, access_external_airlocks, access_pilot, access_explorer, access_gateway)
	minimal_access = list(access_eva, access_maint_tunnels, access_external_airlocks, access_pilot, access_explorer, access_gateway)
	outfit_type = /decl/hierarchy/outfit/job/pathfinder
	job_description = "Работа Первопроходца заключается в том, чтобы руководить и управлять экспедициями, и он является главным руководителем всех выездных экспедиций."

/datum/alt_title/pathfinder
	title = "Первопроходец"

/datum/job/pilot
	title = "Пилот"
	flag = PILOT
	departments = list(DEPARTMENT_PLANET)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Следопытом и Главой Персонала"
	selection_color = "#999440"
	economic_modifier = 5
	minimal_player_age = 3
	pto_type = PTO_EXPLORATION
	access = list(access_pilot)
	minimal_access = list(access_pilot)
	outfit_type = /decl/hierarchy/outfit/job/pilot
	job_description = "Пилот управляет различными шаттлами в системе Дева-Эригон."

/datum/alt_title/pilot
	title = "Пилот"

/datum/job/explorer
	title = "Искатель"
	flag = EXPLORER
	departments = list(DEPARTMENT_PLANET)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Следопытом и Главой Персонала"
	selection_color = "#999440"
	economic_modifier = 6
	pto_type = PTO_EXPLORATION
	access = list(access_explorer, access_external_airlocks, access_eva)
	minimal_access = list(access_explorer, access_external_airlocks, access_eva)
	outfit_type = /decl/hierarchy/outfit/job/explorer2
	job_description = "Искатель ищет интересные вещи и возвращает их на станцию."

/datum/alt_title/explorer
	title = "Искатель"

/datum/job/sar
	title = "Военврач"
	flag = SAR
	departments = list(DEPARTMENT_PLANET, DEPARTMENT_MEDICAL)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Первопроходцем и Главврачом"
	selection_color = "#999440"
	economic_modifier = 6
	minimal_player_age = 3
	pto_type = PTO_EXPLORATION
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_eva, access_maint_tunnels, access_external_airlocks, access_pilot)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_pilot)
	outfit_type = /decl/hierarchy/outfit/job/medical/sar
	job_description = "Военврач работает полевым врачом экспедиционных отрядов."

/datum/alt_title/field_medic
	title = "Военврач"

/datum/job/offduty_exploration
	title = "Off-duty Explorer"
	latejoin_only = TRUE
	timeoff_factor = -1
	total_positions = -1
	faction = "Station"
	departments = list(DEPARTMENT_OFFDUTY)
	supervisors = "nobody! Enjoy your time off"
	selection_color = "#999440"
	access = list(access_maint_tunnels, access_external_airlocks)
	minimal_access = list(access_maint_tunnels, access_external_airlocks)
	outfit_type = /decl/hierarchy/outfit/job/assistant/explorer
	job_description = "Off-duty crew has no responsibilities or authority and is just there to spend their well-deserved time off."
	pto_type = PTO_EXPLORATION
	economic_modifier = 5

/datum/alt_title/offduty_exp
	title = "Off-duty Explorer"
