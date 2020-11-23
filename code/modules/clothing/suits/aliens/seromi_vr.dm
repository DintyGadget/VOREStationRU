//Hooded teshari cloaks
/obj/item/clothing/suit/storage/hooded/teshari
	name = "Плащик с капюшоном"
	desc = "Плащик с капюшоном, предназначенный для тешари."
	icon_override = 'icons/mob/species/seromi/teshari_hood_vr.dmi'
	icon = 'icons/mob/species/seromi/teshari_hood_vr.dmi'
	icon_state = "tesh_hcloak_bo"
	item_state_slots = list(slot_r_hand_str = "tesh_hcloak_bo", slot_l_hand_str = "tesh_hcloak_bo")
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	flags_inv = HIDEHOLSTER|HIDETIE
	//hooded = 1 Variable no longer exists, hood is now handled by code/modules/clothing/suit/storage/hooded.dm
	action_button_name = "Надеть/Снять Капюшон"
	hoodtype = /obj/item/clothing/head/tesh_hood
	allowed = list (/obj/item/weapon/pen, /obj/item/weapon/paper, /obj/item/device/flashlight,/obj/item/weapon/tank/emergency/oxygen, /obj/item/weapon/storage/fancy/cigarettes, /obj/item/weapon/storage/box/matches, /obj/item/weapon/reagent_containers/food/drinks/flask)

/obj/item/clothing/head/tesh_hood
	name = "Капюшон от плащика"
	desc = "Капюшон, прицепленный к плащику"
	icon_override = 'icons/mob/species/seromi/teshari_hood_vr.dmi'
	icon = 'icons/mob/species/seromi/teshari_hood_vr.dmi'
	icon_state = "tesh_hood_bo"
	item_state_slots = list(slot_r_hand_str = "tesh_hood_bo", slot_l_hand_str = "tesh_hood_bo")
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_orange
	name = "Чёрно-оранжевый плащик с капюшоном"
	icon_state = "tesh_hcloak_bo"
	item_state = "tesh_hcloak_bo"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_orange

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_grey
	name = "Чёрно-серый плащик с капюшоном"
	icon_state = "tesh_hcloak_bg"
	item_state = "tesh_hcloak_bg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_midgrey
	name = "Чёрно-сероватый плащик с капюшоном"
	icon_state = "tesh_hcloak_bmg"
	item_state = "tesh_hcloak_bmg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_midgrey

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_lightgrey
	name = "Чёрно-светло-серый плащик с капюшоном"
	icon_state = "tesh_hcloak_blg"
	item_state = "tesh_hcloak_blg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_lightgrey

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_white
	name = "Чёрно-белый плащик с капюшоном"
	icon_state = "tesh_hcloak_bw"
	item_state = "tesh_hcloak_bw"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_white

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_red
	name = "Чёрно-красный плащик с капюшоном"
	icon_state = "tesh_hcloak_br"
	item_state = "tesh_hcloak_br"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_red

/obj/item/clothing/suit/storage/hooded/teshari/standard/black
	name = "Чёрный плащик с капюшоном"
	icon_state = "tesh_hcloak_bn"
	item_state = "tesh_hcloak_bn"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_yellow
	name = "Чёрно-жёлтый плащик с капюшоном"
	icon_state = "tesh_hcloak_by"
	item_state = "tesh_hcloak_by"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_yellow

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_green
	name = "Чёрно-зелёный плащик с капюшоном"
	icon_state = "tesh_hcloak_bgr"
	item_state = "tesh_hcloak_bgr"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_green

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_blue
	name = "Чёрно-синий плащик с капюшоном"
	icon_state = "tesh_hcloak_bbl"
	item_state = "tesh_hcloak_bbl"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_blue

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_purple
	name = "Чёрно-фиолетовый плащик с капюшоном"
	icon_state = "tesh_hcloak_bp"
	item_state = "tesh_hcloak_bp"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_purple

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_pink
	name = "Чёрно-розовый плащик с капюшоном"
	icon_state = "tesh_hcloak_bpi"
	item_state = "tesh_hcloak_bpi"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_pink

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_brown
	name = "Чёрно-коричневый плащик с капюшоном"
	icon_state = "tesh_hcloak_bbr"
	item_state = "tesh_hcloak_bbr"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_brown

/obj/item/clothing/suit/storage/hooded/teshari/standard/orange_grey
	name = "Серо-оранжевый плащик с капюшоном"
	icon_state = "tesh_hcloak_og"
	item_state = "tesh_hcloak_og"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/orange_grey

///obj/item/clothing/suit/storage/hooded/teshari/standard/rainbow
//	name = "rainbow hooded cloak"
//	icon_state = "tesh_hcloak_rainbow"
//	item_state = "tesh_hcloak_rainbow"
//	hoodtype = /obj/item/clothing/head/tesh_hood/standard/rainbow

/obj/item/clothing/suit/storage/hooded/teshari/standard/lightgrey_grey
	name = "Серый плащик с капюшоном"
	icon_state = "tesh_hcloak_lgg"
	item_state = "tesh_hcloak_lgg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/lightgrey_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/white_grey
	name = "Серо-белый плащи с капюшоном"
	icon_state = "tesh_hcloak_wg"
	item_state = "tesh_hcloak_wg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/white_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/red_grey
	name = "Серо-красный плащик с капюшоном"
	icon_state = "tesh_hcloak_rg"
	item_state = "tesh_hcloak_rg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/red_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/orange
	name = "Оранжевый плащик с капюшоном"
	icon_state = "tesh_hcloak_on"
	item_state = "tesh_hcloak_on"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/orange

/obj/item/clothing/suit/storage/hooded/teshari/standard/yellow_grey
	name = "Серо-жёлтый плащик с капюшоном"
	icon_state = "tesh_hcloak_yg"
	item_state = "tesh_hcloak_yg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/yellow_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/green_grey
	name = "Серо-зелёный плащик с капюшоном"
	icon_state = "tesh_hcloak_gg"
	item_state = "tesh_hcloak_gg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/green_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/blue_grey
	name = "Серо-синий плащик с капюшоном"
	icon_state = "tesh_hcloak_blug"
	item_state = "tesh_hcloak_blug"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/blue_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/purple_grey
	name = "Серо-фиолетовый плащик с капюшоном"
	icon_state = "tesh_hcloak_pg"
	item_state = "tesh_hcloak_pg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/purple_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/pink_grey
	name = "Серо-розовый плащик с капюшоном"
	icon_state = "tesh_hcloak_pig"
	item_state = "tesh_hcloak_pig"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/pink_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/brown_grey
	name = "Серо-коричневый плащик с капюшоном"
	icon_state = "tesh_hcloak_brg"
	item_state = "tesh_hcloak_brg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/brown_grey

//The actual hoods
/obj/item/clothing/head/tesh_hood/standard/black_orange
	name = "Чёрно-оранжевый капюшон"
	icon_state = "tesh_hood_bo"
	item_state = "tesh_hood_bo"

/obj/item/clothing/head/tesh_hood/standard/black_grey
	name = "Чёрно-серый капюшон"
	icon_state = "tesh_hood_bg"
	item_state = "tesh_hood_bg"

/obj/item/clothing/head/tesh_hood/standard/black_midgrey
	name = "Чёрно-сероватый капюшон"
	icon_state = "tesh_hood_bmg"
	item_state = "tesh_hood_bmg"

/obj/item/clothing/head/tesh_hood/standard/black_lightgrey
	name = "Чёрно-светло-серый капюшон"
	icon_state = "tesh_hood_blg"
	item_state = "tesh_hood_blg"

/obj/item/clothing/head/tesh_hood/standard/black_white
	name = "Чёрно-белый капюшон"
	icon_state = "tesh_hood_bw"
	item_state = "tesh_hood_bw"

/obj/item/clothing/head/tesh_hood/standard/black_red
	name = "Чёрно-красный капюшон"
	icon_state = "tesh_hood_br"
	item_state = "tesh_hood_br"

/obj/item/clothing/head/tesh_hood/standard/black
	name = "Чёрный капюшон"
	icon_state = "tesh_hood_bn"
	item_state = "tesh_hood_bn"

/obj/item/clothing/head/tesh_hood/standard/black_yellow
	name = "Чёрно-жёлтый капюшон"
	icon_state = "tesh_hood_by"
	item_state = "tesh_hood_by"

/obj/item/clothing/head/tesh_hood/standard/black_green
	name = "Чёрно-зелёный капюшон"
	icon_state = "tesh_hood_bgr"
	item_state = "tesh_hood_bgr"

/obj/item/clothing/head/tesh_hood/standard/black_blue
	name = "Чёрно-синий капюшон"
	icon_state = "tesh_hood_bbl"
	item_state = "tesh_hood_bbl"

/obj/item/clothing/head/tesh_hood/standard/black_purple
	name = "Чёрно-фиолетовый капюшон"
	icon_state = "tesh_hood_bp"
	item_state = "tesh_hood_bp"

/obj/item/clothing/head/tesh_hood/standard/black_pink
	name = "Чёрно-розовый капюшон"
	icon_state = "tesh_hood_bpi"
	item_state = "tesh_hood_bpi"

/obj/item/clothing/head/tesh_hood/standard/black_brown
	name = "Чёрно-коричневый капюшон"
	icon_state = "tesh_hood_bbr"
	item_state = "tesh_hood_bbr"

/obj/item/clothing/head/tesh_hood/standard/orange_grey
	name = "Серо-оранжевый капюшон"
	icon_state = "tesh_hood_og"
	item_state = "tesh_hood_og"

/obj/item/clothing/head/tesh_hood/standard/rainbow
	name = "Радужный капюшон"
	icon_state = "tesh_hood_rainbow"
	item_state = "tesh_hood_rainbow"

/obj/item/clothing/head/tesh_hood/standard/lightgrey_grey
	name = "Серый капюшон"
	icon_state = "tesh_hood_lgg"
	item_state = "tesh_hood_lgg"

/obj/item/clothing/head/tesh_hood/standard/white_grey
	name = "Серо-белый капюшон"
	icon_state = "tesh_hood_wg"
	item_state = "tesh_hood_wg"

/obj/item/clothing/head/tesh_hood/standard/red_grey
	name = "Серо-красный капюшон"
	icon_state = "tesh_hood_rg"
	item_state = "tesh_hood_rg"

/obj/item/clothing/head/tesh_hood/standard/orange
	name = "Оранжевый капюшон"
	icon_state = "tesh_hood_on"
	item_state = "tesh_hood_on"

/obj/item/clothing/head/tesh_hood/standard/yellow_grey
	name = "Серо-жёлтый капюшон"
	icon_state = "tesh_hood_yg"
	item_state = "tesh_hood_yg"

/obj/item/clothing/head/tesh_hood/standard/green_grey
	name = "Серо-зелёный капюшон"
	icon_state = "tesh_hood_gg"
	item_state = "tesh_hood_gg"

/obj/item/clothing/head/tesh_hood/standard/blue_grey
	name = "Серо-синий капюшон"
	icon_state = "tesh_hood_blug"
	item_state = "tesh_hood_blug"

/obj/item/clothing/head/tesh_hood/standard/purple_grey
	name = "Серо-фиолетовый капюшон"
	icon_state = "tesh_hood_pg"
	item_state = "tesh_hood_pg"

/obj/item/clothing/head/tesh_hood/standard/pink_grey
	name = "Серо-розовый капюшон"
	icon_state = "tesh_hood_pig"
	item_state = "tesh_hood_pig"

/obj/item/clothing/head/tesh_hood/standard/brown_grey
	name = "Серо-коричневый капюшон"
	icon_state = "tesh_hood_brg"
	item_state = "tesh_hood_brg"

//Belted cloaks
/obj/item/clothing/suit/storage/seromi/beltcloak
	name = "Плащик с ремешком"
	desc = "Более стильный плащик, предназначенный для тешари."
	icon = 'icons/mob/species/seromi/teshari_cloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/teshari_cloak_vr.dmi'
	icon_state = "tesh_beltcloak_bo"
	item_state = "tesh_beltcloak_bo"
	species_restricted = list(SPECIES_TESHARI)
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black_orange
	name = "Чёрно-оранжевый плащик с ремешком"
	icon_state = "tesh_beltcloak_bo"
	item_state = "tesh_beltcloak_bo"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black_grey
	name = "Чёрно-серый плащик с ремешком"
	icon_state = "tesh_beltcloak_bg"
	item_state = "tesh_beltcloak_bg"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black_midgrey
	name = "Чёрно-сероватый плащик с ремешком"
	icon_state = "tesh_beltcloak_bmg"
	item_state = "tesh_beltcloak_bmg"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black_lightgrey
	name = "Чёрно-светло-серый плащик с ремешком"
	icon_state = "tesh_beltcloak_blg"
	item_state = "tesh_beltcloak_blg"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black_white
	name = "Чёрно-белый плащик с ремешком"
	icon_state = "tesh_beltcloak_bw"
	item_state = "tesh_beltcloak_bw"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black_red
	name = "Чёрно-красный плащик с ремешком"
	icon_state = "tesh_beltcloak_br"
	item_state = "tesh_beltcloak_br"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black
	name = "Чёрный плащик с ремешком"
	icon_state = "tesh_beltcloak_bn"
	item_state = "tesh_beltcloak_bn"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black_yellow
	name = "Чёрно-жёлтый плащик с ремешком"
	icon_state = "tesh_beltcloak_by"
	item_state = "tesh_beltcloak_by"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black_green
	name = "Чёрно-зелёный плащик с ремешком"
	icon_state = "tesh_beltcloak_bgr"
	item_state = "tesh_beltcloak_bgr"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black_blue
	name = "Чёрно-синий плащик с ремешком"
	icon_state = "tesh_beltcloak_bbl"
	item_state = "tesh_beltcloak_bbl"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black_purple
	name = "Чёрно-фиолетовый плащик с ремешком"
	icon_state = "tesh_beltcloak_bp"
	item_state = "tesh_beltcloak_bp"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black_pink
	name = "Чёрно-розовый плащик с ремешком"
	icon_state = "tesh_beltcloak_bpi"
	item_state = "tesh_beltcloak_bpi"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/black_brown
	name = "Чёрно-коричневый плащик с ремешком"
	icon_state = "tesh_beltcloak_bbr"
	item_state = "tesh_beltcloak_bbr"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/orange_grey
	name = "Серо-оранжевый плащик с ремешком"
	icon_state = "tesh_beltcloak_og"
	item_state = "tesh_beltcloak_og"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/rainbow
	name = "Радужный плащик с ремешком"
	icon_state = "tesh_beltcloak_rainbow"
	item_state = "tesh_beltcloak_rainbow"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/lightgrey_grey
	name = "Серый плащик с ремешком"
	icon_state = "tesh_beltcloak_lgg"
	item_state = "tesh_beltcloak_lgg"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/white_grey
	name = "Серо-белый плащик с ремешком"
	icon_state = "tesh_beltcloak_wg"
	item_state = "tesh_beltcloak_wg"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/red_grey
	name = "Серо-красный плащик с ремешком"
	icon_state = "tesh_beltcloak_rg"
	item_state = "tesh_beltcloak_rg"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/orange
	name = "Оранжевый плащик с ремешком"
	icon_state = "tesh_beltcloak_on"
	item_state = "tesh_beltcloak_on"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/yellow_grey
	name = "Серо-жёлтый плащик с ремешком"
	icon_state = "tesh_beltcloak_yg"
	item_state = "tesh_beltcloak_yg"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/green_grey
	name = "Серо-зелёный плащик с ремешком"
	icon_state = "tesh_beltcloak_gg"
	item_state = "tesh_beltcloak_gg"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/blue_grey
	name = "Серо-синий плащик с ремешком"
	icon_state = "tesh_beltcloak_blug"
	item_state = "tesh_beltcloak_blug"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/purple_grey
	name = "Серо-фиолетовый плащик с ремешком"
	icon_state = "tesh_beltcloak_pg"
	item_state = "tesh_beltcloak_pg"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/pink_grey
	name = "Серо-розовый плащик с ремешком"
	icon_state = "tesh_beltcloak_pig"
	item_state = "tesh_beltcloak_pig"

/obj/item/clothing/suit/storage/seromi/beltcloak/standard/brown_grey
	name = "Серо-коричневый плащик с ремешком"
	icon_state = "tesh_beltcloak_brg"
	item_state = "tesh_beltcloak_brg"

//Belted job cloaks
/obj/item/clothing/suit/storage/seromi/beltcloak/jobs
	icon = 'icons/mob/species/seromi/teshari_cloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/teshari_cloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/cargo
	name = "Плащик с ремешком грузчика"
	desc = "Мягкий плащик, рассчитанный на тешари в отделе снабжения."
	icon_state = "tesh_beltcloak_car"
	item_state = "tesh_beltcloak_car"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/mining
	name = "Плащик с ремешком шахтёра"
	desc = "Мягкий плащик, рассчитанный на тешари в должности шахтёра."
	icon_state = "tesh_beltcloak_mine"
	item_state = "tesh_beltcloak_mine"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/command
	name = "Плащик с ремешком Управления"
	desc = "Мягкий плащик, рассчитанный на тешари в отделе Управления."
	icon_state = "tesh_beltcloak_comm"
	item_state = "tesh_beltcloak_comm"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/ce
	name = "Плащик с ремешком Главного инженера"
	desc = "Мягкий плащик, рассчитанный на тешари в должности Главного инженера."
	icon_state = "tesh_beltcloak_ce"
	item_state = "tesh_beltcloak_ce"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/engineer
	name = "Плащик с ремешком инженера"
	desc = "Мягкий плащик, рассчитанный на тешари в должности инженера."
	icon_state = "tesh_beltcloak_engie"
	item_state = "tesh_beltcloak_engie"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/atmos
	name = "Плащик с ремешком атмосферщика"
	desc = "Мягкий плащик, рассчитанный на тешари в должности атмосферного техника."
	icon_state = "tesh_beltcloak_atmos"
	item_state = "tesh_beltcloak_atmos"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/cmo
	name = "Плащик с ремешком Главврача"
	desc = "Мягкий плащик, рассчитанный на тешари в должности Главврача."
	icon_state = "tesh_beltcloak_cmo"
	item_state = "tesh_beltcloak_cmo"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/medical
	name = "Плащик с ремешком врача"
	desc = "Мягкий плащик, рассчитанный на тешари в медицинском отделе."
	icon_state = "tesh_beltcloak_doc"
	item_state = "tesh_beltcloak_doc"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/chemistry
	name = "Плащик с ремешком химика"
	desc = "Мягкий плащик, рассчитанный на тешари в должности химика."
	icon_state = "tesh_beltcloak_vrem"
	item_state = "tesh_beltcloak_vrem"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/viro
	name = "Плащик с ремешком вирусолога"
	desc = "Мягкий плащик, рассчитанный на тешари в должности вирусолога."
	icon_state = "tesh_beltcloak_viro"
	item_state = "tesh_beltcloak_viro"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/para
	name = "Плащик с ремешком парамедика"
	desc = "Мягкий плащик, рассчитанный на тешари в должности парамедика."
	icon_state = "tesh_beltcloak_para"
	item_state = "tesh_beltcloak_para"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/sci
	name = "Плащик с ремешком учёного"
	desc = "Мягкий плащик, рассчитанный на тешари в научном отделе."
	icon_state = "tesh_beltcloak_sci"
	item_state = "tesh_beltcloak_sci"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/robo
	name = "Плащик с ремешком робототехника"
	desc = "Мягкий плащик, рассчитанный на тешари в должности робототехника."
	icon_state = "tesh_beltcloak_robo"
	item_state = "tesh_beltcloak_robo"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/sec
	name = "Плащик с ремешком службы безопасности"
	desc = "Мягкий плащик, рассчитанный на тешари в службе безопасности."
	icon_state = "tesh_beltcloak_sec"
	item_state = "tesh_beltcloak_sec"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/qm
	name = "Плащик с ремешком Квартирмейстера"
	desc = "Мягкий плащик, рассчитанный на тешари в должности Квартирмейстера."
	icon_state = "tesh_beltcloak_qm"
	item_state = "tesh_beltcloak_qm"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/service
	name = "Плащик с ремешком работника сервиса"
	desc = "Мягкий плащик, рассчитанный на тешари в обслуживающей должности."
	icon_state = "tesh_beltcloak_serv"
	item_state = "tesh_beltcloak_serv"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/iaa
	name = "Плащик с ремешком агента внутренних дел"
	desc = "Мягкий плащик, рассчитанный на тешари в должности агента внутренних дел."
	icon_state = "tesh_beltcloak_iaa"
	item_state = "tesh_beltcloak_iaa"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/wrdn
	name = "Плащик с ремешком надзирателя"
	desc = "Мягкий плащик, рассчитанный на тешари в должности надзирателя."
	icon_state = "tesh_beltcloak_wrdn"
	item_state = "tesh_beltcloak_wrdn"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/hos
	name = "Плащик с ремешком Главы службы безопасности"
	desc = "Мягкий плащик, рассчитанный на тешари в должности Главы службы безопасности."
	icon_state = "tesh_beltcloak_hos"
	item_state = "tesh_beltcloak_hos"

/obj/item/clothing/suit/storage/seromi/beltcloak/jobs/jani
	name = "Плащик с ремешком уборщика"
	desc = "Мягкий плащик, рассчитанный на тешари в должности уборщика."
	icon_state = "tesh_beltcloak_jani"
	item_state = "tesh_beltcloak_jani"

//Alternate standard & job cloaks.
/obj/item/clothing/suit/storage/teshari/cloak_vr
	name = "Чёрный плащик"
	desc = "Этот плащик окутывает плечи тешари и заклёпывается на шее. Внутри очень удобно расположены кармашки."
	icon = 'icons/mob/species/seromi/teshari_cloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/teshari_cloak_vr.dmi'
	icon_state = "tesh_cloak_bn"
	item_state = "tesh_cloak_bn"
	species_restricted = list(SPECIES_TESHARI)
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/black_red
	name = "Чёрно-красный плащик"
	icon_state = "tesh_cloak_br"
	item_state = "tesh_cloak_br"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/black_orange
	name = "Чёрно-оранжевый плащик"
	icon_state = "tesh_cloak_bo"
	item_state = "tesh_cloak_bo"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/black_yellow
	name = "Чёрно-жёлтый плащик"
	icon_state = "tesh_cloak_by"
	item_state = "tesh_cloak_by"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/black_green
	name = "Чёрно-зелёный плащик"
	icon_state = "tesh_cloak_bgr"
	item_state = "tesh_cloak_bgr"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/black_blue
	name = "Чёрно-синий плащик"
	icon_state = "tesh_cloak_bbl"
	item_state = "tesh_cloak_bbl"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/black_purple
	name = "Чёрно-фиолетовый плащик"
	icon_state = "tesh_cloak_bp"
	item_state = "tesh_cloak_bp"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/black_pink
	name = "Чёрно-розовый плащик"
	icon_state = "tesh_cloak_bpi"
	item_state = "tesh_cloak_bpi"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/black_brown
	name = "Чёрно-коричневый плащик"
	icon_state = "tesh_cloak_bbr"
	item_state = "tesh_cloak_bbr"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/black_grey
	name = "Чёрно-серый плащик"
	icon_state = "tesh_cloak_bg"
	item_state = "tesh_cloak_bg"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/black_white
	name = "Чёрно-белый плащик"
	icon_state = "tesh_cloak_bw"
	item_state = "tesh_cloak_bw"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/black_glow
	name = "Чёрный светящийся плащик"
	icon_state = "tesh_cloak_bglowing"
	item_state = "tesh_cloak_bglowing"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/dark_retrowave
	name = "Ретровейвовый плащик"
	icon_state = "tesh_cloak_dretrowave"
	item_state = "tesh_cloak_dretrowave"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/white
	name = "Белый плащик"
	icon_state = "tesh_cloak_wn"
	item_state = "tesh_cloak_wn"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/white_grey
	name = "Серо-белый плащик"
	icon_state = "tesh_cloak_wg"
	item_state = "tesh_cloak_wg"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/red_grey
	name = "Серо-красный плащик"
	icon_state = "tesh_cloak_rg"
	item_state = "tesh_cloak_rg"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/orange_grey
	name = "Серо-оранжевый плащик"
	icon_state = "tesh_cloak_og"
	item_state = "tesh_cloak_og"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/yellow_grey
	name = "Серо-жёлтый плащик"
	icon_state = "tesh_cloak_yg"
	item_state = "tesh_cloak_yg"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/green_grey
	name = "Серо-зелёный плащик"
	icon_state = "tesh_cloak_gg"
	item_state = "tesh_cloak_gg"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/blue_grey
	name = "Серо-синий плащик"
	icon_state = "tesh_cloak_blug"
	item_state = "tesh_cloak_blug"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/purple_grey
	name = "Серо-фиолетовый плащик"
	icon_state = "tesh_cloak_pg"
	item_state = "tesh_cloak_pg"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/pink_grey
	name = "Серо-розовый плащик"
	icon_state = "tesh_cloak_pig"
	item_state = "tesh_cloak_pig"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/brown_grey
	name = "Серо-коричневый плащик"
	icon_state = "tesh_cloak_brg"
	item_state = "tesh_cloak_brg"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/rainbow
	name = "Радужный плащик"
	icon_state = "tesh_cloak_rainbow"
	item_state = "tesh_cloak_rainbow"

/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/orange
	name = "Оранжевый плащик"
	icon_state = "tesh_cloak_on"
	item_state = "tesh_cloak_on"

//Alternate Job Cloaks - subpathed for ease of access in loadouts. If the path ends in _vr not /vr it's net-new.
/obj/item/clothing/suit/storage/seromi/cloak/jobs/cap_vr
	name = "Плащик Директора колонии"
	desc = "Мягкий плащик, рассчитанный на тешари в должности Директора колонии."
	icon_state = "tesh_cloak_cap"
	item_state = "tesh_cloak_cap"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

//Cargo

/obj/item/clothing/suit/storage/seromi/cloak/jobs/qm/vr
	name = "Плащик Квартирмейстера (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/cargo/vr
	name = "Плащик грузчика (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/mining/vr
	name = "Плащик шахтёра (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/command/vr
	name = "Плащик Управления (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

//Engineering

/obj/item/clothing/suit/storage/seromi/cloak/jobs/ce/vr
	name = "Плащик Главного инженера (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/eningeer/vr
	name = "Плащик инженера (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/atmos/vr
	name = "Плащик атмосферщика (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

//Medical

/obj/item/clothing/suit/storage/seromi/cloak/jobs/cmo/vr
	name = "Плащик Главврача (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/medical/vr
	name = "Плащик врача (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/chemistry/vr
	name = "Плащик химика (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/viro/vr
	name = "Плащик вирусолога (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/para/vr
	name = "Плащик парамедика (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/psych_vr
	name = "Плащик психиатра"
	desc = "Мягкий плащик, рассчитанный на тешари в должности психиатра."
	icon_state = "tesh_cloak_psych"
	item_state = "tesh_cloak_psych"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

//Science

/obj/item/clothing/suit/storage/seromi/cloak/jobs/rd_vr
	name = "Плащик Директора исследований"
	desc = "Мягкий плащик, рассчитанный на тешари в должности Директора исследований."
	icon_state = "tesh_cloak_rd"
	item_state = "tesh_cloak_rd"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/sci/vr
	name = "Плащик учёного (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/robo/vr
	name = "Плащик робототехника (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

//Security

/obj/item/clothing/suit/storage/seromi/cloak/jobs/hos_vr
	name = "Плащик Главы службы безопасности"
	desc = "Мягкий плащик, рассчитанный на тешари в должности Главы службы безопасности."
	icon_state = "tesh_cloak_hos"
	item_state = "tesh_cloak_hos"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/sec/vr
	name = "Плащик службы безопасности (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/iaa/vr
	name = "Плащик агента внутренних дел (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

//Service

/obj/item/clothing/suit/storage/seromi/cloak/jobs/hop_vr
	name = "Плащик Главы персонала"
	desc = "Мягкий плащик, рассчитанный на тешари в должности Главы персонала."
	icon_state = "tesh_cloak_hop"
	item_state = "tesh_cloak_hop"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'

/obj/item/clothing/suit/storage/seromi/cloak/jobs/service/vr
	name = "Плащик работника сервиса (новый)"
	icon = 'icons/mob/species/seromi/deptcloak_vr.dmi'
	icon_override = 'icons/mob/species/seromi/deptcloak_vr.dmi'
