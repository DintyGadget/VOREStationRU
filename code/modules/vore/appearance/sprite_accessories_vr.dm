/*
	Hello and welcome to VOREStation sprite_accessories: For a more general overview
	please read sprite_accessories.dm. This file is for ears and tails.
	This is intended to be friendly for people with little to no actual coding experience.
	!!WARNING!!: changing existing accessory information can be VERY hazardous to savefiles,
	to the point where you may completely corrupt a server's savefiles. Please refrain
	from doing this unless you absolutely know what you are doing, and have defined a
	conversion in savefile.dm
*/

// Add Additional variable onto sprite_accessory
/datum/sprite_accessory
	// Ckey of person allowed to use this, if defined.
	var/list/ckeys_allowed = null
	var/apply_restrictions = FALSE		//whether to apply restrictions for specific tails/ears/wings

/*
////////////////////////////
/  =--------------------=  /
/  == Ear Definitions  ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/ears
	name = "You should not see this..."
	icon = 'icons/mob/vore/ears_vr.dmi'
	do_colouration = 0 // Set to 1 to blend (ICON_ADD) hair color

	var/color_blend_mode = ICON_ADD // Only appliciable if do_coloration = 1
	var/extra_overlay // Icon state of an additional overlay to blend in.
	var/desc = "You should not see this..."

// Species-unique ears

/datum/sprite_accessory/ears/shadekin
	name = "Шейдкин (окрашиваемые)"
	desc = ""
	icon_state = "shadekin"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	apply_restrictions = TRUE
	species_allowed = list(SPECIES_SHADEKIN, SPECIES_SHADEKIN_CREW)

// Ears avaliable to anyone

/datum/sprite_accessory/ears/hyena
	name = "Гиена (два цвета)"
	desc = ""
	icon_state = "hyena"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "hyena-inner"

/datum/sprite_accessory/ears/moth
	name = "Мотылек"
	desc = ""
	icon_state = "moth"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/squirrel_orange
	name = "Белка, оранжевые"
	desc = ""
	icon_state = "squirrel-orange"

/datum/sprite_accessory/ears/squirrel_red
	name = "Белка, рыжие"
	desc = ""
	icon_state = "squirrel-red"

/datum/sprite_accessory/ears/bunny_white
	name = "Кролик, белые"
	desc = ""
	icon_state = "bunny"

/datum/sprite_accessory/ears/bear_brown
	name = "Медведь, коричневые"
	desc = ""
	icon_state = "bear-brown"

/datum/sprite_accessory/ears/bear_panda
	name = "Медведь, панда"
	desc = ""
	icon_state = "panda"

/datum/sprite_accessory/ears/wolf_grey
	name = "Волк, серые"
	desc = ""
	icon_state = "wolf-grey"

/datum/sprite_accessory/ears/wolf_green
	name = "Волк, зеленые"
	desc = ""
	icon_state = "wolf-green"

/datum/sprite_accessory/ears/wisewolf
	name = "Волк, светлые"
	desc = ""
	icon_state = "wolf-wise"

/datum/sprite_accessory/ears/mouse_grey
	name = "Мышь: серые"
	desc = ""
	icon_state = "mouse-grey"

/datum/sprite_accessory/ears/bee
	name = "Пчелиная антенна"
	desc = ""
	icon_state = "bee"

/datum/sprite_accessory/ears/antennae
	name = "Антенна (окр.)"
	desc = ""
	icon_state = "antennae"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/curly_bug
	name = "Антенна круглая (окр.)"
	desc = ""
	icon_state = "curly_bug"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/dual_robot
	name = "Синт, антенна (окр.)"
	desc = ""
	icon_state = "dual_robot_antennae"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/right_robot
	name = "Синт, правая (окр.)"
	desc = ""
	icon_state = "right_robot_antennae"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/left_robot
	name = "Синт, левая (окр.)"
	desc = ""
	icon_state = "left_robot_antennae"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/oni_h1
	name = "Они, рога"
	desc = ""
	icon_state = "oni-h1"

/datum/sprite_accessory/ears/oni_h1_c
	name = "Они, рога (окр.)"
	desc = ""
	icon_state = "oni-h1_c"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/demon_horns1
	name = "Демон, рога"
	desc = ""
	icon_state = "demon-horns1"

/datum/sprite_accessory/ears/demon_horns1_c
	name = "Демон, рога (окр.)"
	desc = ""
	icon_state = "demon-horns1_c"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/demon_horns2
	name = "Демон, рога наружу (окр.)"
	desc = ""
	icon_state = "demon-horns2"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/dragon_horns
	name = "Дракон, рога (окр.)"
	desc = ""
	icon_state = "dragon-horns"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/foxears
	name = "Зоррен, горный"
	desc = ""
	icon_state = "foxears"

/datum/sprite_accessory/ears/fenears
	name = "Зоррен, равнинный"
	desc = ""
	icon_state = "fenears"

/datum/sprite_accessory/ears/sergal //Redundant
	name = "Сергал"
	icon_state = "serg_plain_s"

/datum/sprite_accessory/ears/foxearshc
	name = "Зоррен, горный (окр.)"
	desc = ""
	icon_state = "foxearshc"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/fenearshc
	name = "Зоррен, равнинный (окр.)"
	desc = ""
	icon_state = "fenearshc"
	extra_overlay = "fenears-inner"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/sergalhc
	name = "Сергал (окр.)"
	icon_state = "serg_plain_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/mousehc
	name = "Мышь (окр.)"
	desc = ""
	icon_state = "mouse"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "mouseinner"

/datum/sprite_accessory/ears/mousehcno
	name = "Мышь, один цвет (окр.)"
	desc = ""
	icon_state = "mouse"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/wolfhc
	name = "Волк (окр.)"
	desc = ""
	icon_state = "wolf"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "wolfinner"

/datum/sprite_accessory/ears/bearhc
	name = "Медведь (окр.)"
	desc = ""
	icon_state = "bear"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/smallbear
	name = "Медведь, маленькие (окр.)"
	desc = ""
	icon_state = "smallbear"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/squirrelhc
	name = "Белка (окр.)"
	desc = ""
	icon_state = "squirrel"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/kittyhc
	name = "Кошка (окр.)"
	desc = ""
	icon_state = "kitty"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "kittyinner"

/datum/sprite_accessory/ears/bunnyhc
	name = "Кролик (окр.)"
	desc = ""
	icon_state = "bunny"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/antlers
	name = "Олень, рога"
	desc = ""
	icon_state = "antlers"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/antlers_e
	name = "Олень, рога и уши"
	desc = ""
	icon_state = "cow-nohorns"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "antlers_mark"

/datum/sprite_accessory/ears/smallantlers
	name = "Олень, маленькие рога"
	desc = ""
	icon_state = "smallantlers"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/smallantlers_e
	name = "Олень, маленькие рога и уши"
	desc = ""
	icon_state = "smallantlers"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "deer"

/datum/sprite_accessory/ears/deer
	name = "Олень, уши"
	desc = ""
	icon_state = "deer"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/cow
	name = "Корова, рога"
	desc = ""
	icon_state = "cow"

/datum/sprite_accessory/ears/cowc
	name = "Корова, рога (окр.)"
	desc = ""
	icon_state = "cow-c"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/cow_nohorns
	name = "Корова, уши (окр.)"
	desc = ""
	icon_state = "cow-nohorns"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/caprahorns
	name = "Козел (окр.)"
	desc = ""
	icon_state = "caprahorns"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/otie
	name = "Оти (окр.)"
	desc = ""
	icon_state = "otie"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "otie-inner"

/datum/sprite_accessory/ears/donkey
	name = "Осел (окр.)"
	desc = ""
	icon_state = "donkey"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "otie-inner"

/datum/sprite_accessory/ears/zears
	name = "Уши широкие"
	desc = ""
	icon_state = "zears"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/elfs
	name = "Эльф"
	desc = ""
	icon_state = "elfs"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/sleek
	name = "Уши острые"
	desc = ""
	icon_state = "sleek"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/drake
	name = "Дракон, бока"
	desc = ""
	icon_state = "drake"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/vulp
	name = "Вульпканин, два цвета"
	desc = ""
	icon_state = "vulp"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "vulp-inner"

/datum/sprite_accessory/ears/vulp_short
	name = "Вульпканин, короткие"
	desc = ""
	icon_state = "vulp_terrier"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/vulp_short_dc
	name = "Вульпканин, короткие двухцветные"
	desc = ""
	icon_state = "vulp_terrier"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "vulp_terrier-inner"

/datum/sprite_accessory/ears/vulp_jackal
	name = "Вульпканин, тонкие двухцветные"
	desc = ""
	icon_state = "vulp_jackal"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "vulp_jackal-inner"

/datum/sprite_accessory/ears/bunny_floppy
	name = "Кролик, свисающие (окр.)"
	desc = ""
	icon_state = "floppy_bun"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/teshari
	name = "Тешари, мех (окр.)"
	desc = ""
	icon_state = "teshari"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "teshariinner"

/datum/sprite_accessory/ears/tesharihigh
	name = "Тешари, окрас верхнего меха"
	desc = ""
	icon_state = "tesharihigh"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "tesharihighinner"

/datum/sprite_accessory/ears/tesharilow
	name = "Тешари, окрас нижнего меха"
	desc = ""
	icon_state = "tesharilow"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "tesharilowinner"

/datum/sprite_accessory/ears/inkling
	name = "Кролик, взрослые свисающие"
	desc = ""
	icon = 'icons/mob/human_face_vr.dmi'
	icon_state = "inkling-colorable"
	color_blend_mode = ICON_MULTIPLY
	do_colouration = 1

/datum/sprite_accessory/ears/large_dragon
	name = "Дракон, огромные рога"
	desc = ""
	icon_state = "big_liz"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

// Special snowflake ears go below here.

/datum/sprite_accessory/ears/molenar_kitsune
	name = "quintail kitsune ears (Molenar)"
	desc = ""
	icon_state = "molenar-kitsune"
	ckeys_allowed = list("molenar")

/datum/sprite_accessory/ears/lilimoth_antennae
	name = "citheronia antennae (Kira72)"
	desc = ""
	icon_state = "lilimoth_antennae"
	ckeys_allowed = list("kira72")

/datum/sprite_accessory/ears/molenar_deathclaw
	name = "deathclaw ears (Molenar)"
	desc = ""
	icon_state = "molenar-deathclaw"
	ckeys_allowed = list("molenar")

/datum/sprite_accessory/ears/miria_fluffdragon
	name = "fluffdragon ears (Miria Masters)"
	desc = ""
	icon_state = "miria-fluffdragonears"
	ckeys_allowed = list("miriamasters")

/datum/sprite_accessory/ears/miria_kitsune
	name = "kitsune ears (Miria Masters)"
	desc = ""
	icon_state = "miria-kitsuneears"
	ckeys_allowed = list("miriamasters")

/datum/sprite_accessory/ears/runac
	name = "fennecsune ears (Runac)"
	desc = ""
	icon_state = "runac"
	ckeys_allowed = list("rebcom1807")

/datum/sprite_accessory/ears/kerena
	name = "wingwolf ears (Kerena)"
	desc = ""
	icon_state = "kerena"
	ckeys_allowed = list("somekindofpony")

/datum/sprite_accessory/ears/rosey
	name = "tritail kitsune ears (Rosey)"
	desc = ""
	icon_state = "rosey"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	ckeys_allowed = list("joey4298")

/datum/sprite_accessory/ears/aronai
	name = "aronai ears/head (Aronai)"
	desc = ""
	icon_state = "aronai"
	ckeys_allowed = list("arokha")

/datum/sprite_accessory/ears/holly
	name = "tigress ears (Holly Sharp)"
	desc = ""
	icon_state = "tigressears"
	ckeys_allowed = list("hoodoo")

/datum/sprite_accessory/ears/molenar_inkling
	name = "teal mature inkling hair (Kari Akiren)"
	desc = ""
	icon_state = "molenar-tentacle"
	ckeys_allowed = list("molenar")

/datum/sprite_accessory/ears/shock
	name = "pharoah hound ears (Shock Diamond)"
	desc = ""
	icon_state = "shock"
	ckeys_allowed = list("icowom","cameron653")

/datum/sprite_accessory/ears/alurane
	name = "alurane ears/hair (Pumila)"
	desc = ""
	icon_state = "alurane-ears"
	ckeys_allowed = list("natje")

/datum/sprite_accessory/ears/frost
    name = "Frost antenna"
    desc = ""
    icon_state = "frosted_tips"
    ckeys_allowed = list("tucker0666")

/datum/sprite_accessory/ears/sylv_pip
    name = "sylveon ears and ribbons (Pip Shyner)"
    desc = ""
    icon_state = "pipears"
    ckeys_allowed = list("phoaly")

/datum/sprite_accessory/ears/elf_caprine_colorable
	name = "Козел, рога с острыми ушами"
	desc = ""
	icon_state = "elfs"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "caprahorns"

/datum/sprite_accessory/ears/elf_oni_colorable
	name = "Они, рога с острыми ушами"
	desc = ""
	icon_state = "elfs"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "oni-h1_c"

/datum/sprite_accessory/ears/elf_demon_colorable
	name = "Демон, рога с острыми ушами"
	desc = ""
	icon_state = "elfs"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "demon-horns1_c"

/datum/sprite_accessory/ears/elf_demon_outwards_colorable
	name = "Демон, рога наружу с острыми ушами"
	desc = ""
	icon_state = "elfs"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "demon-horns2"

/datum/sprite_accessory/ears/elf_dragon_colorable
	name = "Дракон, рога с острыми ушами"
	desc = ""
	icon_state = "elfs"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "dragon-horns"
/*
////////////////////////////
/  =--------------------=  /
/  == Wing Definitions ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/wing
	name = "You should not see this..."
	icon = 'icons/mob/vore/wings_vr.dmi'
	do_colouration = 0 //Set to 1 to enable coloration using the tail color.

	var/color_blend_mode = ICON_ADD // Only appliciable if do_coloration = 1
	var/extra_overlay // Icon state of an additional overlay to blend in.
	var/clothing_can_hide = 1 // If true, clothing with HIDETAIL hides it. If the clothing is bulky enough to hide a tail, it should also hide wings.
	// var/show_species_tail = 1 // Just so // TODO - Seems not needed ~Leshana
	var/desc = "You should not see this..."
	var/ani_state // State when flapping/animated
	var/extra_overlay_w // Flapping state for extra overlay

/datum/sprite_accessory/wing/shock //Unable to split the tail from the wings in the sprite, so let's just classify it as wings.
	name = "pharoah hound tail (Shock Diamond)"
	desc = ""
	icon_state = "shock"
	ckeys_allowed = list("icowom")

/datum/sprite_accessory/wing/featheredlarge //Made by Natje!
	name = "Крылья перистые большие (окр.)"
	desc = ""
	icon_state = "feathered2"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/spider_legs //Not really /WINGS/ but they protrude from the back, kinda. Might as well have them here.
	name = "Паук, ноги"
	desc = ""
	icon_state = "spider-legs"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/moth
	name = "Мотылек"
	desc = ""
	icon_state = "moth"

/datum/sprite_accessory/wing/mothc
	name = "Мотылек (окр.)"
	desc = ""
	icon_state = "moth"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/dragonfly
	name = "Стрекоза"
	desc = ""
	icon_state = "dragonfly"
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/citheroniamoth
	name = "citheronia wings"
	desc = ""
	icon_state = "citheronia_wings"
	ckeys_allowed = list("kira72")

/datum/sprite_accessory/wing/feathered
	name = "Крылья перистые (окр.)"
	desc = ""
	icon_state = "feathered"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/feathered_medium
	name = "Крылья перистые (окр.)" // Keekenox made these feathery things with a little bit more shape to them than the other wings. They are medium sized wing boys.
	desc = ""
	icon_state = "feathered3"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/bat_black
	name = "Летучая мышь, черные"
	desc = ""
	icon_state = "bat-black"

/datum/sprite_accessory/wing/bat_color
	name = "Летучая мышь (окр.)"
	desc = ""
	icon_state = "bat-color"
	do_colouration = 1

/datum/sprite_accessory/wing/bat_red
	name = "Летучая мышь, красные"
	desc = ""
	icon_state = "bat-red"

/datum/sprite_accessory/wing/harpywings
	name = "Гарпия (окр.)"
	desc = ""
	icon_state = "harpywings"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/feathered
	name = "Крылья перистые (окр.)"
	desc = ""
	icon_state = "feathered"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/beewings
	name = "Пчела (окр.)"
	desc = ""
	icon_state = "beewings"

/datum/sprite_accessory/wing/sepulchre
	name = "demon wings (Sepulchre)"
	desc = ""
	icon_state = "sepulchre_wings"
	ckeys_allowed = list("sepulchre")

/datum/sprite_accessory/wing/miria_fluffdragon
	name = "fluffdragon wings (Miria Masters)"
	desc = ""
	icon_state = "miria-fluffdragontail"
	ckeys_allowed = list("miriamasters")

/datum/sprite_accessory/wing/scree
	name = "green taj wings (Scree)"
	desc = ""
	icon_state = "scree-wings"
	ckeys_allowed = list("scree")

/datum/sprite_accessory/wing/liquidfirefly_gazer //I g-guess this could be considered wings?
	name = "gazer eyestalks"
	desc = ""
	icon_state = "liquidfirefly-eyestalks"
	ckeys_allowed = list("liquidfirefly","seiga") //At request.

/datum/sprite_accessory/wing/moth_full
	name = "Мотылек, с антенной"
	desc = ""
	icon_state = "moth_full"

/datum/sprite_accessory/wing/moth_full_gray
	name = "Мотылек, с антенной (окр.)"
	desc = ""
	icon_state = "moth_full_gray"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/kerena
	name = "wingwolf wings (Kerena)"
	desc = ""
	icon_state = "kerena-wings"
	ckeys_allowed = list("somekindofpony")

/datum/sprite_accessory/wing/snag
	name = "Ксеноморф"
	desc = ""
	icon_state = "snag-backplate"

/datum/sprite_accessory/wing/sepulchre_c_yw
	name = "Демон (окр.)"
	desc = ""
	icon_state = "sepulchre_wingsc"
	do_colouration = 1

/datum/sprite_accessory/wing/cyberdragon
	name = "Дракон-киборг (окр.)"
	desc = ""
	icon_state = "cyberdragon_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/wing/cyberdragon_red
	name = "Дракон-киборг, красные"
	desc = ""
	icon_state = "cyberdragon_red_s"
	do_colouration = 0

/datum/sprite_accessory/wing/cyberdoe
	name = "Дракон-киборг, светлые"
	desc = ""
	icon_state = "cyberdoe_s"
	do_colouration = 0

/*
////////////////////////////
/  =--------------------=  /
/  == Tail Definitions ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/tail
	name = "You should not see this..."
	icon = 'icons/mob/vore/tails_vr.dmi'
	do_colouration = 0 //Set to 1 to enable coloration using the tail color.

	var/color_blend_mode = ICON_ADD // Only appliciable if do_coloration = 1
	var/extra_overlay // Icon state of an additional overlay to blend in.
	var/show_species_tail = 0 // If false, do not render species' tail.
	var/clothing_can_hide = 1 // If true, clothing with HIDETAIL hides it
	var/desc = "You should not see this..."
	var/ani_state // State when wagging/animated
	var/extra_overlay_w // Wagging state for extra overlay
	var/list/hide_body_parts = list() //Uses organ tag defines. Bodyparts in this list do not have their icons rendered, allowing for more spriter freedom when doing taur/digitigrade stuff.
	var/icon/clip_mask_icon = null //Icon file used for clip mask.
	var/clip_mask_state = null //Icon state to generate clip mask. Clip mask is used to 'clip' off the lower part of clothing such as jumpsuits & full suits.
	var/icon/clip_mask = null //Instantiated clip mask of given icon and state

/datum/sprite_accessory/tail/New()
	. = ..()
	if(clip_mask_icon && clip_mask_state)
		clip_mask = icon(icon = clip_mask_icon, icon_state = clip_mask_state)

// Species-unique tails

// Everyone tails

/datum/sprite_accessory/tail/invisible
	name = "Скрыть расовый хвост"
	icon = null
	icon_state = null

/datum/sprite_accessory/tail/squirrel_orange
	name = "Белка, оранжевый"
	desc = ""
	icon_state = "squirrel-orange"

/datum/sprite_accessory/tail/squirrel_red
	name = "Белка, рыжий"
	desc = ""
	icon_state = "squirrel-red"

/datum/sprite_accessory/tail/squirrel
	name = "Белка (окр.)"
	desc = ""
	icon_state = "squirrel"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/kitty
	name = "Кот, вниз (окр.)"
	desc = ""
	icon_state = "kittydown"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/kittyup
	name = "Кот, вверх (окр.)"
	desc = ""
	icon_state = "kittyup"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/tiger_white
	name = "Тигр (окр.)"
	desc = ""
	icon_state = "tiger"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "tigerinnerwhite"

/datum/sprite_accessory/tail/stripey
	name = "Таджара, полосатый (окр.)"
	desc = ""
	icon_state = "stripeytail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "stripeytail_mark"

/datum/sprite_accessory/tail/stripeytail_brown
	name = "Таджара, полосатый коричневый"
	desc = ""
	icon_state = "stripeytail-brown"

/datum/sprite_accessory/tail/chameleon
	name = "Хамелеон (окр.)"
	desc = ""
	icon_state = "chameleon"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/bunny
	name = "Кролик (окр.)"
	desc = ""
	icon_state = "bunny"
	do_colouration = 1

/datum/sprite_accessory/tail/bear_brown
	name = "Медведь, коричневый"
	desc = ""
	icon_state = "bear-brown"

/datum/sprite_accessory/tail/bear
	name = "Медведь (окр.)"
	desc = ""
	icon_state = "bear"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/dragon
	name = "Дракон (окр.)"
	desc = ""
	icon_state = "dragon"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/wolf_grey
	name = "Волк, серый"
	desc = ""
	icon_state = "wolf-grey"

/datum/sprite_accessory/tail/wolf_green
	name = "Волк, зеленый"
	desc = ""
	icon_state = "wolf-green"

/datum/sprite_accessory/tail/wisewolf
	name = "Волк, светлый"
	desc = ""
	icon_state = "wolf-wise"

/datum/sprite_accessory/tail/blackwolf
	name = "Волк, черный"
	desc = ""
	icon_state = "wolf"

/datum/sprite_accessory/tail/wolf
	name = "Волк (окр.)"
	desc = ""
	icon_state = "wolf"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "wolfinner"

/datum/sprite_accessory/tail/mouse_pink
	name = "Мышь, розовый"
	desc = ""
	icon_state = "mouse-pink"

/datum/sprite_accessory/tail/mouse
	name = "Мышь (окр.)"
	desc = ""
	icon_state = "mouse"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/horse
	name = "Лошадь (окр.)"
	desc = ""
	icon_state = "horse"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/cow
	name = "Корова (окр.)"
	desc = ""
	icon_state = "cow"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/fantail
	name = "Птичий веер (окр.)"
	desc = ""
	icon_state = "fantail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/wagtail
	name = "Птичий виляющий (окр.)"
	desc = ""
	icon_state = "wagtail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/nevreandc
	name = "Невреан (два цвета)"
	desc = ""
	icon_state = "nevreantail_dc"
	extra_overlay = "nevreantail_dc_tail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/nevreanwagdc
	name = "Невреан виляющий (окр.)"
	desc = ""
	icon_state = "wagtail"
	extra_overlay = "wagtail_dc_tail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/nevreanwagdc_alt
	name = "Невреан виляющий помеченный (два цвета)"
	desc = ""
	icon_state = "wagtail2_dc"
	extra_overlay = "wagtail2_dc_mark"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/crossfox
	name = "Лис"
	desc = ""
	icon_state = "crossfox"

/datum/sprite_accessory/tail/beethorax
	name = "Пчела"
	desc = ""
	icon_state = "beethorax"

/datum/sprite_accessory/tail/doublekitsune
	name = "Китсуне двойной (окр.)"
	desc = ""
	icon_state = "doublekitsune"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/spade_color
	name = "Хвост с пикой (окр.)"
	desc = ""
	icon_state = "spadetail-black"
	do_colouration = 1

/datum/sprite_accessory/tail/snag
	name = "Ксеноморф"
	desc = ""
	icon_state = "snag"

/datum/sprite_accessory/tail/xenotail
	name = "Ксеноморф, альт"
	desc = ""
	icon_state = "xenotail"

/datum/sprite_accessory/tail/eboop
	name = "Меха EGN (окр.)"
	desc = ""
	icon_state = "eboop"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "eboop_mark"

/datum/sprite_accessory/tail/molenar_kitsune
	name = "quintail kitsune tails (Molenar)"
	desc = ""
	icon_state = "molenar-kitsune"
	ckeys_allowed = list("molenar")

/datum/sprite_accessory/tail/miria_fluffdragon
	name = "fluffdragon tail (Miria Masters)"
	desc = ""
	icon_state = "miria-fluffdragontail"
	ckeys_allowed = list("miriamasters")

/datum/sprite_accessory/tail/miria_kitsune
	name = "Black kitsune tails (Miria Masters)"
	desc = ""
	icon_state = "miria-kitsunetail"
	ckeys_allowed = list("miriamasters")

/datum/sprite_accessory/tail/molenar_deathclaw
	name = "deathclaw bits (Molenar)"
	desc = ""
	icon_state = "molenar-deathclaw"
	ckeys_allowed = list("molenar","silvertalismen","jertheace")

/datum/sprite_accessory/tail/runac
	name = "fennecsune tails (Runac)"
	desc = ""
	icon_state = "runac"
	ckeys_allowed = list("rebcom1807")

/datum/sprite_accessory/tail/reika //Leaving this since it was too hard to split the wings from the tail.
	name = "fox tail (+ beewings) (Reika)"
	desc = ""
	icon_state = "reika"
	ckeys_allowed = list("rikaru19xjenkins")

/datum/sprite_accessory/tail/rosey
	name = "tritail kitsune tails (Rosey)"
	desc = ""
	icon_state = "rosey_three"
	ckeys_allowed = list("joey4298")

/datum/sprite_accessory/tail/rosey2
	name = "pentatail kitsune tails (Rosey)" //I predict seven tails next. ~CK
	desc = ""
	icon_state = "rosey_five"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	ckeys_allowed = list("joey4298")

/datum/sprite_accessory/tail/scree
	name = "green taj tail (Scree)"
	desc = ""
	icon_state = "scree"
	ckeys_allowed = list("scree")

/datum/sprite_accessory/tail/aronai
	name = "aronai tail (Aronai)"
	desc = ""
	icon_state = "aronai"
	ckeys_allowed = list("arokha")

/datum/sprite_accessory/tail/cabletail
    name = "cabletail"
    desc = "cabletail"
    icon_state = "cabletail"
    ckeys_allowed = list("tucker0666")

/datum/sprite_accessory/tail/featherfluff_tail
    name = "featherfluff_tail"
    desc = ""
    icon_state = "featherfluff_tail"
    ckeys_allowed = list("tucker0666")

/datum/sprite_accessory/tail/ketrai_wag
	name = "Хвост красно-желтый виляющий"
	desc = ""
	icon_state = "ketraitail"
	ani_state = "ketraitail_w"
	//ckeys_allowed = list("ketrai") //They requested it to be enabled for everyone.

/datum/sprite_accessory/tail/ketrainew_wag
	name = "Хвост красно-желтый виляющий, альт"
	desc = ""
	icon_state = "ketraitailnew"
	ani_state = "ketraitailnew_w"

/datum/sprite_accessory/tail/redpanda
	name = "Красная панда"
	desc = ""
	icon_state = "redpanda"

/datum/sprite_accessory/tail/ringtail
	name = "Хвост кольчатый"
	desc = ""
	icon_state = "ringtail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "ringtail_mark"

/datum/sprite_accessory/tail/holly
	name = "tigress tail (Holly)"
	desc = ""
	icon_state = "tigresstail"
	ckeys_allowed = list("hoodoo")

/datum/sprite_accessory/tail/satyr
	name = "Козлиные ноги (окр.)"
	desc = ""
	icon_state = "satyr"
	color_blend_mode = ICON_MULTIPLY
	do_colouration = 1
	hide_body_parts = list(BP_L_LEG, BP_L_FOOT, BP_R_LEG, BP_R_FOOT) //Exclude pelvis just in case.
	clip_mask_icon = 'icons/mob/vore/taurs_vr.dmi'
	clip_mask_state = "taur_clip_mask_def" //Used to clip off the lower part of suits & uniforms.

/datum/sprite_accessory/tail/tailmaw
	name = "Хвост с пастью (окр.)"
	desc = ""
	icon_state = "tailmaw"
	color_blend_mode = ICON_MULTIPLY
	do_colouration = 1

/datum/sprite_accessory/tail/curltail
	name = "Хвост завивающийся (окр.)"
	desc = ""
	icon_state = "curltail"
	ani_state = "curltail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "curltail_mark"
	extra_overlay_w = "curltail_mark_w"

/datum/sprite_accessory/tail/shorttail
	name = "Хвост короткий (окр.)"
	desc = ""
	icon_state = "straighttail"
	ani_state = "straighttail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/sneptail
	name = "Хвост шерстистый (окр.)"
	desc = ""
	icon_state = "sneptail"
	ani_state = "sneptail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "sneptail_mark"
	extra_overlay_w = "sneptail_mark_w"


/datum/sprite_accessory/tail/tiger_new
	name = "Тигр, виляющий"
	desc = ""
	icon_state = "tigertail"
	ani_state = "tigertail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "tigertail_mark"
	extra_overlay_w = "tigertail_mark_w"

/datum/sprite_accessory/tail/vulp_new
	name = "Вульпканин, альт, виляющий"
	desc = ""
	icon_state = "vulptail"
	ani_state = "vulptail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "vulptail_mark"
	extra_overlay_w = "vulptail_mark_w"

/datum/sprite_accessory/tail/otietail
	name = "Оти, виляющий"
	desc = ""
	icon_state = "otie"
	ani_state = "otie_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/newtailmaw
	name = "Хвост с челюстью, виляющий"
	desc = ""
	icon_state = "newtailmaw"
	ani_state = "newtailmaw_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/ztail
	name = "Хвост зазубренный"
	desc = ""
	icon_state = "ztail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/snaketail
	name = "Змея"
	desc = ""
	icon_state = "snaketail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/vulpan_alt
	name = "Вульпканин, альт 2 (окр.)"
	desc = ""
	icon_state = "vulptail_alt"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/sergaltaildc
	name = "Сергал (два цвета)"
	desc = ""
	icon_state = "sergal"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "sergal_mark"

/datum/sprite_accessory/tail/skunktail
	name = "Скунс (два цвета)"
	desc = ""
	icon_state = "skunktail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "skunktail_mark"

/datum/sprite_accessory/tail/deertail
	name = "Олень (два цвета)"
	desc = ""
	icon_state = "deertail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "deertail_mark"

/datum/sprite_accessory/tail/teshari_fluffytail
	name = "Тешари, альт (окр.)"
	desc = ""
	icon_state = "teshari_fluffytail"
	extra_overlay = "teshari_fluffytail_mark"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/nightstalker
	name = "Ночной хищник (окр.)"
	desc = ""
	icon_state = "nightstalker"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

//For all species tails. Includes haircolored tails.
/datum/sprite_accessory/tail/special
	name = "Нет хвоста"
	icon = 'icons/effects/species_tails_vr.dmi'

/datum/sprite_accessory/tail/special/unathi
	name = "Унати"
	desc = ""
	icon_state = "sogtail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/tajaran
	name = "Таджара"
	desc = ""
	icon_state = "tajtail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/sergal
	name = "Сергал"
	desc = ""
	icon_state = "sergtail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/akula
	name = "Акула"
	desc = ""
	icon_state = "sharktail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/nevrean
	name = "Невреан"
	desc = ""
	icon_state = "nevreantail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/armalis
	name = "Армалис"
	desc = ""
	icon_state = "armalis_tail_humanoid_s"

/datum/sprite_accessory/tail/special/xenodrone
	name = "Ксеноморф, дрон"
	desc = ""
	icon_state = "xenos_drone_tail_s"

/datum/sprite_accessory/tail/special/xenosentinel
	name = "Ксеноморф, страж"
	desc = ""
	icon_state = "xenos_sentinel_tail_s"

/datum/sprite_accessory/tail/special/xenohunter
	name = "Ксеноморф, охотник"
	desc = ""
	icon_state = "xenos_hunter_tail_s"

/datum/sprite_accessory/tail/special/xenoqueen
	name = "Ксеноморф, королева"
	desc = ""
	icon_state = "xenos_queen_tail_s"

/datum/sprite_accessory/tail/special/monkey
	name = "Обезьяна"
	desc = ""
	icon_state = "chimptail_s"

/datum/sprite_accessory/tail/special/seromitail
	name = "Тешари"
	desc = ""
	icon_state = "seromitail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/seromitailfeathered
	name = "Тешари с перьями"
	desc = ""
	icon_state = "seromitail_s"
	extra_overlay = "seromitail_feathers_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/unathihc
	name = "Унати (окр.)"
	desc = ""
	icon_state = "sogtail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/tajaranhc
	name = "Таджара (окр.)"
	desc = ""
	icon_state = "tajtail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/sergalhc
	name = "Сергал (окр.)"
	desc = ""
	icon_state = "sergtail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/akulahc
	name = "Акула (окр.)"
	desc = ""
	icon_state = "sharktail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/nevreanhc
	name = "Невреан (окр.)"
	desc = ""
	icon_state = "nevreantail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/foxhc
	name = "Зоррен горный (окр.)"
	desc = ""
	icon_state = "foxtail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/fennechc
	name = "Зоррен равнинный (окр.)"
	desc = ""
	icon_state = "fentail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/armalishc
	name = "Армалис (окр.)"
	desc = ""
	icon_state = "armalis_tail_humanoid_hc_s"
	do_colouration = 1

/datum/sprite_accessory/tail/special/xenodronehc
	name = "Ксеноморф, дрон (окр.)"
	desc = ""
	icon_state = "xenos_drone_tail_hc_s"
	do_colouration = 1

/datum/sprite_accessory/tail/special/xenosentinelhc
	name = "Ксеноморф, страж (окр.)"
	desc = ""
	icon_state = "xenos_sentinel_tail_hc_s"
	do_colouration = 1

/datum/sprite_accessory/tail/special/xenohunterhc
	name = "Ксеноморф, охотник (окр.)"
	desc = ""
	icon_state = "xenos_hunter_tail_hc_s"
	do_colouration = 1

/datum/sprite_accessory/tail/special/xenoqueenhc
	name = "Ксеноморф, королева (окр.)"
	desc = ""
	icon_state = "xenos_queen_tail_hc_s"
	do_colouration = 1

/datum/sprite_accessory/tail/special/monkeyhc
	name = "Обезьяна (окр.)"
	desc = ""
	icon_state = "chimptail_hc_s"
	do_colouration = 1

/datum/sprite_accessory/tail/special/seromitailhc
	name = "Тешари (окр.)"
	desc = ""
	icon_state = "seromitail_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/seromitailfeatheredhc
	name = "Тешари с перьями (окр.)"
	desc = ""
	icon_state = "seromitail_feathers_hc_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/special/vulpan
	name = "Вульпканин (окр.)"
	desc = ""
	icon_state = "vulptail_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY


/datum/sprite_accessory/tail/zenghu_taj
	name = "Тажара-синт Дзен-Ху (окр.)"
	desc = ""
	icon_state = "zenghu_taj"

//Taurs moved to a separate file due to extra code around them

//Buggo Abdomens!

/datum/sprite_accessory/tail/buggo
	name = "Жук (окр.)"
	desc = ""
	icon_state = "buggo_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggobee
	name = "Жук, полосы сверху (два цвета)"
	desc = ""
	icon_state = "buggo_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobee_markings"

/datum/sprite_accessory/tail/buggobeefull
	name = "Жук, полосы везде (два цвета)"
	desc = ""
	icon_state = "buggo_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobeefull_markings"

/datum/sprite_accessory/tail/buggounder
	name = "Жук, цвет снизу (два цвета)"
	desc = ""
	icon_state = "buggo_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggounder_markings"

/datum/sprite_accessory/tail/buggofirefly
	name = "Жук, светлячок (два цвета)"
	desc = ""
	icon_state = "buggo_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofirefly_markings"

/datum/sprite_accessory/tail/buggofat
	name = "Жук жирный (окр.)"
	desc = ""
	icon_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggofatbee
	name = "Жук жирный, полосы сверху (два цвета)"
	desc = ""
	icon_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatbee_markings"

/datum/sprite_accessory/tail/buggofatbeefull
	name = "Жук жирный, полосы везде (два цвета)"
	desc = ""
	icon_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatbeefull_markings"

/datum/sprite_accessory/tail/buggofatunder
	name = "Жук жирный, цвет снизу (два цвета)"
	desc = ""
	icon_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatunder_markings"

/datum/sprite_accessory/tail/buggofatfirefly
	name = "Жук жирный, светлячок (два цвета)"
	desc = ""
	icon_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatfirefly_markings"

/datum/sprite_accessory/tail/buggowag
	name = "Жук, виляющий (окр.)"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggobeewag
	name = "Жук, полосы сверху, виляющий (окр.)"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobee_markings"
	extra_overlay_w = "buggofatbee_markings"

/datum/sprite_accessory/tail/buggobeefullwag
	name = "Жук, полосы везде, виляющий (два цвета)"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobeefull_markings"
	extra_overlay_w = "buggofatbeefull_markings"

/datum/sprite_accessory/tail/buggounderwag
	name = "Жук, цвет снизу, виляющий (два цвета)"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggounder_markings"
	extra_overlay_w = "buggofatunder_markings"

/datum/sprite_accessory/tail/buggofireflywag
	name = "Жук, светлячок, виляющий (два цвета)"
	desc = ""
	icon_state = "buggo_s"
	ani_state = "buggofat_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofirefly_markings"
	extra_overlay_w = "buggofatfirefly_markings"

//Vass buggo variants!

/datum/sprite_accessory/tail/buggovass
	name = "Жук, с передом (окр.)"
	desc = ""
	icon_state = "buggo_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassbee
	name = "Жук, полосы сверху с передом (два цвета)"
	desc = ""
	icon_state = "buggo_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobee_vass_markings"

/datum/sprite_accessory/tail/buggovassbeefull
	name = "Жук, полосы везде с передом (два цвета)"
	desc = ""
	icon_state = "buggo_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobeefull_vass_markings"

/datum/sprite_accessory/tail/buggovassunder
	name = "Жук, цвет снизу с передом (два цвета)"
	desc = ""
	icon_state = "buggo_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggounder_vass_markings"

/datum/sprite_accessory/tail/buggovassfirefly
	name = "Жук, светлячок с передом (два цвета)"
	desc = ""
	icon_state = "buggo_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofirefly_vass_markings"

/datum/sprite_accessory/tail/buggovassfat
	name = "Жук жирный, с передом (окр.)"
	desc = ""
	icon_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassfatbee
	name = "Жук жирный, полосы сверху с передом (два цвета)"
	desc = ""
	icon_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatbee_vass_markings"

/datum/sprite_accessory/tail/buggovassfatbeefull
	name = "Жук жирный, полосы везде с передом (два цвета)"
	desc = ""
	icon_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatbeefull_vass_markings"

/datum/sprite_accessory/tail/buggovassfatunder
	name = "Жук жирный, цвет снизу с передом (два цвета)"
	desc = ""
	icon_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatunder_vass_markings"

/datum/sprite_accessory/tail/buggovassfatfirefly
	name = "Жук жирный, светлячок с передом (два цвета)"
	desc = ""
	icon_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofatfirefly_vass_markings"

/datum/sprite_accessory/tail/buggovasswag
	name = "Жук, с передом, виляющий (окр.)"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/buggovassbeewag
	name = "Жук, полосы сверху с передом, виляющий (два цвета)"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobee_vass_markings"
	extra_overlay_w = "buggofatbee_vass_markings"

/datum/sprite_accessory/tail/buggovassbeefullwag
	name = "Жук, полосы везде с передом (два цвета)"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggobeefull_vass_markings"
	extra_overlay_w = "buggofatbeefull_vass_markings"

/datum/sprite_accessory/tail/buggovassunderwag
	name = "Жук, цвет снизу с передом, виляющий (два цвета)"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggounder_vass_markings"
	extra_overlay_w = "buggofatunder_vass_markings"

/datum/sprite_accessory/tail/buggovassfireflywag
	name = "Жук, светлячок с передом, виляющий (два цвета)"
	desc = ""
	icon_state = "buggo_vass_s"
	ani_state = "buggofat_vass_s"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "buggofirefly_vass_markings"
	extra_overlay_w = "buggofatfirefly_vass_markings"

/datum/sprite_accessory/tail/tail_smooth
	name = "Ящер, гладкий (окр.)"
	desc = ""
	icon_state = "tail_smooth"
	ani_state = "tail_smooth_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/triplekitsune_colorable
	name = "Китсуне, 3 хвоста (окр.)"
	desc = ""
	icon_state = "triplekitsune"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "triplekitsune_tips"

/datum/sprite_accessory/tail/ninekitsune_colorable
	name = "Китсуне, 9 хвостов (окр.)"
	desc = ""
	icon_state = "ninekitsune"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "ninekitsune-tips"

/datum/sprite_accessory/tail/shadekin_short
	name = "Шейдкин, короткий (окр.)"
	desc = ""
	icon_state = "shadekin-short"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	//apply_restrictions = TRUE
	//species_allowed = list(SPECIES_SHADEKIN, SPECIES_SHADEKIN_CREW)

/datum/sprite_accessory/tail/wartacosushi_tail //brightened +20RGB from matching roboparts
	name = "Ward-Takahashi"
	desc = ""
	icon_state = "wardtakahashi_vulp"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/wartacosushi_tail_dc
	name = "Ward-Takahashi (два цвета)"
	desc = ""
	icon_state = "wardtakahashi_vulp_dc"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "wardtakahashi_vulp_dc_mark"

