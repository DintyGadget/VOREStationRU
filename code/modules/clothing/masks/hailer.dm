/obj/item/clothing/mask/gas/sechailer
	name = "Маска с громкоговорителем"
	desc = "Компактный и прочный противогаз, который можно подсоединить к системе подачи воздуха. В эту маску встроен громкоговоритель службы безопасности."
	description_info = "Громкоговоритель в этой маске можно активировать кнопкой или глаголом СТОЯТЬ!, а для переключения фраз можно альт-кликнуть или нажать соответствующий глагол."
	icon_state = "halfgas"
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 0, bomb = 0, bio = 55, rad = 0)
	action_button_name = "СТОЯТЬ!"
	body_parts_covered = FACE
	var/obj/item/device/hailer/hailer
	var/cooldown = 0
	var/phrase = 1
	var/aggressiveness = 1
	var/safety = 1
	var/list/phrase_list = list(
		"halt" 			= "СТОЯТ! СТОЯТЬ! СТОЯТЬ! СТОЯТЬ!",
		"bobby" 		= "Остановись во имя закона.",
		"compliance" 	= "Послушание в твоих же интересах.",
		"justice"		= "Справедливость должна быть восстановлена!",
		"running"		= "Сопротивление лишь увеличит твой срок.",
		"dontmove"		= "Эй, ты! Ни с места!",
		"floor"			= "Живо на пол!",
		"robocop"		= "Ты идёшь со мной, живым или мёртвым.",
		"god"			= "Бог создал сегодняшний день для поимки тех, кого не поймали вчера.",
		"freeze"		= "Не двигайся, тварь!",
		"imperial"		= "Ни с места, преступное отродье!",
		"bash"			= "Остановись, пока тебе не вдарил.",
		"harry"			= "Ну давай, удиви меня.",
		"asshole"		= "Хватит нарушать закон, скотина.",
		"stfu"			= "У тебя есть право завалить ебальник.",
		"shutup"		= "Молчать, преступник!",
		"super"			= "Познай ярость золотой молнии.",
		"dredd"			= "Я есть ЗАКОН!"
		)

/obj/item/clothing/mask/gas/sechailer/swat/hos
	name = "Маска СОБР Главы службы безопасности"
	desc = "Плотно прилегающая тактическая маска с на удивление агрессивным Утихомиривателем 3000. На ней бежевая полоса."
	icon_state = "hosmask"


/obj/item/clothing/mask/gas/sechailer/swat/warden
	name = "Маска СОБР Надзирателя"
	desc = "Плотно прилегающая тактическая маска с на удивление агрессивным Утихомиривателем 3000. На ней голубая полоса."
	icon_state = "wardenmask"

/obj/item/clothing/mask/gas/sechailer/swat
	name = "Маска СОБР"
	desc = "Плотно прилегающая тактическая маска с на удивление агрессивным Утихомиривателем 3000."
	icon_state = "officermask"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = HIDEFACE|BLOCKHAIR
	aggressiveness = 3
	phrase = 12


/obj/item/clothing/mask/gas/sechailer/ui_action_click()
	halt()

/obj/item/clothing/mask/gas/sechailer/AltClick(mob/user)
	selectphrase()

/obj/item/clothing/mask/gas/sechailer/verb/selectphrase()
	set name = "Выбрать Фразу Маски"
	set category = "Объект"
	set desc = "Изменить сообщение, воспроизводимое Утихомиривателем Вашей тактической маски."

	var/key = phrase_list[phrase]
	var/message = phrase_list[key]

	if (!safety)
		to_chat(usr, "<span class='notice'>Вы установили ограничитель на: ЕШЬ ГОВНО СУКА МУДИЛА КУСОК ЕБАНЫЙ КАК ТАКИХ ВЫБЛЯДКОВ ТОЛЬКО ЗЕМЛЯ НОСИТ Я ПРОСТО ХУЕЮ ЧЕСТНО ЭТО ПРОСТО ЕБАНЫЙ ПИЗДЕЦ БЛЯДЬ НАХУЙ СУКА БЛЯДЬ.</span>")
		return
	switch(aggressiveness)
		if(1)
			phrase = (phrase < 6) ? (phrase + 1) : 1
			key = phrase_list[phrase]
			message = phrase_list[key]
			to_chat(usr,"<span class='notice'>Вы установили ограничитель на: [message]</span>")
		if(2)
			phrase = (phrase < 11 && phrase >= 7) ? (phrase + 1) : 7
			key = phrase_list[phrase]
			message = phrase_list[key]
			to_chat(usr,"<span class='notice'>Вы установили ограничитель на: [message]</span>")
		if(3)
			phrase = (phrase < 18 && phrase >= 12 ) ? (phrase + 1) : 12
			key = phrase_list[phrase]
			message = phrase_list[key]
			to_chat(usr,"<span class='notice'>Вы установили ограничитель на: [message]</span>")
		if(4)
			phrase = (phrase < 18 && phrase >= 1 ) ? (phrase + 1) : 1
			key = phrase_list[phrase]
			message = phrase_list[key]
			to_chat(usr,"<span class='notice'>Вы установили ограничитель на: [message]</span>")
		else
			to_chat(usr, "<span class='notice'>Он сломан.</span>")

/obj/item/clothing/mask/gas/sechailer/emag_act(mob/user)
	if(safety)
		safety = 0
		to_chat(user, "<span class='warning'>Вы тихонечко замыкаете голосую микросхему [ru_getcase(src, "gcase")] при помощи криптографического секвенсера.</span>")
	else
		return

/obj/item/clothing/mask/gas/sechailer/attackby(obj/item/I, mob/user)
	if(I.is_screwdriver())
		switch(aggressiveness)
			if(1)
				to_chat(user, "<span class='notice'>Вы устанавливаете ограничитель агрессии на вторую позицию.</span>")
				aggressiveness = 2
				phrase = 7
			if(2)
				to_chat(user, "<span class='notice'>Вы устанавливаете ограничитель агрессии на третью позицию.</span>")
				aggressiveness = 3
				phrase = 13
			if(3)
				to_chat(user, "<span class='notice'>Вы устанавливаете ограничитель агрессии на четвёртую позицию.</span>")
				aggressiveness = 4
				phrase = 1
			if(4)
				to_chat(user, "<span class='notice'>Вы устанавливаете ограничитель агрессии на первую позицию.</span>")
				aggressiveness = 1
				phrase = 1
			if(5)
				to_chat(user, "<span class='warning'>Вы переключаете ограничитель, но ничего не происходит. Возможно, он сломан?</span>")
	if(I.is_wirecutter())
		if(aggressiveness != 5)
			to_chat(user, "<span class='warning'>Вы сломали ограничитель!</span>")
			aggressiveness = 5
	if(I.is_crowbar())
		if(!hailer)
			to_chat(user, "<span class='warning'>В этой маске встроенный громкоговоритель, его нельзя убрать!</span>")
		else
			var/obj/N = new /obj/item/clothing/mask/gas/half(src.loc)
			playsound(src, 'sound/items/Screwdriver.ogg', 50, 1)
			N.fingerprints = src.fingerprints
			N.fingerprintshidden = src.fingerprintshidden
			N.fingerprintslast = src.fingerprintslast
			N.suit_fibers = src.suit_fibers
			if(!isturf(N.loc))
				user.put_in_hands(hailer)
				user.put_in_hands(N)
			else
				hailer.loc = N.loc
			qdel(src)
			return
	..()

/obj/item/clothing/mask/gas/sechailer/verb/halt()
	set name = "СТОЯТЬ!"
	set category = "Объект"
	set desc = "Активировать громкоговоритель на маске."
	var/key = phrase_list[phrase]
	var/message = phrase_list[key]

	if(cooldown < world.time - 35) // A cooldown, to stop people being jerks
		if(!safety)
			message = "ЕШЬ ГОВНО СУКА МУДИЛА КУСОК ЕБАНЫЙ КАК ТАКИХ ВЫБЛЯДКОВ ТОЛЬКО ЗЕМЛЯ НОСИТ Я ПРОСТО ХУЕЮ ЧЕСТНО ЭТО ПРОСТО ЕБАНЫЙ ПИЗДЕЦ БЛЯДЬ НАХУЙ СУКА БЛЯДЬ."
			usr.visible_message("[usr]'s Compli-o-Nator: <font color='red' size='4'><b>[message]</b></font>")
			playsound(src, 'sound/voice/binsult.ogg', 50, 0, 4) //Future sound channel = something like SFX
			cooldown = world.time
			return

		usr.visible_message("Утихомириватель [usr]: <font color='red' size='4'><b>[message]</b></font>")
		playsound(src, "sound/voice/complionator/[key].ogg", 50, 0, 4) //future sound channel = something like SFX
		cooldown = world.time