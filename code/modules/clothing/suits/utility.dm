/*
 * Contains:
 *		Fire protection
 *		Bomb protection
 *		Radiation protection
 */

/*
 * Fire protection
 */

/obj/item/clothing/suit/fire
	name = "противопожарный костюм"
	desc = "Костюм, предоставляющий защиту от огня и жара."
	icon_state = "fire"
	w_class = ITEMSIZE_LARGE//bulky item
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.50
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank/emergency/oxygen,/obj/item/weapon/extinguisher)
	slowdown = 1.0
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER
	item_flags = 0
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_pressure_protection = 0.2 * ONE_ATMOSPHERE
	max_pressure_protection = 20  * ONE_ATMOSPHERE


/obj/item/clothing/suit/fire/firefighter
	icon_state = "firesuit"

/obj/item/clothing/suit/fire/heavy //Is this even used?? -S2-
	name = "противопожарный костюм"
	desc = "Костюм, предоставляющий защиту от особо опасного огня и жара."
	//icon_state = "thermal"
	item_state_slots = list(slot_r_hand_str = "black_suit", slot_l_hand_str = "black_suit")
	w_class = ITEMSIZE_LARGE//bulky item
	slowdown = 1.5

/*
 * Bomb protection
 */
/obj/item/clothing/head/bomb_hood
	name = "бомбоустойчивый капюшон"
	desc = "Используется в случае бомб."
	icon_state = "bombsuit"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 100, bio = 0, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	siemens_coefficient = 0

/obj/item/clothing/suit/bomb_suit
	name = "бомбоустойчивый костюм"
	desc = "Используется в качестве меры предосторожности при операциях со взрывчаткой."
	icon_state = "bombsuit"
	w_class = ITEMSIZE_LARGE//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	slowdown = 2
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 100, bio = 0, rad = 0)
	flags_inv = HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0

/obj/item/clothing/head/bomb_hood/security
	icon_state = "bombsuitsec"
	body_parts_covered = HEAD

/obj/item/clothing/suit/bomb_suit/security
	icon_state = "bombsuitsec"
	allowed = list(/obj/item/weapon/gun/energy,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS

/*
 * Radiation protection
 */
/obj/item/clothing/head/radiation
	name = "антирадиационный капюшон"
	icon_state = "rad"
	desc = "Капюшон с антирадиационными свойствами. Бирка: Изготовлено с использованием свинца, не употребляйте изоляцию."
	flags_inv = BLOCKHAIR
	item_flags = THICKMATERIAL
	body_parts_covered = HEAD|FACE|EYES
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 60, rad = 100)

/obj/item/clothing/suit/radiation
	name = "Radiation suit"
	desc = "Костюм, предоставляющий защиту от радиации. Бирка: Изготовлено с использованием свинца, не употребляйте изоляцию."
	icon_state = "rad"
	w_class = ITEMSIZE_LARGE//bulky item
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.50
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank/emergency/oxygen,/obj/item/clothing/head/radiation,/obj/item/clothing/mask/gas)
	slowdown = 1.5
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 60, rad = 100)
	flags_inv = HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER
	item_flags = THICKMATERIAL