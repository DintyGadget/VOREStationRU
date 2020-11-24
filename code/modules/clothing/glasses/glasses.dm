///////////////////////////////////////////////////////////////////////
//Glasses
/*
SEE_SELF  // can see self, no matter what
SEE_MOBS  // can see all mobs, no matter what
SEE_OBJS  // can see all objs, no matter what
SEE_TURFS // can see all turfs (and areas), no matter what
SEE_PIXELS// if an object is located on an unlit area, but some of its pixels are
          // in a lit area (via pixel_x,y or smooth movement), can see those pixels
BLIND     // can't see anything
*/
///////////////////////////////////////////////////////////////////////

/obj/item/clothing/glasses
	name = "Очки"
	icon = 'icons/obj/clothing/glasses.dmi'
	w_class = ITEMSIZE_SMALL
	slot_flags = SLOT_EYES
	plane_slots = list(slot_glasses)
	var/vision_flags = 0
	var/darkness_view = 0//Base human is 2
	var/see_invisible = -1
	var/prescription = 0
	var/toggleable = 0
	var/off_state = "degoggles"
	var/active = 1
	var/activation_sound = 'sound/items/goggles_charge.ogg'
	var/obj/screen/overlay = null
	var/list/away_planes //Holder for disabled planes
	drop_sound = 'sound/items/drop/accessory.ogg'
	pickup_sound = 'sound/items/pickup/accessory.ogg'

	sprite_sheets = list(
		"Тешари" = 'icons/mob/species/seromi/eyes.dmi',
		"Вокс" = 'icons/mob/species/vox/eyes.dmi'
		)

/obj/item/clothing/glasses/update_clothing_icon()
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_glasses()

/obj/item/clothing/glasses/proc/can_toggle(mob/living/user)
	if(!toggleable)
		return FALSE

	// Prevent people from just turning their goggles back on.
	if(!active && (vision_flags & (SEE_TURFS|SEE_OBJS)))
		var/area/A = get_area(src)
		if(A.no_spoilers)
			return FALSE

	return TRUE

/obj/item/clothing/glasses/proc/toggle_active(mob/living/user)
	if(active)
		active = FALSE
		icon_state = off_state
		user.update_inv_glasses()
		flash_protection = FLASH_PROTECTION_NONE
		tint = TINT_NONE
		away_planes = enables_planes
		enables_planes = null

	else
		active = TRUE
		icon_state = initial(icon_state)
		user.update_inv_glasses()
		flash_protection = initial(flash_protection)
		tint = initial(tint)
		enables_planes = away_planes
		away_planes = null
	user.update_action_buttons()
	user.recalculate_vis()

/obj/item/clothing/glasses/attack_self(mob/user)
	if(toggleable)
		if(!can_toggle(user))
			to_chat(user, span("warning", "У Вас не получается переключить [ru_getcase(src, "acase")] здесь."))
		else
			toggle_active(user)
			if(active)
				to_chat(user, span("notice", "Вы включаете оптическую матрицу [ru_getcase(src, "gcase")]."))
			else
				to_chat(user, span("notice", "Вы выключаете оптическую матрицу [ru_getcase(src, "gcase")]."))
	..()

/obj/item/clothing/glasses/meson
	name = "Мезонный сканер"
	desc = "Позволяет видеть стены, полы и объекты сквозь другие объекты."
	icon_state = "meson"
	item_state_slots = list(slot_r_hand_str = "meson", slot_l_hand_str = "meson")
	action_button_name = "Переключить Визор"
	origin_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2)
	toggleable = 1
	vision_flags = SEE_TURFS
	enables_planes = list(VIS_FULLBRIGHT, VIS_MESONS)

/obj/item/clothing/glasses/meson/New()
	..()
	overlay = global_hud.meson

/obj/item/clothing/glasses/meson/prescription
	name = "Мезонный сканер (близ.)"
	desc = "Оптический мезонный сканер с линзами для близоруких."
	prescription = 1

/obj/item/clothing/glasses/meson/aviator
	name = "Инженерные очки-авиаторы"
	icon_state = "aviator_eng"
	off_state = "aviator"
	item_state_slots = list(slot_r_hand_str = "sunglasses", slot_l_hand_str = "sunglasses")
	action_button_name = "Включить HUD"
	activation_sound = 'sound/effects/pop.ogg'

/obj/item/clothing/glasses/meson/aviator/prescription
	name = "Инженерные очки-авиаторы (близ.)"
	desc = "Инженерные очки-авиаторы с линзами для близоруких."
	prescription = 1

/obj/item/clothing/glasses/hud/health/aviator
	name = "Медицинские очки-авиаторы"
	desc = "Модифицированные очки-авиаторы с медицинским HUD."
	icon_state = "aviator_med"
	off_state = "aviator"
	action_button_name = "Переключить Режим"
	toggleable = 1
	activation_sound = 'sound/effects/pop.ogg'

/obj/item/clothing/glasses/hud/health/aviator/prescription
	name = "Медицинские очки-авиаторы (близ.)"
	desc = "Модифицированные очки-авиаторы с медицинским HUD. В комплект входят линзы для близоруких."
	prescription = 6

/obj/item/clothing/glasses/science
	name = "Научные очки"
	desc = "Эти очки ничего не делают!"
	icon_state = "purple"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")
	toggleable = 1
	action_button_name = "Переключить Визор"
	item_flags = AIRTIGHT

/obj/item/clothing/glasses/science/New()
	..()
	overlay = global_hud.science

/obj/item/clothing/glasses/goggles
	name = "Защитные очки"
	desc = "Самые что ни на есть обыкновенные защитные очки."
	icon_state = "plaingoggles"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")
	item_flags = AIRTIGHT
	body_parts_covered = EYES

/obj/item/clothing/glasses/night
	name = "Очки ночного видения"
	desc = "Теперь точно всё видно в темноте!"
	icon_state = "night"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")
	origin_tech = list(TECH_MAGNET = 2)
	darkness_view = 7
	toggleable = 1
	action_button_name = "Переключить Визор"
	off_state = "denight"
	flash_protection = FLASH_PROTECTION_REDUCED
	enables_planes = list(VIS_FULLBRIGHT)

/obj/item/clothing/glasses/night/vox
	name = "Инопланетные очки"
	species_restricted = list("Вокс")
	flags = PHORONGUARD

/obj/item/clothing/glasses/night/New()
	..()
	overlay = global_hud.nvg

/obj/item/clothing/glasses/eyepatch
	name = "Повязка на глаз"
	desc = "Йо-хо-хо."
	icon_state = "eyepatch"
	item_state_slots = list(slot_r_hand_str = "blindfold", slot_l_hand_str = "blindfold")
	body_parts_covered = 0
	var/eye = null
	drop_sound = 'sound/items/drop/gloves.ogg'
	pickup_sound = 'sound/items/pickup/gloves.ogg'

/obj/item/clothing/glasses/eyepatch/verb/switcheye()
	set name = "Сменить Положение Повязки"
	set category = "Объект"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.stat) return

	eye = !eye
	if(eye)
		icon_state = "[icon_state]_1"
	else
		icon_state = initial(icon_state)
	update_clothing_icon()

/obj/item/clothing/glasses/eyepatchwhite
	name = "Повязка на глаз"
	desc = "Простая повязка на глаз, сделанная из ленточки ткани."
	icon_state = "eyepatch_white"
	item_state_slots = list(slot_r_hand_str = "blindfold", slot_l_hand_str = "blindfold")
	body_parts_covered = 0
	var/eye = null
	drop_sound = 'sound/items/drop/gloves.ogg'
	pickup_sound = 'sound/items/pickup/gloves.ogg'

/obj/item/clothing/glasses/eyepatchwhite/verb/switcheye()
	set name = "Сменить Положение Повязки"
	set category = "Объект"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.stat) return

	eye = !eye
	if(eye)
		icon_state = "[icon_state]_1"
	else
		icon_state = initial(icon_state)
	update_clothing_icon()

/obj/item/clothing/glasses/monocle
	name = "Монокль"
	desc = "Какой элегантный аксессуар!"
	icon_state = "monocle"
	item_state_slots = list(slot_r_hand_str = "headset", slot_l_hand_str = "headset")
	body_parts_covered = 0

/obj/item/clothing/glasses/material
	name = "Визор материалов"
	desc = "Очки, имеющие свойство запутывать носителя."
	icon_state = "material"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")
	origin_tech = list(TECH_MAGNET = 3, TECH_ENGINEERING = 3)
	toggleable = 1
	action_button_name = "Переключить Визор"
	vision_flags = SEE_OBJS
	enables_planes = list(VIS_FULLBRIGHT)

/obj/item/clothing/glasses/material/New()
	..()
	overlay = global_hud.material

/obj/item/clothing/glasses/material/prescription
	name = "Материальный визор (близ.)"
	prescription = 1

/obj/item/clothing/glasses/graviton
	name = "Материальный визор"
	desc = "Тайны космических путешествий... не в Ваших руках."
	icon_state = "grav"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")
	origin_tech = list(TECH_MAGNET = 2, TECH_BLUESPACE = 1)
	darkness_view = 5
	toggleable = 1
	action_button_name = "Переключить Визор"
	off_state = "denight"
	vision_flags = SEE_OBJS | SEE_TURFS
	flash_protection = FLASH_PROTECTION_REDUCED
	enables_planes = list(VIS_FULLBRIGHT, VIS_MESONS)

/obj/item/clothing/glasses/graviton/New()
	..()
	overlay = global_hud.material

/obj/item/clothing/glasses/regular
	name = "Очки (близ.)"
	desc = "Изготовлены Zadr Inc."
	icon_state = "glasses"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")
	prescription = 1
	body_parts_covered = 0

/obj/item/clothing/glasses/regular/scanners
	name = "Сканирующий визор"
	desc = "Визор крайне престранной формы с торчащими по бокам проводами. Он приглушенно гудит."
	icon_state = "uzenwa_sissra_1"

/obj/item/clothing/glasses/regular/hipster
	name = "Хипстерские очки"
	desc = "Изготовлены Nu Takoe Inc."
	icon_state = "hipster_glasses"

/obj/item/clothing/glasses/threedglasses
	desc = "Когда-то давно, эти очки использовались людьми для придания объёма изображениям на экранах."
	name = "3D-очки"
	icon_state = "3d"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")
	body_parts_covered = 0

/obj/item/clothing/glasses/gglasses
	name = "Зеленые очки"
	desc = "Очки зеленого цвета, придающие Вам довольно зловещий вид."
	icon_state = "gglasses"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")
	body_parts_covered = 0

/obj/item/clothing/glasses/regular/rimless
	name = "Очки без оправы (близ.)"
	desc = "Стильные современные очки из одной крупной линзы."
	icon_state = "glasses_rimless"

/obj/item/clothing/glasses/rimless
	name = "Очки без оправы"
	desc = "Стильные современные очки из одной крупной линзы."
	icon_state = "glasses_rimless"
	prescription = 0

/obj/item/clothing/glasses/regular/thin
	name = "Очки в тонкой оправе (близ.)"
	desc = "Очки в оправе — прошлый век."
	icon_state = "glasses_thin"
	prescription = 1

/obj/item/clothing/glasses/thin
	name = "Очки в тонкой оправе"
	desc = "Очки в оправе — прошлый век."
	icon_state = "glasses_thin"
	prescription = 0


/obj/item/clothing/glasses/sunglasses
	name = "Солнцезащитные очки"
	desc = "На удивление древняя технология, предоставляющая примитивную защиту глаз. Утолщенные линзы защищают от некоторых вспышек."
	icon_state = "sun"
	item_state_slots = list(slot_r_hand_str = "sunglasses", slot_l_hand_str = "sunglasses")
	darkness_view = -1
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/glasses/sunglasses/aviator
	name = "Очки-авиаторы"
	desc = "Дизайнерские очки."
	icon_state = "aviator"

/obj/item/clothing/glasses/welding
	name = "Маска для сварки"
	desc = "Защищает глаза во время сварки. Одобрена ассоциацией безумных учёных."
	icon_state = "welding-g"
	item_state_slots = list(slot_r_hand_str = "welding-g", slot_l_hand_str = "welding-g")
	action_button_name = "Отрегулировать Маску"
	matter = list(DEFAULT_WALL_MATERIAL = 1500, "glass" = 1000)
	item_flags = AIRTIGHT
	var/up = 0
	flash_protection = FLASH_PROTECTION_MAJOR
	tint = TINT_HEAVY

/obj/item/clothing/glasses/welding/attack_self()
	toggle()

/obj/item/clothing/glasses/welding/verb/toggle()
	set category = "Объект"
	set name = "Отрегулировать Маску Для Сварки"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			flags_inv |= HIDEEYES
			body_parts_covered |= EYES
			icon_state = initial(icon_state)
			flash_protection = initial(flash_protection)
			tint = initial(tint)
			to_chat(usr, "Вы опускаете [ru_getcase(src, "acase")], защищая глаза.")
		else
			src.up = !src.up
			flags_inv &= ~HIDEEYES
			body_parts_covered &= ~EYES
			icon_state = "[initial(icon_state)]up"
			flash_protection = FLASH_PROTECTION_NONE
			tint = TINT_NONE
			to_chat(usr, "Вы приподнимаете [ru_getcase(src, "acase")] со своего лица.")
		update_clothing_icon()
		usr.update_action_buttons()

/obj/item/clothing/glasses/welding/superior
	name = "Улучшенные очки для сварки"
	desc = "Очки для сварки, изготовленные из более дорогих материалов и почему-то пахнущие картошкой."
	icon_state = "rwelding-g"
	tint = TINT_MODERATE

/obj/item/clothing/glasses/sunglasses/blindfold
	name = "Повязка на глаза"
	desc = "Закрывает глаза, препятствуя зрению."
	icon_state = "blindfold"
	item_state_slots = list(slot_r_hand_str = "blindfold", slot_l_hand_str = "blindfold")
	flash_protection = FLASH_PROTECTION_MAJOR
	tint = BLIND
	drop_sound = 'sound/items/drop/gloves.ogg'
	pickup_sound = 'sound/items/pickup/gloves.ogg'

/obj/item/clothing/glasses/sunglasses/blindfold/tape
	name = "Кусочек скотча"
	desc = "Прочная самодельная повязка на глаза!"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "tape_cross"
	item_state_slots = list(slot_r_hand_str = null, slot_l_hand_str = null)
	w_class = ITEMSIZE_TINY

/obj/item/clothing/glasses/sunglasses/prescription
	name = "Солнцезащитные очки (близ.)"
	prescription = 1

/obj/item/clothing/glasses/sunglasses/big
	desc = "На удивление древняя технология, предоставляющая примитивную защиту глаз. Толстые линзы защищают от некоторых вспышек."
	icon_state = "bigsunglasses"

/obj/item/clothing/glasses/fakesunglasses //Sunglasses without flash immunity
	name = "Солнечные очки"
	desc = "Дизайнерские солнечные очки. Вряд ли помогают против вспышек."
	icon_state = "sun"
	item_state_slots = list(slot_r_hand_str = "sunglasses", slot_l_hand_str = "sunglasses")

/obj/item/clothing/glasses/fakesunglasses/aviator
	name = "Солнечные очки-авиаторы"
	desc = "Дизайнерские солнечные очки. Вряд ли помогают против вспышек."
	icon_state = "aviator"

/obj/item/clothing/glasses/sunglasses/sechud
	name = "Солнцезащитный HUD"
	desc = "Солнцезащитные очки с HUD службы безопасности."
	icon_state = "sunSecHud"
	enables_planes = list(VIS_CH_ID,VIS_CH_WANTED,VIS_CH_IMPTRACK,VIS_CH_IMPLOYAL,VIS_CH_IMPCHEM)

/obj/item/clothing/glasses/sunglasses/sechud/tactical
	name = "Тактический HUD"
	desc = "Визор со встроенной боевой информацией и записями службы безопасности. Предоставляют защиту от вспышек."
	icon_state = "swatgoggles"

/obj/item/clothing/glasses/sunglasses/sechud/aviator
	name = "HUD-авиатор службы безопасности"
	desc = "Модифицированные очки-авиаторы с режимами HUD и защиты от вспышек."
	icon_state = "aviator_sec"
	off_state = "aviator"
	action_button_name = "Переключить Режим"
	var/on = 1
	toggleable = 1
	activation_sound = 'sound/effects/pop.ogg'

/obj/item/clothing/glasses/sunglasses/sechud/aviator/attack_self(mob/user)
	if(toggleable && !user.incapacitated())
		on = !on
		if(on)
			flash_protection = FLASH_PROTECTION_NONE
			enables_planes = away_planes
			away_planes = null
			to_chat(usr, "Вы переключаете [ru_getcase(src, "acase")] в режим HUD.")
		else
			flash_protection = initial(flash_protection)
			away_planes = enables_planes
			enables_planes = null
			to_chat(usr, "Вы переключаете [ru_getcase(src, "acase")] в режим защиты от вспышек.")
		update_icon()
		user << activation_sound
		user.recalculate_vis()
		user.update_inv_glasses()
		user.update_action_buttons()

/obj/item/clothing/glasses/sunglasses/sechud/aviator/update_icon()
	if(on)
		icon_state = initial(icon_state)
	else
		icon_state = off_state

/obj/item/clothing/glasses/sunglasses/sechud/aviator/prescription
	name = "HUD-авиатор службы безопасности (близ.)"
	desc = "Модифицированные очки-авиаторы с режимами HUD и защиты от вспышек, а также набором линз для близоруких."
	prescription = 6

/obj/item/clothing/glasses/sunglasses/medhud
	name = "Солнцезащитный HUD"
	desc = "Солнцезащитный визор с медицинским HUD."
	icon_state = "sunMedHud"
	enables_planes = list(VIS_CH_STATUS,VIS_CH_HEALTH)

/obj/item/clothing/glasses/thermal
	name = "Тепловой визор"
	desc = "Тепловой сканер в формате очков."
	icon_state = "thermal"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")
	origin_tech = list(TECH_MAGNET = 3)
	toggleable = 1
	action_button_name = "Переключить Визор"
	vision_flags = SEE_MOBS
	enables_planes = list(VIS_FULLBRIGHT, VIS_CLOAKED)
	flash_protection = FLASH_PROTECTION_REDUCED

	emp_act(severity)
		if(istype(src.loc, /mob/living/carbon/human))
			var/mob/living/carbon/human/M = src.loc
			to_chat(M, "<font color='red'[capitalize(src.ncase)] [ru_g_obj(src, "перегружа", "ется", "ется", "ется", "ются"], ослепляя Вас!</font>")
			if(M.glasses == src)
				M.Blind(3)
				M.eye_blurry = 5
				// Don't cure being nearsighted
				if(!(M.disabilities & NEARSIGHTED))
					M.disabilities |= NEARSIGHTED
					spawn(100)
						M.disabilities &= ~NEARSIGHTED
		..()

/obj/item/clothing/glasses/thermal/New()
	..()
	overlay = global_hud.thermal

/obj/item/clothing/glasses/thermal/syndi	//These are now a traitor item, concealed as mesons.	-Pete
	name = "Мезонный сканер"
	desc = "Позволяет видеть стены, полы и объекты сквозь другие объекты."
	icon_state = "meson"
	item_state_slots = list(slot_r_hand_str = "meson", slot_l_hand_str = "meson")
	origin_tech = list(TECH_MAGNET = 3, TECH_ILLEGAL = 4)

/obj/item/clothing/glasses/thermal/plain
	toggleable = 0
	activation_sound = null
	action_button_name = null

/obj/item/clothing/glasses/thermal/plain/monocle
	name = "Термоноколь"
	desc = "Тепловой визор виде монокля."
	icon_state = "thermoncle"
	item_state_slots = list(slot_r_hand_str = "sunglasses", slot_l_hand_str = "sunglasses")
	toggleable = 1
	action_button_name = "Переключить Монокль"
	flags = null //doesn't protect eyes because it's a monocle, duh

	body_parts_covered = 0

/obj/item/clothing/glasses/thermal/plain/eyepatch
	name = "Повязка с тепловым визором"
	desc = "Повязка со встроенным оптическим тепловым сканером."
	icon_state = "eyepatch"
	item_state_slots = list(slot_r_hand_str = "blindfold", slot_l_hand_str = "blindfold")
	body_parts_covered = 0
	toggleable = 1
	action_button_name = "Переключить Повязку"

/obj/item/clothing/glasses/thermal/plain/jensen
	name = "Имплантанты с тепловым визором"
	desc = "Набор вживляемых линз, предназначенных для расширения зрения."
	icon_state = "thermalimplants"
	item_state_slots = list(slot_r_hand_str = "sunglasses", slot_l_hand_str = "sunglasses")

/obj/item/clothing/glasses/aerogelgoggles
	name = "Оранжевые очки"
	desc = "Легковесные очки, предназначенные для тешари."
	icon_state = "orange-g"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")
	action_button_name = "Настроить Оранжевые Очки"
	var/up = 0
	item_flags = AIRTIGHT
	body_parts_covered = EYES
	species_restricted = list(SPECIES_TESHARI)

/obj/item/clothing/glasses/aerogelgoggles/attack_self()
	toggle()

/obj/item/clothing/glasses/aerogelgoggles/verb/toggle()
	set category = "Объект"
	set name = "Настроить Оранжевые Очки"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			flags_inv |= HIDEEYES
			body_parts_covered |= EYES
			icon_state = initial(icon_state)
			to_chat(usr, "Вы опускаете [ru_getcase(src, "acase")], чтобы защитить свои глаза.")
		else
			src.up = !src.up
			flags_inv &= ~HIDEEYES
			body_parts_covered &= ~EYES
			icon_state = "[initial(icon_state)]up"
			to_chat(usr, "Вы приподнимаете [ru_getcase(src, "acase")] со своих глаз.")
		update_clothing_icon()
		usr.update_action_buttons()
