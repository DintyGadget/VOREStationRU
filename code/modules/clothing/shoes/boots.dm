/obj/item/clothing/shoes/boots
	name = "обувь"
	desc = "Обыкновенная обувь."
	icon_state = "workboots"
	force = 3
	can_hold_knife = 1
	step_volume_mod = 1.2
	drop_sound = 'sound/items/drop/boots.ogg'

/obj/item/clothing/shoes/boots/cowboy
	name = "ковбойские сапоги"
	desc = "Не хватает только лошади из дюрастали."
	icon_state = "cowboy"
	drop_sound = 'sound/items/drop/leather.ogg'

/obj/item/clothing/shoes/boots/cowboy/classic
	name = "классические ковбойские сапоги"
	desc = "Классический фасон надёжных ковбойских сапог."
	icon_state = "cowboy_classic"

/obj/item/clothing/shoes/boots/cowboy/snakeskin
	name = "ковбойские сапоги из змеиной кожи"
	desc = "Пара ковбойских сапог, изготовленная из кожи питона."
	icon_state = "cowboy_snakeskin"

/obj/item/clothing/shoes/boots/jackboots
	name = "сапоги"
	desc = "Пара стандартных сапог Службы Безопасности, предназначенных для боевых действий."
	icon_state = "jackboots"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 15, bomb = 20, bio = 0, rad = 0)
	siemens_coefficient = 0.7
	drop_sound = 'sound/items/drop/boots.ogg'
	pickup_sound = 'sound/items/pickup/boots.ogg'

/obj/item/clothing/shoes/boots/jackboots/toeless
	name = "сапоги без пальцев"
	desc = "Видоизмененная пара боевых сапог, предназначенная для рас, обладающих когтями."
	icon_state = "digiboots"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	species_restricted = null

/obj/item/clothing/shoes/boots/jackboots/knee
	name = "сапоги по колени"
	desc = "Более высокие сапоги из синтетической кожи, сияющие искусственным глянцем."
	icon_state = "kneeboots"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")

/obj/item/clothing/shoes/boots/jackboots/toeless/knee
	name = "сапоги по колени без пальцев"
	desc = "Видоизмененная пара более высоких боевых сапог, предназначенная для рас, обладающих когтями."
	icon_state = "digikneeboots"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	species_restricted = null

/obj/item/clothing/shoes/boots/jackboots/thigh
	name = "сапоги по бедра"
	desc = "Ещё более высокие сапоги из синтетической кожи, сияющие искусственным глянцем."
	icon_state = "thighboots"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")

/obj/item/clothing/shoes/boots/jackboots/toeless/thigh
	name = "toe-less thigh-length jackboots"
	desc = "Видоизмененная пара ещё более высоких боевых сапог, предназначенная для рас, обладающих когтями."
	icon_state = "digithighboots"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	species_restricted = null

/obj/item/clothing/shoes/boots/workboots
	name = "рабочие ботинки"
	desc = "Пара ботинок, упрочненных сталью и защищающих пальцы в рабочих условиях."
	icon_state = "workboots"
	armor = list(melee = 40, bullet = 0, laser = 0, energy = 15, bomb = 20, bio = 0, rad = 20)
	siemens_coefficient = 0.7
	drop_sound = 'sound/items/drop/boots.ogg'
	pickup_sound = 'sound/items/pickup/boots.ogg'

/obj/item/clothing/shoes/boots/workboots/toeless
	name = "рабочие ботинки без пальцев"
	desc = "Пара рабочих ботинок без пальцев, защищающих ноги в рабочих условиях и видоизмененных для рас, обладающих когтями."
	icon_state = "workbootstoeless"
	item_state_slots = list(slot_r_hand_str = "workboots", slot_l_hand_str = "workboots")
	species_restricted = null

/obj/item/clothing/shoes/boots/winter
	name = "зимние ботинки"
	desc = "Ботинки с подбивкой из 'синтетической' шерсти."
	icon_state = "winterboots"
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE
	snow_speed = -1
	step_volume_mod = 0.8

/obj/item/clothing/shoes/boots/winter/security
	name = "зимние ботинки Службы Безопасности"
	desc = "Пара зимних ботинок. Эти подбиты серой шерстью и окрашены в дерзкий красный цвет."
	icon_state = "winterboots_sec"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 15, bomb = 20, bio = 0, rad = 0)

/obj/item/clothing/shoes/boots/winter/science
	name = "зимние ботинки ученого"
	desc = "Пара зимних ботинок. Эти подбиты белой шерстью и пронизаны духом науки!"
	icon_state = "winterboots_sci"

/obj/item/clothing/shoes/boots/winter/command
	name = "зимние ботинки Директора Колонии"
	desc = "Пара зимних ботинок. Эти подбиты тёмной шерстью, а края окрашены в цвет превосходства."
	icon_state = "winterboots_cap"

/obj/item/clothing/shoes/boots/winter/engineering
	name = "зимние ботинки инженера"
	desc = "Пара зимних ботинок. Эти подбиты оранжевой шерстью, а края окрашены в цвет катастрофы."
	icon_state = "winterboots_eng"

/obj/item/clothing/shoes/boots/winter/atmos
	name = "зимние ботинки атмосферщика"
	desc = "Пара зимних ботинок. Эти подбиты бежевой шерстью, а края окрашены в цвет свежего воздуха."
	icon_state = "winterboots_atmos"

/obj/item/clothing/shoes/boots/winter/medical
	name = "зимние ботинки врача"
	desc = "Пара зимних ботинок. Эти подбиты белой шерстью, а края окрашены в цвет 30 единиц дексалина."
	icon_state = "winterboots_med"

/obj/item/clothing/shoes/boots/winter/mining
	name = "зимние ботинки шахтера"
	desc = "Пара зимних ботинок. Эти подбиты сероватой шерстью, а края золотого цвета!"
	icon_state = "winterboots_mining"

/obj/item/clothing/shoes/boots/winter/supply
	name = "зимние ботинки грузчика"
	desc = "Пара зимних ботинок. Края этих ботинок окрашены в цвета Каргонии!"
	icon_state = "winterboots_sup"

/obj/item/clothing/shoes/boots/winter/hydro
	name = "зимние ботинки ботаника"
	desc = "Пара зимних ботинок. Эти подбиты коричневой шерстью, а края окрашены в цвет амброзии."
	icon_state = "winterboots_hydro"

/obj/item/clothing/shoes/boots/winter/explorer
	name = "зимние ботинки искателя"
	desc = "Укреплённые сталью зимние ботинки для добычи руд или исследований в суровых условиях. Помогают держать пальцы в тепле и под защитой."
	icon_state = "explorer"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 15, bomb = 20, bio = 0, rad = 0)

// Allows the wearer to climb cliffs, which could allow for shortcuts or sequence-breaking.
/obj/item/clothing/shoes/boots/winter/climbing
	name = "climbing winter boots"
	desc = "A pair of winter boots, with metal bracing attached to assist in climbing rocky terrain."
	icon_state = "climbing_boots"
	rock_climbing = TRUE

/obj/item/clothing/shoes/boots/tactical
	name = "tactical boots"
	desc = "Tan boots with extra padding and armor."
	icon_state = "jungle"
	armor = list(melee = 40, bullet = 30, laser = 40,energy = 25, bomb = 50, bio = 0, rad = 0)
	siemens_coefficient = 0.7

/obj/item/clothing/shoes/boots/duty
	name = "служебные ботинки"
	desc = "Пара укрепленных сталью ботинок из синтетической кожи, отполированных до блеска."
	icon_state = "duty"
	armor = list(melee = 40, bullet = 0, laser = 0, energy = 15, bomb = 20, bio = 0, rad = 20)
	siemens_coefficient = 0.7

/obj/item/clothing/shoes/boots/jungle
	name = "ботинки для джунглей"
	desc = "Пара надёжных водонепроницаемых коричневых ботинок."
	icon_state = "jungle"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 15, bomb = 20, bio = 10, rad = 0)
	siemens_coefficient = 0.7

/obj/item/clothing/shoes/boots/swat
	name = "\improper SWAT shoes"
	desc = "When you want to turn up the heat."
	icon_state = "swat"
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 10, rad = 0)
	item_flags = NOSLIP
	siemens_coefficient = 0.6

/obj/item/clothing/shoes/boots/combat //Basically SWAT shoes combined with galoshes.
	name = "combat boots"
	desc = "When you REALLY want to turn up the heat"
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
	name = "combat boots"
	desc = "Standard issue combat boots for combat scenarios or combat situations. All combat, all the time.  It can hold a Strategical knife."
	icon_state = "jackboots"
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 10, rad = 0)
	siemens_coefficient = 0.6
