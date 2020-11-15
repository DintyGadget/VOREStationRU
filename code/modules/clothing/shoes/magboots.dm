/obj/item/clothing/shoes/magboots
	desc = "Магнитные ботинки, зачастую используемые во время внекорабельной деятельности для поддержания сцепления с поверхностью корабля. Достаточно большие для ношения поверх другой обуви."
	name = "магнитные ботинки"
	icon_state = "magboots0"
	flags = PHORONGUARD
	item_state_slots = list(slot_r_hand_str = "magboots", slot_l_hand_str = "magboots")
	species_restricted = null
	center_of_mass = list("x" = 17,"y" = 12)
	force = 3
	overshoes = 1
	shoes_under_pants = -1	//These things are huge
	preserve_item = 1
	var/magpulse = 0
	var/icon_base = "magboots"
	action_button_name = "Переключить Магнитные Ботинки"
	var/obj/item/clothing/shoes/shoes = null	//Undershoes
	var/mob/living/carbon/human/wearer = null	//For shoe procs
	step_volume_mod = 1.3
	drop_sound = 'sound/items/drop/metalboots.ogg'
	pickup_sound = 'sound/items/pickup/toolbox.ogg'

/obj/item/clothing/shoes/magboots/proc/set_slowdown()
	slowdown = shoes? max(SHOES_SLOWDOWN, shoes.slowdown): SHOES_SLOWDOWN	//So you can't put on magboots to make you walk faster.
	if (magpulse)
		slowdown += 3

/obj/item/clothing/shoes/magboots/attack_self(mob/user)
	if(magpulse)
		item_flags &= ~NOSLIP
		magpulse = 0
		set_slowdown()
		force = 3
		if(icon_base) icon_state = "[icon_base]0"
		to_chat(user, "Вы отключаете систему магнитного сцепления.")
	else
		item_flags |= NOSLIP
		magpulse = 1
		set_slowdown()
		force = 5
		if(icon_base) icon_state = "[icon_base]1"
		playsound(src, 'sound/effects/magnetclamp.ogg', 20)
		to_chat(user, "Вы включаете систему магнитного сцепления.")
	user.update_inv_shoes()	//so our mob-overlays update
	user.update_action_buttons()

/obj/item/clothing/shoes/magboots/mob_can_equip(mob/user, slot, disable_warning = FALSE)
	var/mob/living/carbon/human/H = user

	if(H.shoes)
		shoes = H.shoes
		if(shoes.overshoes)
			if(slot && slot == slot_shoes)
				to_chat(user, "Вы не можете надеть [src], так как Вам мешают [H.shoes].")
			shoes = null
			return 0
		H.drop_from_inventory(shoes)	//Remove the old shoes so you can put on the magboots.
		shoes.forceMove(src)

	if(!..())
		if(shoes) 	//Put the old shoes back on if the check fails.
			if(H.equip_to_slot_if_possible(shoes, slot_shoes))
				src.shoes = null
		return 0

	if (shoes)
		if(slot && slot == slot_shoes)
			to_chat(user, "Вы надеваете [src] поверх своей обуви.")
	set_slowdown()
	wearer = H
	return 1

/obj/item/clothing/shoes/magboots/dropped()
	..()
	var/mob/living/carbon/human/H = wearer
	if(shoes)
		if(!H.equip_to_slot_if_possible(shoes, slot_shoes))
			shoes.forceMove(get_turf(src))
		src.shoes = null
	wearer = null

/obj/item/clothing/shoes/magboots/examine(mob/user)
	. = ..()
	. += "Система магнитного сцепления, похоже, [item_flags & NOSLIP ? "активирована" : "отключена"]."

/obj/item/clothing/shoes/magboots/vox

	desc = "Пара тяжелых, бронированных когтей, предназначенных, по всей видимости, для велоцирапторов."
	name = "магнитные когти"
	item_state = "boots-vox"
	icon_state = "boots-vox"
	flags = PHORONGUARD
	species_restricted = list(SPECIES_VOX)

	action_button_name = "Переключить Магнитные Когти"

/obj/item/clothing/shoes/magboots/vox/attack_self(mob/user)
	if(src.magpulse)
		item_flags &= ~NOSLIP
		magpulse = 0
		canremove = 1
		to_chat(user, "Вы достаёте свои когти из пола.")
	else
		//make sure these can only be used when equipped.
		if(!ishuman(user))
			return
		var/mob/living/carbon/human/H = user
		if (H.shoes != src)
			to_chat(user, "Вам нужно сперва надеть [src].")
			return

		item_flags |= NOSLIP
		magpulse = 1
		canremove = 0	//kinda hard to take off magclaws when you are gripping them tightly.
		to_chat(user, "Вы впиваетесь когтями в пол, прижимаясь к нему.")
	user.update_action_buttons()

//In case they somehow come off while enabled.
/obj/item/clothing/shoes/magboots/vox/dropped(mob/user as mob)
	..()
	if(src.magpulse)
		user.visible_message("Магнитные когти отключаются, будучи снятыми с [usr]'s feet.", "Магнитные когти отключаются, будучи снятыми с Ваших лап.")
		item_flags &= ~NOSLIP
		magpulse = 0
		canremove = 1

/obj/item/clothing/shoes/magboots/vox/examine(mob/user)
	. = ..()
	if(magpulse)
		. += "Их непросто снять, не ослабив сперва хватку." // Theoretically this message should only be seen by the wearer when the claws are equipped.