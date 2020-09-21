/obj/item/weapon/lipstick
	gender = PLURAL
	name = "red lipstick"
	desc = "Универсальная Марка губной помады."
	icon = 'icons/obj/items.dmi'
	icon_state = "lipstick"
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_EARS
	var/colour = "red"
	var/open = 0
	drop_sound = 'sound/items/drop/glass.ogg'
	pickup_sound = 'sound/items/pickup/glass.ogg'

/obj/item/weapon/lipstick/purple
	name = "purple lipstick"
	colour = "purple"

/obj/item/weapon/lipstick/jade
	name = "jade lipstick"
	colour = "jade"

/obj/item/weapon/lipstick/black
	name = "black lipstick"
	colour = "black"

/obj/item/weapon/lipstick/random
	name = "lipstick"

/obj/item/weapon/lipstick/random/New()
	colour = pick("red","purple","jade","black")
	name = "[colour] lipstick"

/obj/item/weapon/lipstick/attack_self(mob/user as mob)
	to_chat(user, "<span class='notice'>Вы [open ? "закрываете" : "открываете"] [src].</span>")
	open = !open
	if(open)
		icon_state = "[initial(icon_state)]_[colour]"
	else
		icon_state = initial(icon_state)

/obj/item/weapon/lipstick/attack(mob/M as mob, mob/user as mob)
	if(!open)	return

	if(!istype(M, /mob))	return

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.lip_style)	//if they already have lipstick on
			to_chat(user, "<span class='notice'>Сначала нужно стереть старую помаду!</span>")
			return
		if(H == user)
			user.visible_message("<span class='notice'>[user] красит губы с помощью [src].</span>", \
								 "<span class='notice'>Вы применяете [src]. Идеально!</span>")
			H.lip_style = colour
			H.update_icons_body()
		else
			user.visible_message("<span class='warning'>[user] начинает красить губы [H] с помощью [src].</span>", \
								 "<span class='notice'>Вы применяете [src].</span>")
			if(do_after(user, 20) && do_after(H, 20, 5, 0))	//user needs to keep their active hand, H does not.
				user.visible_message("<span class='notice'>[user] красит губы [H] [src].</span>", \
									 "<span class='notice'>Вы применяете [src].</span>")
				H.lip_style = colour
				H.update_icons_body()
	else
		to_chat(user, "<span class='notice'>Где на этом губы?</span>")

//you can wipe off lipstick with paper! see code/modules/paperwork/paper.dm, paper/attack()

/obj/item/weapon/haircomb //sparklysheep's comb
	name = "purple comb"
	desc = "Нетронутая фиолетовая расческа из гибкого пластика."
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_EARS
	icon = 'icons/obj/items.dmi'
	icon_state = "purplecomb"

/obj/item/weapon/haircomb/attack_self(mob/living/user)
	var/text = "person"
	if(ishuman(user))
		var/mob/living/carbon/human/U = user
		switch(U.identifying_gender)
			if(MALE)
				text = "guy"
			if(FEMALE)
				text = "lady"
	else
		switch(user.gender)
			if(MALE)
				text = "guy"
			if(FEMALE)
				text = "lady"
	user.visible_message("<span class='notice'>[user] uses [src] to comb their hair with incredible style and sophistication. What a [text].</span>")

/obj/item/weapon/makeover
	name = "makeover kit"
	desc = "Крошечный футляр с зеркалом и контактными линзами."
	w_class = ITEMSIZE_TINY
	icon = 'icons/obj/items.dmi'
	icon_state = "trinketbox"
	var/datum/tgui_module/appearance_changer/mirror/coskit/M

/obj/item/weapon/makeover/Initialize()
	. = ..()
	M = new(src, null)

/obj/item/weapon/makeover/attack_self(mob/living/carbon/user as mob)
	if(ishuman(user))
		to_chat(user, "<span class='notice'>Вы открываете [src] и начинаете корректировать свой внешний вид.</span>")
		M.tgui_interact(user)
		var/mob/living/carbon/human/H = user
		var/obj/item/organ/internal/eyes/E = H.internal_organs_by_name[O_EYES]
		if(istype(E))
			E.change_eye_color()