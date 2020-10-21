/obj/item/clothing/glasses/omnihud
	name = "AR-очки"
	desc = "Очки AR модели ARG-62, отображающие информацию о других. \
	Нередко используются персоналом для взаимодействия с виртуальными интерфейсами. \
	<br>Обладают переключаемыми декоративными электрохромными линзами. \
	Линзы не защищают от ярких вспышек или при сварке."
	origin_tech = list(TECH_MAGNET = 3, TECH_BIO = 3)
	var/obj/item/clothing/glasses/hud/omni/hud = null
	var/mode = "civ"
	icon_state = "glasses"
	var/datum/tgui_module/tgarscreen
	var/tgarscreen_path
	var/flash_prot = 0 //0 for none, 1 for flash weapon protection, 2 for welder protection
	enables_planes = list(VIS_CH_ID,VIS_CH_HEALTH_VR,VIS_AUGMENTED)
	plane_slots = list(slot_glasses)

/obj/item/clothing/glasses/omnihud/New()
	..()
	if(tgarscreen_path)
		tgarscreen = new tgarscreen_path(src)

/obj/item/clothing/glasses/omnihud/Destroy()
	QDEL_NULL(tgarscreen)
	. = ..()

/obj/item/clothing/glasses/omnihud/dropped()
	if(tgarscreen)
		SStgui.close_uis(src)
	..()

/obj/item/clothing/glasses/omnihud/emp_act(var/severity)
	if(tgarscreen)
		SStgui.close_uis(src)
	var/disconnect_tgar = tgarscreen
	tgarscreen = null
	spawn(20 SECONDS)
		tgarscreen = disconnect_tgar

	//extra fun for non-sci variants; a small chance flip the state to the dumb 3d glasses when EMP'd
	if(icon_state == "glasses" || icon_state == "sun")
		if(prob(10))
			icon_state = "3d"
			if(ishuman(loc))
				to_chat(loc, "<span class='warning'>[src.name] дают сбой!</span>")
	..()

/obj/item/clothing/glasses/omnihud/proc/flashed()
	if(flash_prot && ishuman(loc))
		to_chat(loc, "<span class='warning'>Ваши [src.name] затемняются, чтобы защитить Вас от вспышки!</span>")

/obj/item/clothing/glasses/omnihud/prescribe(var/mob/user)
	prescription = !prescription
	playsound(src,'sound/items/screwdriver.ogg', 50, 1)
	if(prescription)
		user.visible_message("[user] загружает новый рецепт в [src.name] и перенастраивает линзы.")
		name = "[initial(name)] (близ.)" //change the name *after* the text so the message above is accurate
		icon_state = "[initial(icon_state)]" //reset the icon state just to be safe
	else
		user.visible_message("[user] берёт в руки [src.name] и перенастраивает линзы, удаляя старый рецепт.")
		name = "[initial(name)]"
		icon_state = "[initial(icon_state)]"

/obj/item/clothing/glasses/omnihud/attack_self(mob/user)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	if(!H.glasses || !(H.glasses == src))
		to_chat(user, "<span class='warning'>Нам нужно носить [src] на себе, чтобы увидеть дисплей.</span>")
	else
		if(!ar_interact(H))
			to_chat(user, "<span class='warning'>[src] не имеет никаких особых дисплеев.</span>")

//cosmetic shading, doesn't enhance eye protection
/obj/item/clothing/glasses/omnihud/verb/chromatize()
	set name = "Переключить Затенение AR-очков"
	set desc = "Переключает косметическое затенение AR-очков."
	set category = "Object"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(icon_state == "3d")
		to_chat(usr, "Вы переключаете электрохромные линзы в нормальный режим.")
		if(prescription)
			name = "[initial(name)] (pr)"
		else
			name = "[initial(name)]"
		icon_state = "[initial(icon_state)]"
	else if(prescription)
		if(icon_state == "glasses")
			to_chat(usr, "Вы переключаете электрохромные линзы в режим односторонней прозрачности.")
			name = "[initial(name)] (затененные, близ.)"
			icon_state = "sun"
		else if(icon_state == "sun")
			to_chat(usr, "Вы переключаете электрохромные линзы в стандартный режим двухсторонней прозрачности.")
			name = "[initial(name)] (близ.)"
			icon_state = "glasses"
		else
			to_chat(usr, "The [src] don't seem to support this functionality.")
	else if(!prescription)
		if(icon_state == "glasses")
			to_chat(usr, "Вы переключаете электрохромные линзы в режим односторонней прозрачности.")
			name = "[initial(name)] (затененные)"
			icon_state = "sun"
		else if(icon_state == "sun")
			to_chat(usr, "Вы переключаете электрохромные линзы в стандартный режим двухсторонней прозрачности.")
			name = "[initial(name)]"
			icon_state = "glasses"
		else
			to_chat(usr, "[src] не обладают такой функцией.")
	update_clothing_icon()

/obj/item/clothing/glasses/omnihud/proc/ar_interact(var/mob/living/carbon/human/user)
	return 0 //The base models do nothing.

/obj/item/clothing/glasses/omnihud/prescription
	name = "AR-очки (близ.)"
	prescription = 1

/obj/item/clothing/glasses/omnihud/med
	name = "AR-M очки"
	desc = "Очки AR модели ARG-62, отображающие информацию о других. \
	В эти встроен доступ к медицинским записям и базе данных о вирусах. \
	Они также отображают активные датчики, используя систему отслеживания персонала."
	mode = "med"
	action_button_name = "AR-консоль (Отслеживание Персонала)"
	tgarscreen_path = /datum/tgui_module/crew_monitor/glasses
	enables_planes = list(VIS_CH_ID,VIS_CH_HEALTH_VR,VIS_CH_STATUS_R,VIS_CH_BACKUP,VIS_AUGMENTED)

	ar_interact(var/mob/living/carbon/human/user)
		if(tgarscreen)
			tgarscreen.tgui_interact(user)
		return 1

/obj/item/clothing/glasses/omnihud/sec
	name = "AR-S очки"
	desc = "Очки AR модели ARG-62, отображающие информацию о других. \
	В эти встроен доступ к записям службы безопасности и защита от вспышек. \
	Они также имеют доступ к тревогам камер и датчиков движения."
	mode = "sec"
	flash_protection = FLASH_PROTECTION_MODERATE //weld protection is a little too widespread
	action_button_name = "AR-консоль (Сигнализация СБ)"
	tgarscreen_path = /datum/tgui_module/alarm_monitor/security/glasses
	enables_planes = list(VIS_CH_ID,VIS_CH_HEALTH_VR,VIS_CH_WANTED,VIS_AUGMENTED)

	ar_interact(var/mob/living/carbon/human/user)
		if(tgarscreen)
			tgarscreen.tgui_interact(user)
		return 1

/obj/item/clothing/glasses/omnihud/eng
	name = "AR-E очки"
	desc = "Очки AR модели ARG-62, отображающие информацию о других. \
	В эти встроены улучшенные электрохромные линзы для защиты глаз при сварке, \
	а также отображение атмосферных и пожарных тревог и сбоев питания."
	mode = "eng"
	flash_protection = FLASH_PROTECTION_MAJOR
	action_button_name = "AR-консоль (Тревоги По Станции)"
	tgarscreen_path = /datum/tgui_module/alarm_monitor/engineering/glasses

	ar_interact(var/mob/living/carbon/human/user)
		if(tgarscreen)
			tgarscreen.tgui_interact(user)
		return 1

/obj/item/clothing/glasses/omnihud/rnd
	name = "AR-R очки"
	desc = "Очки AR модели ARG-62, отображающие информацию о других. \
	Они... вроде ничего особо интересного не делают? Зато выглядят по-научному как-то, тоже неплохо."
	mode = "sci"

/obj/item/clothing/glasses/omnihud/eng/meson
	name = "HUD с мезонным сканером"
	desc = "Гарнитура со встроенным в линзы сканером и ретинальным проектором. Не защищает глаза, однако более удобная, чем защитные очки."
	icon = 'icons/vore/custom_items_vr.dmi'
	icon_override = 'icons/vore/custom_clothes_vr.dmi'
	icon_state = "projector"
	off_state = "projector-off"
	body_parts_covered = 0
	toggleable = 1
	vision_flags = SEE_TURFS //but they can spot breaches. Due to the way HUDs work, they don't provide darkvision up-close the way mesons do.
	flash_protection = 0 //it's an open, single-eye retinal projector. there's no way it protects your eyes from flashes or welders.

/obj/item/clothing/glasses/omnihud/eng/meson/attack_self(mob/user)
	if(!active)
		toggleprojector()
	..()

/obj/item/clothing/glasses/omnihud/eng/meson/verb/toggleprojector()
	set name = "Переключить Проектор"
	set category = "Object"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.stat) return
	if(toggleable)
		if(active)
			active = 0
			icon_state = off_state
			item_state = "[initial(item_state)]-off"
			usr.update_inv_glasses()
			to_chat(usr, "Вы деактивируете ретинальный проектор.")
		else
			active = 1
			icon_state = initial(icon_state)
			item_state = initial(item_state)
			usr.update_inv_glasses()
			to_chat(usr, "Вы активируете ретинальный проектор.")
		usr.update_action_buttons()

/obj/item/clothing/glasses/omnihud/all
	name = "AR-B очки"
	desc = "Очки AR модели ARG-62, отображающие информацию о других. \
	В эти встроен (почти) весь функционал предшествующих моделей. Уже интересно. \
	<br>Предоставляет полную защиту от вспышек/сварки и полный доступ к системе тревог."
	mode = "best"
	flash_protection = FLASH_PROTECTION_MAJOR
	enables_planes = list(VIS_CH_ID,VIS_CH_HEALTH_VR,VIS_CH_STATUS_R,VIS_CH_BACKUP,VIS_CH_WANTED)
	action_button_name = "AR-консоль (Все Тревоги)"
	tgarscreen_path = /datum/tgui_module/alarm_monitor/all/glasses

	ar_interact(var/mob/living/carbon/human/user)
		if(tgarscreen)
			tgarscreen.tgui_interact(user)
		return 1

/obj/item/clothing/glasses/hud/security/eyepatch
    name = "HUD-повязка службы безопасности"
    desc = "Повязка на глаз со встроенным сканером людей в поле зрения, предоставляющая информацию об их идентификации и записях Службы Безопасности."
    icon_state = "eyepatch"
    item_state_slots = list(slot_r_hand_str = "blindfold", slot_l_hand_str = "blindfold")
    body_parts_covered = 0
    enables_planes = list(VIS_CH_ID,VIS_CH_WANTED,VIS_CH_IMPTRACK,VIS_CH_IMPLOYAL,VIS_CH_IMPCHEM)
    var/eye = null

/obj/item/clothing/glasses/hud/security/eyepatch/verb/switcheye()
	set name = "Сменить Повязку"
	set category = "Object"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.stat) return

	eye = !eye
	if(eye)
		icon_state = "[icon_state]_1"
	else
		icon_state = initial(icon_state)
	update_clothing_icon()


/obj/item/clothing/glasses/hud/health/eyepatch
    name = "медицинская HUD-повязка"
    desc = "Повязка на глаз со встроенным сканером людей в поле зрения, предоставляющая информацию об их состоянии здоровья."
    icon_state = "eyepatch"
    item_state_slots = list(slot_r_hand_str = "blindfold", slot_l_hand_str = "blindfold")
    body_parts_covered = 0
    enables_planes =  list(VIS_CH_STATUS,VIS_CH_HEALTH)
    var/eye = null

/obj/item/clothing/glasses/hud/health/eyepatch/verb/switcheye()
	set name = "Сменить Повязку"
	set category = "Object"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.stat) return

	eye = !eye
	if(eye)
		icon_state = "[icon_state]_1"
	else
		icon_state = initial(icon_state)
	update_clothing_icon()