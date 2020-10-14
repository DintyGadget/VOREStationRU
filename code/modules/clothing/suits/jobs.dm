/*
 * Job related
 */

//Botanist
/obj/item/clothing/suit/storage/apron
	name = "фартук"
	desc = "Обычный синий фартук."
	icon_state = "apron"
	item_state_slots = list(slot_r_hand_str = "overalls", slot_l_hand_str = "overalls")
	blood_overlay_type = "armor"
	body_parts_covered = 0
	allowed = list (/obj/item/weapon/reagent_containers/spray/plantbgone, /obj/item/device/analyzer/plant_analyzer, /obj/item/seeds,
	/obj/item/weapon/reagent_containers/glass/bottle, /obj/item/weapon/material/minihoe)

/obj/item/clothing/suit/storage/apron/white
	name = "белый фартук"
	desc = "Обычный белый фартук."
	icon_state = "apron_white"
	item_state_slots = list(slot_r_hand_str = "apronchef", slot_l_hand_str = "apronchef")

//Captain
/obj/item/clothing/suit/captunic
	name = "site manager's parade tunic"
	desc = "Worn by a Site Manager to show their class."
	icon_state = "captunic"
	body_parts_covered = UPPER_TORSO|ARMS
	flags_inv = HIDEJUMPSUIT|HIDETIE|HIDEHOLSTER

/obj/item/clothing/suit/captunic/capjacket
	name = "site manager's uniform jacket"
	desc = "A less formal jacket for everyday Site Manager use."
	icon_state = "capjacket"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEHOLSTER

//Chaplain
/obj/item/clothing/suit/storage/hooded/chaplain_hoodie
	name = "chaplain hoodie"
	desc = "This suit says to you \"Hush\"!"
	icon_state = "chaplain_hoodie"
	item_state_slots = list(slot_r_hand_str = "suit_black", slot_l_hand_str = "suit_black")
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEHOLSTER
	hoodtype = /obj/item/clothing/head/chaplain_hood
	allowed = list (/obj/item/weapon/storage/bible)

//Chaplain but spookier
/obj/item/clothing/suit/storage/hooded/chaplain_hoodie/whiteout
	name = "white robe"
	desc = "A long, flowing white robe. It looks comfortable, but not very warm."
	icon_state = "whiteout_robe"
	item_state_slots = list(slot_r_hand_str = "suit_white", slot_l_hand_str = "suit_white")
	flags_inv = HIDETIE|HIDEHOLSTER
	hoodtype = /obj/item/clothing/head/chaplain_hood/whiteout

//Chaplain
/obj/item/clothing/suit/nun
	name = "nun robe"
	desc = "Maximum piety in this star system."
	icon_state = "nun"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDESHOES|HIDEJUMPSUIT|HIDETIE|HIDEHOLSTER

//Chef
/obj/item/clothing/suit/chef
	name = "chef's apron"
	desc = "An apron used by a high class chef."
	icon_state = "chef"
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.50
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	flags_inv = HIDETIE|HIDEHOLSTER
	allowed = list (/obj/item/weapon/material/knife)

//Chef
/obj/item/clothing/suit/chef/classic
	name = "classic chef's apron"
	desc = "A basic, dull, white chef's apron."
	icon_state = "apronchef"
	blood_overlay_type = "armor"
	body_parts_covered = 0
	flags_inv = 0

//Security
/obj/item/clothing/suit/security/navyofficer
	name = "security officer's jacket"
	desc = "This jacket is for those special occasions when a security officer actually feels safe."
	icon_state = "officerbluejacket"
	item_state_slots = list(slot_r_hand_str = "suit_navy", slot_l_hand_str = "suit_navy")
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	flags_inv = HIDEHOLSTER

/obj/item/clothing/suit/security/navywarden
	name = "warden's jacket"
	desc = "Perfectly suited for the warden that wants to leave an impression of style on those who visit the brig."
	icon_state = "wardenbluejacket"
	item_state_slots = list(slot_r_hand_str = "suit_navy", slot_l_hand_str = "suit_navy")
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	flags_inv = HIDEHOLSTER

/obj/item/clothing/suit/security/navyhos
	name = "head of security's jacket"
	desc = "This piece of clothing was specifically designed for asserting superior authority."
	icon_state = "hosbluejacket"
	item_state_slots = list(slot_r_hand_str = "suit_navy", slot_l_hand_str = "suit_navy")
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	flags_inv = HIDEHOLSTER

//Detective
/obj/item/clothing/suit/storage/det_trench
	name = "коричневый тренчкот"
	desc = "Изношенный тренчкот с защитой от ударов извне — самое то на случай, если выпадете из окна."
	icon_state = "detective"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	flags_inv = HIDEHOLSTER
	allowed = list(/obj/item/weapon/tank/emergency/oxygen, /obj/item/device/flashlight, /obj/item/weapon/gun/energy, /obj/item/weapon/gun/projectile, /obj/item/ammo_magazine,
	/obj/item/ammo_casing, /obj/item/weapon/melee/baton, /obj/item/weapon/handcuffs, /obj/item/weapon/storage/fancy/cigarettes, /obj/item/weapon/flame/lighter,
	/obj/item/device/taperecorder, /obj/item/device/uv_light)
	armor = list(melee = 10, bullet = 10, laser = 15, energy = 10, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/det_trench/grey
	name = "серый тренчкот"
	icon_state = "detective2"
	item_state_slots = list(slot_r_hand_str = "leather_jacket", slot_l_hand_str = "leather_jacket")
	flags_inv = HIDEHOLSTER

//Forensics
/obj/item/clothing/suit/storage/forensics
	name = "куртка"
	desc = "Куртка настоящего криминалиста."
	body_parts_covered = UPPER_TORSO|ARMS
	flags_inv = HIDEHOLSTER
	allowed = list(/obj/item/weapon/tank/emergency/oxygen, /obj/item/device/flashlight, /obj/item/weapon/gun/energy, /obj/item/weapon/gun/projectile, /obj/item/ammo_magazine,
	/obj/item/ammo_casing, /obj/item/weapon/melee/baton, /obj/item/weapon/handcuffs, /obj/item/weapon/storage/fancy/cigarettes, /obj/item/weapon/flame/lighter,
	/obj/item/device/taperecorder, /obj/item/device/uv_light)
	armor = list(melee = 10, bullet = 10, laser = 15, energy = 10, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/forensics/red
	name = "красный пиджак"
	desc = "Красный пиджак настоящего криминалиста."
	icon_state = "forensics_red"
	item_state_slots = list(slot_r_hand_str = "suit_red", slot_l_hand_str = "suit_red")

/obj/item/clothing/suit/storage/forensics/red/long
	name = "длинный красный пиджак"
	desc = "Длинный красный пиджак настоящего криминалиста."
	icon_state = "forensics_red_long"

/obj/item/clothing/suit/storage/forensics/blue
	name = "синий пиджак"
	desc = "Синий пиджак настоящего криминалиста."
	icon_state = "forensics_blue"
	item_state_slots = list(slot_r_hand_str = "suit_navy", slot_l_hand_str = "suit_navy")

/obj/item/clothing/suit/storage/forensics/blue/long
	name = "длинный синий пиджак"
	desc = "Длинный синий пиджак настоящего криминалиста."
	icon_state = "forensics_blue_long"

//Engineering
/obj/item/clothing/suit/storage/hazardvest
	name = "аварийный жилет"
	desc = "Жилет повышенной видимости, используемый при строительстве."
	icon_state = "hazard"
	blood_overlay_type = "armor"
	allowed = list (/obj/item/device/analyzer, /obj/item/device/flashlight, /obj/item/device/multitool, /obj/item/device/pipe_painter, /obj/item/device/radio, /obj/item/device/t_scanner,
	/obj/item/weapon/tool/crowbar, /obj/item/weapon/tool/screwdriver, /obj/item/weapon/weldingtool, /obj/item/weapon/tool/wirecutters, /obj/item/weapon/tool/wrench, /obj/item/weapon/tank/emergency/oxygen,
	/obj/item/clothing/mask/gas, /obj/item/taperoll/engineering)
	body_parts_covered = UPPER_TORSO

/obj/item/clothing/suit/storage/hazardvest/blue
	name = "синий аварийный жилет"
	desc = "Жилет повышенной видимости. Этот синего цвета!"
	icon_state = "hazard_b"

/obj/item/clothing/suit/storage/hazardvest/green
	name = "зеленый аварийный жилет"
	desc = "Жилет повышенной видимости. Этот зеленого цвета!"
	icon_state = "hazard_g"

/obj/item/clothing/suit/storage/hazardvest/white
	name = "белый аварийный жилет"
	desc = "Жилет повышенной видимости. На этом красный крест!"
	icon_state = "hazard_w"

//Lawyer
/obj/item/clothing/suit/storage/toggle/lawyer/bluejacket
	name = "синий формальный пиджак"
	desc = "Вызывающий формальный пиджак."
	icon_state = "suitjacket_blue"
	item_state_slots = list(slot_r_hand_str = "suit_blue", slot_l_hand_str = "suit_blue")
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/lawyer/purpjacket
	name = "синий формальный пиджак"
	desc = "Вызывающий формальный пиджак."
	icon_state = "suitjacket_purp"
	item_state_slots = list(slot_r_hand_str = "suit_purple", slot_l_hand_str = "suit_purple")
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS

//Internal Affairs
/obj/item/clothing/suit/storage/toggle/internalaffairs
	name = "черный формальный пиджак"
	desc = "Гладкий тёмный пиджак."
	icon_state = "ia_jacket"
	item_state_slots = list(slot_r_hand_str = "suit_black", slot_l_hand_str = "suit_black")
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS

//Medical
/obj/item/clothing/suit/storage/toggle/fr_jacket
	name = "куртка спасателя"
	desc = "Куртка повышенной видимости, используемый врачами неотложной помощи."
	icon_state = "fr_jacket"
	item_state_slots = list(slot_r_hand_str = "fr_jacket", slot_l_hand_str = "fr_jacket")
	blood_overlay_type = "armor"
	allowed = list(/obj/item/stack/medical, /obj/item/weapon/reagent_containers/dropper, /obj/item/weapon/reagent_containers/hypospray, /obj/item/weapon/reagent_containers/syringe,
	/obj/item/device/healthanalyzer, /obj/item/device/flashlight, /obj/item/device/radio, /obj/item/weapon/tank/emergency/oxygen)
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/fr_jacket/ems
	name = "куртка работника неотложной помощи"
	desc = "Тёмная куртка врача неотложной помощи со светоотражающими полосами и звездой на спине."
	icon_state = "ems_jacket"
	item_state_slots = list(slot_r_hand_str = "ems_jacket", slot_l_hand_str = "ems_jacket")

/obj/item/clothing/suit/surgicalapron
	name = "хирургический фартук"
	desc = "Стерильный синий фартук для проведения хирургических операций."
	icon_state = "surgical"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	allowed = list(/obj/item/stack/medical, /obj/item/weapon/reagent_containers/dropper, /obj/item/weapon/reagent_containers/hypospray, /obj/item/weapon/reagent_containers/syringe, \
	/obj/item/device/healthanalyzer, /obj/item/device/flashlight, /obj/item/device/radio, /obj/item/weapon/tank/emergency/oxygen,/obj/item/weapon/surgical/scalpel,/obj/item/weapon/surgical/retractor,/obj/item/weapon/surgical/hemostat, \
	/obj/item/weapon/surgical/cautery,/obj/item/weapon/surgical/bonegel,/obj/item/weapon/surgical/FixOVein)

//Mime
/obj/item/clothing/suit/suspenders
	name = "подтяжки"
	desc = "Неотъемлемый аксессуар любого уважающего себя мима, и не только."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "suspenders"
	blood_overlay_type = "armor" //it's the less thing that I can put here
	body_parts_covered = 0
