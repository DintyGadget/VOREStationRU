/datum/species/shapeshifter/promethean
	min_age = 18 //Required for server rules
	max_age = 80
	push_flags = ~HEAVY
	swap_flags = ~HEAVY
	gluttonous = 0
	water_damage_mod = 0		//No water damage
	valid_transform_species = list(
		"Человек", "Унати", "Таджара", "Скрелл",
		"Диона", "Тешари", "Мартышка","Сергал",
		"Акула","Невреан","Зоррен",
		"Фенек", "Вульпканин", "Василиссан",
		"Рапала", "Неера", "Сток", "Фарва", "Собак",
		"Вольпин", "Сару", "Спарра")

	color_mult = 1
	mob_size = MOB_MEDIUM //As of writing, original was MOB_SMALL - Allows normal swapping
	trashcan = 1 //They have goopy bodies. They can just dissolve things within them.

	appearance_flags = HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_HAIR_COLOR | RADIATION_GLOWS | HAS_UNDERWEAR

	inherent_verbs = list(
		/mob/living/carbon/human/proc/shapeshifter_select_shape,
		/mob/living/carbon/human/proc/shapeshifter_select_colour,
		/mob/living/carbon/human/proc/shapeshifter_select_hair,
		/mob/living/carbon/human/proc/shapeshifter_select_hair_colors,
		/mob/living/carbon/human/proc/shapeshifter_select_gender,
		/mob/living/carbon/human/proc/regenerate,
		/mob/living/carbon/human/proc/shapeshifter_select_wings,
		/mob/living/carbon/human/proc/shapeshifter_select_tail,
		/mob/living/carbon/human/proc/shapeshifter_select_ears,
		/mob/living/proc/set_size,
		/mob/living/carbon/human/proc/succubus_drain,
		/mob/living/carbon/human/proc/succubus_drain_finalize,
		/mob/living/carbon/human/proc/succubus_drain_lethal,
		/mob/living/carbon/human/proc/slime_feed,
		/mob/living/proc/eat_trash,
		/mob/living/carbon/human/proc/promethean_select_opaqueness,
		)
