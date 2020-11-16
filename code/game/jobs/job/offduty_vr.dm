//
// "Off-duty" jobs are for people who want to do nothing and have earned it.
//

/datum/job/offduty_civilian
	title = "Рабочий на отгуле"
	latejoin_only = TRUE
	timeoff_factor = -1
	total_positions = -1
	faction = "Station"
	departments = list(DEPARTMENT_OFFDUTY)
	supervisors = "...никем! Наслаждайтесь отдыхом"
	selection_color = "#9b633e"
	access = list(access_maint_tunnels)
	minimal_access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/assistant/worker
	job_description = "Работники на отгуле не имеют никакой ответственности или власти и посещают станцию только ради заслуженного отдыха."
	pto_type = PTO_CIVILIAN
	economic_modifier = 2

/datum/job/offduty_cargo
	title = "Грузчик на отгуле"
	latejoin_only = TRUE
	timeoff_factor = -1
	total_positions = -1
	faction = "Station"
	departments = list(DEPARTMENT_OFFDUTY)
	supervisors = "...никем! Наслаждайтесь отдыхом"
	selection_color = "#9b633e"
	access = list(access_maint_tunnels)
	minimal_access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/assistant/cargo
	job_description = "Работники на отгуле не имеют никакой ответственности или власти и посещают станцию только ради заслуженного отдыха."
	pto_type = PTO_CARGO
	economic_modifier = 2

/datum/job/offduty_engineering
	title = "Инженер на отгуле"
	latejoin_only = TRUE
	timeoff_factor = -1
	total_positions = -1
	faction = "Station"
	departments = list(DEPARTMENT_OFFDUTY)
	supervisors = "...никем! Наслаждайтесь отдыхом"
	selection_color = "#5B4D20"
	access = list(access_maint_tunnels, access_external_airlocks, access_construction)
	minimal_access = list(access_maint_tunnels, access_external_airlocks)
	outfit_type = /decl/hierarchy/outfit/job/assistant/engineer
	job_description = "Работники на отгуле не имеют никакой ответственности или власти и посещают станцию только ради заслуженного отдыха."
	pto_type = PTO_ENGINEERING
	economic_modifier = 5

/datum/job/offduty_medical
	title = "Врач на отгуле"
	latejoin_only = TRUE
	timeoff_factor = -1
	total_positions = -1
	faction = "Station"
	departments = list(DEPARTMENT_OFFDUTY)
	supervisors = "...никем! Наслаждайтесь отдыхом"
	selection_color = "#013D3B"
	access = list(access_maint_tunnels, access_external_airlocks)
	minimal_access = list(access_maint_tunnels, access_external_airlocks)
	outfit_type = /decl/hierarchy/outfit/job/assistant/medic
	job_description = "Работники на отгуле не имеют никакой ответственности или власти и посещают станцию только ради заслуженного отдыха."
	pto_type = PTO_MEDICAL
	economic_modifier = 5

/datum/job/offduty_science
	title = "Учёный на отгуле"
	latejoin_only = TRUE
	timeoff_factor = -1
	total_positions = -1
	faction = "Station"
	departments = list(DEPARTMENT_OFFDUTY)
	supervisors = "...никем! Наслаждайтесь отдыхом"
	selection_color = "#633D63"
	access = list(access_maint_tunnels)
	minimal_access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/assistant/scientist
	job_description = "Работники на отгуле не имеют никакой ответственности или власти и посещают станцию только ради заслуженного отдыха."
	pto_type = PTO_SCIENCE
	economic_modifier = 5

/datum/job/offduty_security
	title = "Офицер на отгуле"
	latejoin_only = TRUE
	timeoff_factor = -1
	total_positions = -1
	faction = "Station"
	departments = list(DEPARTMENT_OFFDUTY)
	supervisors = "...никем! Наслаждайтесь отдыхом"
	selection_color = "#601C1C"
	access = list(access_maint_tunnels)
	minimal_access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/assistant/officer
	job_description = "Работники на отгуле не имеют никакой ответственности или власти и посещают станцию только ради заслуженного отдыха."
	pto_type = PTO_SECURITY
	economic_modifier = 4

/datum/job/offduty_exploration
	title = "Искатель на отгуле"
	latejoin_only = TRUE
	timeoff_factor = -1
	total_positions = -1
	faction = "Station"
	departments = list(DEPARTMENT_OFFDUTY)
	supervisors = "...никем! Наслаждайтесь отдыхом"
	selection_color = "#999440"
	access = list(access_maint_tunnels, access_external_airlocks)
	minimal_access = list(access_maint_tunnels, access_external_airlocks)
	outfit_type = /decl/hierarchy/outfit/job/assistant/explorer
	job_description = "Работники на отгуле не имеют никакой ответственности или власти и посещают станцию только ради заслуженного отдыха."
	pto_type = PTO_EXPLORATION
	economic_modifier = 5
