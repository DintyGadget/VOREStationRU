/*

	Hello and welcome to sprite_accessories: For sprite accessories, such as hair,
	facial hair, and possibly tattoos and stuff somewhere along the line. This file is
	intended to be friendly for people with little to no actual coding experience.
	The process of adding in new hairstyles has been made pain-free and easy to do.
	Enjoy! - Doohl


	Notice: This all gets automatically compiled in a list in dna2.dm, so you do not
	have to define any UI values for sprite accessories manually for hair and facial
	hair. Just add in new hair types and the game will naturally adapt.

	!!WARNING!!: changing existing hair information can be VERY hazardous to savefiles,
	to the point where you may completely corrupt a server's savefiles. Please refrain
	from doing this unless you absolutely know what you are doing, and have defined a
	conversion in savefile.dm
*/

/datum/sprite_accessory

	var/icon			// the icon file the accessory is located in
	var/icon_state		// the icon_state of the accessory
	var/preview_state	// a custom preview state for whatever reason

	var/name			// the preview name of the accessory

	// Determines if the accessory will be skipped or included in random hair generations
	var/gender = NEUTER

	// Restrict some styles to specific species
	var/list/species_allowed = list(SPECIES_HUMAN,SPECIES_PROMETHEAN,SPECIES_HUMAN_VATBORN)

	// Whether or not the accessory can be affected by colouration
	var/do_colouration = 1


/*
////////////////////////////
/  =--------------------=  /
/  == Hair Definitions ==  /
/  =--------------------=  /
////////////////////////////
*/

/datum/sprite_accessory/hair
	icon = 'icons/mob/Human_face_m.dmi'	  // default icon for all hairs
	var/icon_add = 'icons/mob/human_face.dmi'
	var/flags

/datum/sprite_accessory/hair/eighties
	name = "80'ые"
	icon_state = "hair_80s"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/afro
	name = "Афро"
	icon_state = "hair_afro"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/afro2
	name = "Афро 2"
	icon_state = "hair_afro2"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/afro_large
	name = "Афро большое"
	icon_state = "hair_bigafro"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/amazon
	name = "Амазонка"
	icon_state = "hair_amazon"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/antenna
	name = "Антенна"
	icon_state = "hair_antenna"

/datum/sprite_accessory/hair/bald
	name = "Лысая голова"
	icon_state = "bald"
	flags = HAIR_VERY_SHORT
	species_allowed = list(SPECIES_HUMAN,SPECIES_UNATHI,SPECIES_PROMETHEAN,SPECIES_HUMAN_VATBORN,SPECIES_VOX,SPECIES_TESHARI)

/datum/sprite_accessory/hair/baldfade
	name = "Лысеющий градиент"
	icon_state = "hair_baldfade"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/balding
	name = "Лысеющая голова"
	icon_state = "hair_e"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/beachwave
	name = "Пляжные волны"
	icon_state = "hair_beachwave"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bedhead
	name = "Отлежанные"
	icon_state = "hair_bedhead"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bedhead2
	name = "Отлежанные 2"
	icon_state = "hair_bedheadv2"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bedhead3
	name = "Отлежанные 3"
	icon_state = "hair_bedheadv3"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bedheadlong
	name = "Отлежанные длинные"
	icon_state = "hair_long_bedhead"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bedheadlongest
	name = "Отлежанные длиннейшие"
	icon_state = "hair_longest_bedhead"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/beehive
	name = "Пчелиный улей"
	icon_state = "hair_beehive"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/beehive2
	name = "Пчелиный улей 2"
	icon_state = "hair_beehive2"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/belenko
	name = "Беленко"
	icon_state = "hair_belenko"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/belenkotied
	name = "Беленко в хвостик"
	icon_state = "hair_belenkotied"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bob
	name = "Каре"
	icon_state = "hair_bobcut"
	species_allowed = list(SPECIES_HUMAN,SPECIES_PROMETHEAN,SPECIES_HUMAN_VATBORN,SPECIES_UNATHI)
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bobcutalt
	name = "Каре до подбородка"
	icon_state = "hair_bobcutalt"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bobcurl
	name = "Каре кудрявое"
	icon_state = "hair_bobcurl"
	species_allowed = list(SPECIES_HUMAN,SPECIES_PROMETHEAN,SPECIES_HUMAN_VATBORN,SPECIES_UNATHI)
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bowl
	name = "Горшок"
	icon_state = "hair_bowlcut"

/datum/sprite_accessory/hair/bowlcut2
	name = "Горшок 2"
	icon_state = "hair_bowlcut2"

/datum/sprite_accessory/hair/bowlcut2
	name = "Горшок на глаза"
	icon_state = "hair_overeyebowl"

/datum/sprite_accessory/hair/grandebraid
	name = "Хвост"
	icon_state = "hair_grande"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/braid2
	name = "Хвост длинный"
	icon_state = "hair_hbraid"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/mbraid
	name = "Хвост-коса"
	icon_state = "hair_shortbraid"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/braid
	name = "Хвост до пола"
	icon_state = "hair_braid"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/front_braid
	name = "Косички спереди"
	icon_state = "hair_braidfront"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/braidtail
	name = "Косичка спереди"
	icon_state = "hair_braidtail"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bun
	name = "Пучок"
	icon_state = "hair_bun"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bun2
	name = "Пучок 2"
	icon_state = "hair_bun2"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bun3
	name = "Пучок 3"
	icon_state = "hair_bun3"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/bunhead
	name = "Пучок по сторонам"
	icon_state = "hair_bunhead"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/doublebun
	name = "Пучок двойной"
	icon_state = "hair_doublebun"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/tightbun
	name = "Пучок на всю голову"
	icon_state = "hair_tightbun"
	flags = HAIR_VERY_SHORT | HAIR_TIEABLE

/datum/sprite_accessory/hair/manbun
	name = "Пучок мужской"
	icon_state = "hair_manbun"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/donutbun
	name = "Пучок в кольцо"
	icon_state = "hair_donutbun"

/datum/sprite_accessory/hair/business
	name = "Бизнес-прическа"
	icon_state = "hair_business"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/business2
	name = "Бизнес-прическа 2"
	icon_state = "hair_business2"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/business3
	name = "Бизнес-прическа 3"
	icon_state = "hair_business3"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/business4
	name = "Бизнес-прическа 4"
	icon_state = "hair_business4"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/buzz
	name = "Короткая стрижка"
	icon_state = "hair_buzzcut"
	flags = HAIR_VERY_SHORT
	species_allowed = list(SPECIES_HUMAN,SPECIES_PROMETHEAN,SPECIES_HUMAN_VATBORN,SPECIES_UNATHI)

/datum/sprite_accessory/hair/celebcurls
	name = "Гламурные кудри"
	icon_state = "hair_celebcurls"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/crono
	name = "Хроно"
	icon_state = "hair_toriyama"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/cia
	name = "ЦРУ"
	icon_state = "hair_cia"

/datum/sprite_accessory/hair/coffeehouse
	name = "Бариста"
	icon_state = "hair_coffeehouse"
	gender = MALE
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/combover
	name = "Начес"
	icon_state = "hair_combover"

/datum/sprite_accessory/hair/country
	name = "Кантри"
	icon_state = "hair_country"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/crew
	name = "Ёжик"
	icon_state = "hair_crewcut"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/curls
	name = "Кудри"
	icon_state = "hair_curls"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/cut
	name = "Короткая стрижка"
	icon_state = "hair_c"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/dave
	name = "Дейв"
	icon_state = "hair_dave"

/datum/sprite_accessory/hair/devillock
	name = "Девилок"
	icon_state = "hair_devilock"

/datum/sprite_accessory/hair/dreadlocks
	name = "Хиппи"
	icon_state = "hair_dreads"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/mahdrills
	name = "Дриллруру"
	icon_state = "hair_drillruru"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/emo
	name = "Эмо"
	icon_state = "hair_emo"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/emo2
	name = "Эмо альт"
	icon_state = "hair_emo2"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/fringeemo
	name = "Эмо челка"
	icon_state = "hair_emofringe"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/halfshaved
	name = "Эмо набок"
	icon_state = "hair_halfshaved"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/longemo
	name = "Эмо по бокам"
	icon_state = "hair_emolong"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/highfade
	name = "Переход высокий"
	icon_state = "hair_highfade"
	gender = MALE
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/medfade
	name = "Переход средний"
	icon_state = "hair_medfade"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/lowfade
	name = "Переход низкий"
	icon_state = "hair_lowfade"
	gender = MALE
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/partfade
	name = "Переход разделенный"
	icon_state = "hair_shavedpart"
	gender = MALE
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/familyman
	name = "Семьянин"
	icon_state = "hair_thefamilyman"

/datum/sprite_accessory/hair/father
	name = "Отец"
	icon_state = "hair_father"

/datum/sprite_accessory/hair/feather
	name = "Перо"
	icon_state = "hair_feather"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/sargeant
	name = "Сержант"
	icon_state = "hair_sargeant"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/flowhair
	name = "Укладка"
	icon_state = "hair_f"

/datum/sprite_accessory/hair/flair
	name = "Секущиеся"
	icon_state = "hair_flair"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/longfringe
	name = "Секущиеся 2"
	icon_state = "hair_longfringe"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/longestalt
	name = "Секущиеся 3"
	icon_state = "hair_vlongfringe"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/fringetail
	name = "Секущиеся, хвост"
	icon_state = "hair_fringetail"
	flags = HAIR_TIEABLE|HAIR_VERY_SHORT

/datum/sprite_accessory/hair/gelled
	name = "Начес назад"
	icon_state = "hair_gelled"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/gentle
	name = "Нежная"
	icon_state = "hair_gentle"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/gentle2
	name = "Нежная 2"
	icon_state = "hair_gentle2long"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/glossy
	name = "Блестящая"
	icon_state = "hair_glossy"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/halfbang
	name = "Получелка"
	icon_state = "hair_halfbang"

/datum/sprite_accessory/hair/halfbangalt
	name = "Получелка, альт"
	icon_state = "hair_halfbang_alt"

/datum/sprite_accessory/hair/hightight
	name = "Ирокез короткий"
	icon_state = "hair_hightight"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/himecut
	name = "Химе"
	icon_state = "hair_himecut"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/himeup
	name = "Химе в хвост"
	icon_state = "hair_himeup"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/shorthime
	name = "Химе короткаая"
	icon_state = "hair_shorthime"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/hitop
	name = "Хай-топ"
	icon_state = "hair_hitop"

/datum/sprite_accessory/hair/jade
	name = "Джейд"
	icon_state = "hair_jade"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/jensen
	name = "Дженсен"
	icon_state = "hair_jensen"

/datum/sprite_accessory/hair/jessica
	name = "Джессика"
	icon_state = "hair_jessica"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/joestar
	name = "Джостар"
	icon_state = "hair_joestar"

/datum/sprite_accessory/hair/kagami
	name = "Кагами"
	icon_state = "hair_kagami"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/keanu
	name = "Киану"
	icon_state = "hair_keanu"

/datum/sprite_accessory/hair/kusangi
	name = "Кусанаги"
	icon_state = "hair_kusanagi"

/datum/sprite_accessory/hair/long
	name = "Длинные по плечи"
	icon_state = "hair_b"
	flags = HAIR_TIEABLE
/*
/datum/sprite_accessory/hair/longish
	name = "Longer Hair"
	icon_state = "hair_b2"
	flags = HAIR_TIEABLE
*/

/datum/sprite_accessory/hair/longer
	name = "Длинные волосы"
	icon_state = "hair_vlong"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/longeralt2
	name = "Длинные волосы 2"
	icon_state = "hair_longeralt2"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/sidepartlongalt
	name = "Длинные по сторонам"
	icon_state = "hair_longsidepart"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/longest
	name = "Очень длинные волосы"
	icon_state = "hair_longest"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/lowbraid
	name = "Длинная коса"
	icon_state = "hair_hbraid"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/marysue
	name = "Мэри Сью"
	icon_state = "hair_marysue"

/datum/sprite_accessory/hair/miles
	name = "Майлз"
	icon_state = "hair_miles"

/datum/sprite_accessory/hair/modern
	name = "Модерн"
	icon_state = "hair_modern"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/mohawk
	name = "Могавк"
	icon_state = "hair_d"
	species_allowed = list(SPECIES_HUMAN,SPECIES_PROMETHEAN,SPECIES_HUMAN_VATBORN,SPECIES_UNATHI)

/datum/sprite_accessory/hair/regulationmohawk
	name = "Могавк солдатский"
	icon_state = "hair_shavedmohawk"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/reversemohawk
	name = "Могавк наоборот"
	icon_state = "hair_reversemohawk"

/datum/sprite_accessory/hair/mohawkunshaven
	name = "Могавк нестриженный"
	icon_state = "hair_unshaven_mohawk"

/datum/sprite_accessory/hair/mulder
	name = "Мулдер"
	icon_state = "hair_mulder"

/datum/sprite_accessory/hair/newyou
	name = "Новое 'Ты'"
	icon_state = "hair_newyou"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/nia
	name = "Ниа"
	icon_state = "hair_nia"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/nitori
	name = "Нитори"
	icon_state = "hair_nitori"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/odango
	name = "Оданго"
	icon_state = "hair_odango"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/ombre
	name = "Омбре"
	icon_state = "hair_ombre"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/oxton
	name = "Окстон"
	icon_state = "hair_oxton"

/datum/sprite_accessory/hair/veryshortovereye
	name = "Челка, очень короткие"
	icon_state = "hair_veryshortovereye"

/datum/sprite_accessory/hair/veryshortovereyealternate
	name = "Челка, очень короткие, альт"
	icon_state = "hair_veryshortovereyealternate"

/datum/sprite_accessory/hair/shortovereye
	name = "Челка, короткие"
	icon_state = "hair_shortovereye"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/longovereye
	name = "Челка, длинные"
	icon_state = "hair_longovereye"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/parted
	name = "По сторонам"
	icon_state = "hair_parted"

/datum/sprite_accessory/hair/partedalt
	name = "По сторонам, альт"
	icon_state = "hair_partedalt"

/datum/sprite_accessory/hair/pixie
	name = "Пикси"
	icon_state = "hair_pixie"

/datum/sprite_accessory/hair/pompadour
	name = "Помпадур"
	icon_state = "hair_pompadour"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/dandypomp
	name = "Помпадур пышнее"
	icon_state = "hair_dandypompadour"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/ponytail1
	name = "Хвостик 1"
	icon_state = "hair_ponytail"
	flags = HAIR_TIEABLE|HAIR_VERY_SHORT

/datum/sprite_accessory/hair/ponytail2
	name = "Хвостик 2"
	icon_state = "hair_pa"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/ponytail3
	name = "Хвостик 3"
	icon_state = "hair_ponytail3"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/ponytail4
	name = "Хвостик 4"
	icon_state = "hair_ponytail4"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/ponytail5
	name = "Хвостик 5"
	icon_state = "hair_ponytail5"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/ponytail6
	name = "Хвостик 6"
	icon_state = "hair_ponytail6"
	flags = HAIR_TIEABLE|HAIR_VERY_SHORT

/datum/sprite_accessory/hair/wisp
	name = "Хвостик 7"
	icon_state = "hair_wisp"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/zieglertail
	name = "Хвостик Циглер"
	icon_state = "hair_ziegler"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/sharpponytail
	name = "Хвостик острый"
	icon_state = "hair_sharpponytail"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/spikyponytail
	name = "Хвостик с кончиками"
	icon_state = "hair_spikyponytail"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/sideponytail
	name = "Хвостик набок"
	icon_state = "hair_stail"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/sideponytail4 //Not happy about this... but it's for the save files.
	name = "Хвостик набок 2"
	icon_state = "hair_ponytailf"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/sideponytail2
	name = "Хвостик набок 3"
	icon_state = "hair_oneshoulder"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/sideponytail3
	name = "Хвостик набок 4"
	icon_state = "hair_tressshoulder"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/poofy
	name = "Лохматая"
	icon_state = "hair_poofy"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/poofy2
	name = "Лохматая 2"
	icon_state = "hair_poofy2"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/proper
	name = "Ретро"
	icon_state = "hair_proper"

/datum/sprite_accessory/hair/quiff
	name = "Челка торчащая"
	icon_state = "hair_quiff"

/datum/sprite_accessory/hair/nofade
	name = "Солдатская стрижка"
	icon_state = "hair_nofade"
	gender = MALE
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/newyou
	name = "Новое 'Ты'"
	icon_state = "hair_newyou"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/ronin
	name = "Ронин"
	icon_state = "hair_ronin"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/rosa
	name = "Роза"
	icon_state = "hair_rosa"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/rows
	name = "Ряды"
	icon_state = "hair_rows1"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/rows2
	name = "Ряды 2"
	icon_state = "hair_rows2"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/rowbun
	name = "Ряды в пучок"
	icon_state = "hair_rowbun"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/rowdualbraid
	name = "Ряды в две косы"
	icon_state = "hair_rowdualtail"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/rowbraid
	name = "Ряды в косу"
	icon_state = "hair_rowbraid"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/sabitsuki
	name = "Сабитсуки"
	icon_state = "hair_sabitsuki"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/scully
	name = "Скалли"
	icon_state = "hair_scully"

/datum/sprite_accessory/hair/shavehair
	name = "Сбритые волосы"
	icon_state = "hair_shaved"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/shortbangs
	name = "Короткая челка"
	icon_state = "hair_shortbangs"

/datum/sprite_accessory/hair/short
	name = "Короткая стрижка"  // try to capatilize the names please~
	icon_state = "hair_a" // you do not need to define _s or _l sub-states, game automatically does this for you
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/short2
	name = "Короткая стрижка 2"
	icon_state = "hair_shorthair3"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/short3
	name = "Короткая стрижка 3"
	icon_state = "hair_shorthair4"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/sleeze
	name = "Короткая стрижка 4"
	icon_state = "hair_sleeze"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/shy
	name = "Неформал"
	icon_state = "hair_shy"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/skinhead
	name = "Скинхед"
	icon_state = "hair_skinhead"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/protagonist
	name = "Длинноватые"
	icon_state = "hair_protagonist"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/spiky
	name = "Шипы"
	icon_state = "hair_spikey"
	species_allowed = list(SPECIES_HUMAN,SPECIES_PROMETHEAN,SPECIES_HUMAN_VATBORN,SPECIES_UNATHI)

/datum/sprite_accessory/hair/straightlong
	name = "Длинные выпрямленные"
	icon_state = "hair_straightlong"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/sweepshave
	name = "Сбритый бок"
	icon_state = "hair_sweepshave"

/datum/sprite_accessory/hair/thinning
	name = "Выстриженная"
	icon_state = "hair_thinning"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/thinningfront
	name = "Выстриженная спереди"
	icon_state = "hair_thinningfront"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/thinningback
	name = "Выстриженная сзади"
	icon_state = "hair_thinningrear"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/topknot
	name = "Топ кнот"
	icon_state = "hair_topknot"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/trimflat
	name = "Укороченные, плоский верх"
	icon_state = "hair_trimflat"
	gender = MALE
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/trimmed
	name = "Укороченные"
	icon_state = "hair_trimmed"
	gender = MALE
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/twintail
	name = "Две косички"
	icon_state = "hair_twintail"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/undercut1
	name = "Андеркат"
	icon_state = "hair_undercut1"
	gender = MALE
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/undercut2
	name = "Андеркат направо"
	icon_state = "hair_undercut2"
	gender = MALE
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/undercut3
	name = "Андеркат налево"
	icon_state = "hair_undercut3"
	gender = MALE
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/sideundercut
	name = "Андеркат набок"
	icon_state = "hair_sideundercut"
	flags = HAIR_VERY_SHORT

/datum/sprite_accessory/hair/unkept
	name = "Небрежная"
	icon_state = "hair_unkept"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/updo
	name = "Хвост сверху"
	icon_state = "hair_updo"
	flags = HAIR_TIEABLE

/datum/sprite_accessory/hair/vegeta
	name = "Вегета"
	icon_state = "hair_toriyama2"

/datum/sprite_accessory/hair/vivi
	name = "Виви"
	icon_state = "hair_vivi"

/datum/sprite_accessory/hair/volaju
	name = "Воладжу"
	icon_state = "hair_volaju"
	flags = HAIR_TIEABLE

/*
///////////////////////////////////
/  =---------------------------=  /
/  == Facial Hair Definitions ==  /
/  =---------------------------=  /
///////////////////////////////////
*/

/datum/sprite_accessory/facial_hair
	icon = 'icons/mob/Human_face.dmi'

/datum/sprite_accessory/facial_hair/shaved
	name = "Бритое лицо"
	icon_state = "bald"
	gender = NEUTER
	species_allowed = list(SPECIES_HUMAN,SPECIES_HUMAN_VATBORN,SPECIES_UNATHI,SPECIES_TAJ,SPECIES_SKRELL, "Machine", SPECIES_TESHARI, SPECIES_TESHARI,SPECIES_PROMETHEAN)

/datum/sprite_accessory/facial_hair/watson
	name = "Усы Ватсона"
	icon_state = "facial_watson"

/datum/sprite_accessory/facial_hair/hogan
	name = "Усы Халка Хогана"
	icon_state = "facial_hogan" //-Neek

/datum/sprite_accessory/facial_hair/vandyke
	name = "Усы Ван Дайка"
	icon_state = "facial_vandyke"

/datum/sprite_accessory/facial_hair/chaplin
	name = "Усы квадратные"
	icon_state = "facial_chaplin"

/datum/sprite_accessory/facial_hair/selleck
	name = "Усы Селлека"
	icon_state = "facial_selleck"

/datum/sprite_accessory/facial_hair/walrus
	name = "Усы моржовые"
	icon_state = "facial_walrus"

/datum/sprite_accessory/facial_hair/mutton
	name = "Бакенбарды"
	icon_state = "facial_mutton"

/datum/sprite_accessory/facial_hair/muttonstache
	name = "Бакенбарды с усами"
	icon_state = "facial_muttonmus"

/datum/sprite_accessory/facial_hair/elvis
	name = "Бакенбарды Элвиса"
	icon_state = "facial_elvis"
	species_allowed = list(SPECIES_HUMAN,SPECIES_PROMETHEAN,SPECIES_HUMAN_VATBORN,SPECIES_UNATHI)

/datum/sprite_accessory/facial_hair/threeOclock
	name = "Щетина, три часа"
	icon_state = "facial_3oclock"

/datum/sprite_accessory/facial_hair/threeOclockstache
	name = "Щетина, три часа с усами"
	icon_state = "facial_3oclockmoustache"

/datum/sprite_accessory/facial_hair/fiveOclock
	name = "Щетина, пять часов"
	icon_state = "facial_5oclock"

/datum/sprite_accessory/facial_hair/fiveOclockstache
	name = "Щетина, пять часов с усами"
	icon_state = "facial_5oclockmoustache"

/datum/sprite_accessory/facial_hair/sevenOclock
	name = "Щетина, семь часов"
	icon_state = "facial_7oclock"

/datum/sprite_accessory/facial_hair/sevenOclockstache
	name = "Щетина, семь часов с усами"
	icon_state = "facial_7oclockmoustache"

/datum/sprite_accessory/facial_hair/neckbeard
	name = "Борода по шею"
	icon_state = "facial_neckbeard"

/datum/sprite_accessory/facial_hair/fullbeard
	name = "Борода, полная"
	icon_state = "facial_fullbeard"

/datum/sprite_accessory/facial_hair/longbeard
	name = "Борода, длинная"
	icon_state = "facial_longbeard"

/datum/sprite_accessory/facial_hair/vlongbeard
	name = "Борода, очень длинная"
	icon_state = "facial_wise"

/datum/sprite_accessory/facial_hair/abe
	name = "Борода Линкольна"
	icon_state = "facial_abe"

/datum/sprite_accessory/facial_hair/chinstrap
	name = "Бородка под подбородком"
	icon_state = "facial_chin"

/datum/sprite_accessory/facial_hair/hip
	name = "Борода хипстера"
	icon_state = "facial_hip"

/datum/sprite_accessory/facial_hair/gt
	name = "Бородка козлиная"
	icon_state = "facial_gt"

/datum/sprite_accessory/facial_hair/jensen
	name = "Борода Адама Дженсена"
	icon_state = "facial_jensen"

/datum/sprite_accessory/facial_hair/volaju
	name = "Борода Воладжу"
	icon_state = "facial_volaju"

/datum/sprite_accessory/facial_hair/dwarf
	name = "Борода гнома"
	icon_state = "facial_dwarf"

/datum/sprite_accessory/facial_hair/croppedbeard
	name = "Борода укороченная"
	icon_state = "facial_croppedfullbeard"

/datum/sprite_accessory/facial_hair/chinless
	name = "Борода без подбородка"
	icon_state = "facial_chinlessbeard"

/datum/sprite_accessory/facial_hair/tribeard
	name = "Борода тройная"
	icon_state = "facial_tribeard"

/datum/sprite_accessory/facial_hair/moonshiner
	name = "Борода мудреца"
	icon_state = "facial_moonshiner"

/datum/sprite_accessory/facial_hair/martial
	name = "Борода мудреца, альт"
	icon_state = "facial_martialartist"
/*
///////////////////////////////////
/  =---------------------------=  /
/  == Alien Style Definitions ==  /
/  =---------------------------=  /
///////////////////////////////////
*/

/datum/sprite_accessory/hair/una_spines_short
	name = "Унати: Шипы короткие"
	icon_state = "soghun_shortspines"
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/hair/una_spines_long
	name = "Унати: Шипы длинные"
	icon_state = "soghun_longspines"
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/hair/una_smallhorns
	name = "Унати: Рога короткие"
	icon_state = "unathi_smallhorn"
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/hair/una_horns
	name = "Унати: Рога средние"
	icon_state = "soghun_horns"
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/hair/una_bighorns
	name = "Унати: Рога большие"
	icon_state = "unathi_bighorn"
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/hair/una_ramhorns
	name = "Унати: Рога округлые"
	icon_state = "unathi_ramhorn"
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/hair/una_frills_short
	name = "Унати: Плавники короткие"
	icon_state = "soghun_shortfrills"
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/hair/una_frills_long
	name = "Унати: Плавники средние"
	icon_state = "soghun_longfrills"
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/hair/una_sidefrills
	name = "Унати: Плавники большие"
	icon_state = "unathi_sidefrills"
	species_allowed = list(SPECIES_UNATHI)

//Skrell 'hairstyles'
/datum/sprite_accessory/hair/skr_tentacle_veryshort
	name = "Скрелл: Очень короткие щупальца"
	icon_state = "skrell_hair_short"
	species_allowed = list(SPECIES_SKRELL)
	gender = MALE

/datum/sprite_accessory/hair/skr_tentacle_short
	name = "Скрелл: Короткие щупальца"
	icon_state = "skrell_hair_average"
	species_allowed = list(SPECIES_SKRELL)

/datum/sprite_accessory/hair/skr_tentacle_average
	name = "Скрелл: Длинные щупальца"
	icon_state = "skrell_hair_long"
	species_allowed = list(SPECIES_SKRELL)

/datum/sprite_accessory/hair/skr_tentacle_verylong
	name = "Скрелл: Очень длинные щупальца"
	icon_state = "skrell_hair_verylong"
	species_allowed = list(SPECIES_SKRELL)

//Tajaran hairstyles
/datum/sprite_accessory/hair/taj_ears
	name = "Таджара: Уши"
	icon_state = "ears_plain"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_clean
	name = "Таджара: Уши и волосы"
	icon_state = "hair_clean"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_bangs
	name = "Таджара: Дреды"
	icon_state = "hair_bangs"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_braid
	name = "Таджара: Косы"
	icon_state = "hair_tbraid"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_shaggy
	name = "Таджара: Лохматые"
	icon_state = "hair_shaggy"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_mohawk
	name = "Таджара: Могавк"
	icon_state = "hair_mohawk"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_plait
	name = "Таджара: Хвостик"
	icon_state = "hair_plait"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_straight
	name = "Таджара: Прямые"
	icon_state = "hair_straight"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_long
	name = "Таджара: Длинные"
	icon_state = "hair_long"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_rattail
	name = "Таджара: Крысиный хвост"
	icon_state = "hair_rattail"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_spiky
	name = "Таджара: Колючие"
	icon_state = "hair_tajspiky"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_messy
	name = "Таджара: Неопрятные"
	icon_state = "hair_messy"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_curls
	name = "Таджара: Кудрявые"
	icon_state = "hair_curly"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_wife
	name = "Таджара: Домоседка"
	icon_state = "hair_wife"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_victory
	name = "Таджара: Прическа в стиле виктори"
	icon_state = "hair_victory"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_bob
	name = "Таджара: Каре"
	icon_state = "hair_tbob"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/hair/taj_ears_fingercurl
	name = "Таджара: Завитые локоны"
	icon_state = "hair_fingerwave"
	species_allowed = list(SPECIES_TAJ)

//Teshari things
/datum/sprite_accessory/hair/teshari
	name = "Тешари: Обычная"
	icon_state = "teshari_default"
	species_allowed = list(SPECIES_TESHARI)

/datum/sprite_accessory/hair/teshari/altdefault
	name = "Тешари: Обычная, альт"
	icon_state = "teshari_ears"

/datum/sprite_accessory/hair/teshari/tight
	name = "Тешари: Плотная"
	icon_state = "teshari_tight"

/datum/sprite_accessory/hair/teshari/excited
	name = "Тешари: Колючая"
	icon_state = "teshari_spiky"

/datum/sprite_accessory/hair/teshari/spike
	name = "Тешари: Шипы"
	icon_state = "teshari_spike"

/datum/sprite_accessory/hair/teshari/long
	name = "Тешари: Обросшие"
	icon_state = "teshari_long"

/datum/sprite_accessory/hair/teshari/burst
	name = "Тешари: Взрыв на макаронной фабрике"
	icon_state = "teshari_burst"

/datum/sprite_accessory/hair/teshari/shortburst
	name = "Тешари: Короткий взрыв на макаронной фабрике"
	icon_state = "teshari_burst_short"

/datum/sprite_accessory/hair/teshari/mohawk
	name = "Тешари: Могавк"
	icon_state = "teshari_mohawk"

/datum/sprite_accessory/hair/teshari/pointy
	name = "Тешари: По сторонам"
	icon_state = "teshari_pointy"

/datum/sprite_accessory/hair/teshari/upright
	name = "Тешари: По сторонам и вверх"
	icon_state = "teshari_upright"

/datum/sprite_accessory/hair/teshari/mane
	name = "Тешари: Грива"
	icon_state = "teshari_mane"

/datum/sprite_accessory/hair/teshari/droopy
	name = "Тешари: Вниз"
	icon_state = "teshari_droopy"

/datum/sprite_accessory/hair/teshari/mushroom
	name = "Тешари: Гриб"
	icon_state = "teshari_mushroom"

//Tesh things ported from Ark Station

/datum/sprite_accessory/hair/teshari/twies
	name = "Тешари: Назад и вверх"
	icon_state = "teshari_twies"

/datum/sprite_accessory/hair/teshari/backstrafe
	name = "Тешари: Назад"
	icon_state = "teshari_backstrafe"

/datum/sprite_accessory/hair/teshari/_longway
	name = "Тешари: Назад, длинные"
	icon_state = "teshari_longway"

/datum/sprite_accessory/hair/teshari/tree
	name = "Тешари: Дерево"
	icon_state = "teshari_tree"

/datum/sprite_accessory/hair/teshari/fluffymohawk
	name = "Тешари: Пышный могавк"
	icon_state = "teshari_fluffymohawk"

// Vox things

/datum/sprite_accessory/hair/vox_braid_short
	name = "Вокс: Короткая коса"
	icon_state = "vox_shortbraid"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_braid_long
	name = "Вокс: Длинная коса"
	icon_state = "vox_longbraid"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_quills_short
	name = "Вокс: Короткие перья"
	icon_state = "vox_shortquills"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_quills_kingly
	name = "Вокс: Королевские перья"
	icon_state = "vox_kingly"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_quills_mohawk
	name = "Вокс: Могавк из перьев"
	icon_state = "vox_mohawk"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/facial_hair/taj_sideburns
	name = "Таджара: Бакенбарды"
	icon_state = "facial_sideburns"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/facial_hair/taj_mutton
	name = "Таджара: Бакенбарды большие"
	icon_state = "facial_mutton"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/facial_hair/taj_pencilstache
	name = "Таджара: Усы тонкие"
	icon_state = "facial_pencilstache"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/facial_hair/taj_moustache
	name = "Таджара: Усы толстые"
	icon_state = "facial_moustache"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/facial_hair/taj_goatee
	name = "Таджара: Козлиная бородка"
	icon_state = "facial_goatee"
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/facial_hair/taj_smallstache
	name = "Таджара: Козлиная бородка, альт"
	icon_state = "facial_smallstache"
	species_allowed = list(SPECIES_TAJ)

//unathi horn beards and the like

/datum/sprite_accessory/facial_hair/una_chinhorn
	name = "Унати: Рожки на подбородке"
	icon_state = "facial_chinhorns"
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/facial_hair/una_hornadorns
	name = "Унати: Рога по лицу"
	icon_state = "facial_hornadorns"
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/facial_hair/una_spinespikes
	name = "Унати: Шипы до спины"
	icon_state = "facial_spikes"
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/facial_hair/una_dorsalfrill
	name = "Унати: Спинной плавник"
	icon_state = "facial_dorsalfrill"
	species_allowed = list(SPECIES_UNATHI)


//Teshari things
/datum/sprite_accessory/facial_hair/teshari_beard
	name = "Тешари: Борода"
	icon_state = "teshari_chin"
	species_allowed = list(SPECIES_TESHARI)
	gender = NEUTER

/datum/sprite_accessory/facial_hair/teshari_scraggly
	name = "Тешари: Борода, альт"
	icon_state = "teshari_scraggly"
	species_allowed = list(SPECIES_TESHARI)
	gender = NEUTER

/datum/sprite_accessory/facial_hair/teshari_chops
	name = "Тешари: Бакенбарды"
	icon_state = "teshari_gap"
	species_allowed = list(SPECIES_TESHARI)
	gender = NEUTER

/*
////////////////////////////
/  =--------------------=  /
/  ==  Body Markings   ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/marking
	icon = 'icons/mob/human_races/markings.dmi'
	do_colouration = 1 //Almost all of them have it, COLOR_ADD

	//Empty list is unrestricted. Should only restrict the ones that make NO SENSE on other species,
	//like Tajaran inner-ear coloring overlay stuff.
	species_allowed = list()

	var/body_parts = list() //A list of bodyparts this covers, in organ_tag defines
	//Reminder: BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN,BP_HEAD

/datum/sprite_accessory/marking/tat_heart
	name = "Тату: Торс"
	icon_state = "tat_heart"
	body_parts = list(BP_TORSO)

/datum/sprite_accessory/marking/tat_hive
	name = "Тату: Спина"
	icon_state = "tat_hive"
	body_parts = list(BP_TORSO)

/datum/sprite_accessory/marking/tat_nightling
	name = "Тату: Спина, альт"
	icon_state = "tat_nightling"
	body_parts = list(BP_TORSO)

/datum/sprite_accessory/marking/tat_campbell
	name = "Тату: Правая рука"
	icon_state = "tat_campbell"
	body_parts = list(BP_R_ARM)

/datum/sprite_accessory/marking/tat_campbell/left
	name = "Тату: Левая рука"
	body_parts = list(BP_L_ARM)

/datum/sprite_accessory/marking/tat_campbell/leftleg
	name = "Тату: Левая нога"
	body_parts = list (BP_L_LEG)

/datum/sprite_accessory/marking/tat_silverburgh/left
	name = "Тату: Левая нога, альт"
	icon_state = "tat_silverburgh"
	body_parts = list (BP_L_LEG)

/datum/sprite_accessory/marking/tat_campbell/rightleg
	name = "Тату: Правая нога"
	body_parts = list(BP_R_LEG)

/datum/sprite_accessory/marking/tat_silverburgh
	name = "Tату: Правая нога, альт"
	icon_state = "tat_silverburgh"
	body_parts = list (BP_R_LEG)

/datum/sprite_accessory/marking/tat_tiger
	name = "Тату: Тигриные полосы (всё тело)"
	icon_state = "tat_tiger"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN)

/datum/sprite_accessory/marking/paw_socks
	name = "Окрас носков (все расы)"
	icon_state = "pawsocks"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
	species_allowed = list(SPECIES_TAJ, SPECIES_UNATHI)

/datum/sprite_accessory/marking/paw_socks_belly
	name = "Окрас носков, живота (все расы)"
	icon_state = "pawsocksbelly"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)
	species_allowed = list(SPECIES_TAJ, SPECIES_UNATHI)

/datum/sprite_accessory/marking/belly_hands_feet
	name = "Окрас ладоней, ступней, живота (меньше)"
	icon_state = "bellyhandsfeetsmall"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)
	species_allowed = list(SPECIES_TAJ, SPECIES_UNATHI)

/datum/sprite_accessory/marking/hands_feet_belly_full
	name = "Окрас ладоней, ступней, живота (больше)"
	icon_state = "bellyhandsfeet"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)
	species_allowed = list(SPECIES_TAJ, SPECIES_UNATHI)

/datum/sprite_accessory/marking/hands_feet_belly_full_female
	name = "Окрас ладоней, ступней, живота (больше, жен.)"
	icon_state = "bellyhandsfeet_female"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/marking/patches
	name = "Цветные пятна"
	icon_state = "patches"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN)
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/marking/patchesface
	name = "Цветные пятна (лицо)"
	icon_state = "patchesface"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/marking/bands
	name = "Цветные кольца"
	icon_state = "bands"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN)

/datum/sprite_accessory/marking/bandsface
	name = "Цветные кольца (лицо)"
	icon_state = "bandsface"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tiger_stripes
	name = "Тигр: Полосы"
	icon_state = "tiger"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_TORSO,BP_GROIN)
	species_allowed = list(SPECIES_TAJ) //There's a tattoo for non-cats

/datum/sprite_accessory/marking/tigerhead
	name = "Тигр: Полосы (голова, меньше)"
	icon_state = "tigerhead"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tigerface
	name = "Тигр: полосы (голова, больше)"
	icon_state = "tigerface"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_TAJ) //There's a tattoo for non-cats

/datum/sprite_accessory/marking/backstripe
	name = "Спина: Полосы"
	icon_state = "backstripe"
	body_parts = list(BP_TORSO)

/datum/sprite_accessory/marking/heterochromia
	name = "Глаза: Гетерохромия (правый)"
	icon_state = "heterochromia"
	body_parts = list(BP_HEAD)

	//Taj specific stuff
/datum/sprite_accessory/marking/taj_belly
	name = "Таджара: Живот"
	icon_state = "taj_belly"
	body_parts = list(BP_TORSO)
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/marking/taj_bellyfull
	name = "Таджара: Живот (шире)"
	icon_state = "taj_bellyfull"
	body_parts = list(BP_TORSO)
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/marking/taj_earsout
	name = "Таджара: Уши (внеш.)"
	icon_state = "taj_earsout"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/marking/taj_earsin
	name = "Таджара: Уши (внутр.)"
	icon_state = "taj_earsin"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/marking/taj_nose
	name = "Таджара: Нос"
	icon_state = "taj_nose"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/marking/taj_crest
	name = "Таджара: Грудь (крест)"
	icon_state = "taj_crest"
	body_parts = list(BP_TORSO)
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/marking/taj_muzzle
	name = "Таджара: Морда"
	icon_state = "taj_muzzle"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/marking/taj_face
	name = "Таджара: Щёки"
	icon_state = "taj_face"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/marking/taj_all
	name = "Таджара: Голова (полностью)"
	icon_state = "taj_all"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/marking/taj_paw_socks
	name = "Таджара: Окрас носков"
	icon_state = "taj_pawsocks"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
	species_allowed = list(SPECIES_TAJ)

	//Una specific stuff
/datum/sprite_accessory/marking/una_face
	name = "Унати: Лицо"
	icon_state = "una_face"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/marking/una_facelow
	name = "Унати: Лицо (ниже)"
	icon_state = "una_facelow"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/marking/una_scutes
	name = "Унати: Грудь"
	icon_state = "una_scutes"
	body_parts = list(BP_TORSO)
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/marking/una_paw_socks
	name = "Унати: Окрас носков"
	icon_state = "una_pawsocks"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
	species_allowed = list(SPECIES_UNATHI)

	//Tesh stuff.

/datum/sprite_accessory/marking/teshi_fluff
	name = "Тешари: Вторичный цвет"
	icon_state = "teshi_fluff"
	body_parts = list(BP_HEAD, BP_TORSO, BP_GROIN, BP_R_LEG, BP_L_LEG)
	species_allowed = list(SPECIES_TESHARI)

/datum/sprite_accessory/marking/teshi_heterochromia
	name = "Тешари: Гетерохромия (правый глаз)"
	icon_state = "teshi_heterochromia"
	body_parts = list(BP_HEAD)
	species_allowed = list(SPECIES_TESHARI)

	//Diona stuff.

/datum/sprite_accessory/marking/diona_leaves
	name = "Диона: Листва"
	icon_state = "diona_leaves"
	body_parts = list(BP_L_FOOT, BP_R_FOOT, BP_L_LEG, BP_R_LEG, BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_TORSO, BP_GROIN, BP_HEAD)
	species_allowed = list(SPECIES_DIONA)

/datum/sprite_accessory/marking/diona_thorns
	name = "Диона: Шипы"
	icon_state = "diona_thorns"
	body_parts =list(BP_TORSO, BP_HEAD)
	species_allowed = list(SPECIES_DIONA)
	do_colouration = 0

/datum/sprite_accessory/marking/diona_flowers
	name = "Диона: Цветы"
	icon_state = "diona_flowers"
	body_parts =list(BP_TORSO, BP_HEAD)
	species_allowed = list(SPECIES_DIONA)
	do_colouration = 0

/datum/sprite_accessory/marking/diona_moss
	name = "Диона: Мох"
	icon_state = "diona_moss"
	body_parts =list(BP_TORSO)
	species_allowed = list(SPECIES_DIONA)
	do_colouration = 0

/datum/sprite_accessory/marking/diona_mushroom
	name = "Диона: Гриб"
	icon_state = "diona_mushroom"
	body_parts =list(BP_HEAD)
	species_allowed = list(SPECIES_DIONA)
	do_colouration = 0

/datum/sprite_accessory/marking/diona_antennae
	name = "Диона: Антенна"
	icon_state = "diona_antennae"
	body_parts =list(BP_HEAD)
	species_allowed = list(SPECIES_DIONA)
	do_colouration = 0



//skin styles - WIP
//going to have to re-integrate this with surgery
//let the icon_state hold an icon preview for now
/datum/sprite_accessory/skin
	icon = 'icons/mob/human_races/r_human.dmi'

/datum/sprite_accessory/skin/human
	name = "Default human skin"
	icon_state = "default"
	species_allowed = list(SPECIES_HUMAN,SPECIES_HUMAN_VATBORN)

/datum/sprite_accessory/skin/human_tatt01
	name = "Tatt01 human skin"
	icon_state = "tatt1"
	species_allowed = list(SPECIES_HUMAN,SPECIES_HUMAN_VATBORN)

/datum/sprite_accessory/skin/tajaran
	name = "Default tajaran skin"
	icon_state = "default"
	icon = 'icons/mob/human_races/r_tajaran.dmi'
	species_allowed = list(SPECIES_TAJ)

/datum/sprite_accessory/skin/unathi
	name = "Default Unathi skin"
	icon_state = "default"
	icon = 'icons/mob/human_races/r_lizard.dmi'
	species_allowed = list(SPECIES_UNATHI)

/datum/sprite_accessory/skin/skrell
	name = "Default skrell skin"
	icon_state = "default"
	icon = 'icons/mob/human_races/r_skrell.dmi'
	species_allowed = list(SPECIES_SKRELL)
