/obj/item/clothing/mask/balaclava
	name = "балаклава"
	desc = "Деньги будут наши-"
	icon_state = "balaclava"
	item_state_slots = list(slot_r_hand_str = "bandblack", slot_l_hand_str = "bandblack")
	flags_inv = HIDEFACE|BLOCKHAIR
	body_parts_covered = FACE|HEAD
	w_class = ITEMSIZE_SMALL

/obj/item/clothing/mask/balaclava/tactical
	name = "зеленая балаклава"
	desc = "Скрывает Вашу личность, да ещё и греет Ваше лицо."
	icon_state = "swatclava"
	item_state_slots = list(slot_r_hand_str = "bandgreen", slot_l_hand_str = "bandgreen")
	flags_inv = HIDEFACE|BLOCKHAIR
	w_class = ITEMSIZE_SMALL

/obj/item/clothing/mask/luchador
	name = "маска Лючадор"
	desc = "Используется стойкими бойцами, что взмывают ввысь и сокрушают всех своих врагов!"
	icon_state = "luchag"
	flags_inv = HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE
	w_class = ITEMSIZE_SMALL
	siemens_coefficient = 3.0

/obj/item/clothing/mask/luchador/tecnicos
	name = "маска Текникос"
	desc = "Используется стойкими бойцами, что поддерживают справедливость и сражаются с честью."
	icon_state = "luchador"

/obj/item/clothing/mask/luchador/rudos
	name = "маска Рудос"
	desc = "Используется стойкими бойцами, что готовы пойти на всё ради победы."
	icon_state = "luchar"