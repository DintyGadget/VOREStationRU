/*
	Earmuffs
*/
/obj/item/clothing/ears/earmuffs
	name = "Защитные наушники"
	desc = "Защищают Ваш слух как от громких шумов, так и от тихих."
	icon_state = "earmuffs"
	item_state_slots = list(slot_r_hand_str = "earmuffs", slot_l_hand_str = "earmuffs")
	slot_flags = SLOT_EARS | SLOT_TWOEARS
	ear_protection = 2

/obj/item/clothing/ears/earmuffs/headphones
	name = "Наушники"
	desc = "Унц унц унц унц."
	var/headphones_on = 0
	icon_state = "headphones_off"
	item_state_slots = list(slot_r_hand_str = "headphones", slot_l_hand_str = "headphones")
	slot_flags = SLOT_EARS | SLOT_TWOEARS

/obj/item/clothing/ears/earmuffs/headphones/verb/togglemusic()
	set name = "Включить/Выключить Музыку"
	set category = "Объект"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.stat) return

	var/base_icon = copytext_char(icon_state,1,(length(icon_state) - 3 + headphones_on))

	if(headphones_on)
		icon_state = "[base_icon]_off"
		headphones_on = 0
		to_chat(usr, "<span class='notice'>Вы выключаете музыку.</span>")
	else
		icon_state = "[base_icon]_on"
		headphones_on = 1
		to_chat(usr, "<span class='notice'>Вы включаете музыку.</span>")

	update_clothing_icon()

/*
	Skrell tentacle wear
*/
/obj/item/clothing/ears/skrell
	name = "Скрелльское украшение"
	desc = "Украшение, носимое скреллами на головных щупальцах."
	icon = 'icons/obj/clothing/ears.dmi'
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_EARS
	species_restricted = list(SPECIES_SKRELL)

/obj/item/clothing/ears/skrell/chain
	name = "Золотая скрелльская цепочка"
	desc = "Изящная цепочка, которой самки скреллов украшают свои головные хвосты."
	icon_state = "skrell_chain"
	item_state_slots = list(slot_r_hand_str = "egg5", slot_l_hand_str = "egg5")
	drop_sound = 'sound/items/drop/ring.ogg'
	pickup_sound = 'sound/items/pickup/ring.ogg'

/obj/item/clothing/ears/skrell/chain/silver
	name = "Серебряная скрелльская цепочка"
	desc = "Изящная серебряная цепочка, которой самки скреллов украшают свои головные хвосты."
	icon_state = "skrell_chain_sil"
	item_state_slots = list(slot_r_hand_str = "egg", slot_l_hand_str = "egg")

/obj/item/clothing/ears/skrell/chain/bluejewels
	name = "Скрелльская цепочка с синими самоцветами"
	desc = "Изящная золотая цепочка, украшенная синими самоцветами, которой самки скреллов украшают свои головные хвосты."
	icon_state = "skrell_chain_bjewel"
	item_state_slots = list(slot_r_hand_str = "egg2", slot_l_hand_str = "egg2")

/obj/item/clothing/ears/skrell/chain/redjewels
	name = "Скрелльская цепочка с красными самоцветами"
	desc = "Изящная золотая цепочка, украшенная красными самоцветами, которой самки скреллов украшают свои головные хвосты."
	icon_state = "skrell_chain_rjewel"
	item_state_slots = list(slot_r_hand_str = "egg4", slot_l_hand_str = "egg4")

/obj/item/clothing/ears/skrell/chain/ebony
	name = "Эбеновая скрелльская цепочка"
	desc = "Изящная эбеновая цепочка, которой самки скреллов украшают свои головные хвосты."
	icon_state = "skrell_chain_ebony"
	item_state_slots = list(slot_r_hand_str = "egg6", slot_l_hand_str = "egg6")

/obj/item/clothing/ears/skrell/band
	name = "Золотые скрелльские обручи"
	desc = "Металлические обручи, которыми самцы скреллов украшают свои головные хвосты."
	icon_state = "skrell_band"
	item_state_slots = list(slot_r_hand_str = "egg5", slot_l_hand_str = "egg5")
	drop_sound = 'sound/items/drop/ring.ogg'
	pickup_sound = 'sound/items/pickup/ring.ogg'

/obj/item/clothing/ears/skrell/band/silver
	name = "Серебряные скрелльские обручи"
	desc = "Серебряные металлические обручи, которыми самцы скреллов украшают свои головные хвосты."
	icon_state = "skrell_band_sil"
	item_state_slots = list(slot_r_hand_str = "egg", slot_l_hand_str = "egg")

/obj/item/clothing/ears/skrell/band/bluejewels
	name = "Скрелльские обручи с синими самоцветами"
	desc = "Золотые металлические обручи, украшенные синими самоцветами, которыми самцы скреллов украшают свои головные хвосты."
	icon_state = "skrell_band_bjewel"
	item_state_slots = list(slot_r_hand_str = "egg2", slot_l_hand_str = "egg2")

/obj/item/clothing/ears/skrell/band/redjewels
	name = "Скрелльские обручи с красными самоцветами"
	desc = "Золотые металлические обручи, украшенные красными самоцветами, которыми самцы скреллов украшают свои головные хвосты."
	icon_state = "skrell_band_rjewel"
	item_state_slots = list(slot_r_hand_str = "egg4", slot_l_hand_str = "egg4")

/obj/item/clothing/ears/skrell/band/ebony
	name = "Эбеновые скрелльские обручи"
	desc = "Эбеновые обручи, которыми самцы скреллов украшают свои головные хвосты."
	icon_state = "skrell_band_ebony"
	item_state_slots = list(slot_r_hand_str = "egg6", slot_l_hand_str = "egg6")

/obj/item/clothing/ears/skrell/colored/band
	name = "Скрелльские обручи"
	desc = "Окрашенные обручи, которыми самцы скреллов украшают свои головные хвосты."
	icon_state = "skrell_band_sil"
	item_state_slots = list(slot_r_hand_str = "egg", slot_l_hand_str = "egg")

/obj/item/clothing/ears/skrell/colored/chain
	name = "Скрелльская цепочка"
	desc = "Изящная окрашенная цепочка, которой самки скреллов украшают свои головные хвосты."
	icon_state = "skrell_chain_sil"
	item_state_slots = list(slot_r_hand_str = "egg", slot_l_hand_str = "egg")

/obj/item/clothing/ears/skrell/cloth_female
	name = "Красный скрелльский платок"
	desc = "Тканевый платок, которым самки скреллов украшают свои головные хвосты."
	icon_state = "skrell_cloth_female"
	item_state_slots = list(slot_r_hand_str = "egg4", slot_l_hand_str = "egg4")

/obj/item/clothing/ears/skrell/cloth_female/black
	name = "Черный скрелльский платок"
	icon_state = "skrell_cloth_black_female"
	item_state_slots = list(slot_r_hand_str = "egg6", slot_l_hand_str = "egg6")

/obj/item/clothing/ears/skrell/cloth_female/blue
	name = "Синий скрелльский платок"
	icon_state = "skrell_cloth_blue_female"
	item_state_slots = list(slot_r_hand_str = "egg2", slot_l_hand_str = "egg2")

/obj/item/clothing/ears/skrell/cloth_female/green
	name = "Зеленый скрелльский платок"
	icon_state = "skrell_cloth_green_female"
	item_state_slots = list(slot_r_hand_str = "egg3", slot_l_hand_str = "egg3")

/obj/item/clothing/ears/skrell/cloth_female/pink
	name = "Розовый скрелльский платок"
	icon_state = "skrell_cloth_pink_female"
	item_state_slots = list(slot_r_hand_str = "egg1", slot_l_hand_str = "egg1")

/obj/item/clothing/ears/skrell/cloth_female/lightblue
	name = "Голубой скрелльский платок"
	icon_state = "skrell_cloth_lblue_female"
	item_state_slots = list(slot_r_hand_str = "egg2", slot_l_hand_str = "egg2")

/obj/item/clothing/ears/skrell/cloth_male
	name = "Красная скрелльская повязка"
	desc = "Тканевая повязка, которой самцы скреллов украшают свои головные хвосты."
	icon_state = "skrell_cloth_male"
	item_state_slots = list(slot_r_hand_str = "egg4", slot_l_hand_str = "egg4")

/obj/item/clothing/ears/skrell/cloth_male/black
	name = "Черная скрелльская повязка"
	icon_state = "skrell_cloth_black_male"
	item_state_slots = list(slot_r_hand_str = "egg6", slot_l_hand_str = "egg6")

/obj/item/clothing/ears/skrell/cloth_male/blue
	name = "Синяя скрелльская повязка"
	icon_state = "skrell_cloth_blue_male"
	item_state_slots = list(slot_r_hand_str = "egg2", slot_l_hand_str = "egg2")

/obj/item/clothing/ears/skrell/cloth_male/green
	name = "Зеленая скрелльская повязка"
	icon_state = "skrell_cloth_green_male"
	item_state_slots = list(slot_r_hand_str = "egg3", slot_l_hand_str = "egg3")

/obj/item/clothing/ears/skrell/cloth_male/pink
	name = "Розовая скрелльская повязка"
	icon_state = "skrell_cloth_pink_male"
	item_state_slots = list(slot_r_hand_str = "egg1", slot_l_hand_str = "egg1")

/obj/item/clothing/ears/skrell/cloth_male/lightblue
	name = "Голубая скрелльская повязка"
	icon_state = "skrell_cloth_lblue_male"
	item_state_slots = list(slot_r_hand_str = "egg2", slot_l_hand_str = "egg2")