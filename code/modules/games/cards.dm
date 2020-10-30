/datum/playingcard
	var/name = "игральная карта"
	var/card_icon = "card_back"
	var/back_icon = "card_back"

/obj/item/weapon/deck
	w_class = ITEMSIZE_SMALL
	icon = 'icons/obj/playing_cards.dmi'
	var/list/cards = list()
	var/cooldown = 0 // to prevent spam shuffle

/obj/item/weapon/deck/holder
	name = "карточный чехол"
	desc = "Небольшой кожаный чехол для хранения игральных карт, дабы всем показать, насколько Ваш вкус лучше остальных."
	icon_state = "card_holder"

/obj/item/weapon/deck/cards
	name = "колода игральных карт"
	desc = "Обыкновенная колода игральных карт."
	icon_state = "deck"
	drop_sound = 'sound/items/drop/paper.ogg'
	pickup_sound = 'sound/items/pickup/paper.ogg'

/obj/item/weapon/deck/cards/New()
	..()
	var/datum/playingcard/P
	for(var/suit in list("пик","треф","бубен","червей"))

		var/colour
		if(suit == "пик" || suit == "треф")
			colour = "black_"
		else
			colour = "red_"

		for(var/number in list("туз","двойка","тройка","четверка","пятерка","шестерка","семерка","восьмерка","девятка","десятка"))
			P = new()
			P.name = "[number] [suit]"
			P.card_icon = "[colour]num"
			P.back_icon = "card_back"
			cards += P

		for(var/number in list("валет","дама","король"))
			P = new()
			P.name = "[number] [suit]"
			P.card_icon = "[colour]col"
			P.back_icon = "card_back"
			cards += P

	for(var/i = 0, i<2, i++)
		P = new()
		P.name = "джокер"
		P.card_icon = "joker"
		cards += P

/obj/item/weapon/deck/attackby(obj/O as obj, mob/user as mob)
	if(istype(O,/obj/item/weapon/hand))
		var/obj/item/weapon/hand/H = O
		if(H.parentdeck == src)
			for(var/datum/playingcard/P in H.cards)
				cards += P
			qdel(H)
			to_chat(user,"<span class='notice'>Вы складываете свои карты под колоду.</span>.")
			return
		else
			to_chat(user,"<span class='warning'>Нельзя перемешивать колоды друг с другом!</span>")
			return
	..()

/obj/item/weapon/deck/attack_hand(mob/user as mob)
	var/mob/living/carbon/human/H = user
	if(istype(src.loc, /obj/item/weapon/storage) || src == H.r_store || src == H.l_store || src.loc == user) // so objects can be removed from storage containers or pockets. also added a catch-all, so if it's in the mob you'll pick it up.
		..()
	else // but if they're not, or are in your hands, you can still draw cards.
		draw_card()

/obj/item/weapon/deck/verb/draw_card()

	set category = "Объект"
	set name = "Вытянуть Карту"
	set desc = "Вытягивает карту из колоды."
	set src in view(1)

	var/mob/living/carbon/user = usr

	if(usr.stat || !Adjacent(usr)) return

	if(user.hands_are_full()) // Safety check lest the card disappear into oblivion
		to_chat(user,"<span class='notice'>Ваши руки заняты!</span>")
		return

	if(!istype(usr,/mob/living/carbon))
		return

	if(!cards.len)
		to_chat(user,"<span class='notice'>В колоде не осталось карт.</span>")
		return

	var/obj/item/weapon/hand/H = user.get_type_in_hands(/obj/item/weapon/hand)
	if(H && !(H.parentdeck == src))
		to_chat(user,"<span class='warning'>Нельзя перемешивать колоды друг с другом!</span>")
		return

	if(!H)
		H = new(get_turf(src))
		user.put_in_hands(H)

	if(!H || !user) return

	var/datum/playingcard/P = cards[1]
	H.cards += P
	cards -= P
	H.parentdeck = src
	H.update_icon()
	user.visible_message("<span class='notice'>[user] вытягивает карту.</span>")
	to_chat(user,"<span class='notice'>Это [P].</span>")

/obj/item/weapon/deck/verb/deal_card()

	set category = "Объект"
	set name = "Раздать Карту"
	set desc = "Раздает из колоды карту."
	set src in view(1)

	if(usr.stat || !Adjacent(usr)) return

	if(!cards.len)
		to_chat(usr,"<span class='notice'>В колоде не осталось карт.</span>")
		return

	var/list/players = list()
	for(var/mob/living/player in viewers(3))
		if(!player.stat)
			players += player
	//players -= usr

	var/mob/living/M = input("Кому бы Вы хотели выдать карту?") as null|anything in players
	if(!usr || !src || !M) return

	deal_at(usr, M, 1)

/obj/item/weapon/deck/verb/deal_card_multi()

	set category = "Объект"
	set name = "Раздать Несколько Карт"
	set desc = "Раздает из колоды несколько карт."
	set src in view(1)

	if(usr.stat || !Adjacent(usr)) return

	if(!cards.len)
		to_chat(usr,"<span class='notice'>В колоде не осталось карт.</span>")
		return

	var/list/players = list()
	for(var/mob/living/player in viewers(3))
		if(!player.stat)
			players += player
	//players -= usr
	var/maxcards = max(min(cards.len,10),1)
	var/dcard = input("Сколько карт Вы хотели бы выдать? Можно выдать до [maxcards] карт.") as num
	if(dcard > maxcards)
		return
	var/mob/living/M = input("Кому бы Вы хотели выдать [dcard] карт?") as null|anything in players
	if(!usr || !src || !M) return

	deal_at(usr, M, dcard)

/obj/item/weapon/deck/proc/deal_at(mob/user, mob/target, dcard) // Take in the no. of card to be dealt
	var/obj/item/weapon/hand/H = new(get_step(user, user.dir))
	var/i
	for(i = 0, i < dcard, i++)
		H.cards += cards[1]
		cards -= cards[1]
		H.parentdeck = src
		H.concealed = 1
		H.update_icon()
	if(user==target)
		user.visible_message("<span class = 'notice'>[user] выдаёт себе [dcard] карты </span>")
	else
		user.visible_message("<span class = 'notice'>[user] выдает [dcard] карты [target].</span>")
	H.throw_at(get_step(target,target.dir),10,1,H)


/obj/item/weapon/hand/attackby(obj/O as obj, mob/user as mob)
	if(cards.len == 1 && istype(O, /obj/item/weapon/pen))
		var/datum/playingcard/P = cards[1]
		if(P.name != "Пустая Карта")
			to_chat(user,"<span class = 'notice'>На этой карте ничего нельзя писать.</span>")
			return
		var/cardtext = sanitize(input(user, "Что бы Вы хотели написать на этой карте?", "Редактирование Карты") as text|null, MAX_PAPER_MESSAGE_LEN)
		if(!cardtext)
			return
		P.name = cardtext
		// SNOWFLAKE FOR CAG, REMOVE IF OTHER CARDS ARE ADDED THAT USE THIS.
		P.card_icon = "cag_white_card"
		update_icon()
	else if(istype(O,/obj/item/weapon/hand))
		var/obj/item/weapon/hand/H = O
		if(H.parentdeck == src.parentdeck) // Prevent cardmixing
			for(var/datum/playingcard/P in cards)
				H.cards += P
			H.concealed = src.concealed
			user.drop_from_inventory(src)
			qdel(src)
			H.update_icon()
			return
		else
			to_chat(user,"<span class = 'notice'>Нельзя перемешивать колоды друг с другом!</span>")
			return

	..()

/obj/item/weapon/deck/attack_self()
	shuffle()


/obj/item/weapon/deck/verb/verb_shuffle()
	set category = "Объект"
	set name = "Перетасовать"
	set desc = "Перетасовать карты в колоде."
	set src in view(1)
	shuffle()

/obj/item/weapon/deck/proc/shuffle()
	var/mob/living/user = usr
	if (cooldown < world.time - 10) // 15 ticks cooldown
		var/list/newcards = list()
		while(cards.len)
			var/datum/playingcard/P = pick(cards)
			newcards += P
			cards -= P
		cards = newcards
		if (src == /obj/item/weapon/deck/cah)
			user.visible_message("<span class = 'notice'>[user] перетасовывает белую колоду Карт Против Галактики.</span>")
		else if (src == /obj/item/weapon/deck/cah/black)
			user.visible_message("<span class = 'notice'>[user] перетасовывает черную колоду Карт Против Галактики.</span>")
		else
			user.visible_message("<span class = 'notice'>[user] перетасовывает колоду игральных карт.</span>")
		playsound(src, 'sound/items/cardshuffle.ogg', 50, 1)
		cooldown = world.time
	else
		return


/obj/item/weapon/deck/MouseDrop(mob/user as mob) // Code from Paper bin, so you can still pick up the deck
	if((user == usr && (!( usr.restrained() ) && (!( usr.stat ) && (usr.contents.Find(src) || in_range(src, usr))))))
		if(!istype(usr, /mob/living/simple_mob))
			if( !usr.get_active_hand() )		//if active hand is empty
				var/mob/living/carbon/human/H = user
				var/obj/item/organ/external/temp = H.organs_by_name["r_hand"]

				if (H.hand)
					temp = H.organs_by_name["l_hand"]
				if(temp && !temp.is_usable())
					to_chat(user,"<span class='notice'>Вы пытаетесь пошевелить рукой, но не можете!</span>")
					return

				to_chat(user,"<span class='notice'>Вы подбираете колоду карт.</span>")
				user.put_in_hands(src)

	return

/obj/item/weapon/deck/verb_pickup() // Snowflaked so pick up verb work as intended
	var/mob/user = usr
	if((istype(user) && (!( usr.restrained() ) && (!( usr.stat ) && (usr.contents.Find(src) || in_range(src, usr))))))
		if(!istype(usr, /mob/living/simple_mob))
			if( !usr.get_active_hand() )		//if active hand is empty
				var/mob/living/carbon/human/H = user
				var/obj/item/organ/external/temp = H.organs_by_name["r_hand"]

				if (H.hand)
					temp = H.organs_by_name["l_hand"]
				if(temp && !temp.is_usable())
					to_chat(user,"<span class='notice'>Вы пытаетесь пошевелить рукой, но не можете!</span>")
					return

				to_chat(user,"<span class='notice'>Вы подбираете колоду карт.</span>")
				user.put_in_hands(src)
	return

/obj/item/weapon/pack/
	name = "набор карт"
	desc = "Для тех, кому некуда девать деньги."

	icon_state = "card_pack"
	icon = 'icons/obj/playing_cards.dmi'
	w_class = ITEMSIZE_TINY
	var/list/cards = list()
	var/parentdeck = null // This variable is added here so that card pack dependent card can be mixed together by defining a "parentdeck" for them
	drop_sound = 'sound/items/drop/paper.ogg'
	pickup_sound = 'sound/items/pickup/paper.ogg'


/obj/item/weapon/pack/attack_self(var/mob/user as mob)
	if (src == /obj/item/weapon/pack/cardemon)
		user.visible_message("<span class ='danger'>[user] рвёт упаковку комплекта карт Картемон!</span>")
	else if (src == /obj/item/weapon/pack/spaceball)
		user.visible_message("<span class ='danger'>[user] рвёт упаковку комплекта карт Спейсбол!</span>")
	else
		user.visible_message("<span class ='danger'>[user] рвёт упаковку комплекта карт!</span>")
	var/obj/item/weapon/hand/H = new()

	H.cards += cards
	H.parentdeck = src.parentdeck
	cards.Cut();
	user.drop_item()
	qdel(src)

	H.update_icon()
	user.put_in_active_hand(H)

/obj/item/weapon/hand
	name = "рука карт"
	desc = "Несколько игровых карт в руке."
	icon = 'icons/obj/playing_cards.dmi'
	icon_state = "empty"
	drop_sound = 'sound/items/drop/paper.ogg'
	pickup_sound = 'sound/items/pickup/paper.ogg'
	w_class = ITEMSIZE_TINY

	var/concealed = 0
	var/list/cards = list()
	var/parentdeck = null

/obj/item/weapon/hand/verb/discard()

	set category = "Объект"
	set name = "Сбросить Карту"
	set desc = "Положить карту (карты) из своей руки перед собой."

	var/i
	var/maxcards = min(cards.len,5) // Maximum of 5 cards at once
	var/discards = input("Сколько карт Вы бы хотели сбросить? Можно сбросить до [maxcards] карт.") as num
	if(discards > maxcards)
		return
	for	(i = 0;i < discards;i++)
		var/list/to_discard = list()
		for(var/datum/playingcard/P in cards)
			to_discard[P.name] = P
		var/discarding = input("Какую карту Вы хотели бы сбросить?") as null|anything in to_discard

		if(!discarding || !to_discard[discarding] || !usr || !src) return

		var/datum/playingcard/card = to_discard[discarding]
		to_discard.Cut()

		var/obj/item/weapon/hand/H = new(src.loc)
		H.cards += card
		cards -= card
		H.concealed = 0
		H.parentdeck = src.parentdeck
		H.update_icon()
		src.update_icon()
		usr.visible_message("<span class = 'notice'>[usr] разыгрывает карту [discarding].</span>")
		H.loc = get_step(usr,usr.dir)

	if(!cards.len)
		qdel(src)

/obj/item/weapon/hand/attack_self(var/mob/user as mob)
	concealed = !concealed
	update_icon()
	user.visible_message("<span class = 'notice'>[user] [concealed ? "скрывает" : "раскрывает"] карты в руке.</span>")

/obj/item/weapon/hand/examine(mob/user)
	. = ..()
	if((!concealed) && cards.len)
		. += "В руке содержатся: "
		for(var/datum/playingcard/P in cards)
			. += "[P.name]."

/obj/item/weapon/hand/verb/Removecard()

	set category = "Объект"
	set name = "Убрать Карту Из Руки"
	set desc = "Достает из Вашей руки карту."
	set src in view(1)

	var/mob/living/carbon/user = usr

	if(user.stat || !Adjacent(user)) return

	if(user.hands_are_full()) // Safety check lest the card disappear into oblivion
		to_chat(usr,"<span class='danger'>Ваши руки заняты!</span>")
		return

	var/pickablecards = list()
	for(var/datum/playingcard/P in cards)
		pickablecards[P.name] += P
	var/pickedcard = input("Какую карту Вы хотели бы убрать из руки?")	as null|anything in pickablecards

	if(!pickedcard || !pickablecards[pickedcard] || !usr || !src) return

	var/datum/playingcard/card = pickablecards[pickedcard]

	var/obj/item/weapon/hand/H = new(get_turf(src))
	user.put_in_hands(H)
	H.cards += card
	cards -= card
	H.parentdeck = src.parentdeck
	H.concealed = src.concealed
	H.update_icon()
	src.update_icon()

	if(!cards.len)
		qdel(src)
	return

/obj/item/weapon/hand/update_icon(var/direction = 0)

	if(!cards.len)
		qdel(src)
		return
	else if(cards.len > 1)
		name = "рука карт"
		desc = "Несколько игровых карт в руке."
	else
		name = "игровая карта"
		desc = "Одна игровая карта."

	overlays.Cut()


	if(cards.len == 1)
		var/datum/playingcard/P = cards[1]
		var/image/I = new(src.icon, (concealed ? "[P.back_icon]" : "[P.card_icon]") )
		I.pixel_x += (-5+rand(10))
		I.pixel_y += (-5+rand(10))
		overlays += I
		return

	var/offset = FLOOR(20/cards.len, 1)

	var/matrix/M = matrix()
	if(direction)
		switch(direction)
			if(NORTH)
				M.Translate( 0,  0)
			if(SOUTH)
				M.Translate( 0,  4)
			if(WEST)
				M.Turn(90)
				M.Translate( 3,  0)
			if(EAST)
				M.Turn(90)
				M.Translate(-2,  0)
	var/i = 0
	for(var/datum/playingcard/P in cards)
		var/image/I = new(src.icon, (concealed ? "[P.back_icon]" : "[P.card_icon]") )
		//I.pixel_x = origin+(offset*i)
		switch(direction)
			if(SOUTH)
				I.pixel_x = 8-(offset*i)
			if(WEST)
				I.pixel_y = -6+(offset*i)
			if(EAST)
				I.pixel_y = 8-(offset*i)
			else
				I.pixel_x = -7+(offset*i)
		I.transform = M
		overlays += I
		i++

/obj/item/weapon/hand/dropped(mob/user as mob)
	if(locate(/obj/structure/table, loc))
		src.update_icon(user.dir)
	else
		update_icon()

/obj/item/weapon/hand/pickup(mob/user as mob)
	..()
	src.update_icon()
