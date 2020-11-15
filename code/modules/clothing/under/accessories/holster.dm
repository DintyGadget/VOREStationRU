/obj/item/clothing/accessory/holster
	name = "наплечная кобура"
	desc = "Кобура для пистолета."
	icon_state = "holster"
	slot = ACCESSORY_SLOT_WEAPON
	concealed_holster = 1
	var/obj/item/holstered = null
	var/list/can_hold //VOREStation Add
	var/holster_in = 'sound/items/holsterin.ogg'
	var/holster_out = 'sound/items/holsterout.ogg'

/obj/item/clothing/accessory/holster/proc/holster(var/obj/item/I, var/mob/living/user)
	if(holstered && istype(user))
		to_chat(user, "<span class='warning'>В кобуре уже находится [holstered]!</span>")
		return
	//VOREStation Edit - Machete sheath support
	if (LAZYLEN(can_hold))
		if(!is_type_in_list(I,can_hold))
			to_chat(user, "<span class='warning'>[I] не помещается в кобуру!</span>")
			return

	else if (!(I.slot_flags & SLOT_HOLSTER))
	//VOREStation Edit End
		to_chat(user, "<span class='warning'>[I] не помещается в кобуру!</span>")
		return

	if(holster_in)
		playsound(src, holster_in, 50)

	if(istype(user))
		user.stop_aiming(no_message=1)
	holstered = I
	user.drop_from_inventory(holstered)
	holstered.loc = src
	holstered.add_fingerprint(user)
	w_class = max(w_class, holstered.w_class)
	user.visible_message("<span class='notice'>[user] помещает [holstered] в кобуру.</span>", "<span class='notice'>Вы помещаете [holstered] в кобуру.</span>")
	name = "occupied [initial(name)]"

/obj/item/clothing/accessory/holster/proc/clear_holster()
	holstered = null
	name = initial(name)

/obj/item/clothing/accessory/holster/proc/unholster(mob/user as mob)
	if(!holstered)
		return

	if(istype(user.get_active_hand(),/obj) && istype(user.get_inactive_hand(),/obj))
		to_chat(user, "<span class='warning'>Чтобы спрятать [holstered] в кобуру, одна рука должна быть свободной!</span>")
	else
		var/sound_vol = 25
		if(user.a_intent == I_HURT)
			sound_vol = 50
			usr.visible_message(
				"<span class='danger'>[user] угрожающе достает [holstered] из кобуры!</span>", //VOREStation Edit
				"<span class='warning'>Вы угрожающе достаете [holstered] из кобуры!</span>" //VOREStation Edit
				)
		else
			user.visible_message(
				"<span class='notice'>[user] достает [holstered] из кобуры острием к земле.</span>",
				"<span class='notice'>Вы достаете [holstered] из кобуры острием к земле.</span>"
				)

		if(holster_out)
			playsound(src, holster_out, sound_vol)

		user.put_in_hands(holstered)
		holstered.add_fingerprint(user)
		w_class = initial(w_class)
		clear_holster()

/obj/item/clothing/accessory/holster/attack_hand(mob/user as mob)
	if (has_suit && (slot & ACCESSORY_SLOT_UTILITY))	//if we are part of a suit
		if (holstered)
			unholster(user)
		return

	..(user)

/obj/item/clothing/accessory/holster/attackby(obj/item/W as obj, mob/user as mob)
	holster(W, user)

/obj/item/clothing/accessory/holster/emp_act(severity)
	if (holstered)
		holstered.emp_act(severity)
	..()

/obj/item/clothing/accessory/holster/examine(mob/user)
	. = ..(user)
	if(holstered)
		. += "Внутри находится [holstered]."
	else
		. += "Внутри пусто."

/obj/item/clothing/accessory/holster/on_attached(obj/item/clothing/under/S, mob/user as mob)
	..()
	if(has_suit)
		has_suit.verbs += /obj/item/clothing/accessory/holster/verb/holster_verb

/obj/item/clothing/accessory/holster/on_removed(mob/user as mob)
	if(has_suit)
		has_suit.verbs -= /obj/item/clothing/accessory/holster/verb/holster_verb
	..()

//For the holster hotkey
/obj/item/clothing/accessory/holster/verb/holster_verb()
	set name = "Кобура"
	set category = "Object"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.stat) return

	//can't we just use src here?
	var/obj/item/clothing/accessory/holster/H = null
	if (istype(src, /obj/item/clothing/accessory/holster))
		H = src
	else if (istype(src, /obj/item/clothing/under))
		var/obj/item/clothing/under/S = src
		if (LAZYLEN(S.accessories))
			H = locate() in S.accessories

	if (!H)
		to_chat(usr, "<span class='warning'>Что-то тут не так.</span>")

	if(!H.holstered)
		var/obj/item/W = usr.get_active_hand()
		if(!istype(W, /obj/item))
			to_chat(usr, "<span class='warning'>Чтобы сложить оружие в кобуру, нужно сперва иметь его в руках.</span>")
			return
		H.holster(W, usr)
	else
		H.unholster(usr)

/obj/item/clothing/accessory/holster/armpit
	name = "кобура под мышки"
	desc = "Поношенная кобура для пистолета. Отлично подходит для скрытого ношения."
	icon_state = "holster"

/obj/item/clothing/accessory/holster/waist
	name = "кобура на талию"
	desc = "Кобура для пистолета из дорогой кожи."
	icon_state = "holster"
	overlay_state = "holster_low"
	concealed_holster = 0

/obj/item/clothing/accessory/holster/hip
	name = "набедренная кобура"
	desc = "Пистолетная кобура, опущенная до бедер."
	icon_state = "holster_hip"
	concealed_holster = 0

/obj/item/clothing/accessory/holster/leg
	name = "ножная кобура"
	desc = "Тактическая кобура для пистолета. Надевается на ногу."
	icon_state = "holster_leg"
	overlay_state = "holster_leg"
	concealed_holster = 0
