/obj/item/clothing/shoes/griffin
	name = "ботинки грифона"
	desc = "Пара ботинок для костюма грифона, исполненные в стиле птичьих когтей."
	icon_state = "griffinboots"
	item_state = "griffinboots"
	icon = 'icons/obj/clothing/shoes_vr.dmi'
	icon_override = 'icons/mob/feet_vr.dmi'

/obj/item/clothing/shoes/bhop
	name = "джет-ботинки"
	desc = "Специализированная пара военных ботинок со встроенной системой подачи импульса для быстрого передвижения."
	icon_state = "jetboots"
	item_state = "jetboots"
	icon = 'icons/obj/clothing/shoes_vr.dmi'
	icon_override = 'icons/mob/feet_vr.dmi'
	// resistance_flags = FIRE_PROOF
	action_button_name = "Активировать Джет-Ботинки"
	permeability_coefficient = 0.05
	var/jumpdistance = 5 //-1 from to see the actual distance, e.g 4 goes over 3 tiles
	var/jumpspeed = 3
	var/recharging_rate = 60 //default 6 seconds between each dash
	var/recharging_time = 0 //time until next dash
	// var/jumping = FALSE //are we mid-jump? We have no throw_at callback, so we have to check user.throwing.

/obj/item/clothing/shoes/bhop/ui_action_click()
	var/mob/living/user = loc
	if(!isliving(user))
		return

	if(user.throwing)
		return // User is already being thrown

	if(recharging_time > world.time)
		to_chat(user, "<span class='warning'>Система импульса джет-ботинок перезаряжается!</span>")
		return

	var/atom/target = get_edge_target_turf(user, user.dir) //gets the user's direction

	playsound(src, 'sound/effects/stealthoff.ogg', 50, 1, 1)
	user.visible_message("<span class='warning'>[user] бросается вперёд!</span>")
	user.throw_at(target, jumpdistance, jumpspeed)
	recharging_time = world.time + recharging_rate

/obj/item/clothing/shoes/magboots/adv
	name = "улучшенные магнитные ботинки"
	desc = "Усовершенствованные магнитные ботинки для продвинутых пользователей. В них слабее магнитное сцепление, что позволяет носителю передвигаться быстрее."
	icon = 'icons/obj/clothing/shoes_vr.dmi'
	icon_override = 'icons/mob/feet_vr.dmi'

	icon_state = "advmag0"
	item_flags = PHORONGUARD
	item_state_slots = list(slot_r_hand_str = "magboots", slot_l_hand_str = "magboots")
	icon_base = "advmag"

/obj/item/clothing/shoes/magboots/adv/set_slowdown()
	if(magpulse)
		slowdown = shoes ? max(SHOES_SLOWDOWN, shoes.slowdown) : SHOES_SLOWDOWN	//So you can't put on magboots to make you walk faster.
	else if(shoes)
		slowdown = shoes.slowdown
	else
		slowdown = SHOES_SLOWDOWN

// Armor Versions Here
/obj/item/clothing/shoes/knight
	name = "рыцарские ботинки"
	desc = "Пара древних рыцарских ботинок."
	icon_state = "knight_boots1"
	item_state = "knight_boots1"
	icon = 'icons/obj/clothing/shoes_vr.dmi'
	icon_override = 'icons/obj/clothing/shoes_vr.dmi'
	armor = list(melee = 80, bullet = 50, laser = 10, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/shoes/knight/black
	name = "рыцарские ботинки"
	desc = "Пара древних рыцарских ботинок."
	icon_state = "knight_boots2"
	item_state = "knight_boots2"

// Costume Versions Here
/obj/item/clothing/shoes/knight_costume
	name = "рыцарские ботинки"
	desc = "Пара древних рыцарских ботинок."
	icon_state = "knight_boots1"
	item_state = "knight_boots1"
	icon = 'icons/obj/clothing/shoes_vr.dmi'
	icon_override = 'icons/obj/clothing/shoes_vr.dmi'

/obj/item/clothing/shoes/knight_costume/black
	name = "knight boots"
	desc = "Пара древних рыцарских ботинок."
	icon_state = "knight_boots2"
	item_state = "knight_boots2"