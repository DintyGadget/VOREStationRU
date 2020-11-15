/*
 * Contents:
 *		Welding mask
 *		Cakehat
 *		Ushanka
 *		Pumpkin head
 *		Kitty ears
 *		Holiday hats
 		Crown of Wrath
 		Warning cone
 */

/*
 * Welding mask
 */
/obj/item/clothing/head/welding
	name = "сварочная маска"
	desc = "Закрепляемая на голове маска, защищающая глаза носителя от воздействия сварочной дуги."
	icon_state = "welding"
	item_state_slots = list(slot_r_hand_str = "welding", slot_l_hand_str = "welding")
	matter = list(DEFAULT_WALL_MATERIAL = 3000, "glass" = 1000)
	var/up = 0
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_inv = (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
	body_parts_covered = HEAD|FACE|EYES
	action_button_name = "Отрегулировать Сварочную Маску"
	siemens_coefficient = 0.9
	w_class = ITEMSIZE_NORMAL
	var/base_state
	flash_protection = FLASH_PROTECTION_MAJOR
	tint = TINT_HEAVY
	drop_sound = 'sound/items/drop/helm.ogg'
	pickup_sound = 'sound/items/pickup/helm.ogg'

/obj/item/clothing/head/welding/attack_self()
	toggle()


/obj/item/clothing/head/welding/verb/toggle()
	set category = "Объект"
	set name = "Отрегулировать Сварочную Маску"
	set src in usr

	if(!base_state)
		base_state = icon_state

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			body_parts_covered |= (EYES|FACE)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = base_state
			flash_protection = FLASH_PROTECTION_MAJOR
			tint = initial(tint)
			to_chat(usr, "Вы опускаете сварочную маску на лицо, защищая глаза.")
		else
			src.up = !src.up
			body_parts_covered &= ~(EYES|FACE)
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "[base_state]up"
			flash_protection = FLASH_PROTECTION_NONE
			tint = TINT_NONE
			to_chat(usr, "Вы приподнимаете сварочную маску с лица.")
		update_clothing_icon()	//so our mob-overlays
		if (ismob(src.loc)) //should allow masks to update when it is opened/closed
			var/mob/M = src.loc
			M.update_inv_wear_mask()
		usr.update_action_buttons()

/obj/item/clothing/head/welding/demon
	name = "демоническая сварочная маска"
	desc = "Разрисованная сварочная маска с изображением лица демона."
	icon_state = "demonwelding"
	item_state_slots = list(
		slot_l_hand_str = "demonwelding",
		slot_r_hand_str = "demonwelding",
		)

/obj/item/clothing/head/welding/knight
	name = "рыцарская сварочная маска"
	desc = "Разрисованная сварочная маска, похожая на рыцарский шлем."
	icon_state = "knightwelding"
	item_state_slots = list(
		slot_l_hand_str = "knightwelding",
		slot_r_hand_str = "knightwelding",
		)

/obj/item/clothing/head/welding/fancy
	name = "модная сварочная маска"
	desc = "Сварочная маска, элегантно расписанная черным и золотым цветами."
	icon_state = "fancywelding"
	item_state_slots = list(
		slot_l_hand_str = "fancywelding",
		slot_r_hand_str = "fancywelding",
		)

/obj/item/clothing/head/welding/engie
	name = "инженерная сварочная маска"
	desc = "Сварочная маска, расписанная инженерными цветами."
	icon_state = "engiewelding"
	item_state_slots = list(
		slot_l_hand_str = "engiewelding",
		slot_r_hand_str = "engiewelding",
		)

/*
 * Cakehat
 */
/obj/item/clothing/head/cakehat
	name = "шляпа из торта"
	desc = "На вид вкусно!"
	icon_state = "cake0"
	var/onfire = 0
	body_parts_covered = HEAD

/obj/item/clothing/head/cakehat/process()
	if(!onfire)
		STOP_PROCESSING(SSobj, src)
		return

	var/turf/location = src.loc
	if(istype(location, /mob/))
		var/mob/living/carbon/human/M = location
		if(M.item_is_in_hands(src) || M.head == src)
			location = M.loc

	if (istype(location, /turf))
		location.hotspot_expose(700, 1)

/obj/item/clothing/head/cakehat/attack_self(mob/user as mob)
	onfire = !(onfire)
	if (onfire)
		force = 3
		damtype = "fire"
		icon_state = "cake1"
		START_PROCESSING(SSobj, src)
	else
		force = null
		damtype = "brute"
		icon_state = "cake0"
	return


/*
 * Ushanka
 */
/obj/item/clothing/head/ushanka
	name = "ушанка"
	desc = "Самое то для зимы в Сибири, товарищ."
	icon_state = "ushankadown"
	flags_inv = HIDEEARS

/obj/item/clothing/head/ushanka/attack_self(mob/user as mob)
	if(src.icon_state == "ushankadown")
		src.icon_state = "ushankaup"
		to_chat(user, "Вы завязываете шапку-ушанку сверху.")
	else
		src.icon_state = "ushankadown"
		to_chat(user, "Вы завязываете шапку-ушанку снизу.")

/*
 * Pumpkin head
 */
/obj/item/clothing/head/pumpkinhead
	name = "вырезанная тыква"
	desc = "Фонарь Джека! Отпугивает злых духов."
	icon_state = "hardhat0_pumpkin"//Could stand to be renamed
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	brightness_on = 2
	light_overlay = "jackolantern"
	w_class = ITEMSIZE_NORMAL
	drop_sound = 'sound/items/drop/herb.ogg'
	pickup_sound = 'sound/items/pickup/herb.ogg'

/*
 * Kitty ears
 */
/obj/item/clothing/head/kitty
	name = "кошачьи ушки"
	desc = "Пара кошачьих ушек. Мяу!"
	icon_state = "kitty"
	body_parts_covered = 0
	siemens_coefficient = 1.5
	item_icons = list()

	update_icon(var/mob/living/carbon/human/user)
		if(!istype(user)) return
		var/icon/ears = new/icon("icon" = 'icons/mob/head.dmi', "icon_state" = "kitty")
		ears.Blend(rgb(user.r_hair, user.g_hair, user.b_hair), ICON_ADD)

		var/icon/earbit = new/icon("icon" = 'icons/mob/head.dmi', "icon_state" = "kittyinner")
		ears.Blend(earbit, ICON_OVERLAY)

/obj/item/clothing/head/richard
	name = "куриная маска"
	desc = "Вам слышатся звуки евробита."
	icon_state = "richard"
	item_state_slots = list(slot_r_hand_str = "chickenhead", slot_l_hand_str = "chickenhead")
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHAIR

/obj/item/clothing/head/santa
	name = "шапка Санты"
	desc = "Праздничная шапка, в красной вариации!"
	icon_state = "santahatnorm"
	item_state_slots = list(slot_r_hand_str = "santahat", slot_l_hand_str = "santahat")
	body_parts_covered = 0

/obj/item/clothing/head/santa/green
	name = "зеленая шапка Санты"
	desc = "Праздничная шапка, в зеленой вариации!"
	icon_state = "santahatgreen"
	item_state_slots = list(slot_r_hand_str = "santahatgreen", slot_l_hand_str = "santahatgreen")
	body_parts_covered = 0

/*
 * Xenoarch/Surface Loot Hats
 */

// Triggers an effect when the wearer is 'in grave danger'.
// Causes brainloss when it happens.
/obj/item/clothing/head/psy_crown
	name = "broken crown"
	desc = "A crown-of-thorns with a missing gem."
	var/tension_threshold = 125
	var/cooldown = null // world.time of when this was last triggered.
	var/cooldown_duration = 3 MINUTES // How long the cooldown should be.
	var/flavor_equip = null // Message displayed to someone who puts this on their head. Drones don't get a message.
	var/flavor_unequip = null // Ditto, but for taking it off.
	var/flavor_drop = null // Ditto, but for dropping it.
	var/flavor_activate = null // Ditto, for but activating.
	var/brainloss_cost = 3 // Whenever it activates, inflict this much brainloss on the wearer, as its not good for the mind to wear things that manipulate it.

/obj/item/clothing/head/psy_crown/proc/activate_ability(var/mob/living/wearer)
	cooldown = world.time + cooldown_duration
	to_chat(wearer, flavor_activate)
	to_chat(wearer, "<span class='danger'>The inside of your head hurts...</span>")
	wearer.adjustBrainLoss(brainloss_cost)

/obj/item/clothing/head/psy_crown/equipped(var/mob/living/carbon/human/H)
	..()
	if(istype(H) && H.head == src && H.is_sentient())
		START_PROCESSING(SSobj, src)
		to_chat(H, flavor_equip)

/obj/item/clothing/head/psy_crown/dropped(var/mob/living/carbon/human/H)
	..()
	STOP_PROCESSING(SSobj, src)
	if(H.is_sentient())
		if(loc == H) // Still inhand.
			to_chat(H, flavor_unequip)
		else
			to_chat(H, flavor_drop)

/obj/item/clothing/head/psy_crown/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/head/psy_crown/process()
	if(isliving(loc))
		var/mob/living/L = loc
		if(world.time >= cooldown && L.is_sentient() && L.get_tension() >= tension_threshold)
			activate_ability(L)


/obj/item/clothing/head/psy_crown/wrath
	name = "red crown"
	desc = "A crown-of-thorns set with a red gemstone that seems to glow unnaturally. It feels rather disturbing to touch."
	description_info = "This has a chance to cause the wearer to become extremely angry when in extreme danger."
	icon_state = "wrathcrown"
	flavor_equip = "<span class='warning'>You feel a bit angrier after putting on this crown.</span>"
	flavor_unequip = "<span class='notice'>You feel calmer after removing the crown.</span>"
	flavor_drop = "<span class='notice'>You feel much calmer after letting go of the crown.</span>"
	flavor_activate = "<span class='danger'>An otherworldly feeling seems to enter your mind, and it ignites your mind in fury!</span>"

/obj/item/clothing/head/psy_crown/wrath/activate_ability(var/mob/living/wearer)
	..()
	wearer.add_modifier(/datum/modifier/berserk, 30 SECONDS)

/obj/item/clothing/head/psy_crown/gluttony
	name = "green crown"
	desc = "A crown-of-thorns set with a green gemstone that seems to glow unnaturally. It feels rather disturbing to touch."
	description_info = "This has a chance to cause the wearer to become extremely durable, but hungry when in extreme danger."
	icon_state = "gluttonycrown"
	flavor_equip = "<span class='warning'>You feel a bit hungrier after putting on this crown.</span>"
	flavor_unequip = "<span class='notice'>You feel sated after removing the crown.</span>"
	flavor_drop = "<span class='notice'>You feel much more sated after letting go of the crown.</span>"
	flavor_activate = "<span class='danger'>An otherworldly feeling seems to enter your mind, and it drives your mind into gluttony!</span>"

/obj/item/clothing/head/psy_crown/gluttony/activate_ability(var/mob/living/wearer)
	..()
	wearer.add_modifier(/datum/modifier/gluttonyregeneration, 45 SECONDS)

/obj/item/clothing/head/cone
	name = "warning cone"
	desc = "This cone is trying to warn you of something!"
	description_info = "It looks like you can wear it in your head slot."
	icon_state = "cone"
	item_state = "cone"
	drop_sound = 'sound/items/drop/shoes.ogg'
	force = 1
	throwforce = 3
	throw_speed = 2
	throw_range = 5
	w_class = 2
	body_parts_covered = HEAD
	attack_verb = list("warned", "cautioned", "smashed")
	armor = list("melee" = 5, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)