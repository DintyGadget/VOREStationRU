/datum/mob_descriptor/vox_markings
	name = "шейные метки"
	chargen_label = "шейные метки (ранг)"
	skip_species_mention = TRUE
	standalone_value_descriptors = list(
		"крайне минимальные",
		"скорее простоватые",
		"сложноватые",
		"сравнительно сложные",
		"невероятно сложные"
		)
	chargen_value_descriptors = list(
		"слуга"  =        1,
		"рабочий" =       2,
		"пушечное мясо" = 3,
		"налетчик" =      4,
		"лидер" =         5
		)
	comparative_value_descriptor_equivalent = "такой же важности, что и Ваши."
	comparative_value_descriptors_smaller = list(
		"чуть меньшей важности, чем Ваши",
		"гораздо меньшей важности, чем Ваши",
		"гораздо ниже Ваших и не стоят Вашего внимания"
		)
	comparative_value_descriptors_larger = list(
		"чуть важнее Ваших",
		"гораздо важнее Ваших",
		"требуют Вашего бесспорного повиновения"
		)

/datum/mob_descriptor/vox_markings/get_first_person_message_start()
	. = "Ваши шейные метки"

/datum/mob_descriptor/vox_markings/get_third_person_message_start(var/datum/gender/my_gender)
	. = "[my_gender.His] шейные метки"
