/obj/item/weapon/paper_bin
	name = "paper bin"
	desc = "Пластиковая корзина с бумагой. Вроде бы есть и обычная, и копировальная бумага на выбор."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "paper_bin1"
	item_icons = list(
			slot_l_hand_str = 'icons/mob/items/lefthand_material.dmi',
			slot_r_hand_str = 'icons/mob/items/righthand_material.dmi',
			)
	item_state = "sheet-metal"
	throwforce = 1
	w_class = ITEMSIZE_NORMAL
	throw_speed = 3
	throw_range = 7
	pressure_resistance = 10
	layer = OBJ_LAYER - 0.1
	var/amount = 30					//How much paper is in the bin.
	var/list/papers = new/list()	//List of papers put in the bin for reference.
	drop_sound = 'sound/items/drop/cardboardbox.ogg'
	pickup_sound = 'sound/items/pickup/cardboardbox.ogg'


/obj/item/weapon/paper_bin/MouseDrop(mob/user as mob)
	if(user == usr && !(usr.restrained() || usr.stat) && (usr.contents.Find(src) || in_range(src, usr)))
		if(!istype(usr, /mob/living/simple_mob))
			if( !usr.get_active_hand() )		//if active hand is empty
				var/mob/living/carbon/human/H = user
				var/obj/item/organ/external/temp = H.organs_by_name["r_hand"]

				if (H.hand)
					temp = H.organs_by_name["l_hand"]
				if(temp && !temp.is_usable())
					to_chat(user, "<span class='notice'>Вы пытаетесь переместить [temp.name], но не можете!</span>")
					return

				to_chat(user, "<span class='notice'>Вы берете [src].</span>")
				user.put_in_hands(src)

	return

/obj/item/weapon/paper_bin/attack_hand(mob/user as mob)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/organ/external/temp = H.organs_by_name["r_hand"]
		if (H.hand)
			temp = H.organs_by_name["l_hand"]
		if(temp && !temp.is_usable())
			to_chat(user, "<span class='notice'>You try to move your [temp.name], but cannot!</span>")
			return
	var/response = ""
	if(!papers.len > 0)
		response = alert(user, "Вы берете обычную бумагу или копировальную бумагу?", "Paper type request", "Обычная", "Копировальная", "Отмена")
		if (response != "Обычная" && response != "Копировальная")
			add_fingerprint(user)
			return
	if(amount >= 1)
		amount--
		if(amount==0)
			update_icon()

		var/obj/item/weapon/paper/P
		if(papers.len > 0)	//If there's any custom paper on the stack, use that instead of creating a new paper.
			P = papers[papers.len]
			papers.Remove(P)
		else
			if(response == "Обычная")
				P = new /obj/item/weapon/paper
				if(Holiday == "April Fool's Day")
					if(prob(30))
						P.info = "<font face=\"[P.crayonfont]\" color=\"red\"><b>HONK HONK HONK HONK HONK HONK HONK<br>HOOOOOOOOOOOOOOOOOOOOOONK<br>APRIL FOOLS</b></font>"
						P.rigged = 1
						P.updateinfolinks()
			else if (response == "Копировальная")
				P = new /obj/item/weapon/paper/carbon

		P.loc = user.loc
		user.put_in_hands(P)
		to_chat(user, "<span class='notice'>Вы взяли [P] из [src].</span>")
	else
		to_chat(user, "<span class='notice'>[src] пуст!</span>")

	add_fingerprint(user)
	return


/obj/item/weapon/paper_bin/attackby(obj/item/weapon/paper/i as obj, mob/user as mob)
	if(!istype(i))
		return

	user.drop_item()
	i.loc = src
	to_chat(user, "<span class='notice'>Вы положили [i] в [src].</span>")
	papers.Add(i)
	update_icon()
	amount++


/obj/item/weapon/paper_bin/examine(mob/user)
	. = ..()
	if(Adjacent(user))
		if(amount)
			. += "<span class='notice'>В корзине осталось " + (amount > 1 ? "[amount] листов бугами" : "ровно на один раз") + ".</span>"
		else
			. += "<span class='notice'>В корзине нет бумаг.</span>"

/obj/item/weapon/paper_bin/update_icon()
	if(amount < 1)
		icon_state = "paper_bin0"
	else
		icon_state = "paper_bin1"
