/obj/item/device/radio/headset
	name = "Гарнитура"
	desc = "Обновлённый, модулярный интерком, надеваемый на голову. Поддерживает ключи шифрования."
	var/radio_desc = ""
	icon_state = "headset"
	item_state = null //To remove the radio's state
	matter = list(DEFAULT_WALL_MATERIAL = 75)
	subspace_transmission = 1
	canhear_range = 0 // can't hear headsets from very far away
	slot_flags = SLOT_EARS
	sprite_sheets = list(SPECIES_TESHARI = 'icons/mob/species/seromi/ears.dmi')

	var/translate_binary = 0
	var/translate_hive = 0
	var/obj/item/device/encryptionkey/keyslot1 = null
	var/obj/item/device/encryptionkey/keyslot2 = null
	var/ks1type = null
	var/ks2type = null

	drop_sound = 'sound/items/drop/component.ogg'
	pickup_sound = 'sound/items/pickup/component.ogg'

/obj/item/device/radio/headset/New()
	..()
	internal_channels.Cut()
	if(ks1type)
		keyslot1 = new ks1type(src)
	if(ks2type)
		keyslot2 = new ks2type(src)
	recalculateChannels(1)

/obj/item/device/radio/headset/Destroy()
	qdel(keyslot1)
	qdel(keyslot2)
	keyslot1 = null
	keyslot2 = null
	return ..()

/obj/item/device/radio/headset/list_channels(var/mob/user)
	return list_secure_channels()

/obj/item/device/radio/headset/examine(mob/user)
	. = ..()

	if(radio_desc && Adjacent(user))
		. += "Доступны следующие каналы:"
		. += radio_desc

/obj/item/device/radio/headset/handle_message_mode(mob/living/M as mob, list/message_pieces, channel)
	if(channel == "special")
		if(translate_binary)
			var/datum/language/binary = GLOB.all_languages["Роботический"]
			binary.broadcast(M, M.strip_prefixes(multilingual_to_message(message_pieces)))
			return RADIO_CONNECTION_NON_SUBSPACE
		if(translate_hive)
			var/datum/language/hivemind = GLOB.all_languages["Коллективный Разум"]
			hivemind.broadcast(M, M.strip_prefixes(multilingual_to_message(message_pieces)))
			return RADIO_CONNECTION_NON_SUBSPACE
		return RADIO_CONNECTION_FAIL

	return ..()

/obj/item/device/radio/headset/receive_range(freq, level, aiOverride = 0)
	if (aiOverride)
		return ..(freq, level)
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		if(H.l_ear == src || H.r_ear == src)
			return ..(freq, level)
	return -1

/obj/item/device/radio/headset/get_worn_icon_state(var/slot_name)
	var/append = ""
	if(icon_override)
		switch(slot_name)
			if(slot_l_ear_str)
				append = "_l"
			if(slot_r_ear_str)
				append = "_r"

	return "[..()][append]"

/obj/item/device/radio/headset/tgui_state(mob/user)
	return GLOB.tgui_inventory_state

/obj/item/device/radio/headset/syndicate
	origin_tech = list(TECH_ILLEGAL = 3)
	syndie = 1
	ks1type = /obj/item/device/encryptionkey/syndicate

/obj/item/device/radio/headset/syndicate/alt
	icon_state = "syndie_headset"
	item_state = "headset"
	origin_tech = list(TECH_ILLEGAL = 3)
	syndie = 1
	ks1type = /obj/item/device/encryptionkey/syndicate

/obj/item/device/radio/headset/raider
	origin_tech = list(TECH_ILLEGAL = 2)
	syndie = 1
	ks1type = /obj/item/device/encryptionkey/raider

/obj/item/device/radio/headset/raider/Initialize()
	. = ..()
	set_frequency(RAID_FREQ)

/obj/item/device/radio/headset/binary
	origin_tech = list(TECH_ILLEGAL = 3)
	ks1type = /obj/item/device/encryptionkey/binary

/obj/item/device/radio/headset/headset_sec
	name = "Гарнитура службы безопасности"
	desc = "Используется элитными охранниками порядка."
	icon_state = "sec_headset"
	ks2type = /obj/item/device/encryptionkey/headset_sec

/obj/item/device/radio/headset/headset_sec/alt
	name = "Наушник службы безопасности"
	desc = "Используется элитными охранниками порядка."
	icon_state = "sec_headset_alt"
	ks2type = /obj/item/device/encryptionkey/headset_sec

/obj/item/device/radio/headset/headset_eng
	name = "Гарнитура инженерного отдела"
	desc = "Инженеры тоже любят сплетничать."
	icon_state = "eng_headset"
	ks2type = /obj/item/device/encryptionkey/headset_eng

/obj/item/device/radio/headset/headset_eng/alt
	name = "Наушник инженерного отдела"
	desc = "Инженеры тоже любят сплетничать."
	icon_state = "eng_headset_alt"
	ks2type = /obj/item/device/encryptionkey/headset_eng

/obj/item/device/radio/headset/headset_rob
	name = "Гарнитура робототехника"
	desc = "Специально для робототехников, которые не могут определиться со своим отделом."
	icon_state = "rob_headset"
	ks2type = /obj/item/device/encryptionkey/headset_rob

/obj/item/device/radio/headset/headset_med
	name = "Гарнитура медицинского отдела"
	desc = "Для работников медицинского отдела."
	icon_state = "med_headset"
	ks2type = /obj/item/device/encryptionkey/headset_med

/obj/item/device/radio/headset/headset_med/alt
	name = "Наушник медицинского отдела"
	desc = "Для работников медицинского отдела."
	icon_state = "med_headset_alt"
	ks2type = /obj/item/device/encryptionkey/headset_med

/obj/item/device/radio/headset/headset_sci
	name = "Гарнитура научного отдела"
	desc = "Гарнитура учёного. Ничего необычного."
	icon_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/headset_sci

/obj/item/device/radio/headset/headset_medsci
	name = "Гарнитура научно-медицинских отдела"
	desc = "Потому что кто-то никак не мог определиться между наукой и медициной."
	icon_state = "med_headset"
	ks2type = /obj/item/device/encryptionkey/headset_medsci

/obj/item/device/radio/headset/headset_com
	name = "Гарнитура Управления"
	desc = "Гарнитура с доступом в канал Управления."
	icon_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/headset_com

/obj/item/device/radio/headset/headset_com/alt
	name = "Наушник Управления"
	desc = "Гарнитура с доступом в канал Управления."
	icon_state = "com_headset_alt"
	ks2type = /obj/item/device/encryptionkey/headset_com


/obj/item/device/radio/headset/heads/captain
	name = "Гарнитура Директора колонии"
	desc = "Гарнитура босса."
	icon_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/captain

/obj/item/device/radio/headset/heads/captain/alt
	name = "Наушник Директора колонии"
	desc = "Гарнитура босса."
	icon_state = "com_headset_alt"
	ks2type = /obj/item/device/encryptionkey/heads/captain

/obj/item/device/radio/headset/heads/captain/sfr
	name = "Гарнитура БРС"
	desc = "Гарнитура, принадлежащая диджею Бесплатного Радио Сифа. БРС, лучшие треки необитываемых территорий."
	icon_state = "com_headset_alt"
	ks2type = /obj/item/device/encryptionkey/heads/captain

/obj/item/device/radio/headset/heads/ai_integrated //No need to care about icons, it should be hidden inside the AI anyway.
	name = "Субкосмический трансивер ИИ"
	desc = "Интегрированный трансивер радио для ИИ."
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "radio"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/heads/ai_integrated
	var/myAi = null    // Atlantis: Reference back to the AI which has this radio.
	var/disabledAi = 0 // Atlantis: Used to manually disable AI's integrated radio via intellicard menu.

/obj/item/device/radio/headset/heads/ai_integrated/receive_range(freq, level)
	if (disabledAi)
		return -1 //Transciever Disabled.
	return ..(freq, level, 1)

/obj/item/device/radio/headset/heads/rd
	name = "Гарнитура Директора исследований"
	desc = "Гарнитура бога науки."
	icon_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/rd

/obj/item/device/radio/headset/heads/rd/alt
	name = "Наушник Директора исследований"
	desc = "Гарнитура бога науки."
	icon_state = "com_headset_alt"
	ks2type = /obj/item/device/encryptionkey/heads/rd

/obj/item/device/radio/headset/heads/hos
	name = "Гарнитура Главы службы безопасности"
	desc = "Гарнитура того, кто защищает все ваши никчёмные жизни."
	icon_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/hos

/obj/item/device/radio/headset/heads/hos/alt
	name = "Наушник Главы службы безопасности"
	desc = "Гарнитура того, кто защищает все ваши никчёмные жизни."
	icon_state = "com_headset_alt"
	ks2type = /obj/item/device/encryptionkey/heads/hos

/obj/item/device/radio/headset/heads/ce
	name = "Гарнитура Главного инженера"
	desc = "Гарнитура того, кто отвечает за кучку идиотов."
	icon_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/ce

/obj/item/device/radio/headset/heads/ce/alt
	name = "Наушник Главного инженера"
	desc = "Гарнитура того, кто отвечает за кучку идиотов."
	icon_state = "com_headset_alt"
	ks2type = /obj/item/device/encryptionkey/heads/ce

/obj/item/device/radio/headset/heads/cmo
	name = "Гарнитура Главврача"
	desc = "Гарнитура опытного главного врача."
	icon_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/cmo

/obj/item/device/radio/headset/heads/cmo/alt
	name = "Наушник Главврача"
	desc = "Гарнитура опытного главного врача."
	icon_state = "com_headset_alt"
	ks2type = /obj/item/device/encryptionkey/heads/cmo

/obj/item/device/radio/headset/heads/hop
	name = "Гарнитура Главы персонала"
	desc = "Гарнитура того, кто однажды станет Директором колонии."
	icon_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/hop

/obj/item/device/radio/headset/heads/hop/alt
	name = "Наушник Главы персонала"
	desc = "Гарнитура того, кто однажды станет Директором колонии."
	icon_state = "com_headset_alt"
	ks2type = /obj/item/device/encryptionkey/heads/hop

/obj/item/device/radio/headset/headset_mine
	name = "Гарнитура шахтёра"
	desc = "Гарнитура, используемая шахтёрами. Имеет встроенное короткочастотное радио на случай отключения связи."
	icon_state = "mine_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/device/encryptionkey/headset_cargo

/obj/item/device/radio/headset/headset_cargo
	name = "Гарнитура отдела снабжения"
	desc = "Гарнитура, используемая Квартирмейстерами и их рабами."
	icon_state = "cargo_headset"
	ks2type = /obj/item/device/encryptionkey/headset_cargo

/obj/item/device/radio/headset/headset_cargo/alt
	name = "Наушник отдела снабжения"
	desc = "Гарнитура, используемая Квартирмейстерами и их рабами."
	icon_state = "cargo_headset_alt"
	ks2type = /obj/item/device/encryptionkey/headset_cargo

/obj/item/device/radio/headset/headset_service
	name = "Гарнитура обслуживающего персонала"
	desc = "Гарнитура, используемая обслуживающим персоналом, поддерживающем станцию в чистоте и хорошем настроении."
	icon_state = "srv_headset"
	ks2type = /obj/item/device/encryptionkey/headset_service

/obj/item/device/radio/headset/ert
	name = "Гарнитура группы экстренного реагирования"
	desc = "Гарнитура босса Вашего босса."
	icon_state = "com_headset"
	centComm = 1
//	freerange = 1
	ks2type = /obj/item/device/encryptionkey/ert

/obj/item/device/radio/headset/ert/alt
	name = "Наушник группы экстренного реагирования"
	desc = "Гарнитура босса Вашего босса."
	icon_state = "com_headset_alt"
//	freerange = 1
	ks2type = /obj/item/device/encryptionkey/ert

/obj/item/device/radio/headset/omni		//Only for the admin intercoms
	ks2type = /obj/item/device/encryptionkey/omni

/obj/item/device/radio/headset/ia
	name = "Гарнитура агента внутренних дел"
	desc = "Гарнитура Вашего самого заклятого врага."
	icon_state = "com_headset"
	ks2type = /obj/item/device/encryptionkey/heads/hos

/obj/item/device/radio/headset/mmi_radio
	name = "Вживлённая рация"
	desc = "Такие обычно имеются у ЧМИ и синтетиков."
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "radio"
	item_state = "headset"
	var/mmiowner = null
	var/radio_enabled = 1

/obj/item/device/radio/headset/mmi_radio/receive_range(freq, level)
	if (!radio_enabled || istype(src.loc.loc, /mob/living/silicon) || istype(src.loc.loc, /obj/item/organ/internal))
		return -1 //Transciever Disabled.
	return ..(freq, level, 1)

/obj/item/device/radio/headset/attackby(obj/item/weapon/W as obj, mob/user as mob)
//	..()
	user.set_machine(src)
	if(!(W.is_screwdriver() || istype(W, /obj/item/device/encryptionkey)))
		return

	if(W.is_screwdriver())
		if(keyslot1 || keyslot2)


			for(var/ch_name in channels)
				radio_controller.remove_object(src, radiochannels[ch_name])
				secure_radio_connections[ch_name] = null


			if(keyslot1)
				var/turf/T = get_turf(user)
				if(T)
					keyslot1.loc = T
					keyslot1 = null



			if(keyslot2)
				var/turf/T = get_turf(user)
				if(T)
					keyslot2.loc = T
					keyslot2 = null

			recalculateChannels()
			to_chat(user, "Вы достаёте ключ шифрования из гарнитуры!")
			playsound(src, W.usesound, 50, 1)

		else
			to_chat(user, "В этой гарнитуре нет ключей шифрования! И на кой она тогда вообще...")

	if(istype(W, /obj/item/device/encryptionkey/))
		if(keyslot1 && keyslot2)
			to_chat(user, "Сюда не вместится ещё один ключ!")
			return

		if(!keyslot1)
			user.drop_item()
			W.loc = src
			keyslot1 = W

		else
			user.drop_item()
			W.loc = src
			keyslot2 = W


		recalculateChannels()

	return


/obj/item/device/radio/headset/recalculateChannels(var/setDescription = 0)
	src.channels = list()
	src.translate_binary = 0
	src.translate_hive = 0
	src.syndie = 0

	if(keyslot1)
		for(var/ch_name in keyslot1.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] = keyslot1.channels[ch_name]

		if(keyslot1.translate_binary)
			src.translate_binary = 1

		if(keyslot1.translate_hive)
			src.translate_hive = 1

		if(keyslot1.syndie)
			src.syndie = 1

	if(keyslot2)
		for(var/ch_name in keyslot2.channels)
			if(ch_name in src.channels)
				continue
			src.channels += ch_name
			src.channels[ch_name] = keyslot2.channels[ch_name]

		if(keyslot2.translate_binary)
			src.translate_binary = 1

		if(keyslot2.translate_hive)
			src.translate_hive = 1

		if(keyslot2.syndie)
			src.syndie = 1


	for (var/ch_name in channels)
		if(!radio_controller)
			sleep(30) // Waiting for the radio_controller to be created.
		if(!radio_controller)
			src.name = "Сломанная гарнитура"
			src.rugender = "female"
			src.ncase = "сломанная гарнитура"
			src.gcase = "сломанной гарнитуры"
			src.dcase = "сломанной гарнитуре"
			src.acase = "сломанную гарнитуру"
			src.icase = "сломанной гарнитурой"
			src.pcase = "сломанной гарнитуре"
			return

		secure_radio_connections[ch_name] = radio_controller.add_object(src, radiochannels[ch_name],  RADIO_CHAT)

	if(setDescription)
		setupRadioDescription()

	return

/obj/item/device/radio/headset/proc/setupRadioDescription()
	var/radio_text = ""
	for(var/i = 1 to channels.len)
		var/channel = channels[i]
		var/key = get_radio_key_from_channel(channel)
		radio_text += "[key] - [channel]"
		if(i != channels.len)
			radio_text += ", "

	radio_desc = radio_text
