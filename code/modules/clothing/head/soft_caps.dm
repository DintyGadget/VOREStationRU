/obj/item/clothing/head/soft
	name = "Кепка грузчика"
	desc = "Простая бейсболка скудного желтого цвета."
	icon_state = "cargosoft"
	item_state_slots = list(slot_r_hand_str = "cargosoft", slot_l_hand_str = "cargosoft")
	var/flipped = 0
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/soft/dropped()
	icon_state = initial(icon_state)
	flipped=0
	..()

/obj/item/clothing/head/soft/attack_self(mob/user)
	flipped = !flipped
	if(flipped)
		icon_state = "[icon_state]_flipped"
		to_chat(user, "Вы повернули козырёк на затылок.")
	else
		icon_state = initial(icon_state)
		to_chat(user, "Вы повернули козырёк обратно.")
	update_clothing_icon()	//so our mob-overlays update

/obj/item/clothing/head/soft/red
	name = "Красная кепка"
	desc = "Простая бейсболка скудного красного цвета."
	icon_state = "redsoft"
	item_state_slots = list(slot_r_hand_str = "redsoft", slot_l_hand_str = "redsoft")

/obj/item/clothing/head/soft/blue
	name = "Синяя кепка"
	desc = "Простая бейсболка скудного синего цвета."
	icon_state = "bluesoft"
	item_state_slots = list(slot_r_hand_str = "bluesoft", slot_l_hand_str = "bluesoft")

/obj/item/clothing/head/soft/green
	name = "Зелёная кепка"
	desc = "Простая бейсболка скудного зелёного цвета."
	icon_state = "greensoft"
	item_state_slots = list(slot_r_hand_str = "greensoft", slot_l_hand_str = "greensoft")

/obj/item/clothing/head/soft/yellow
	name = "Жёлтая кепка"
	desc = "Простая бейсболка скудного жёлтого цвета."
	icon_state = "yellowsoft"
	item_state_slots = list(slot_r_hand_str = "yellowsoft", slot_l_hand_str = "yellowsoft")

/obj/item/clothing/head/soft/grey
	name = "Серая кепка"
	desc = "Простая бейсболка скудного серого цвета."
	icon_state = "greysoft"
	item_state_slots = list(slot_r_hand_str = "greysoft", slot_l_hand_str = "greysoft")

/obj/item/clothing/head/soft/orange
	name = "Оранжевая кепка"
	desc = "Простая бейсболка скудного оранжевого цвета."
	icon_state = "orangesoft"
	item_state_slots = list(slot_r_hand_str = "orangesoft", slot_l_hand_str = "orangesoft")

/obj/item/clothing/head/soft/mime
	name = "Белая кепка"
	desc = "Простая бейсболка скудного белого цвета."
	icon_state = "mimesoft"
	item_state_slots = list(slot_r_hand_str = "mimesoft", slot_l_hand_str = "mimesoft")

/obj/item/clothing/head/soft/purple
	name = "Фиолетовая кепка"
	desc = "Простая бейсболка скудного фиолетового цвета."
	icon_state = "purplesoft"
	item_state_slots = list(slot_r_hand_str = "purplesoft", slot_l_hand_str = "purplesoft")

/obj/item/clothing/head/soft/rainbow
	name = "Радужная кепка"
	desc = "Яркая бейсболка всех цветов радуги."
	icon_state = "rainbowsoft"
	item_state_slots = list(slot_r_hand_str = "rainbowsoft", slot_l_hand_str = "rainbowsoft")

/obj/item/clothing/head/soft/sec
	name = "Офицерская фуражка"
	desc = "Яркая полевая фуражка красного цвета."
	icon_state = "secsoft"
	item_state_slots = list(slot_r_hand_str = "secsoft", slot_l_hand_str = "secsoft")

/obj/item/clothing/head/soft/sec/corp
	name = "Фирменная офицерская фуражка"
	desc = "Полевая фуражка в фирменной расцветке."
	icon_state = "corpsoft"
	item_state_slots = list(slot_r_hand_str = "corpsoft", slot_l_hand_str = "corpsoft")

/obj/item/clothing/head/soft/black
	name = "Чёрная кепка"
	desc = "Простая бейсболка скудного чёрного цвета."
	icon_state = "blacksoft"
	item_state_slots = list(slot_r_hand_str = "blacksoft", slot_l_hand_str = "blacksoft")

/obj/item/clothing/head/soft/mbill
	name = "Кепка доставщика"
	desc = "Бейсболка в расцветке компании Major Bill's Shipping."
	icon_state = "mbillsoft"
	catalogue_data = list(/datum/category_item/catalogue/information/organization/major_bills)
