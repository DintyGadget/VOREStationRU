/mob/living/verb/customsay()
	set category = "IC"
	set name = "Собственные Глаголы Речи"
	set desc = "Редактировать Ваши глаголы в чате, например 'говорит', 'спрашивает' и т.д."

	if(src.client)
		var/customsaylist[] = list(
				"Обычная речь",
				"Шёпот",
				"Вопрос (?)",
				"Восклицание (!)",
				"Отмена"
			)
		var/sayselect = input("Which say-verb do you wish to customise?") as null|anything in customsaylist //we can't use alert() for this because there's too many terms

		if(sayselect == "Обычная речь")
			custom_say =  sanitize(input(usr, "Это слово будет показываться вместо 'говорит': [src] говорит, \"Привет.\"", "Собственный глагол речи", null)  as text)
		else if(sayselect == "Шёпот")
			custom_whisper =  sanitize(input(usr, "Это слово будет показываться вместо 'шепчет': [src] шепчет, \"Привет...\"", "Собственный глагол шёпота", null)  as text)
		else if(sayselect == "Вопрос (?)")
			custom_ask =  sanitize(input(usr, "Это слово будет показываться вместо 'спрашивает': [src] спрашивает, \"Привет?\"", "Собственный глагол вопроса", null)  as text)
		else if(sayselect == "Восклицание (!)")
			custom_exclaim =  sanitize(input(usr, "Это слово будет показываться вместо 'кричит': [src] кричит, \"Привет!\"", "Собственный глагол восклицания", null)  as text)
		else
			return

/mob/living/proc/toggle_rider_reins()
	set name = "Передать Управление"
	set category = "Способности"
	set desc = "Позволить людям, катающимся на Вас, управлять Вашим передвижением."

	if(riding_datum)
		if(istype(riding_datum,/datum/riding))
			if(riding_datum.keytype)
				riding_datum.keytype = null
				to_chat(src, "Управление ездоком включено.")
				return
			else
				riding_datum.keytype = /obj/item/weapon/material/twohanded/fluff/riding_crop
				to_chat(src, "Управление ездоком отключено.")
				return
	return

/mob/living/verb/set_metainfo()
	set name = "Установить Метаинфо ООС"
	set desc = "Установить ООС заметки о Вас, а также Ваших предпочтениях в РП."
	set category = "OOC"

	var/new_metadata = sanitize(input(usr, "Введите любую информацию, которую Вы хотите показать другим, такую как предпочтения в РП. Они будут сохранены ТОЛЬКО на этот раунд.", "Игровые Предпочтения" , html_decode(ooc_notes)) as message, extra = 0)
	if(new_metadata && CanUseTopic(usr))
		ooc_notes = new_metadata
		to_chat(usr, "Заметки ООС обновлены.")
		log_admin("[key_name(usr)] обновляет Заметки ООС в течение раунда.")
