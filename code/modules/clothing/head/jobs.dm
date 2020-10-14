
//Bartender
/obj/item/clothing/head/chefhat
	name = "chef's hat"
	desc = "It's a hat used by chefs to keep hair out of your food. Judging by the food in the mess, they don't work."
	icon_state = "chefhat"

//Captain
/obj/item/clothing/head/caphat
	name = "site manager's hat"
	icon_state = "captain"
	desc = "It's good being the king."
	body_parts_covered = 0

/obj/item/clothing/head/caphat/cap
	name = "site manager's cap"
	desc = "You fear to wear it for the negligence it brings."
	icon_state = "capcap"

/obj/item/clothing/head/caphat/formal
	name = "parade hat"
	desc = "No one in a commanding position should be without a perfect, white hat of ultimate authority."
	icon_state = "officercap"

//HOP
/obj/item/clothing/head/caphat/hop
	name = "crew resource's hat"
	desc = "A stylish hat that both protects you from enraged former-crewmembers and gives you a false sense of authority."
	icon_state = "hopcap"

//Chaplain
/obj/item/clothing/head/chaplain_hood
	name = "chaplain's hood"
	desc = "It's a hood that covers the head. It keeps you warm during the space winters."
	icon_state = "chaplain_hood"
	item_state_slots = list(slot_r_hand_str = "beret_black", slot_l_hand_str = "beret_black")
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

//Chaplain but spookier
/obj/item/clothing/head/chaplain_hood/whiteout
	name = "white hood"
	desc = "It's a generic white hood. Very spooky."
	icon_state = "whiteout_hood"
	item_state_slots = list(slot_r_hand_str = "beret_white", slot_l_hand_str = "beret_white")

//Chaplain
/obj/item/clothing/head/nun_hood
	name = "nun hood"
	desc = "Maximum piety in this star system."
	icon_state = "nun_hood"
	item_state_slots = list(slot_r_hand_str = "beret_black", slot_l_hand_str = "beret_black")
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

//Mime
/obj/item/clothing/head/beret
	name = "берет"
	desc = "Берет, излюбленный художниками головной убор."
	icon_state = "beret"
	body_parts_covered = 0

//Security
/obj/item/clothing/head/beret/sec
	name = "берет службы безопасности"
	desc = "Берет с пришитым знаком Службы Безопасности. Для офицеров, для которых стиль важнее безопасности."
	icon_state = "beret_officer"
	item_state_slots = list(slot_r_hand_str = "beret", slot_l_hand_str = "beret")

/obj/item/clothing/head/beret/sec/navy/officer
	name = "берет офицера"
	desc = "Тёмный берет с эмблемой звания офицера. Для офицеров, для которых стиль важнее безопасности."
	icon_state = "beret_navy_officer"
	item_state_slots = list(slot_r_hand_str = "beret_navy", slot_l_hand_str = "beret_navy")

/obj/item/clothing/head/beret/sec/navy/hos
	name = "берет Главы Службы Безопасности"
	desc = "Тёмный берет с эмблемой звания Главы Службы Безопасности. Для офицеров, для которых стиль важнее безопасности."
	icon_state = "beret_navy_hos"
	item_state_slots = list(slot_r_hand_str = "beret_navy", slot_l_hand_str = "beret_navy")

/obj/item/clothing/head/beret/sec/navy/warden
	name = "берет надзирателя"
	desc = "Тёмный берет с эмблемой звания надзирателя. Для офицеров, для которых стиль важнее безопасности."
	icon_state = "beret_navy_warden"
	item_state_slots = list(slot_r_hand_str = "beret_navy", slot_l_hand_str = "beret_navy")

/obj/item/clothing/head/beret/sec/corporate/officer
	name = "берет офицера"
	desc = "Черный фирменный берет с эмблемой звания офицера. Для офицеров, для которых стиль важнее безопасности."
	icon_state = "beret_corporate_officer"
	item_state_slots = list(slot_r_hand_str = "beret_black", slot_l_hand_str = "beret_black")

/obj/item/clothing/head/beret/sec/corporate/hos
	name = "берет Главы Службы Безопасности"
	desc = "Черный фирменный берет с эмблемой звания Главы Службы Безопасности. Для офицеров, для которых стиль важнее безопасности."
	icon_state = "beret_corporate_hos"
	item_state_slots = list(slot_r_hand_str = "beret_black", slot_l_hand_str = "beret_black")

/obj/item/clothing/head/beret/sec/corporate/warden
	name = "берет надзирателя"
	desc = "Черный фирменный берет с эмблемой звания надзирателя. Для офицеров, для которых стиль важнее безопасности."
	icon_state = "beret_corporate_warden"
	item_state_slots = list(slot_r_hand_str = "beret_black", slot_l_hand_str = "beret_black")

/obj/item/clothing/head/helmet/warden
	name = "warden's helmet"
	desc = "Standard Warden gear. Protects the head from impacts."

/obj/item/clothing/head/helmet/warden/hat
	name = "warden's hat"
	desc = "It's a special hat issued to the Warden of a securiy force."
	icon_state = "policehelm"
	valid_accessory_slots = null

/obj/item/clothing/head/helmet/HoS
	name = "Head of Security helmet"
	desc = "Standard Head of Security gear. Protects the head from impacts."

/obj/item/clothing/head/helmet/HoS/hat
	name = "Head of Security Hat"
	desc = "The hat of the Head of Security. For showing the officers who's in charge."
	icon_state = "hoscap"
	valid_accessory_slots = null

/obj/item/clothing/head/helmet/dermal
	name = "Dermal Armour Patch"
	desc = "You're not quite sure how you manage to take it on and off, but it implants nicely in your head."
	icon_state = "dermal"
	item_state_slots = list(slot_r_hand_str = "", slot_l_hand_str = "")
	valid_accessory_slots = null
	show_examine = FALSE
	flags_inv = null

/obj/item/clothing/head/det
	name = "федора"
	desc = "Коричневая федора. В зависимости от носителя, является либо последним писком детективной моды, либо убогой попыткой выглядеть круто."
	icon_state = "detective"
	allowed = list(/obj/item/weapon/reagent_containers/food/snacks/candy_corn, /obj/item/weapon/pen)
	armor = list(melee = 10, bullet = 10, laser = 15, energy = 10, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	valid_accessory_slots = null
	show_examine = FALSE

/obj/item/clothing/head/det/grey
	icon_state = "detective2"
	item_state_slots = list(slot_r_hand_str = "detective", slot_l_hand_str = "detective")
	desc = "Серая федора. В зависимости от носителя, является либо последним писком детективной моды, либо убогой попыткой выглядеть круто."

/obj/item/clothing/head/beret/engineering
	name = "инженерный берет"
	desc = "Берет с пришитым знаком инженеров. Для инженеров, для которых стиль важнее безопасности."
	icon_state = "beret_orange"

/obj/item/clothing/head/beret/purple
	name = "фиолетовый берет"
	desc = "Стильный берет (если, конечно, фиолетовый)."
	icon_state = "beret_purpleyellow"

/obj/item/clothing/head/beret/centcom/officer
	name = "officers beret"
	desc = "A dark blue beret adorned with a silver patch. Worn by NanoTrasen Officials."
	icon_state = "beret_centcom_officer"
	item_state_slots = list(slot_r_hand_str = "beret_white", slot_l_hand_str = "beret_white")

/obj/item/clothing/head/beret/centcom/captain
	name = "captains beret"
	desc = "A white beret adorned with a blue patch. Worn by NanoTrasen command staff."
	icon_state = "beret_centcom_captain"
	item_state_slots = list(slot_r_hand_str = "beret_white", slot_l_hand_str = "beret_white")

/obj/item/clothing/head/beret/sec/gov
	name = "officer beret"
	desc = "A black beret with a gold emblem."
	icon_state = "beret_corporate_hos"
	item_state_slots = list(slot_r_hand_str = "beret_black", slot_l_hand_str = "beret_black")

//Medical
/obj/item/clothing/head/surgery
	name = "хирургическая шапочка"
	desc = "Шапочка, которую носят хирурги во время операций, чтобы их волосы не щекотали Вам внутренние органы."
	icon_state = "surgcap_blue"
	item_state_slots = list(slot_r_hand_str = "beret_blue", slot_l_hand_str = "beret_blue")
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/surgery/purple
	desc = "Шапочка, которую носят хирурги во время операций, чтобы их волосы не щекотали Вам внутренние органы. Эта фиолетового цвета."
	icon_state = "surgcap_purple"
	item_state_slots = list(slot_r_hand_str = "beret_purple", slot_l_hand_str = "beret_purple")

/obj/item/clothing/head/surgery/blue
	desc = "Шапочка, которую носят хирурги во время операций, чтобы их волосы не щекотали Вам внутренние органы. Эта голубого цвета."
	icon_state = "surgcap_blue"
	item_state_slots = list(slot_r_hand_str = "beret_blue", slot_l_hand_str = "beret_blue")

/obj/item/clothing/head/surgery/green
	desc = "Шапочка, которую носят хирурги во время операций, чтобы их волосы не щекотали Вам внутренние органы. Эта тёмно-зеленого цвета."
	icon_state = "surgcap_green"
	item_state_slots = list(slot_r_hand_str = "beret_green", slot_l_hand_str = "beret_green")

/obj/item/clothing/head/surgery/black
	desc = "Шапочка, которую носят хирурги во время операций, чтобы их волосы не щекотали Вам внутренние органы. Эта чёрного цвета."
	icon_state = "surgcap_black"
	item_state_slots = list(slot_r_hand_str = "beret_black", slot_l_hand_str = "beret_black")

/obj/item/clothing/head/surgery/navyblue
	desc = "Шапочка, которую носят хирурги во время операций, чтобы их волосы не щекотали Вам внутренние органы. Эта темно-синего цвета."
	icon_state = "surgcap_navyblue"
	item_state_slots = list(slot_r_hand_str = "beret_navy", slot_l_hand_str = "beret_navy")
