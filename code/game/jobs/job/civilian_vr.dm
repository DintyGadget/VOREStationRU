/datum/job/bartender
	pto_type = PTO_CIVILIAN

/datum/job/chef
	total_positions = 2 //IT TAKES A LOT TO MAKE A STEW
	spawn_positions = 2 //A PINCH OF SALT AND LAUGHTER, TOO
	pto_type = PTO_CIVILIAN

/datum/job/hydro
	spawn_positions = 2
	pto_type = PTO_CIVILIAN

/datum/job/qm
	pto_type = PTO_CARGO
	dept_time_required = 20

/datum/job/cargo_tech
	total_positions = 3
	spawn_positions = 3
	pto_type = PTO_CARGO

/datum/job/mining
	total_positions = 4
	spawn_positions = 4
	pto_type = PTO_CARGO

/datum/job/janitor //Lots of janitor substations on station.
	total_positions = 3
	spawn_positions = 3
	alt_titles = list("Дворник" = /datum/alt_title/custodian, "Сантехник" = /datum/alt_title/sanitation_tech, "Горничная" = /datum/alt_title/maid)
	pto_type = PTO_CIVILIAN

/datum/alt_title/sanitation_tech
	title = "Сантехник"

/datum/alt_title/maid
	title = "Горничная"

/datum/job/librarian
	total_positions = 2
	spawn_positions = 2
	alt_titles = list("Журналист" = /datum/alt_title/journalist, "Писатель" = /datum/alt_title/writer, "Историк" = /datum/alt_title/historian, "Профессор" = /datum/alt_title/professor)
	pto_type = PTO_CIVILIAN

/datum/alt_title/historian
	title = "Историк"
	title_blurb = "Историк использует библиотеку в качестве своей базы для записи важных событий, происходящих на станции."

/datum/alt_title/professor
	title = "Профессор"
	title_blurb = "Профессор использует библиотеку как персональную аудиторию для просвещения экипажа."

/datum/job/lawyer
	disallow_jobhop = TRUE
	pto_type = PTO_CIVILIAN

/datum/job/chaplain
	pto_type = PTO_CIVILIAN



//////////////////////////////////
//			Entertainer
//////////////////////////////////

/datum/job/entertainer
	title = "Аниматор"
	flag = ENTERTAINER
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Главой персонала"
	selection_color = "#515151"
	access = list(access_entertainment)
	minimal_access = list(access_entertainment)
	pto_type = PTO_CIVILIAN

	outfit_type = /decl/hierarchy/outfit/job/assistant
	job_description = "Аниматор отвечает за развлечение персонала! Ставьте спектакли, играйте музыку, пойте песни, рассказывайте истории или читайте свои любимые фанфики."
	alt_titles = list("Артист" = /datum/alt_title/performer, "Музыкант" = /datum/alt_title/musician, "Рабочий сцены" = /datum/alt_title/stagehand)

// Entertainer Alt Titles
/datum/alt_title/performer
	title = "Артист"
	title_blurb = "Артист -- понятие растяжимое! Актерское мастерство, танцы, вокал и так далее!"

/datum/alt_title/musician
	title = "Музыкант"
	title_blurb = "Музыкант - это тот, кто создаёт музыку! Петь, играть на музыкальных инструментах, слогать стихами - это ваше дело!"

/datum/alt_title/stagehand
	title = "Рабочий сцены"
	title_blurb = "Рабочий сцены обычно выполняет все, что не делают остальные артисты: управляет светом, ставнями, окнами или рассказывает что-либо через микрофон на сцену!"