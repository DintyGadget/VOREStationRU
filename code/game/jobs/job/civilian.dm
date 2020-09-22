//Food

//////////////////////////////////
//			Bartender
//////////////////////////////////

/datum/job/bartender
	title = "Бармен"
	flag = BARTENDER
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Главой Персонала"
	selection_color = "#515151"
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_bar)

	outfit_type = /decl/hierarchy/outfit/job/service/bartender
	job_description = "Бармен смешивает напитки для экипажа. Как правило, у него есть разрешение взимать плату за напитки или отказывать в обслуживании непослушным посетителям."
	alt_titles = list("Бариста" = /datum/alt_title/barista)

// Bartender Alt Titles
/datum/alt_title/barista
	title = "Бариста"
	title_blurb = "В кафе работает Бариста, который подает экипажу в основном безалкогольные напитки. Как правило, у него есть разрешение взимать плату за напитки или отказывать в обслуживании непослушным посетителям."
	title_outfit = /decl/hierarchy/outfit/job/service/bartender/barista

//////////////////////////////////
//			   Chef
//////////////////////////////////

/datum/job/chef
	title = "Шеф-повар"
	flag = CHEF
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Главой Персонала"
	selection_color = "#515151"
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_kitchen)

	outfit_type = /decl/hierarchy/outfit/job/service/chef
	job_description = "Шеф-повар готовит еду для экипажа. Он обычно имеет разрешение взимать плату за еду или отказывать в обслуживании непослушным посетителям."
	alt_titles = list("Повар" = /datum/alt_title/cook)

// Chef Alt Titles
/datum/alt_title/cook
	title = "Повар"
	title_blurb = "У Повара есть же обязанности, хотя он может быть менее опытным."

//////////////////////////////////
//			Botanist
//////////////////////////////////

/datum/job/hydro
	title = "Ботаник"
	flag = BOTANIST
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Главой Персонала"
	selection_color = "#515151"
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_hydroponics)

	outfit_type = /decl/hierarchy/outfit/job/service/gardener
	job_description = "Ботаник выращивает растения для шеф-повара и бармена."
	alt_titles = list("Садовник" = /datum/alt_title/gardener)

//Botanist Alt Titles
/datum/alt_title/gardener
	title = "Садовник"
	title_blurb = "Садовник может быть менее профессионален, чем его коллеги, и с большей вероятностью будет ухаживать за отделом гидропоники, если он не нужен в другом месте."

//Cargo
//////////////////////////////////
//			Quartermaster
//////////////////////////////////
/datum/job/qm
	title = "Интендант"
	flag = QUARTERMASTER
	departments = list(DEPARTMENT_CARGO)
	sorting_order = 1 // QM is above the cargo techs, but below the HoP.
	departments_managed = list(DEPARTMENT_CARGO)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Главой Персонала"
	selection_color = "#9b633e"
	economic_modifier = 5
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)

	ideal_character_age = 40

	outfit_type = /decl/hierarchy/outfit/job/cargo/qm
	job_description = "Интендант управляет отделом снабжения, проверяя заказы на грузы и обеспечивая доставку товаров туда, где они необходимы."
	alt_titles = list("Начальник снабжения" = /datum/alt_title/supply_chief)

// Quartermaster Alt Titles
/datum/alt_title/supply_chief
	title = "Начальник снабжения"

//////////////////////////////////
//			Cargo Tech
//////////////////////////////////
/datum/job/cargo_tech
	title = "Грузчик"
	flag = CARGOTECH
	departments = list(DEPARTMENT_CARGO)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Интендантом и Главой Персонала"
	selection_color = "#7a4f33"
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_cargo, access_cargo_bot, access_mailsorting)

	outfit_type = /decl/hierarchy/outfit/job/cargo/cargo_tech
	job_description = "Грузчик заполняет и доставляет заказы на груз. Им рекомендуется вернуть доставленные ящики в грузовой шаттл, \
						потому что Центральное командование дает частичный возврат денег."

//////////////////////////////////
//			Shaft Miner
//////////////////////////////////

/datum/job/mining
	title = "Шахтер"
	flag = MINER
	departments = list(DEPARTMENT_CARGO)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Интендантом и Главой Персонала"
	selection_color = "#7a4f33"
	economic_modifier = 5
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_mining, access_cargo, access_mining_station, access_mailsorting)

	outfit_type = /decl/hierarchy/outfit/job/cargo/mining
	job_description = "Шахтер добывает и перерабатывает полезные ископаемые для доставки в те отделы, которые в них нуждаются."
	alt_titles = list("Бурильщик" = /datum/alt_title/drill_tech)

/datum/alt_title/drill_tech
	title = "Бурильщик"
	title_blurb = "Бурильщик специализируется на эксплуатации и обслуживании оборудования, необходимого для извлечения руды из жил глубоко под поверхностью."

//Service
//////////////////////////////////
//			Janitor
//////////////////////////////////
/datum/job/janitor
	title = "Уборщик"
	flag = JANITOR
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Главой Персонала"
	selection_color = "#515151"
	access = list(access_janitor, access_maint_tunnels)
	minimal_access = list(access_janitor, access_maint_tunnels)

	outfit_type = /decl/hierarchy/outfit/job/service/janitor
	job_description = "Уборщик следит за чистотой участка до тех пор, пока это не мешает активным местам преступления."
	alt_titles = list("Дворник" = /datum/alt_title/custodian)

// Janitor Alt Titles
/datum/alt_title/custodian
	title = "Дворник"

//More or less assistants
//////////////////////////////////
//			Librarian
//////////////////////////////////
/datum/job/librarian
	title = "Библиотекарь"
	flag = LIBRARIAN
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Главой Персонала"
	selection_color = "#515151"
	access = list(access_library, access_maint_tunnels)
	minimal_access = list(access_library)

	outfit_type = /decl/hierarchy/outfit/job/librarian
	job_description = "Библиотекарь курирует выбор книг в библиотеке, так, чтобы экипаж мог наслаждаться ими."
	alt_titles = list("Журналист" = /datum/alt_title/journalist, "Писатель" = /datum/alt_title/writer)

// Librarian Alt Titles
/datum/alt_title/journalist
	title = "Журналист"
	title_blurb = "Журналист использует библиотеку как оперативную базу, откуда он может сообщать новости происходящее на станции с помощью своей камеры."

/datum/alt_title/writer
	title = "Писатель"
	title_blurb = "Писатель использует библиотеку как тихое место, чтобы написать все, что он решит написать."

//////////////////////////////////
//		Internal Affairs Agent
//////////////////////////////////

//var/global/lawyer = 0//Checks for another lawyer //This changed clothes on 2nd lawyer, both IA get the same dreds.
/datum/job/lawyer
	title = "Агент внутренних дел"
	flag = LAWYER
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "должностными лицами компании NT и Корпоративными Правилами"
	selection_color = "#515151"
	economic_modifier = 7
	access = list(access_lawyer, access_sec_doors, access_maint_tunnels, access_heads)
	minimal_access = list(access_lawyer, access_sec_doors, access_heads)
	minimal_player_age = 7

	outfit_type = /decl/hierarchy/outfit/job/internal_affairs_agent
	job_description = "Агент внутренних дел следит за тем, чтобы экипаж следовал стандартной рабочей процедуре. Они также \
						обрабатывают жалобы на членов экипажа и могут доводить проблемы до сведения Центрального командования, \
						предполагая, что их документы в порядке."

/*
/datum/job/lawyer/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)
*/
