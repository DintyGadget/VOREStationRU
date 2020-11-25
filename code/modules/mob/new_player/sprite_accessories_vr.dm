////////////////////////
// For sergals and stuff
////////////////////////
// Note: Creating a sub-datum to group all vore stuff together
// would require us to exclude that datum from the global list.

/datum/sprite_accessory/hair

	//var/icon_add = 'icons/mob/human_face.dmi' //Already defined in sprite_accessories.dm line 49.
	var/color_blend_mode = ICON_MULTIPLY
	species_allowed = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_TESHARI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE, SPECIES_WEREBEAST, SPECIES_SHADEKIN, SPECIES_SHADEKIN_CREW) //This lets all races use the default hairstyles.

	astolfo
		name = "Астольфо"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "hair_astolfo"

	awoohair
		name = "Лохматые до плеч"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "momijihair"

	citheronia
		name = "Citheronia Hair (Kira72)"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "citheronia_hair"
		ckeys_allowed = list("Kira72")
		do_colouration = 0

	taramaw
		name = "Hairmaw (Liquidfirefly)"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "maw_hair"
		ckeys_allowed = list("liquidfirefly")
		do_colouration = 0

	citheronia_colorable
		name = "Прическа Цитеронии"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "citheronia_hair_c"
		do_colouration = 1

	sergal_plain
		name = "Сергал: Простая"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "serg_plain"
		species_allowed = list(SPECIES_SERGAL)

	sergal_medicore
		name = "Сергал: Длинные"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "serg_medicore"
		species_allowed = list(SPECIES_SERGAL)

	sergal_tapered
		name = "Сергал: Собранные"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "serg_tapered"
		species_allowed = list(SPECIES_SERGAL)

	sergal_fairytail
		name = "Сергал: Коса"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "serg_fairytail"
		species_allowed = list(SPECIES_SERGAL)

	braid
		name = "Коса до пола"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "hair_braid"

	twindrills
		name = "Завитушки по бокам"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "hair_twincurl"

	crescent_moon
		name = "Полумесяц"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "crescent_moon"

	bald
		name = "Лысая голова"
		icon_state = "bald"
		gender = MALE
		species_allowed = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_TESHARI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE, SPECIES_WEREBEAST) //Lets all the races be bald if they want.

	ponytail6_fixed //Eggnerd's done with waiting for upstream fixes lmao.
		name = "Хвостик 6 исправленный"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "hair_ponytail6"
		species_allowed = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_NEVREAN, SPECIES_AKULA,SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE, SPECIES_WEREBEAST)

	una_hood
		name = "Капюшон кобры"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "soghun_hood"

	una_spines_long
		name = "Унати: Длинные шипы"
		icon_state = "soghun_longspines"
		species_allowed = list(SPECIES_UNATHI, SPECIES_XENOCHIMERA, SPECIES_PROTEAN) //Xenochimera get most hairstyles since they're abominations.

	una_spines_short
		name = "Унати: Короткие шипы"
		icon_state = "soghun_shortspines"
		species_allowed = list(SPECIES_UNATHI, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)

	una_sidefrills
		name = "Унати: Большие плавники"
		icon_state = "unathi_sidefrills"
		species_allowed = list(SPECIES_UNATHI, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)

	una_frills_long
		name = "Унати: Длинные плавники"
		icon_state = "soghun_longfrills"
		species_allowed = list(SPECIES_UNATHI, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)

	una_frills_short
		name = "Унати: Короткие плавники"
		icon_state = "soghun_shortfrills"
		species_allowed = list(SPECIES_UNATHI, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)

	una_horns
		name = "Унати: Рога"
		icon_state = "soghun_horns"
		species_allowed = list(SPECIES_UNATHI, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)

	una_bighorns
		name = "Унати: Длинные рога"
		icon_state = "unathi_bighorn"
		species_allowed = list(SPECIES_UNATHI, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)

	una_smallhorns
		name = "Унати: Короткие рога"
		icon_state = "unathi_smallhorn"
		species_allowed = list(SPECIES_UNATHI, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)

	una_ramhorns
		name = "Унати: Скругленные рога"
		icon_state = "unathi_ramhorn"
		species_allowed = list(SPECIES_UNATHI, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)

	una_doublehorns
		name = "Унати: Двойные рога"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "soghun_dubhorns"
		species_allowed = list(SPECIES_UNATHI, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)

	taj_ears
		name = "Таджара: Уши"
		icon_state = "ears_plain"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_clean
		name = "Таджара: Уши и волосы"
		icon_state = "hair_clean"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_bangs
		name = "Таджара: Дреды"
		icon_state = "hair_bangs"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_braid
		name = "Таджара: Косы"
		icon_state = "hair_tbraid"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_shaggy
		name = "Таджара: Лохматые"
		icon_state = "hair_shaggy"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_mohawk
		name = "Таджара: Могавк"
		icon_state = "hair_mohawk"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_plait
		name = "Таджара: Хвостик"
		icon_state = "hair_plait"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_straight
		name = "Таджара: Прямые"
		icon_state = "hair_straight"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_long
		name = "Таджара: Длинные"
		icon_state = "hair_long"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_rattail
		name = "Таджара: Крысиный хвост"
		icon_state = "hair_rattail"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_spiky
		name = "Таджара: Колючие"
		icon_state = "hair_tajspiky"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_messy
		name = "Таджара: Неопрятные"
		icon_state = "hair_messy"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_curls
		name = "Таджара: Кудрявые"
		icon_state = "hair_curly"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_wife
		name = "Таджара: Домоседка"
		icon_state = "hair_wife"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_victory
		name = "Таджара: Прическа в стиле виктори"
		icon_state = "hair_victory"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_bob
		name = "Таджара: Каре"
		icon_state = "hair_tbob"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

	taj_ears_fingercurl
		name = "Таджара: Завитые локоны"
		icon_state = "hair_fingerwave"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)

//Teshari things
	teshari
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_altdefault
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_tight
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_excited
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_spike
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_long
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_burst
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_shortburst
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_mohawk
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_pointy
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_upright
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_mane
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_droopy
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_mushroom
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_twies
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_backstrafe
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_longway
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_tree
		icon_add = 'icons/mob/human_face_vr_add.dmi'

	teshari_fluffymohawk
		icon =  'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'

//Skrell 'hairstyles' - these were requested for a chimera and screw it, if one wants to eat seafood, go nuts
	skr_tentacle_veryshort
		name = "Скрелл: Очень короткие щупальца"
		icon_state = "skrell_hair_veryshort"
		species_allowed = list(SPECIES_SKRELL, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)
		gender = MALE

	skr_tentacle_short
		name = "Скрелл: Короткие щупальца"
		icon_state = "skrell_hair_short"
		species_allowed = list(SPECIES_SKRELL, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)

	skr_tentacle_average
		name = "Скрелл: Длинные щупальца"
		icon_state = "skrell_hair_average"
		species_allowed = list(SPECIES_SKRELL, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)

	skr_tentacle_verylong
		name = "Скрелл: Очень длинные щупальца"
		icon_state = "skrell_hair_verylong"
		species_allowed = list(SPECIES_SKRELL, SPECIES_XENOCHIMERA, SPECIES_PROTEAN)
		gender = FEMALE

// Vulpa stuffs

	vulp_hair_none
		name = "Вулпканин: Лысый"
		icon_state = "bald"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_hair_kajam
		name = "Вулпканин: Каджам"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "kajam"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_keid
		name = "Вулпканин: Кеид"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "keid"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_adhara
		name = "Вулпканин: Адхара"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "adhara"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_kleeia
		name = "Вулпканин: Клийя"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "kleeia"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_mizar
		name = "Вулпканин: Мизар"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "mizar"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_apollo
		name = "Вулпканин: Аполлон"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "apollo"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_belle
		name = "Вулпканин: Белла"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "belle"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_bun
		name = "Вулпканин: Пучок"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "bun"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_jagged
		name = "Вулпканин: Зазубренная"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "jagged"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_curl
		name = "Вулпканин: Кудри"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "curl"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_hawk
		name = "Вулпканин: Ястреб"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "hawk"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_anita
		name = "Вулпканин: Анита"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "anita"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_short
		name = "Вулпканин: Короткая"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "short"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

	vulp_hair_spike
		name = "Вулпканин: Колючая"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "spike"
		species_allowed = list(SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_TAJ, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_PROTEAN)
		gender = NEUTER

//xeno stuffs
	xeno_head_drone_color
		name = "Ксеноморф: Купол дрона"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "cxeno_drone"
		species_allowed = list(SPECIES_XENOHYBRID)
		gender = NEUTER
// figure this one out for better coloring
	xeno_head_sentinel_color
		name = "Ксеноморф: Купол стража"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "cxeno_sentinel"
		species_allowed = list(SPECIES_XENOHYBRID)
		gender = NEUTER

	xeno_head_queen_color
		name = "Ксеноморф: Купол королевы"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "cxeno_queen"
		species_allowed = list(SPECIES_XENOHYBRID)
		gender = NEUTER

	xeno_head_hunter_color
		name = "Ксеноморф: Купол охотника"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "cxeno_hunter"
		species_allowed = list(SPECIES_XENOHYBRID)
		gender = NEUTER

	xeno_head_praetorian_color
		name = "Ксеноморф: Купол преторианца"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "cxeno_praetorian"
		species_allowed = list(SPECIES_XENOHYBRID)
		gender = NEUTER

// Shadekin stuffs

	shadekin_hair_short
		name = "Шейдкин: Короткие волосы"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "shadekin_short"
		species_allowed = list(SPECIES_SHADEKIN, SPECIES_SHADEKIN_CREW)
		gender = NEUTER

	shadekin_hair_poofy
		name = "Шейдкин: Пышные волосы"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "shadekin_poofy"
		species_allowed = list(SPECIES_SHADEKIN, SPECIES_SHADEKIN_CREW)
		gender = NEUTER

	shadekin_hair_long
		name = "Шейдкин: Длинные волосы"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "shadekin_long"
		species_allowed = list(SPECIES_SHADEKIN, SPECIES_SHADEKIN_CREW)
		gender = NEUTER

	shadekin_hair_rivyr
		name = "Rivyr Hair"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "shadekin_rivyr"
		ckeys_allowed = list("verysoft")
		species_allowed = list(SPECIES_SHADEKIN, SPECIES_SHADEKIN_CREW)
		gender = NEUTER

/datum/sprite_accessory/facial_hair
	icon = 'icons/mob/human_face_or_vr.dmi'
	var/color_blend_mode = ICON_MULTIPLY
	species_allowed = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_TESHARI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE, SPECIES_WEREBEAST) //This lets all races use the facial hair styles.

	shaved
		name = "Бритое лицо"
		icon_state = "bald"
		gender = NEUTER
		species_allowed = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_TESHARI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE, SPECIES_WEREBEAST) //This needed to be manually defined, apparantly.

	neck_fluff
		name = "Воротник из шерсти"
		icon = 'icons/mob/human_face_or_vr.dmi'
		icon_state = "facial_neckfluff"
		gender = NEUTER
		species_allowed = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_TESHARI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE, SPECIES_WEREBEAST)

	vulp_none
		name = "Вульпканин: Нет"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "none"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_blaze
		name = "Вульпканин: Пятно на моське"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_blaze"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_vulpine
		name = "Вульпканин: Лис"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_vulpine"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_earfluff
		name = "Вульпканин: Ушной мех"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_earfluff"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_mask
		name = "Вульпканин: Маска"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_mask"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_patch
		name = "Вульпканин: Боевой окрас"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_patch"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_ruff
		name = "Вульпканин: Бока"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_ruff"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_kita
		name = "Вульпканин: Края"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_kita"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_swift
		name = "Вульпканин: Стороны"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_swift"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

//VOREStation Body Markings and Overrides
//Reminder: BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN,BP_HEAD

/datum/sprite_accessory/marking //Override for base markings
	var/color_blend_mode = ICON_ADD

/datum/sprite_accessory/marking/vr
	icon = 'icons/mob/human_races/markings_vr.dmi'

	vulp_belly
		name = "Вульпканин: Шерсть на животе"
		icon_state = "vulp_belly"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	vulp_crest
		name = "Вульпканин: Крест на животе"
		icon_state = "vulp_crest"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	vulp_fullbelly
		name = "Вульпканин: Весь живот"
		icon_state = "vulp_fullbelly"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	vulp_nose
		name = "Вульпканин: Нос"
		icon_state = "vulp_nose"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	vulp_short_nose
		name = "Вульпканин: Нос, короткий"
		icon_state = "vulp_short_nose"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	snoutstripe
		name = "Вульпканин: Нос, полоска"
		icon_state = "snoutstripe"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	vulp_face
		name = "Вульпканин: Лицо"
		icon_state = "vulp_face"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	vulp_facealt
		name = "Вульпканин: Лицо, альт"
		icon_state = "vulp_facealt"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	vulp_earsface
		name = "Вульпканин: Лицо и уши"
		icon_state = "vulp_earsface"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	vulp_all
		name = "Вульпканин: Вся голова"
		icon_state = "vulp_all"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	sergal_full
		name = "Сергал: Нательные метки"
		icon_state = "sergal_full"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)
		species_allowed = list("Сергал")

	sergal_full_female
		name = "Сергал: Нательные метки (жен.)"
		icon_state = "sergal_full_female"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)
		species_allowed = list("Сергал")

	sergaleyes
		name = "Сергал: Глаза"
		icon_state = "eyes_sergal"
		body_parts = list(BP_HEAD)

	spidereyes
		name = "Паук: Глаза"
		icon_state = "spidereyes"
		body_parts = list(BP_HEAD)

	closedeyes
		name = "Глаза: Закрытые"
		icon_state = "eyes_closed"
		body_parts = list(BP_HEAD)

	brows
		name = "Брови"
		icon_state = "brows"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	nevrean_female
		name = "Невреан: Клюв (жен.)"
		icon_state = "nevrean_f"
		body_parts = list(BP_HEAD)
		color_blend_mode = ICON_MULTIPLY
		gender = FEMALE

	nevrean_male
		name = "Невреан: Клюв (муж.)"
		icon_state = "nevrean_m"
		body_parts = list(BP_HEAD)
		color_blend_mode = ICON_MULTIPLY
		gender = MALE

	spots
		name = "Пятна"
		icon_state = "spots"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)

	shaggy_mane
		name = "Лохматая грива/перья"
		icon_state = "shaggy"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO)

	jagged_teeth
		name = "Зубы: Острые"
		icon_state = "jagged"
		body_parts = list(BP_HEAD)

	blank_face
		name = "Монстр: Пустое лицо (ко рту)"
		icon_state = "blankface"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	monster_mouth
		name = "Монстр: Рот"
		icon_state = "monster"
		body_parts = list(BP_HEAD)

	saber_teeth
		name = "Зубы: Саблезубость"
		icon_state = "saber"
		body_parts = list(BP_HEAD)

	fangs
		name = "Забы: Клыки"
		icon_state = "fangs"
		body_parts = list(BP_HEAD)

	tusks
		name = "Бивни"
		icon_state = "tusks"
		body_parts = list(BP_HEAD)

	otie_face
		name = "Оти: Лицо"
		icon_state = "otieface"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	otie_nose
		name = "Оти: Нос"
		icon_state = "otie_nose"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	otienose_lite
		name = "Оти: Нос, короче"
		icon_state = "otienose_lite"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	backstripes
		name = "Спина: Полосы"
		icon_state = "otiestripes"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_HEAD)

	belly_butt
		name = "Живот и зад"
		icon_state = "bellyandbutt"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_GROIN,BP_TORSO)

	fingers_toes
		name = "Руки и ноги: носки/рукава"
		icon_state = "fingerstoes"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_HAND,BP_R_HAND)

	otie_socks
		name = "Руки и ноги: пальцы"
		icon_state = "otiesocks"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)

	corvid_beak
		name = "Птица: Клюв"
		icon_state = "corvidbeak"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	corvid_belly
		name = "Птица: Живот"
		icon_state = "corvidbelly"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_GROIN,BP_TORSO,BP_HEAD)

	cow_body
		name = "Корова: Пятна"
		icon_state = "cowbody"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	cow_nose
		name = "Корова: Нос"
		icon_state = "cownose"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	zmask
		name = "Глаза: Маска"
		icon_state = "zmask"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	zbody
		name = "Полосы: Толстые, зазубренные"
		icon_state = "zbody"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_GROIN,BP_TORSO)

	znose
		name = "Нос: Зазубренный"
		icon_state = "znose"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	otter_nose
		name = "Выдра: Нос"
		icon_state = "otternose"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	otter_face
		name = "Выдра: Лицо"
		icon_state = "otterface"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	deer_face
		name = "Олень: Лицо"
		icon_state = "deerface"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	sharkface
		name = "Акула: Нос"
		icon_state = "sharkface"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	sheppy_face
		name = "Овчарка: Лицо"
		icon_state = "shepface"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	sheppy_back
		name = "Овчарка: Спина"
		icon_state = "shepback"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	zorren_belly_male
		name = "Зоррен: Торс (муж.)"
		icon_state = "zorren_belly"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	zorren_belly_female
		name = "Зоррен: Торс (жен.)"
		icon_state = "zorren_belly_female"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	zorren_back_patch
		name = "Зоррен: Спина"
		icon_state = "zorren_backpatch"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO)

	zorren_face_male
		name = "Зоррен: Лицо (муж.)"
		icon_state = "zorren_face"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		gender = MALE

	zorren_face_female
		name = "Зоррен: Лицо (жен.)"
		icon_state = "zorren_face_female"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		gender = FEMALE

	zorren_muzzle_male
		name = "Зоррен: Нос (муж.)"
		icon_state = "zorren_muzzle"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		gender = MALE

	zorren_muzzle_female
		name = "Зоррен: Нос (жен.)"
		icon_state = "zorren_muzzle_female"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		gender = FEMALE

	zorren_socks
		name = "Зоррен: Носки"
		icon_state = "zorren_socks"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)

	zorren_longsocks
		name = "Зоррен: Носки, длинные"
		icon_state = "zorren_longsocks"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)

	tesh_feathers
		name = "Тешари: Перья"
		icon_state = "tesh-feathers"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_HAND,BP_R_HAND)

	harpy_feathers
		name = "Рапала: Перья"
		icon_state = "harpy-feathers"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG)

	harpy_legs
		name = "Рапала: Ноги"
		icon_state = "harpy-leg"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)

	chooves
		name = "Копыта"
		icon_state = "chooves"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT)

	alurane
		name = "Алрауне: Тело"
		icon_state = "alurane"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)
		ckeys_allowed = list("natje")

	body_tone
		name = "Тело: Тонирование (для понижения контраста)"
		icon_state = "btone"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)

	gloss
		name = "Тело: Блики по всему телу"
		icon_state = "gloss"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	osocks_rarm
		name = "Рука, правая"
		icon_state = "osocks"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_R_ARM,BP_R_HAND)

	osocks_larm
		name = "Рука, левая"
		icon_state = "osocks"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_ARM,BP_L_HAND)

	osocks_rleg
		name = "Нога, правая"
		icon_state = "osocks"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_R_FOOT,BP_R_LEG)

	osocks_lleg
		name = "Нога, левая"
		icon_state = "osocks"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_L_LEG)

	animeeyesinner
		name = "Глаза: Аниме (внутр.)"
		icon_state = "animeeyesinner"
		body_parts = list(BP_HEAD)

	animeeyesouter
		name = "Глаза: Аниме (внеш.)"
		icon_state = "animeeyesouter"
		body_parts = list(BP_HEAD)

	panda_eye_marks
		name = "Панда: Глаза"
		icon_state = "eyes_panda"
		body_parts = list(BP_HEAD)

	catwomantorso
		name = "Кошка: Полосы, грудь"
		icon_state = "catwomanchest"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO)

	catwomangroin
		name = "Кошка: Полосы, пояс"
		icon_state = "catwomangroin"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_GROIN)

	catwoman_rleg
		name = "Кошка: Полосы, правая нога"
		icon_state = "catwomanright"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_R_LEG)

	catwoman_lleg
		name = "Кошка: Полосы, левая нога"
		icon_state = "catwomanleft"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_LEG)

	teshi_small_feathers
		name = "Тешари: Пёрышки на крыльях"
		icon_state = "teshi_sf"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_HAND,BP_R_HAND,BP_TORSO)

	eboop_panels
		name = "Ward: Пятна по всему телу"
		icon_state = "eboop"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	spirit_lights
		name = "Ward: Фонарики"
		icon_state = "lights"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_HEAD)

	spirit_lights_body
		name = "Ward: Фонарики, тело"
		icon_state = "lights"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO)

	spirit_lights_head
		name = "Ward: Фонарики, голова"
		icon_state = "lights"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	spirit_panels
		name = "Ward: Пластины"
		icon_state = "panels"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	spirit_panels_body
		name = "Ward: Пластины, тело"
		icon_state = "panels"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)

	spirit_panels_head
		name = "Ward: Пластины, голова"
		icon_state = "panels"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	tentacle_head
		name = "Осьминог: Голова"
		icon_state = "tentaclehead"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	tentacle_mouth
		name = "Осьминог: Рот-щупальца"
		icon_state = "tentaclemouth"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	rosette
		name = "Пятнышки"
		icon_state = "rosette"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	werewolf_nose
		name = "Оборотень: Нос"
		icon = 'icons/mob/species/werebeast/werebeast_markings.dmi'
		icon_state = "werewolf_nose"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_WEREBEAST)

	werewolf_face
		name = "Оборотень: Лицо"
		icon = 'icons/mob/species/werebeast/werebeast_markings.dmi'
		icon_state = "werewolf"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_WEREBEAST)

	werewolf_belly
		name = "Оборотень: Живот"
		icon = 'icons/mob/species/werebeast/werebeast_markings.dmi'
		icon_state = "werewolf"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_GROIN,BP_TORSO)
		species_allowed = list(SPECIES_WEREBEAST)

	werewolf_socks
		name = "Оборотень: Носки"
		icon = 'icons/mob/species/werebeast/werebeast_markings.dmi'
		icon_state = "werewolf"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
		species_allowed = list(SPECIES_WEREBEAST)

	shadekin_snoot
		name = "Шейдкин: Нос"
		icon_state = "shadekin-snoot"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_SHADEKIN, SPECIES_SHADEKIN_CREW)

	taj_nose_alt
		name = "Таджара: Нос, альт"
		icon_state = "taj_nosealt"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	talons
		name = "Когти, птичьи"
		icon_state = "talons"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)

	claws
		name = "Когти"
		icon_state = "claws"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_HAND,BP_R_HAND)

	equine_snout //Why the long face? Works best with sergal bodytype.
		name = "Лошадиное лицо"
		icon_state = "donkey"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	equine_nose
		name = "Лошадиный нос"
		icon_state = "dnose"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	bee_stripes
		name = "Пчелиные полосы"
		icon_state = "beestripes"
		body_parts = list(BP_TORSO,BP_GROIN)

	vas_toes
		name = "Жук: Лапки (Василиссан)"
		icon_state = "vas_toes"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT)

	//CitRP stuff
	vox_alt
		name = "Вокс: Тело, альт"
		icon_state = "bay_vox"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN,BP_HEAD)
		species_allowed = list(SPECIES_VOX)

	vox_alt_eyes
		name = "Вокс: Глаза, альт"
		icon_state = "bay_vox_eyes"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_VOX)

	c_beast_body
		name = "Кибер: Тело"
		icon_state = "c_beast_body"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_TORSO,BP_GROIN)

	c_beast_plating
		name = "Кибер: Пластины (к телу)"
		icon_state = "c_beast_plating"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM)

	c_beast_band
		name = "Кибер: Круг (к голове Cybertech)"
		icon_state = "c_beast_band"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	c_beast_cheek_a
		name = "Кибер: Щёки А (использовать с А, B и C)"
		icon_state = "c_beast_a"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	c_beast_cheek_b
		name = "Кибер: Щёки B (использовать с А, B и C)"
		icon_state = "c_beast_b"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	c_beast_cheek_c
		name = "Кибер: Щёки C (использовать с А, B и C)"
		icon_state = "c_beast_c"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	teshari_large_eyes
		name = "Тешари: Большие глаза"
		icon_state = "teshlarge_eyes"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TESHARI)

	teshari_coat
		name = "Тешари: Накидка"
		icon_state = "tesh_coat"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_TORSO,BP_HEAD)
		species_allowed = list(SPECIES_TESHARI)

	teshari_pattern_male
		name = "Тешари: Метки, мужские"
		icon_state = "tesh-pattern-male"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN,BP_HEAD)
		species_allowed = list(SPECIES_TESHARI)

	teshari_pattern_female
		name = "Тешари: Метки, женские"
		icon_state = "tesh-pattern-fem"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN,BP_HEAD)
		species_allowed = list(SPECIES_TESHARI)

	voxscales
		name = "Vox Scales"
		icon_state = "Voxscales"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_HEAD)

	voxclaws
		name = "Vox Claws"
		icon_state = "Voxclaws"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_HAND,BP_R_HAND)

	voxbeak
		name = "Vox Beak"
		icon_state = "Voxscales"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	unathihood
		name = "Cobra Hood"
		icon_state = "unathihood"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	unathidoublehorns
		name = "Double Unathi Horns"
		icon_state = "unathidoublehorns"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	unathihorns
		name = "Unathi Horns"
		icon_state = "unathihorns"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	unathiramhorns
		name = "Unathi Ram Horns"
		icon_state = "unathiramhorns"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	unathishortspines
		name = "Unathi Short Spines"
		icon_state = "unathishortspines"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	unathilongspines
		name = "Unathi Long Spines"
		icon_state = "unathilongspines"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	unathishortfrills
		name = "Unathi Short Frills"
		icon_state = "unathishortfrills"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	unathilongfrills
		name = "Unathi Long Frills"
		icon_state = "unathilongfrills"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
