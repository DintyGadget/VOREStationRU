/obj/item/clothing/shoes/boots
	name = "Обувь"
	desc = "Обыкновенная обувь."
	icon_state = "workboots"
	force = 3
	can_hold_knife = 1
	step_volume_mod = 1.2
	drop_sound = 'sound/items/drop/boots.ogg'

/obj/item/clothing/shoes/boots/cowboy
	name = "Ковбойские сапоги"
	desc = "Не хватает только лошади из дюрастали."
	icon_state = "cowboy"
	drop_sound = 'sound/items/drop/leather.ogg'

/obj/item/clothing/shoes/boots/cowboy/classic
	name = "Классические ковбойские сапоги"
	desc = "Классический фасон надёжных ковбойских сапог."
	icon_state = "cowboy_classic"

/obj/item/clothing/shoes/boots/cowboy/snakeskin
	name = "Змеиные ковбойские сапоги"
	desc = "Пара ковбойских сапог, изготовленная из кожи питона."
	icon_state = "cowboy_snakeskin"

/obj/item/clothing/shoes/boots/jackboots
	name = "Сапоги"
	desc = "Пара стандартных сапог службы безопасности, предназначенных для боевых действий."
	icon_state = "jackboots"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 15, bomb = 20, bio = 0, rad = 0)
	siemens_coefficient = 0.7
	drop_sound = 'sound/items/drop/boots.ogg'
	pickup_sound = 'sound/items/pickup/boots.ogg'

/obj/item/clothing/shoes/boots/jackboots/toeless
	name = "Беспалые сапоги"
	desc = "Видоизмёненная пара боевых сапог, предназначенная для рас, обладающих когтями."
	icon_state = "digiboots"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	species_restricted = null

/obj/item/clothing/shoes/boots/jackboots/knee
	name = "Сапоги по колени"
	desc = "Более высокие сапоги из синтетической кожи, сияющие искусственным глянцем."
	icon_state = "kneeboots"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")

/obj/item/clothing/shoes/boots/jackboots/toeless/knee
	name = "Беспалые сапоги по колени"
	desc = "Видоизменённая пара более высоких боевых сапог, предназначенная для рас, обладающих когтями."
	icon_state = "digikneeboots"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	species_restricted = null

/obj/item/clothing/shoes/boots/jackboots/thigh
	name = "Сапоги по бёдра"
	desc = "Ещё более высокие сапоги из синтетической кожи, сияющие искусственным глянцем."
	icon_state = "thighboots"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")

/obj/item/clothing/shoes/boots/jackboots/toeless/thigh
	name = "Беспалые сапоги по бёдра"
	desc = "Видоизменённая пара ещё более высоких боевых сапог, предназначенная для рас, обладающих когтями."
	icon_state = "digithighboots"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	species_restricted = null

/obj/item/clothing/shoes/boots/workboots
	name = "Рабочие ботинки"
	desc = "Пара ботинок, упрочнённых сталью и защищающих пальцы в рабочих условиях."
	icon_state = "workboots"
	armor = list(melee = 40, bullet = 0, laser = 0, energy = 15, bomb = 20, bio = 0, rad = 20)
	siemens_coefficient = 0.7
	drop_sound = 'sound/items/drop/boots.ogg'
	pickup_sound = 'sound/items/pickup/boots.ogg'

/obj/item/clothing/shoes/boots/workboots/toeless
	name = "Беспалые рабочие ботинки"
	desc = "Пара рабочих ботинок без пальцев, защищающих ноги в рабочих условиях и видоизмененных для рас, обладающих когтями."
	icon_state = "workbootstoeless"
	item_state_slots = list(slot_r_hand_str = "workboots", slot_l_hand_str = "workboots")
	species_restricted = null

/obj/item/clothing/shoes/boots/winter
	name = "Зимние ботинки"
	desc = "Ботинки с подбивкой из 'синтетической' шерсти."
	icon_state = "winterboots"
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE
	snow_speed = -1
	step_volume_mod = 0.8

/obj/item/clothing/shoes/boots/winter/security
	name = "Зимние ботинки службы безопасности"
	desc = "Пара зимних ботинок. Эти подбиты серой шерстью и окрашены в дерзкий красный цвет."
	icon_state = "winterboots_sec"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 15, bomb = 20, bio = 0, rad = 0)

/obj/item/clothing/shoes/boots/winter/science
	name = "Зимние ботинки учёного"
	desc = "Пара зимних ботинок. Эти подбиты белой шерстью и пронизаны духом науки!"
	icon_state = "winterboots_sci"

/obj/item/clothing/shoes/boots/winter/command
	name = "Зимние ботинки Директора колонии"
	desc = "Пара зимних ботинок. Эти подбиты тёмной шерстью, а края окрашены в цвет превосходства."
	icon_state = "winterboots_cap"

/obj/item/clothing/shoes/boots/winter/engineering
	name = "Зимние ботинки инженера"
	desc = "Пара зимних ботинок. Эти подбиты оранжевой шерстью, а края окрашены в цвет катастрофы."
	icon_state = "winterboots_eng"

/obj/item/clothing/shoes/boots/winter/atmos
	name = "Зимние ботинки атмосферщика"
	desc = "Пара зимних ботинок. Эти подбиты бежевой шерстью, а края окрашены в цвет свежего воздуха."
	icon_state = "winterboots_atmos"

/obj/item/clothing/shoes/boots/winter/medical
	name = "Зимние ботинки врача"
	desc = "Пара зимних ботинок. Эти подбиты белой шерстью, а края окрашены в цвет 30 единиц дексалина."
	icon_state = "winterboots_med"

/obj/item/clothing/shoes/boots/winter/mining
	name = "Зимние ботинки шахтёра"
	desc = "Пара зимних ботинок. Эти подбиты сероватой шерстью, а края золотого цвета!"
	icon_state = "winterboots_mining"

/obj/item/clothing/shoes/boots/winter/supply
	name = "Зимние ботинки грузчика"
	desc = "Пара зимних ботинок. Края этих ботинок окрашены в цвета Каргонии!"
	icon_state = "winterboots_sup"

/obj/item/clothing/shoes/boots/winter/hydro
	name = "Зимние ботинки ботаника"
	desc = "Пара зимних ботинок. Эти подбиты коричневой шерстью, а края окрашены в цвет амброзии."
	icon_state = "winterboots_hydro"

/obj/item/clothing/shoes/boots/winter/explorer
	name = "Зимние ботинки искателя"
	desc = "Укреплённые сталью зимние ботинки для добычи руд или исследований в суровых условиях. Помогают держать пальцы в тепле и под защитой."
	icon_state = "explorer"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 15, bomb = 20, bio = 0, rad = 0)

// Allows the wearer to climb cliffs, which could allow for shortcuts or sequence-breaking.
/obj/item/clothing/shoes/boots/winter/climbing
	name = "Альпинистские зимние ботинки"
	desc = "Пара зимних ботинок с металлическими подошвами, способствующими при скалолазаньи."
	icon_state = "climbing_boots"
	rock_climbing = TRUE

/obj/item/clothing/shoes/boots/tactical
	name = "Тактические ботинки"
	desc = "Бежевые ботинки с бронированным подслоем."
	icon_state = "jungle"
	armor = list(melee = 40, bullet = 30, laser = 40,energy = 25, bomb = 50, bio = 0, rad = 0)
	siemens_coefficient = 0.7

/obj/item/clothing/shoes/boots/duty
	name = "Служебные ботинки"
	desc = "Пара укрепленных сталью ботинок из синтетической кожи, отполированных до блеска."
	icon_state = "duty"
	armor = list(melee = 40, bullet = 0, laser = 0, energy = 15, bomb = 20, bio = 0, rad = 20)
	siemens_coefficient = 0.7

/obj/item/clothing/shoes/boots/jungle
	name = "Ботинки для джунглей"
	desc = "Пара надёжных водонепроницаемых коричневых ботинок."
	icon_state = "jungle"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 15, bomb = 20, bio = 10, rad = 0)
	siemens_coefficient = 0.7

/obj/item/clothing/shoes/boots/swat
	name = "Ботинки СОБР"
	desc = "Прибавим жару."
	icon_state = "swat"
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 10, rad = 0)
	item_flags = NOSLIP
	siemens_coefficient = 0.6

/obj/item/clothing/shoes/boots/combat //Basically SWAT shoes combined with galoshes.
	name = "Боевые ботинки"
	desc = "Прибавим МНОГО жару."
	icon_state = "swat"
	force = 5
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 10, rad = 0)
	item_flags = NOSLIP
	siemens_coefficient = 0.6

	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE

//Stolen from CM, refurbished to be less terrible.
/obj/item/clothing/shoes/boots/marine
	name = "Боевые ботинки"
	desc = "Стандартизированные военные ботинки для боевых действий. Всегда наготове. В них поместится боевой нож."
	icon_state = "jackboots"
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 10, rad = 0)
	siemens_coefficient = 0.6
