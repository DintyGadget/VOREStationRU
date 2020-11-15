/obj/item/device/text_to_speech
	name = "преобразователь текста в речь"
	desc = "Прибор, озвучивающий введенное сообщение. Выдается персоналу с трудностями речи, а также полностью немым."
	icon = 'icons/obj/integrated_electronics/electronic_setups.dmi'
	icon_state = "setup_small"
	w_class = ITEMSIZE_SMALL
	var/named

/obj/item/device/text_to_speech/attack_self(mob/user as mob)
	if(user.incapacitated(INCAPACITATION_ALL)) //Are you in a state to actual use the device?
		to_chat(user, "Вы не можете использовать преобразователь текста в таком состоянии.")
		return

	if(!named)
		to_chat(user, "Вы вводите своё имя в преобразователь текста.")
		name = "[initial(name)] ([user.real_name])"
		desc = "[initial(desc)] Этот прибор принадлежит [user.real_name]."
		named = 1
		/* //Another way of naming the device. Gives more freedom, but could lead to issues.
		device_name = copytext_char(sanitize(input(user, "What would you like to name your device? You must input a name before the device can be used.", "Name your device", "") as null|text),1,MAX_NAME_LEN)
		name = "[initial(name)] - [device_name]"
		named = 1
		*/

	var/message = sanitize(input(user,"Введите озвучиваемый текст.") as text|null)
	if(message)
		var/obj/item/device/text_to_speech/O = src
		audible_message("[bicon(O)] [O.name] диктует, \"[message]\"")
