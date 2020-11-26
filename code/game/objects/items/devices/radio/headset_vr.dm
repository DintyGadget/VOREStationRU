/obj/item/device/radio/headset/centcom
	name = "Гарнитура ЦК"
	desc = "Гарнитура босса Вашего босса."
	icon_state = "cent_headset"
	item_state = "headset"
	centComm = 1
	ks2type = /obj/item/device/encryptionkey/ert

/obj/item/device/radio/headset/centcom/alt
	name = "Наушник ЦК"
	icon_state = "com_headset_alt"

/obj/item/device/radio/headset/nanotrasen
	name = "Гарнитура NT"
	desc = "Гарнитура представителя NanoTrasen."
	icon_state = "nt_headset"
	centComm = 1
	ks2type = /obj/item/device/encryptionkey/ert

/obj/item/device/radio/headset/nanotrasen/alt
	name = "Наушник NT"
	icon_state = "nt_headset_alt"

/obj/item/device/radio/headset
	sprite_sheets = list(SPECIES_TESHARI = 'icons/mob/species/seromi/ears.dmi',
						SPECIES_WEREBEAST = 'icons/mob/species/werebeast/ears.dmi')

/obj/item/device/radio/headset/mob_headset	//Adminbus headset for simplemob shenanigans.
	name = "Нечеловеческий радио-приёмник"
	desc = "Обновлённый клейкий модулярный интерком, который не требует ни рук, ни ушей -- достаточно просто прилепить. Поддерживает ключи шифрования."

/obj/item/device/radio/headset/mob_headset/receive_range(freq, level)
	if(ismob(src.loc))
		return ..(freq, level, 1)
	return -1

/obj/item/device/radio/headset/mob_headset/afterattack(var/atom/movable/target, mob/living/user, proximity)
	if(!proximity)
		return
	if(istype(target,/mob/living/simple_mob))
		var/mob/living/simple_mob/M = target
		if(!M.mob_radio)
			user.drop_item()
			forceMove(M)
			M.mob_radio = src
			return
		if(M.mob_radio)
			M.mob_radio.forceMove(M.loc)
			M.mob_radio = null
			return
	..()

/obj/item/device/radio/headset/headset_cargo
	desc = "Гарнитура, используемая рабами Квартирмейстера."

/obj/item/device/radio/headset/headset_cargo/alt
	desc = "Гарнитура, используемая рабами Квартирмейстера."

/obj/item/device/radio/headset/headset_qm
	name = "Гарнитура Квартирмейстера"
	desc = "Гарнитура, используемая Квартирмейстером."
	icon_state = "cargo_headset"
	ks2type = /obj/item/device/encryptionkey/qm

/obj/item/device/radio/headset/headset_qm/alt
	name = "Наушник Квартирмейстера"
	desc = "Гарнитура, используемая Квартирмейстером."
	icon_state = "cargo_headset_alt"

/obj/item/device/radio/headset/pathfinder
	name = "Гарнитура Первопроходца"
	desc = "Гарнитура, используемая Первопроходцами. Имеет доступ к каналам экспедиции и Управления."
	icon_state = "exp_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/device/encryptionkey/pathfinder

/obj/item/device/radio/headset/pathfinder/alt
	name = "Наушник Первопроходца"
	desc = "Гарнитура, используемая Первопроходцами. Имеет доступ к каналам экспедиции и Управления."
	icon_state = "exp_headset_alt"

/obj/item/device/radio/headset/pilot
	name = "Гарнитура пилота"
	desc = "Гарнитура, используемая пилотами. Имеет доступ к экспедиционному каналу."
	icon_state = "pilot_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/device/encryptionkey/pilot

/obj/item/device/radio/headset/pilot/alt
	name = "Наушник пилота"
	desc = "Гарнитура, используемая пилотами. Имеет доступ к экспедиционному каналу."
	icon_state = "pilot_headset_alt"

/obj/item/device/radio/headset/explorer
	name = "Гарнитура искателя"
	desc = "Гарнитура, используемая искателями. Имеет доступ к экспедиционному каналу."
	icon_state = "exp_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/device/encryptionkey/explorer

/obj/item/device/radio/headset/explorer/alt
	name = "Наушник искателя"
	desc = "Гарнитура, используемая искателями. Имеет доступ к экспедиционному каналу."
	icon_state = "exp_headset_alt"

/obj/item/device/radio/headset/sar
	name = "Гарнитура военврача"
	desc = "Гарнитура для полевых врачей."
	icon_state = "sar_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/device/encryptionkey/sar

/obj/item/device/radio/headset/sar/alt
	name = "Наушник военврача"
	desc = "Гарнитура для полевых врачей."
	icon_state = "sar_headset_alt"

/obj/item/device/radio/headset/volunteer
	name = "Гарнитура волонтёра"
	desc = "Гарнитура, используемая волонтёрами в экспедициях. Имеет доступ к экспедиционному каналу."
	icon_state = "pilot_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/device/encryptionkey/pilot

/obj/item/device/radio/headset/talon
	name = "Гарнитура Когтя"
	desc = "Гарнитура для сообщения между экипажем фрегата Коготь."
	adhoc_fallback = TRUE
	icon_state = "pilot_headset"
	ks2type = /obj/item/device/encryptionkey/talon
