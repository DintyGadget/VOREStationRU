/obj/item/voice_changer
	name = "модулятор голоса"
	desc = "Модуль искажения голоса. Если Вы это видите, это баг, о котором стоит доложить."
	var/voice = null //If set and item is present in mask/suit, this name will be used for the wearer's speech.
	var/active = TRUE

/obj/item/clothing/mask/gas/voice
	name = "газовая маска"
	desc = "Закрывающая лицо маска, которую можно подсоединить к источнику воздуха. Внутри, кажется, какая-то странная электроника."
	var/obj/item/voice_changer/changer
	origin_tech = list(TECH_ILLEGAL = 4)

/obj/item/clothing/mask/gas/voice/verb/Toggle_Voice_Changer()
	set category = "Объект"
	set src in usr

	changer.active = !changer.active
	to_chat(usr, "<span class='notice'>Вы [changer.active ? "включаете" : "отключаете"] искажатель голоса.</span>")

/obj/item/clothing/mask/gas/voice/verb/Set_Voice(name as text)
	set category = "Объект"
	set src in usr

	var/voice = sanitize(name, MAX_NAME_LEN)
	if(!voice || !length(voice)) return
	changer.voice = voice
	to_chat(usr, "<span class='notice'>Вы теперь копируете голос <B>[changer.voice]</B>.</span>")

/obj/item/clothing/mask/gas/voice/verb/Reset_Voice()
	set category = "Объект"
	set src in usr

	changer.voice = null
	to_chat(usr, "<span class='notice'>Вы сбрасываете настройку модулятора голоса.</span>")

/obj/item/clothing/mask/gas/voice/New()
	..()
	changer = new(src)
