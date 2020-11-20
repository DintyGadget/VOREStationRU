/obj/item/clothing/shoes/syndigaloshes
	desc = "Пара кроссовок коричневого цвета. Кажется, обладают более хорошим сцеплением."
	name = "Коричневые кроссовки"
	icon_state = "brown"
	permeability_coefficient = 0.05
	item_flags = NOSLIP
	origin_tech = list(TECH_ILLEGAL = 3)
	var/list/clothing_choices = list()
	siemens_coefficient = 0.8
	species_restricted = null
	step_volume_mod = 0.5
	drop_sound = 'sound/items/drop/rubber.ogg'
	pickup_sound = 'sound/items/pickup/rubber.ogg'

/obj/item/clothing/shoes/mime
	name = "Башмаки мима"
	icon_state = "white"
	step_volume_mod = 0	//It's a mime

/obj/item/clothing/shoes/galoshes
	desc = "Резиновые ботинки."
	name = "Галоши"
	icon_state = "galoshes"
	permeability_coefficient = 0.05
	siemens_coefficient = 0 //They're thick rubber boots! Of course they won't conduct electricity!
	item_flags = NOSLIP
	slowdown = SHOES_SLOWDOWN+1
	species_restricted = null
	drop_sound = 'sound/items/drop/rubber.ogg'
	pickup_sound = 'sound/items/pickup/rubber.ogg'

/obj/item/clothing/shoes/dress
	name = "Парадные туфли"
	desc = "Туфли с острым носом, идеально подходят к формальным костюмам."
	icon_state = "laceups"

/obj/item/clothing/shoes/dress/white
	name = "Белые парадные туфли"
	desc = "Белоснежные туфли, на которых нет ни единого пятнышка."
	icon_state = "whitedress"

/obj/item/clothing/shoes/sandal
	desc = "Пара обыкновенных деревянных сандалий."
	name = "Сандалии"
	icon_state = "wizard"
	species_restricted = null
	body_parts_covered = 0

	wizard_garb = 1

obj/item/clothing/shoes/sandal/clogs
	name = "Сабо"
	desc = "Пара пластиковых сабо."
	icon_state = "clogs"

/obj/item/clothing/shoes/sandal/marisa
	desc = "Пара волшебных черных башмаков."
	name = "Волшебные башмаки"
	icon_state = "black"
	body_parts_covered = FEET

/obj/item/clothing/shoes/clown_shoes
	desc = "Стандартизированные башмаки заведующего по розыгрышам. Господи, какие же они огромные!"
	name = "Клоунские башмаки"
	icon_state = "clown"
	slowdown = SHOES_SLOWDOWN+1
	force = 0
	var/footstep = 1	//used for squeeks whilst walking
	species_restricted = null

/obj/item/clothing/shoes/clown_shoes/handle_movement(var/turf/walking, var/running)
	if(running)
		if(footstep >= 2)
			footstep = 0
			playsound(src, "clownstep", 50, 1) // this will get annoying very fast.
		else
			footstep++
	else
		playsound(src, "clownstep", 20, 1)

/obj/item/clothing/shoes/cult
	name = "Ботинки"
	desc = "Пара ботинок, носимых последователями Нар-Си."
	icon_state = "cult"
	item_state_slots = list(slot_r_hand_str = "cult", slot_l_hand_str = "cult")
	force = 2
	siemens_coefficient = 0.7

	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE
	species_restricted = null

/obj/item/clothing/shoes/cult/cultify()
	return

/obj/item/clothing/shoes/cyborg
	name = "Ботинки киборга"
	desc = "Ботинки для костюма киборга."
	icon_state = "boots"

/obj/item/clothing/shoes/slippers
	name = "Кроличьи тапочки"
	desc = "Пуффыстые!"
	icon_state = "slippers"
	force = 0
	species_restricted = null
	w_class = ITEMSIZE_SMALL
	drop_sound = 'sound/items/drop/clothing.ogg'
	pickup_sound = 'sound/items/pickup/clothing.ogg'

/obj/item/clothing/shoes/slippers/worn
	name = "Поношенные кроличьи тапочки"
	desc = "Пуффыстые..."
	icon_state = "slippers_worn"
	item_state_slots = list(slot_r_hand_str = "slippers", slot_l_hand_str = "slippers")

/obj/item/clothing/shoes/laceup
	name = "Чёрные оксфорды"
	icon_state = "oxford_black"

/obj/item/clothing/shoes/laceup/grey
	name = "Серые оксфорды"
	icon_state = "oxford_grey"

/obj/item/clothing/shoes/laceup/brown
	name = "Коричневые оксфорды"
	icon_state = "oxford_brown"

/obj/item/clothing/shoes/swimmingfins
	desc = "Способствуют плаванию."
	name = "Плавательные ласты"
	icon_state = "flippers"
	item_state_slots = list(slot_r_hand_str = "galoshes", slot_l_hand_str = "galoshes")
	item_flags = NOSLIP
	slowdown = SHOES_SLOWDOWN+1
	species_restricted = null

/obj/item/clothing/shoes/flipflop
	name = "Шлёпанцы"
	desc = "Пара шлёпанцев из пеноматериала. Для тех, кто не стесняется своих лодыжек."
	icon_state = "thongsandal"
	addblends = "thongsandal_a"

/obj/item/clothing/shoes/athletic
	name = "Спортивные кеды"
	desc = "Пара модных спортивных кед. Придуманы атлетами для атлетов."
	icon_state = "sportshoe"
	addblends = "sportshoe_a"
	item_state_slots = list(slot_r_hand_str = "sportheld", slot_l_hand_str = "sportheld")

/obj/item/clothing/shoes/skater
	name = "Скейтерские кеды"
	desc = "Пара широких кед с толстой подошвой. Созданы для скейтбординга."
	icon_state = "skatershoe"
	addblends = "skatershoe_a"
	item_state_slots = list(slot_r_hand_str = "skaterheld", slot_l_hand_str = "skaterheld")

/obj/item/clothing/shoes/heels
	name = "Туфли на каблуках"
	desc = "Пара туфель на высоких каблуках. Элегантно!"
	icon_state = "heels"
	addblends = "heels_a"

/obj/item/clothing/shoes/footwraps
	name = "Портянки"
	desc = "Обмотки из обработанной ткани для когтей и лап."
	icon_state = "clothwrap"
	item_state = "clothwrap"
	force = 0
	w_class = ITEMSIZE_SMALL
	species_restricted = null
	drop_sound = 'sound/items/drop/clothing.ogg'
	pickup_sound = 'sound/items/pickup/clothing.ogg'

/obj/item/clothing/shoes/boots/ranger
	var/bootcolor = "white"
	name = "Ботинки рейнджера"
	desc = "Особый легковесный гибрид магнитных и реактивных ботинок, идеальный для внекорабельной деятельности. Если бы ещё все эти свойства были настоящими!\
	 Эти ботинки - всего лишь красивая копия ботинок рейнджеров соответствующего цвета."
	icon = 'icons/obj/clothing/ranger.dmi'
	icon_state = "ranger_boots"

/obj/item/clothing/shoes/boots/ranger/Initialize()
	. = ..()
	if(icon_state == "ranger_boots")
		icon_state = "[bootcolor]_ranger_boots"

/obj/item/clothing/shoes/boots/ranger/black
	bootcolor = "black"

/obj/item/clothing/shoes/boots/ranger/pink
	bootcolor = "pink"

/obj/item/clothing/shoes/boots/ranger/green
	bootcolor = "green"

/obj/item/clothing/shoes/boots/ranger/cyan
	bootcolor = "cyan"

/obj/item/clothing/shoes/boots/ranger/orange
	bootcolor = "orange"

/obj/item/clothing/shoes/boots/ranger/yellow
	bootcolor = "yellow"