/obj/item/clothing/accessory/vest
	name = "черный жилет"
	desc = "Стильный жилет чёрного цвета."
	icon_state = "det_vest"
	slot = ACCESSORY_SLOT_OVER

/obj/item/clothing/accessory/jacket
	name = "бежевый пиджак"
	desc = "Удобный пиджак бежевого цвета."
	icon_state = "tan_jacket"
	slot = ACCESSORY_SLOT_OVER

/obj/item/clothing/accessory/jacket/charcoal
	name = "темный пиджак"
	desc = "Строгий пиджак угольного цвета."
	icon_state = "charcoal_jacket"

/obj/item/clothing/accessory/jacket/navy
	name = "синий пиджак"
	desc = "Парадный пиджак синего цвета."
	icon_state = "navy_jacket"

/obj/item/clothing/accessory/jacket/burgundy
	name = "бордовый пиджак"
	desc = "Дорогой пиджак бордового цвета."
	icon_state = "burgundy_jacket"

/obj/item/clothing/accessory/jacket/checkered
	name = "клетчатый пиджак"
	desc = "Везучий пиджак в клеточку."
	icon_state = "checkered_jacket"

/obj/item/clothing/accessory/chaps
	name = "коричневые гамаши"
	desc = "Свисающие кожаные гамаши коричневого цвета."
	icon_state = "chaps"

/obj/item/clothing/accessory/chaps/black
	name = "черные гамаши"
	desc = "Свисающие кожаные гамаши чёрного цвета."
	icon_state = "chaps_black"

/*
 * Poncho
 */
/obj/item/clothing/accessory/poncho
	name = "пончо"
	desc = "Простое, удобное пончо."
	icon_state = "classicponcho"
	item_state = "classicponcho"
	icon_override = 'icons/mob/ties.dmi'
	var/fire_resist = T0C+100
	allowed = list(/obj/item/weapon/tank/emergency/oxygen)
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	slot_flags = SLOT_OCLOTHING | SLOT_TIE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	siemens_coefficient = 0.9
	w_class = ITEMSIZE_NORMAL
	slot = ACCESSORY_SLOT_OVER

	sprite_sheets = list(
		"Тешари" = 'icons/mob/species/seromi/suit.dmi'
		)

/obj/item/clothing/accessory/poncho/equipped() //Solution for race-specific sprites for an accessory which is also a suit. Suit icons break if you don't use icon override which then also overrides race-specific sprites.
	..()
	var/mob/living/carbon/human/H = loc
	if(istype(H) && H.wear_suit == src)
		if(H.species.name == "Тешари")
			icon_override = 'icons/mob/species/seromi/suit.dmi'
		else
			icon_override = 'icons/mob/ties.dmi'
		update_clothing_icon()

/obj/item/clothing/accessory/poncho/dropped() //Resets the override to prevent the wrong .dmi from being used because equipped only triggers when wearing ponchos as suits.
	icon_override = null

/obj/item/clothing/accessory/poncho/green
	name = "зеленое пончо"
	desc = "Простая и удобная накидка без рукавов. Это пончо зелёного цвета."
	icon_state = "greenponcho"
	item_state = "greenponcho"

/obj/item/clothing/accessory/poncho/red
	name = "красное пончо"
	desc = "Простая и удобная накидка без рукавов. Это пончо красного цвета."
	icon_state = "redponcho"
	item_state = "redponcho"

/obj/item/clothing/accessory/poncho/purple
	name = "фиолетовое пончо"
	desc = "Простая и удобная накидка без рукавов. Это пончо фиолетового цвета."
	icon_state = "purpleponcho"
	item_state = "purpleponcho"

/obj/item/clothing/accessory/poncho/blue
	name = "синее пончо"
	desc = "Простая и удобная накидка без рукавов. Это пончо синего цвета."
	icon_state = "blueponcho"
	item_state = "blueponcho"

/obj/item/clothing/accessory/poncho/roles/security
	name = "пончо службы безопасности"
	desc = "Простая и удобная накидка без рукавов. Это пончо красное с черным — расцветка Службы Безопасности NanoTrasen."
	icon_state = "secponcho"
	item_state = "secponcho"

/obj/item/clothing/accessory/poncho/roles/medical
	name = "медицинское пончо"
	desc = "Простая и удобная накидка без рукавов. Это пончо белое с зеленым и синим - расцветка медицинского отдела."
	icon_state = "medponcho"
	item_state = "medponcho"

/obj/item/clothing/accessory/poncho/roles/engineering
	name = "инженерное пончо"
	desc = "Простая и удобная накидка без рукавов. Это пончо желтое с оранжевым - расцветка инженерного отдела."
	icon_state = "engiponcho"
	item_state = "engiponcho"

/obj/item/clothing/accessory/poncho/roles/science
	name = "научное пончо"
	desc = "Простая и удобная накидка без рукавов. Это пончо белое с фиолетовыми краями - расцветка научного отдела NanoTrasen."
	icon_state = "sciponcho"
	item_state = "sciponcho"

/obj/item/clothing/accessory/poncho/roles/cargo
	name = "пончо отдела снабжения"
	desc = "Простая и удобная накидка без рукавов. Это пончо серое с бежевым - расцветка отдела снабжения."
	icon_state = "cargoponcho"
	item_state = "cargoponcho"

/*
 * Cloak
 */
/obj/item/clothing/accessory/poncho/roles/cloak
	name = "плащ Квартирмейстера"
	desc = "Изысканная накидка коричневого с золотым цвета."
	icon_state = "qmcloak"
	item_state = "qmcloak"
	body_parts_covered = null

/obj/item/clothing/accessory/poncho/roles/cloak/ce
	name = "плащ Главного Инженера"
	desc = "Изысканная накидка Главного Инженера."
	icon_state = "cecloak"
	item_state = "cecloak"

/obj/item/clothing/accessory/poncho/roles/cloak/cmo
	name = "плащ Главврача"
	desc = "Изысканная накидка, предназначенная для Главврача."
	icon_state = "cmocloak"
	item_state = "cmocloak"

/obj/item/clothing/accessory/poncho/roles/cloak/hop
	name = "плащ Главы Персонала"
	desc = "Изысканная накидка, предназначенная для Главы Персонала."
	icon_state = "hopcloak"
	item_state = "hopcloak"

/obj/item/clothing/accessory/poncho/roles/cloak/rd
	name = "плащ Директора Исследований"
	desc = "Изысканная накидка, предназначенная для Директора Исследований."
	icon_state = "rdcloak"
	item_state = "rdcloak"

/obj/item/clothing/accessory/poncho/roles/cloak/qm
	name = "плащ Квартирмейстера"
	desc = "Изысканная накидка, предназначенная для Квартирмейстера"
	icon_state = "qmcloak"
	item_state = "qmcloak"

/obj/item/clothing/accessory/poncho/roles/cloak/hos
	name = "плащ Главы Службы Безопасности"
	desc = "Изысканная накидка, предназначенная для Главы Службы Безопасности."
	icon_state = "hoscloak"
	item_state = "hoscloak"

/obj/item/clothing/accessory/poncho/roles/cloak/captain
	name = "плащ Директора Колонии"
	desc = "Изысканная накидка, предназначенная для Директора Колонии."
	icon_state = "capcloak"
	item_state = "capcloak"

/obj/item/clothing/accessory/poncho/roles/cloak/cargo
	name = "коричневый плащ"
	desc = "Простенькая накидка черно-коричневого цвета."
	icon_state = "cargocloak"
	item_state = "cargocloak"

/obj/item/clothing/accessory/poncho/roles/cloak/mining
	name = "укороченный фиолетовый плащ"
	desc = "Укороченная накидка фиолетово-золотого цвета."
	icon_state = "miningcloak"
	item_state = "miningcloak"

/obj/item/clothing/accessory/poncho/roles/cloak/security
	name = "красный плащ"
	desc = "Простенькая накидка красно-черного цвета."
	icon_state = "seccloak"
	item_state = "seccloak"

/obj/item/clothing/accessory/poncho/roles/cloak/service
	name = "зеелный плащ"
	desc = "Простенькая накидка зелено-синего цвета."
	icon_state = "servicecloak"
	item_state = "servicecloak"

/obj/item/clothing/accessory/poncho/roles/cloak/engineer
	name = "золотой плащ"
	desc = "Простенькая накидка коричнево-золотого цвета."
	icon_state = "engicloak"
	item_state = "engicloak"

/obj/item/clothing/accessory/poncho/roles/cloak/atmos
	name = "желтый плащ"
	desc = "Укороченная накидка желто-голубого цвета."
	icon_state = "atmoscloak"
	item_state = "atmoscloak"

/obj/item/clothing/accessory/poncho/roles/cloak/research
	name = "фиолетовый плащ"
	desc = "Простенькая накидка бело-фиолетового цвета."
	icon_state = "scicloak"
	item_state = "scicloak"

/obj/item/clothing/accessory/poncho/roles/cloak/medical
	name = "голубой плащ"
	desc = "Простенькая накидка голубого цвета."
	icon_state = "medcloak"
	item_state = "medcloak"


/obj/item/clothing/accessory/poncho/roles/cloak/custom //A colorable cloak
	name = "плащ"
	desc = "Простая одноцветная накидка."
	icon_state = "colorcloak"
	item_state = "colorcloak"

/obj/item/clothing/accessory/hawaii
	name = "цветочная рубашка"
	desc = "От такой поможет только сварочная маска."
	icon_state = "hawaii"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	slot_flags = SLOT_OCLOTHING | SLOT_TIE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	siemens_coefficient = 0.9
	w_class = ITEMSIZE_NORMAL
	slot = ACCESSORY_SLOT_OVER

/obj/item/clothing/accessory/hawaii/red
	icon_state = "hawaii2"

/obj/item/clothing/accessory/hawaii/random
	name = "цветочная рубашка"

/obj/item/clothing/accessory/hawaii/random/New()
	if(prob(50))
		icon_state = "hawaii2"
	color = color_rotation(rand(-11,12)*15)

/obj/item/clothing/accessory/wcoat
	name = "жилетка"
	desc = "Для стильного и, вероятно, убийственного веселья."
	icon_state = "vest"
	item_state = "vest"
	icon_override = 'icons/mob/ties.dmi'
	item_state_slots = list(slot_r_hand_str = "wcoat", slot_l_hand_str = "wcoat")
	allowed = list(/obj/item/weapon/pen, /obj/item/weapon/paper, /obj/item/device/flashlight, /obj/item/weapon/tank/emergency/oxygen, /obj/item/weapon/storage/fancy/cigarettes, /obj/item/weapon/storage/box/matches, /obj/item/weapon/reagent_containers/food/drinks/flask)
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	slot_flags = SLOT_OCLOTHING | SLOT_TIE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	siemens_coefficient = 0.9
	w_class = ITEMSIZE_NORMAL
	slot = ACCESSORY_SLOT_OVER

/obj/item/clothing/accessory/wcoat/red
	name = "красная жилетка"
	icon_state = "red_waistcoat"
	item_state = "red_waistcoat"

/obj/item/clothing/accessory/wcoat/grey
	name = "серая жилетка"
	icon_state = "grey_waistcoat"
	item_state = "grey_waistcoat"

/obj/item/clothing/accessory/wcoat/brown
	name = "коричневая жилетка"
	icon_state = "brown_waistcoat"
	item_state = "brown_waistcoat"

/obj/item/clothing/accessory/wcoat/gentleman
	name = "элегантная жилетка"
	icon_state = "elegant_waistcoat"
	item_state = "elegant_waistcoat"

/obj/item/clothing/accessory/wcoat/swvest
	name = "черный жилет-свитер"
	desc = "Свитер без рукавов. Такие носят только те, кому не нужны теплые руки, а также ботаники."
	icon_state = "sweatervest"
	item_state = "sweatervest"

/obj/item/clothing/accessory/wcoat/swvest/blue
	name = "синий жилет-свитер"
	icon_state = "sweatervest_blue"
	item_state = "sweatervest_blue"

/obj/item/clothing/accessory/wcoat/swvest/red
	name = "красный жилет-свитер"
	icon_state = "sweatervest_red"
	item_state = "sweatervest_red"

//Sweaters.

/obj/item/clothing/accessory/sweater
	name = "свитер"
	desc = "Теплый вязаный свитер."
	icon_override = 'icons/mob/ties.dmi'
	icon_state = "sweater"
	slot_flags = SLOT_OCLOTHING | SLOT_TIE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	siemens_coefficient = 0.9
	w_class = ITEMSIZE_NORMAL
	slot = ACCESSORY_SLOT_OVER

/obj/item/clothing/accessory/sweater/pink
	name = "розовый свитер"
	desc = "Теплый вязаный свитер. Этот свитер розового цвета."
	icon_state = "sweater_pink"

/obj/item/clothing/accessory/sweater/mint
	name = "мятный свитер"
	desc = "Теплый вязаный свитер в мятных оттенках."
	icon_state = "sweater_mint"

/obj/item/clothing/accessory/sweater/blue
	name = "голубой свитер"
	desc = "Теплый вязаный свитер. Этот свитер светло-синего цвета."
	icon_state = "sweater_blue"

/obj/item/clothing/accessory/sweater/heart
	name = "свитер с сердечком"
	desc = "Теплый вязаный свитер. Этот свитер светло-синего цвета, и в центре нарисовано огромное сердечко!"
	icon_state = "sweater_blueheart"

/obj/item/clothing/accessory/sweater/nt
	name = "темно-синий свитер"
	desc = "Теплый вязаный свитер. Этот свитер темно-синего цвета."
	icon_state = "sweater_nt"

/obj/item/clothing/accessory/sweater/keyhole
	name = "свитер со скважиной"
	desc = "Лавандовый свитер с открытой грудью."
	icon_state = "keyholesweater"

/obj/item/clothing/accessory/sweater/blackneck
	name = "черная водолазка"
	desc = "Плотно прилегающая водолазка черного цвета."
	icon_state = "turtleneck_black"

/obj/item/clothing/accessory/sweater/winterneck
	name = "рождественская водолазка"
	desc = "Очень убогий праздничный свитер. Немножко чешется."
	icon_state = "turtleneck_winterred"

/obj/item/clothing/accessory/sweater/uglyxmas
	name = "убогий рождественский свитер"
	desc = "Подарок, которому стоило бы остаться где-то глубоко в шкафу."
	icon_state = "uglyxmas"

/obj/item/clothing/accessory/sweater/flowersweater
	name = "цветочный свитер"
	desc =  "Розовый оверсайз свитер."
	icon_state = "flowersweater"

/obj/item/clothing/accessory/sweater/redneck
	name = "красная водолазка"
	desc = "Удобная водолазка тёмно-красного цвета."
	icon_state = "turtleneck_red"

//***
// End of sweaters
//***

/obj/item/clothing/accessory/cowledvest
	name = "безрукавка с воротом"
	desc = "Телогрейка XXIV века." //VOREStation Edit
	icon_state = "cowled_vest"

/obj/item/clothing/accessory/asymmetric
	name = "синяя асимметричная куртка"
	desc = "Вызывающий авангард в голубых тонах."
	icon_state = "asym_blue"

/obj/item/clothing/accessory/asymmetric/purple
	name = "фиолетовая асимметричная куртка"
	desc = "Вызывающий авангард в мальвовых тонах."
	icon_state = "asym_purple"

/obj/item/clothing/accessory/asymmetric/green
	name = "зеленая асимметричная куртка"
	desc = "Вызывающий авангард в тонах морской волны."
	icon_state = "asym_green"

/obj/item/clothing/accessory/asymovercoat
	name = "оранжевое асимметричное пальто"
	desc = "Асимметричное оранжевое пальто, которое в последний раз было в моде в 2560-ых."
	icon_state = "asymovercoat"
