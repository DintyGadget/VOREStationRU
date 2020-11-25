/obj/item/clothing/shoes/leg_guard
	name = "Защитные ботинки"
	desc = "Эти ботинки защищают Ваши ноги и ступни."
	body_parts_covered = LEGS|FEET
	slowdown = SHOES_SLOWDOWN+0.5
	species_restricted = null	//Unathi and Taj can wear leg armor now
	w_class = ITEMSIZE_NORMAL
	step_volume_mod = 1.3
	can_hold_knife = TRUE
	drop_sound = 'sound/items/drop/boots.ogg'
	pickup_sound = 'sound/items/pickup/boots.ogg'

/obj/item/clothing/shoes/leg_guard/mob_can_equip(var/mob/living/carbon/human/H, slot, disable_warning = FALSE)
	if(..()) //This will only run if no other problems occured when equiping.
		if(H.wear_suit)
			if(H.wear_suit.body_parts_covered & LEGS)
				to_chat(H, "<span class='warning'>Вы не можете надеть [ru_getcase(src, "acase")], так как Вам [ru_g_obj(H.wear_suit, "меша", "ет", "ет", "ет", "ют")] [ru_getcase(H.wear_suit, "ncase")].</span>")
				return 0
			for(var/obj/item/clothing/accessory/A in H.wear_suit)
				if(A.body_parts_covered & LEGS)
					to_chat(H, "<span class='warning'>Вы не можете надеть [ru_getcase(src, "acase")], так как Вам [ru_g_obj(H.wear_suit, "меша", "ет", "ет", "ет", "ют")] [ru_getcase(A, "ncase")] [ru_getcase(H.wear_suit, "gcase")].</span>")
					return 0
		return 1

/obj/item/clothing/shoes/leg_guard/laserproof
	name = "Абляционные ботинки"
	desc = "Эти ботинки защищают ступни и ноги от энергетического оружия."
	icon_state = "leg_guards_laser"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	siemens_coefficient = 0.1
	armor = list(melee = 10, bullet = 10, laser = 80, energy = 50, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/shoes/leg_guard/bulletproof
	name = "Пуленепробиваемые ботинки"
	desc = "Эти ботинки защищают ступни и ноги от энергетического оружия."
	icon_state = "leg_guards_bullet"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	siemens_coefficient = 0.7
	armor = list(melee = 10, bullet = 80, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/shoes/leg_guard/riot
	name = "Милицейские ботинки"
	desc = "Эти ботинки защищают ступни и ноги от оружия ближнего боя."
	icon_state = "leg_guards_riot"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	siemens_coefficient = 0.5
	armor = list(melee = 80, bullet = 10, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/shoes/leg_guard/combat
	name = "Боевые ботинки"
	desc = "Эти ботинки защищают ступни и ноги от различного оружия."
	icon_state = "leg_guards_combat"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	siemens_coefficient = 0.6
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 30, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/shoes/leg_guard/flexitac
	name = "Тактические ботинки"
	desc = "Эти ботинки защищают ступни и ноги от различного оружия, при этом не ограничивая передвижение."
	icon_state = "leg_guards_flexitac"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	siemens_coefficient = 0.6
	slowdown = SHOES_SLOWDOWN+0.2
	armor = list(melee = 40, bullet = 40, laser = 60, energy = 35, bomb = 30, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20
	cold_protection = LEGS