/obj/item/clothing/suit/customs
	desc = "Формальный пиджак Таможни Сол."

//HERE BE TAUR RELATED CLOTHES

/*
 * Contains:
 *		Centaur Barding
 *		Drake cloak
 *		Centaur Wedding dress
 */


/obj/item/clothing/suit/drake_cloak
	name = "плащ драконовидных"
	desc = "Простой плащ для драконотавров."
	icon = 'icons/mob/taursuits_drake_vr.dmi'
	icon_state = "cloak"
	item_state_slots = list(slot_r_hand_str = "capjacket", slot_l_hand_str = "capjacket")
	body_parts_covered = UPPER_TORSO|ARMS
	pixel_x = -16

/obj/item/clothing/suit/drake_cloak/mob_can_equip(var/mob/living/carbon/human/H, slot, disable_warning = 0)
	if(..())
		if(istype(H) && istype(H.tail_style, /datum/sprite_accessory/tail/taur/drake))
			return ..()
		else
			to_chat(H, "<span class='warning'>Такое могут носить только существа-драконотавры!</span>")
			return 0

/obj/item/clothing/suit/barding
	description_info = "Чтобы это надеть, необходимо быть лошадью."
	icon = 'icons/mob/taursuits_horse_vr.dmi'
	item_state_slots = list(slot_r_hand_str = "capjacket", slot_l_hand_str = "capjacket")
	body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO|LEGS
	pixel_x = -16
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 0, rad = 0)//Minor armor for fluff.

/obj/item/clothing/suit/barding/mob_can_equip(var/mob/living/carbon/human/H, slot, disable_warning = 0)
	if(..())
		if(istype(H) && istype(H.tail_style, /datum/sprite_accessory/tail/taur/horse))
			return ..()
		else
			to_chat(H, "<span class='warning'>Чтобы это надеть, Вам нужно быть наполовину лошадью-тавром.</span>")
			return 0

//Bardings are medieval suits of armor.
/obj/item/clothing/suit/barding/agatha
	name = "бард Агата"
	desc = "Рыцарские доспехи для скакуна, который не нуждается в наезднике. Эти доспехи с эмблемой дома Агата."
	icon_state = "Agatha_barding"

/obj/item/clothing/suit/barding/alt_agatha
	name = "бард Агата"
	desc = "Рыцарские доспехи для скакуна, который не нуждается в наезднике. Эти доспехи с эмблемой дома Агата."
	icon_state = "Agatha_barding_alt"

/obj/item/clothing/suit/barding/mason
	name = "бард Масон"
	desc = "Рыцарские доспехи для скакуна, который не нуждается в наезднике. Эти доспехи с эмблемой дома Масон."
	icon_state = "Mason_barding"

/obj/item/clothing/suit/taur_dress
	icon = 'icons/mob/taursuits_horse_vr.dmi'
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	pixel_x = -16

/obj/item/clothing/suit/taur_dress/white
	name = "белое свадебное платье"
	desc = "Дорогое белое платье для тавров."
	icon_state = "whitedress1"
	flags_inv = HIDESHOES

/obj/item/clothing/suit/storage/det_trench/alt
	name = "элегантное пальто"
	desc = "Глянцевое пальто, изготовленное из неоламинированной ткани. На внутренней стороне располагается карман."
	icon = 'icons/obj/clothing/suits_vr.dmi'
	icon_override = 'icons/mob/suit_vr.dmi'
	icon_state = "cyberpunksleek"
	item_state = "cyberpunksleek"

/obj/item/clothing/suit/storage/det_trench/alt2
	name = "длинное элегантное пальто"
	desc = "Длинное глянцевое пальто, изготовленное из неоламинированной ткани. На внутренней стороне располагается карман."
	icon = 'icons/obj/clothing/suits_vr.dmi'
	icon_override = 'icons/mob/suit_vr.dmi'
	icon_state = "cyberpunksleek_long"
	item_state = "cyberpunksleek_long"
