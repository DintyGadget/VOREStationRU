/obj/item/weapon/pack/cardemon
	name = "комплект карточек Картемон"
	desc = "Наконец-то! Эта детская игра теперь и в космосе."
	icon_state = "card_pack_cardemon"
	parentdeck = "cardemon"

/obj/item/weapon/pack/cardemon/New()
	..()
	var/datum/playingcard/P
	var/i
	for(i=0; i<5; i++)
		var/rarity
		if(prob(10))
			if(prob(5))
				if(prob(5))
					rarity = "Пласталевый"
				else
					rarity = "Платиновый"
			else
				rarity = "Серебряный"

		var/nam = pick("Смертельный","Жизненный","Растительный","Лиственный","Воздушный","Земельный","Огненный","Водяной","Убийственный","Святой", "Божественный", "Обыкновенный","Демонический","Ангельский", "Пласталевый", "Фороновый", "Разъяренный", "Сумасшедший", "Металлический", "Стальной", "Секретный")
		var/nam2 = pick("Карп", "Корги", "Кот", "Хомяк", "Осминог", "Ящер", "Примат", "Цветок", "Утенок", "Демон", "Паук", "Птенец", "Слизень", "Баран")

		P = new()
		P.name = "[nam] [nam2]"
		P.card_icon = "card_cardemon"
		if(rarity)
			P.name = "[rarity] [P.name]"
			P.card_icon += "_[rarity]"
		P.back_icon = "card_back_cardemon"
		cards += P
