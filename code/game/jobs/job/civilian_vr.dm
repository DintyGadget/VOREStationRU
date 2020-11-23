/datum/job/bartender
	pto_type = PTO_CIVILIAN
	alt_titles = list("Бариста" = /datum/alt_title/barista, "Миксолог" = /datum/alt_title/mixologist)

/datum/alt_title/mixologist
	title = "Миксолог"


/datum/job/chef
	total_positions = 2 //IT TAKES A LOT TO MAKE A STEW
	spawn_positions = 2 //A PINCH OF SALT AND LAUGHTER, TOO
	pto_type = PTO_CIVILIAN
	alt_titles = list("Су-шеф" = /datum/alt_title/souschef,"Повар" = /datum/alt_title/cook, "Кухонный работник" = /datum/alt_title/kitchen_worker)

/datum/alt_title/souschef
	title = "Су-шеф"

/datum/alt_title/kitchen_worker
	title = "Кухонный работник"
	title_blurb = "Кухонный работник выполняет те же обязанности, что и повар, однако менее опытен."


/datum/job/hydro
	spawn_positions = 2
	pto_type = PTO_CIVILIAN
	alt_titles = list("Гидропонист" = /datum/alt_title/hydroponicist, "Культиватор" = /datum/alt_title/cultivator, "Фермер" = /datum/alt_title/farmer,
						"Садовник" = /datum/alt_title/gardener, "Флорист" = /datum/alt_title/florsit)

/datum/alt_title/hydroponicist
	title = "Гидропонист"

/datum/alt_title/cultivator
	title = "Культиватор"

/datum/alt_title/farmer
	title = "Фермер"

/datum/alt_title/florsit
	title = "Флорист"
	title_blurb = "Флорист менее опытен, и, вероятнее всего, присматривает за общим ботаническим садом, если от него ничего не требуется."


/datum/job/qm
	pto_type = PTO_CARGO
	dept_time_required = 20
	alt_titles = list("Начальник снабжения" = /datum/alt_title/supply_chief, "Менеджер логистики" = /datum/alt_title/logistics_manager)

/datum/alt_title/logistics_manager
	title = "Менеджер логистики"


/datum/job/cargo_tech
	total_positions = 3
	spawn_positions = 3
	pto_type = PTO_CARGO
	alt_titles = list("Погрузчик" = /datum/alt_title/cargo_loader, "Поставщик груза" = /datum/alt_title/cargo_handler, "Курьер" = /datum/alt_title/supply_courier,
					"Сортировщик" = /datum/alt_title/disposal_sorter)

/datum/alt_title/supply_courier
	title = "Курьер"
	title_blurb = "На плечи курьера обычно возлагается обязанность доставлять полученный груз по месту назначения."

/datum/alt_title/cargo_loader
	title = "Погрузчик"
	title_blurb = "Погрузчик обычно занимается более скучной работой в отделе снабжения - разгрузкой и возвратом ящиков."

/datum/alt_title/cargo_handler
	title = "Поставщик груза"
	title_blurb = "Поставщик груза обычно занимается более скучной работой в отделе снабжения - разгрузкой и возвратом ящиков."

/datum/alt_title/disposal_sorter
	title = "Сортировщик"
	title_blurb = "Сортировщик обычно занимается сортировкой того, что приходит по трубам, а также доставкой посылок в нужные отделы."


/datum/job/mining
	total_positions = 4
	spawn_positions = 4
	pto_type = PTO_CARGO
	alt_titles = list("Шахтёр астероидов" = /datum/alt_title/deep_space_miner, "Бурильщик" = /datum/alt_title/drill_tech, "Старатель" = /datum/alt_title/prospector)

/datum/alt_title/deep_space_miner
	title = "Шахтёр астероидов"
	title_blurb = "Шахтёр астероидов специализируется на добыче руд в вакууме, а именно на астероидах."

/datum/alt_title/prospector
	title = "Старатель"


/datum/job/janitor //Lots of janitor substations on station.
	total_positions = 3
	spawn_positions = 3
	pto_type = PTO_CIVILIAN
	alt_titles = list("Дворник" = /datum/alt_title/custodian, "Сантехник" = /datum/alt_title/sanitation_tech,
					"Горничная" = /datum/alt_title/maid, "Мусорщик" = /datum/alt_title/garbage_collector)

/datum/alt_title/sanitation_tech
	title = "Сантехник"

/datum/alt_title/maid
	title = "Горничная"

/datum/alt_title/garbage_collector
	title = "Мусорщик"
	title_blurb = "Мусорщик специализируется на более крупном мусоре. Влажная чистка для него на втором плане."


/datum/job/librarian
	total_positions = 2
	spawn_positions = 2
	alt_titles = list("Журналист" = /datum/alt_title/journalist, "Репортёр" =  /datum/alt_title/reporter, "Писатель" = /datum/alt_title/writer,
					"Историк" = /datum/alt_title/historian, "Архивист" = /datum/alt_title/archivist, "Профессор" = /datum/alt_title/professor,
					"Преподаватель" = /datum/alt_title/academic, "Философ" = /datum/alt_title/philosopher)
	pto_type = PTO_CIVILIAN

/datum/alt_title/reporter
	title = "Репортёр"
	title_blurb = "Репортёр использует библиотеку как оперативную базу, откуда он может сообщать новости и происходящее на станции с помощью своей камеры."

/datum/alt_title/historian
	title = "Историк"
	title_blurb = "Историк использует библиотеку в качестве своей базы для записи важных событий, происходящих на станции."

/datum/alt_title/archivist
	title = "Архивист"
	title_blurb = "Архивист использует библиотеку в качестве своей базы для записи важных событий, происходящих на станции."

/datum/alt_title/professor
	title = "Профессор"
	title_blurb = "Профессор использует библиотеку как персональную аудиторию для просвещения экипажа."

/datum/alt_title/academic
	title = "Преподаватель"
	title_blurb = "Преподаватель использует библиотеку как персональную аудиторию для просвещения экипажа."

/datum/alt_title/philosopher
	title = "Философ"
	title_blurb = "Философ использует библиотеку как форум для рассуждений о величайших вопросах жизни и их обсуждения с экипажем."


/datum/job/lawyer
	disallow_jobhop = TRUE
	pto_type = PTO_CIVILIAN
	alt_titles = list("Связист внутренних дел" = /datum/alt_title/ia_liaison, "Делегат внутренних дел" = /datum/alt_title/ia_delegate,
						"Следователь внутренних дел" = /datum/alt_title/ia_investigator)

/datum/alt_title/ia_liaison
	title = "Связист внутренних дел"

/datum/alt_title/ia_delegate
	title = "Делегат внутренних дел"

/datum/alt_title/ia_investigator
	title = "Следователь внутренних дел"


/datum/job/chaplain
	pto_type = PTO_CIVILIAN
	alt_titles = list("Миссионер" = /datum/alt_title/missionary, "Проповедник" = /datum/alt_title/preacher, "Гуру" = /datum/alt_title/guru)

/datum/alt_title/guru
	title = "Гуру"
	title_blurb = "Гуру в общих чертах предоставляет духовный совет тем, кто в нём нуждается."

/datum/alt_title/missionary
	title = "Миссионер"

/datum/alt_title/preacher
	title = "Проповедник"



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
	alt_titles = list("Артист" = /datum/alt_title/performer, "Музыкант" = /datum/alt_title/musician, "Рабочий сцены" = /datum/alt_title/stagehand,
						"Актёр" = /datum/alt_title/actor, "Танцор" = /datum/alt_title/dancer, "Певец" = /datum/alt_title/singer,
						"Фокусник" = /datum/alt_title/magician, "Комедиант" = /datum/alt_title/comedian, "Трагик" = /datum/alt_title/tragedian)

// Entertainer Alt Titles
/datum/alt_title/actor
	title = "Актёр"
	title_blurb = "Актёр отыгрывает роли! Каким бы ни был его персонаж, он должен полностью в него влиться и впечатлять людей силой трагедии и комедии!"

/datum/alt_title/performer
	title = "Артист"
	title_blurb = "Артист - понятие растяжимое! Актерское мастерство, танцы, вокал и так далее!"

/datum/alt_title/musician
	title = "Музыкант"
	title_blurb = "Музыкант - это тот, кто создаёт музыку! Петь, играть на музыкальных инструментах, слогать стихами - это ваше дело!"

/datum/alt_title/stagehand
	title = "Рабочий сцены"
	title_blurb = "Рабочий сцены обычно выполняет все, что не делают остальные артисты: управляет светом, ставнями, окнами или рассказывает что-либо через микрофон на сцену!"

/datum/alt_title/dancer
	title = "Танцор"
	title_blurb = "Танцор впечатляет людей своим телом! От вальса до брейкданса, лишь бы публика была довольна."

/datum/alt_title/singer
	title = "Певец"
	title_blurb = "Певец одарён мелодичным голосом! Впечатлите людей своим вокалом!"

/datum/alt_title/magician
	title = "Фокусник"
	title_blurb = "Фокусник поражает своих зрителей невозможными трюками. Демонстрируйте свой репертуар, оставляя секрет фокусов за кулисами!"

/datum/alt_title/comedian
	title = "Комедиант"
	title_blurb = "Комедиант поднимает людям настроение при помощи юмора и острого ума! Анекдоты, стендапы, лишь бы люди улыбались!"

/datum/alt_title/tragedian
	title = "Трагик"
	title_blurb = "Трагик специализируется на донесении до людей мыслей о жизни и о мире вокруг них самих. Жизнь - трагедия, и кто же лучше Вас передаст её эмоции?"