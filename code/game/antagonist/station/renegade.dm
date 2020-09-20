var/datum/antagonist/renegade/renegades

/datum/antagonist/renegade
	id = MODE_RENEGADE
	role_type = BE_RENEGADE
	role_text = "Renegade"
	role_text_plural = "Renegades"
	bantype = "renegade"
	avoid_silicons = TRUE
	welcome_text = "Что-то сегодня пойдет не так, вы можете просто почувствовать это. Вы параноик, у вас есть пистолет, и вы выживете."
	antag_sound = 'sound/effects/antag_notice/general_goodie_alert.ogg'
	antag_text = "Вы <b>второстепенный</b> антагонист! В рамках правил постарайтесь защитить себя и то, что для вас важно. Вы здесь не для того, \
		чтобы создавать проблемы, вы просто более готовы пойти на крайности, чтобы остановить беспредел, чем другие. \
		Ваша задача - противостоять другим антагонистам, если они угрожают вам, не совсем законными способами. \
		Постарайтесь, чтобы другие игроки тоже <i>развлекались от вашей игры</i>! Если вы запутались или растерялись, всегда обращайтесь за помощью к администратору, \
		а прежде чем предпринимать крайние меры, попробуйте также связаться с администрацией! \
		Продумайте свои действия и сделайте ролевую игру захватывающей! <b>Пожалуйста, помните, что все правила, \
		кроме некоторых, без явных исключений, применяются к антагонистам.</b>"
	flags = ANTAG_SUSPICIOUS | ANTAG_IMPLANT_IMMUNE | ANTAG_RANDSPAWN | ANTAG_VOTABLE
	can_speak_aooc = FALSE	// They aren't 'true' antags, but they still need to hear blanket antag instructions

	hard_cap = 8
	hard_cap_round = 12
	initial_spawn_req = 2
	initial_spawn_target = 4

	var/list/spawn_guns = list(
		/obj/item/weapon/gun/energy/laser,
		/obj/item/weapon/gun/energy/captain,
		/obj/item/weapon/gun/energy/lasercannon,
		/obj/item/weapon/gun/energy/xray,
		/obj/item/weapon/gun/energy/gun,
		/obj/item/weapon/gun/energy/gun/burst,
		/obj/item/weapon/gun/energy/gun/nuclear,
		/obj/item/weapon/gun/energy/crossbow,
		/obj/item/weapon/gun/energy/crossbow/largecrossbow,
		/obj/item/weapon/gun/projectile/automatic,
		/obj/item/weapon/gun/projectile/automatic/mini_uzi,
		/obj/item/weapon/gun/projectile/automatic/c20r,
		/obj/item/weapon/gun/projectile/automatic/sts35,
		/obj/item/weapon/gun/projectile/automatic/bullpup,
		/obj/item/weapon/gun/projectile/automatic/wt550,
		/obj/item/weapon/gun/projectile/automatic/z8,
		/obj/item/weapon/gun/projectile/automatic/tommygun,
		/obj/item/weapon/gun/projectile/colt/detective,
		/obj/item/weapon/gun/projectile/sec/wood,
		/obj/item/weapon/gun/projectile/silenced,
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/p92x,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/gun/projectile/derringer,
		/obj/item/weapon/gun/projectile/shotgun/pump,
		/obj/item/weapon/gun/projectile/shotgun/pump/rifle,
		/obj/item/weapon/gun/projectile/shotgun/pump/combat,
		/obj/item/weapon/gun/projectile/shotgun/doublebarrel,
		/obj/item/weapon/gun/projectile/revolver/judge,
		/obj/item/weapon/gun/projectile/revolver/lemat,
		list(/obj/item/weapon/gun/projectile/shotgun/doublebarrel/pellet, /obj/item/weapon/gun/projectile/shotgun/doublebarrel/sawn),
		list(/obj/item/weapon/gun/projectile/deagle, /obj/item/weapon/gun/projectile/deagle/gold, /obj/item/weapon/gun/projectile/deagle/camo),
		list(/obj/item/weapon/gun/projectile/revolver/detective, /obj/item/weapon/gun/projectile/revolver/deckard),
		list(/obj/item/weapon/gun/projectile/luger,/obj/item/weapon/gun/projectile/luger/brown)
		)

/datum/antagonist/renegade/New()
	..()
	renegades = src

/datum/antagonist/renegade/create_objectives(var/datum/mind/player)

	if(!..())
		return

	var/datum/objective/survive/survive = new
	survive.owner = player
	player.objectives |= survive

/datum/antagonist/renegade/equip(var/mob/living/carbon/human/player)

	if(!..())
		return

	var/gun_type = pick(spawn_guns)
	if(islist(gun_type))
		gun_type = pick(gun_type)
	var/obj/item/gun = new gun_type(get_turf(player))

	// Attempt to put into a container.
	if(player.equip_to_storage(gun))
		return

	// If that failed, attempt to put into any valid non-handslot
	if(player.equip_to_appropriate_slot(gun))
		return

	// If that failed, then finally attempt to at least let the player carry the weapon
	player.put_in_hands(gun)


/proc/rightandwrong()
	to_chat(usr, "<B>Вы вызвали пушки!</B>")
	message_admins("[key_name_admin(usr, 1)] вызывает пушки!")
	for(var/mob/living/carbon/human/H in player_list)
		if(H.stat == 2 || !(H.client)) continue
		if(is_special_character(H)) continue
		renegades.add_antagonist(H.mind)
