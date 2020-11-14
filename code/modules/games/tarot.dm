/* this is a playing card deck based off of the Rider-Waite Tarot Deck.
*/

/obj/item/weapon/deck/tarot
	name = "колода карт таро"
	desc = "Для ценителей оккультизма."
	icon_state = "deck_tarot"

/obj/item/weapon/deck/tarot/New()
	..()

	var/datum/playingcard/P
	for(var/name in list("Шут","Маг","Верховная Жрица","Императрица","Император","Иерофант","Влюбленные","Колесница","Сила","Отшельник","Колесо Судьбы","Справедливость","Повешенный","Смерть","Умеренность","Дъявол","Башня","Звезда","Луна","Солнце","Суд","Мир"))
		P = new()
		P.name = "[name]"
		P.card_icon = "tarot_major"
		P.back_icon = "card_back_tarot"
		cards += P
	for(var/suit in list("жезлов","пентаклей","кубков","мечей"))
		for(var/number in list("туз","двойка","тройка","четверка","пятерка","шестерка","семерка","восьмерка","девятка","десятка","паж","принц","королева","король"))
			P = new()
			P.name = "[number] [suit]"
			if (suit == "жезлов")
				P.card_icon = "tarot_wands"
			else if (suit == "пентаклей")
				P.card_icon = "tarot_pentacles"
			else if (suit == "кубков")
				P.card_icon = "tarot_cups"
			else
				P.card_icon = "tarot_swords"
			P.back_icon = "card_back_tarot"
			cards += P

/obj/item/weapon/deck/tarot/shuffle()
	var/mob/living/user = usr
	if (cooldown < world.time - 10)
		var/list/newcards = list()
		while(cards.len)
			var/datum/playingcard/P = pick(cards)
			P.name = replacetext(P.name,", карта перевернута","")
			if(prob(50))
				P.name += ", карта перевернута"
			newcards += P
			cards -= P
		cards = newcards
		playsound(src, 'sound/items/cardshuffle.ogg', 50, 1)
		user.visible_message("[user] перетасовывает колоду карт таро.")
		cooldown = world.time
	else
		return
