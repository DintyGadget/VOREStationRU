/obj/item/clothing/accessory/locket
	name = "серебряный медальон"
	desc = "Небольшой медальон из высококачественного металла."
	icon_state = "locket"
	drop_sound = 'sound/items/drop/ring.ogg'
	pickup_sound = 'sound/items/pickup/ring.ogg'
	w_class = ITEMSIZE_SMALL
	slot_flags = SLOT_MASK | SLOT_TIE
	slot = ACCESSORY_SLOT_DECOR
	var/base_icon
	var/open
	var/obj/item/held //Item inside locket.

/obj/item/clothing/accessory/locket/attack_self(mob/user as mob)
	if(!base_icon)
		base_icon = icon_state

	if(!("[base_icon]_open" in cached_icon_states(icon)))
		to_chat(user, "Это [src] закрыт.")
		return

	open = !open
	to_chat(user, "Вы [open?"раскрываете":"закрываете"] медальон.")
	if(open)
		icon_state = "[base_icon]_open"
		if(held)
			to_chat(user, "Из медальона выпадает [held]!")
			held.loc = get_turf(user)
			held = null
	else
		icon_state = "[base_icon]"

/obj/item/clothing/accessory/locket/attackby(var/obj/item/O as obj, mob/user as mob)
	if(!open)
		to_chat(user, "Необходимо сперва открыть медальон.")
		return

	if(istype(O,/obj/item/weapon/paper) || istype(O, /obj/item/weapon/photo))
		if(held)
			to_chat(usr, "Этот [src] уже содержит что-то внутри.")
		else
			to_chat(usr, "Вы помещаете [O] в [src].")
			user.drop_item()
			O.loc = src
			held = O
		return
	..()
