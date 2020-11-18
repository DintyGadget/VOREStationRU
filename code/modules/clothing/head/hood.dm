/obj/item/clothing/head/hood
	name = "Капюшон"
	desc = "Обыкновенный капюшон."
	icon_state = "generic_hood"
	body_parts_covered = HEAD
	cold_protection = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR

// Winter coats
/obj/item/clothing/head/hood/winter
	name = "Зимний капюшон"
	desc = "Тёплый капюшон от зимнего пальто."
	icon_state = "generic_hood"
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/hood/winter/captain
	name = "Зимний капюшон Директора колонии"
	armor = list(melee = 20, bullet = 15, laser = 20, energy = 10, bomb = 15, bio = 0, rad = 0)

/obj/item/clothing/head/hood/winter/security
	name = "Зимний капюшон службы безопасности"
	armor = list(melee = 25, bullet = 20, laser = 20, energy = 15, bomb = 20, bio = 0, rad = 0)

/obj/item/clothing/head/hood/winter/medical
	name = "Зимний капюшон врача"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 50, rad = 0)

/obj/item/clothing/head/hood/winter/science
	name = "Зимний капюшон учёного"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/hood/winter/engineering
	name = "Зимний капюшон инженера"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 20)

/obj/item/clothing/head/hood/winter/engineering/atmos
	name = "Зимний капюшон атмосферщика"

/obj/item/clothing/head/hood/winter/hydro
	name = "Зимний капюшон ботаника"

/obj/item/clothing/head/hood/winter/cargo
	name = "Зимний капюшон грузчика"

/obj/item/clothing/head/hood/winter/miner
	name = "Зимний капюшон шахтёра"
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

// Explorer gear
/obj/item/clothing/head/hood/explorer
	name = "Капюшон искателя"
	desc = "Укреплённый капюшон для исследования в суровых условиях."
	icon_state = "explorer"
	flags = THICKMATERIAL
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.9
	armor = list(melee = 30, bullet = 20, laser = 20, energy = 20, bomb = 35, bio = 75, rad = 35)

// Costumes
/obj/item/clothing/head/hood/carp_hood
	name = "Капюшон карпа"
	desc = "Капюшон, прикрепленный к костюму карпа."
	icon_state = "carp_casual"
	item_state_slots = list(slot_r_hand_str = "carp_casual", slot_l_hand_str = "carp_casual") //Does not exist -S2-
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE	//Space carp like space, so you should too

/obj/item/clothing/head/hood/ian_hood
	name = "Капюшон корги"
	desc = "Капюшон, неотличимый от головы корги. Не гарантирует, что Вас угостят вкусняшкой."
	icon_state = "ian"
	item_state_slots = list(slot_r_hand_str = "ian", slot_l_hand_str = "ian") //Does not exist -S2-