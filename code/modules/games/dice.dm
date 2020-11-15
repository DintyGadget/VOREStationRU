/obj/item/weapon/dice
	name = "шестигранный кубик"
	desc = "Кубик с шестью гранями."
	icon = 'icons/obj/dice.dmi'
	icon_state = "d66"
	w_class = ITEMSIZE_TINY
	var/sides = 6
	var/result = 6
	attack_verb = list("diced")

/obj/item/weapon/dice/New()
	icon_state = "[name][rand(1,sides)]"

/obj/item/weapon/dice/d4
	name = "четырехгранный кубик"
	desc = "Кубик с четырьмя гранями."
	icon_state = "d44"
	sides = 4
	result = 4

/obj/item/weapon/dice/d8
	name = "восьмигранный кубик"
	desc = "Кубик с восьмью гранями."
	icon_state = "d88"
	sides = 8
	result = 8

/obj/item/weapon/dice/d10
	name = "десятигранный кубик"
	desc = "Кубик с десятью гранями."
	icon_state = "d1010"
	sides = 10
	result = 10

/obj/item/weapon/dice/d12
	name = "двенадцатигранный кубик"
	desc = "Кубик с двенадцатью гранями."
	icon_state = "d1212"
	sides = 12
	result = 12

/obj/item/weapon/dice/d20
	name = "двадцатигранный кубик"
	desc = "Кубик с двадцатью гранями."
	icon_state = "d2020"
	sides = 20
	result = 20

/obj/item/weapon/dice/d100
	name = "стогранный кубик"
	desc = "Кубик с десятью гранями. Выдает десятичные значения."
	icon_state = "d10010"
	sides = 10
	result = 10

/obj/item/weapon/dice/attack_self(mob/user as mob)
	rollDice(user, 0)

/obj/item/weapon/dice/proc/rollDice(mob/user as mob, var/silent = 0)
	result = rand(1, sides)
	icon_state = "[name][result]"

	if(!silent)
		var/comment = ""
		if(sides == 20 && result == 20)
			comment = "Нат 20!"
		else if(sides == 20 && result == 1)
			comment = "Уф, не повезло."

		user.visible_message("<span class='notice'>[user] бросает [src]. Сверху число [result]. [comment]</span>", \
							 "<span class='notice'>Вы бросаете [src]. Сверху число [result]. [comment]</span>", \
							 "<span class='notice'>Вы видите, как [src] перекатывается цифрой [result] кверху. [comment]</span>")

/*
 * Dice packs
 */

/obj/item/weapon/storage/pill_bottle/dice	//7d6
	name = "мешочек игральных кубиков"
	desc = "Небольшой мешочек с игральными кубиками внутри."
	icon = 'icons/obj/dice.dmi'
	icon_state = "dicebag"
	drop_sound = 'sound/items/drop/hat.ogg'
	pickup_sound = 'sound/items/pickup/hat.ogg'

/obj/item/weapon/storage/pill_bottle/dice/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/dice( src )

/obj/item/weapon/storage/pill_bottle/dice_nerd	//DnD dice
	name = "мешочек многогранных кубиков"
	desc = "Небольшой мешочек с кубиками для настольных игр внутри."
	icon = 'icons/obj/dice.dmi'
	icon_state = "magicdicebag"
	drop_sound = 'sound/items/drop/hat.ogg'
	pickup_sound = 'sound/items/pickup/hat.ogg'

/obj/item/weapon/storage/pill_bottle/dice_nerd/New()
	..()
	new /obj/item/weapon/dice/d4( src )
	new /obj/item/weapon/dice( src )
	new /obj/item/weapon/dice/d8( src )
	new /obj/item/weapon/dice/d10( src )
	new /obj/item/weapon/dice/d12( src )
	new /obj/item/weapon/dice/d20( src )
	new /obj/item/weapon/dice/d100( src )

/*
 *Liar's Dice cup
 */

/obj/item/weapon/storage/dicecup
	name = "стакан для кубиков"
	desc = "Небольшой стаканчик для скрывания или хранения кубиков."
	icon = 'icons/obj/dice.dmi'
	icon_state = "dicecup"
	w_class = ITEMSIZE_SMALL
	storage_slots = 5
	can_hold = list(
		/obj/item/weapon/dice,
		)

/obj/item/weapon/storage/dicecup/attack_self(mob/user as mob)
	user.visible_message("<span class='notice'>[user] встряхивает [src].</span>", \
							 "<span class='notice'>Вы встряхиваете [src].</span>", \
							 "<span class='notice'>Вы слышите звуки перекатывания кубиков.</span>")
	rollCup(user)

/obj/item/weapon/storage/dicecup/proc/rollCup(mob/user as mob)
	for(var/obj/item/weapon/dice/I in src.contents)
		var/obj/item/weapon/dice/D = I
		D.rollDice(user, 1)

/obj/item/weapon/storage/dicecup/proc/revealDice(var/mob/viewer)
	for(var/obj/item/weapon/dice/I in src.contents)
		var/obj/item/weapon/dice/D = I
		to_chat(viewer, "[D.name] показывает [D.result].")

/obj/item/weapon/storage/dicecup/verb/peekAtDice()
	set category = "Объект"
	set name = "Подсмотреть Кубики"
	set desc = "Подсмотреть кубики в Вашем стаканчике."

	revealDice(usr)

/obj/item/weapon/storage/dicecup/verb/revealDiceHand()

	set category = "Объект"
	set name = "Показать Кубики"
	set desc = "Показать кубики, скрытые под Вашим стаканчиком."

	for(var/mob/living/player in viewers(3))
		to_chat(player, "[usr] показывает кубики.")
		revealDice(player)


/obj/item/weapon/storage/dicecup/loaded/New()
	..()
	for(var/i = 1 to 5)
		new /obj/item/weapon/dice( src )