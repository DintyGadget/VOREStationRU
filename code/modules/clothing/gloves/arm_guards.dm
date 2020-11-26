/obj/item/clothing/gloves/arm_guard
	name = "Защитные перчатки"
	desc = "Эти перчатки защищают Ваши ладони и руки."
	body_parts_covered = HANDS|ARMS
	overgloves = 1
	punch_force = 3
	w_class = ITEMSIZE_NORMAL
	drop_sound = 'sound/items/drop/metalshield.ogg'
	pickup_sound = 'sound/items/pickup/axe.ogg'

/obj/item/clothing/gloves/arm_guard/mob_can_equip(var/mob/living/carbon/human/H, slot, disable_warning = FALSE)
	if(..()) //This will only run if no other problems occured when equiping.
		if(H.wear_suit)
			if(H.wear_suit.body_parts_covered & ARMS)
				to_chat(H, "<span class='warning'>Вы не можете надеть [ru_getcase(src, "acase")], так как на Вас [ru_getcase(H.wear_suit, "ncase")].</span>")
				return 0
			for(var/obj/item/clothing/accessory/A in H.wear_suit)
				if(A.body_parts_covered & ARMS)
					to_chat(H, "<span class='warning'>Вы не можете надеть [ru_getcase(src, "acase")], так как на Вас [ru_getcase(A, "ncase")] [ru_getcase(H.wear_suit, "gcase")].</span>")
					return 0
		return 1

/obj/item/clothing/gloves/arm_guard/laserproof
	name = "Абляционные перчатки"
	desc = "Эти перчатки защищают ладони и руки от энергетического оружия."
	icon_state = "arm_guards_laser"
	item_state_slots = list(slot_r_hand_str = "swat", slot_l_hand_str = "swat")
	siemens_coefficient = 0.4 //This is worse than the other ablative pieces, to avoid this from becoming the poor warden's insulated gloves.
	armor = list(melee = 10, bullet = 10, laser = 80, energy = 50, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/gloves/arm_guard/bulletproof
	name = "Пуленепробиваемые перчатки"
	desc = "Эти перчатки защищают ладони и руки от баллистического оружия."
	icon_state = "arm_guards_bullet"
	item_state_slots = list(slot_r_hand_str = "swat", slot_l_hand_str = "swat")
	siemens_coefficient = 0.7
	armor = list(melee = 10, bullet = 80, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/gloves/arm_guard/riot
	name = "Милицейские перчатки"
	desc = "Эти перчатки защищают ладони и руки от оружия ближнего боя."
	icon_state = "arm_guards_riot"
	item_state_slots = list(slot_r_hand_str = "swat", slot_l_hand_str = "swat")
	siemens_coefficient = 0.5
	armor = list(melee = 80, bullet = 10, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/gloves/arm_guard/combat
	name = "Боевые перчатки"
	desc = "Эти перчатки защищают ладони и руки от различного оружия."
	icon_state = "arm_guards_combat"
	item_state_slots = list(slot_r_hand_str = "swat", slot_l_hand_str = "swat")
	siemens_coefficient = 0.6
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 30, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/gloves/arm_guard/flexitac
	name = "Тактические перчатки"
	desc = "Эти перчатки защищают ладони и руки от различного оружия, при этом не ограничивая передвижение."
	icon_state = "arm_guards_flexitac"
	item_state_slots = list(slot_r_hand_str = "swat", slot_l_hand_str = "swat")
	siemens_coefficient = 0.6
	armor = list(melee = 40, bullet = 40, laser = 60, energy = 35, bomb = 30, bio = 0, rad = 0)
	min_cold_protection_temperature = T0C - 20
	cold_protection = ARMS