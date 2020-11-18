/obj/item/weapon/dice
	name = "Шестигранный кубик"
	desc = "Кубик с шестью гранями."
	icon = 'icons/obj/dice.dmi'
	icon_state = "d66"
	w_class = ITEMSIZE_TINY
	var/sides = 6
	var/result = 6
	var/diceicon = "d6" // XenosStation Edit: Required for proper localization
	//attack_verb = list("diced") // XenosStation Edit: Obsolete with the introduction of cases

/obj/item/weapon/dice/New()
	icon_state = "[diceicon][rand(1,sides)]"

/obj/item/weapon/dice/d4
	name = "Четырёхгранный кубик"
	desc = "Кубик с четырьмя гранями."
	icon_state = "d44"
	sides = 4
	result = 4
	diceicon = "d4"

/obj/item/weapon/dice/d8
	name = "Восьмигранный кубик"
	desc = "Кубик с восьмью гранями."
	icon_state = "d88"
	sides = 8
	result = 8
	diceicon = "d8"

/obj/item/weapon/dice/d10
	name = "Десятигранный кубик"
	desc = "Кубик с десятью гранями."
	icon_state = "d1010"
	sides = 10
	result = 10
	diceicon = "d10"

/obj/item/weapon/dice/d12
	name = "Двенадцатигранный кубик"
	desc = "Кубик с двенадцатью гранями."
	icon_state = "d1212"
	sides = 12
	result = 12
	diceicon = "d12"

/obj/item/weapon/dice/d20
	name = "Двадцатигранный кубик"
	desc = "Кубик с двадцатью гранями."
	icon_state = "d2020"
	sides = 20
	result = 20
	diceicon = "d20"

/obj/item/weapon/dice/d100
	name = "Стогранный кубик"
	desc = "Кубик с десятью гранями. Выдает десятичные значения."
	icon_state = "d10010"
	sides = 10
	result = 10
	diceicon = "d100"

/obj/item/weapon/dice/attack_self(mob/user as mob)
	rollDice(user, 0)

/obj/item/weapon/dice/proc/rollDice(mob/user as mob, var/silent = 0)
	result = rand(1, sides)
	icon_state = "[diceicon][result]"

	if(!silent)
		var/comment = ""
		if(sides == 20 && result == 20)
			comment = "Все 20!"
		else if(sides == 20 && result == 1)
			comment = "Уф, не повезло."

		user.visible_message("<span class='notice'>[user] бросает [src.acase]. Выпадает [result]. [comment]</span>", \
							 "<span class='notice'>Вы бросаете [src.acase]. Выпадает [result]. [comment]</span>", \
							 "<span class='notice'>Вы видите, как [src.acase] перекатывается цифрой [result] кверху. [comment]</span>")

/*
 * Dice packs
 */

/obj/item/weapon/storage/pill_bottle/dice	//7d6
	name = "Мешочек игральных кубиков"
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
	name = "Мешочек многогранных кубиков"
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
	name = "Стакан для кубиков"
	desc = "Небольшой стаканчик для скрывания или хранения кубиков."
	icon = 'icons/obj/dice.dmi'
	icon_state = "dicecup"
	w_class = ITEMSIZE_SMALL
	storage_slots = 5
	can_hold = list(
		/obj/item/weapon/dice,
		)

/obj/item/weapon/storage/dicecup/attack_self(mob/user as mob)
	user.visible_message("<span class='notice'>[user] встряхивает [src.acase].</span>", \
							 "<span class='notice'>Вы встряхиваете [src.acase].</span>", \
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