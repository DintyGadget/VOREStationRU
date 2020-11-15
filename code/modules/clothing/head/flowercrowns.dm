/obj/item/clothing/head/woodcirclet
	name = "деревянный венец"
	desc = "Небольшой деревянный венец для изготовления цветочных венков."
	icon_state = "woodcirclet"
	w_class = ITEMSIZE_SMALL
	body_parts_covered = 0

/obj/item/clothing/head/woodcirclet/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/complete
	if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown))
		var/obj/item/weapon/reagent_containers/food/snacks/grown/G = W
		if(G.seed.kitchen_tag == "poppy")
			to_chat(user, "Вы обвиваете обруч маком и создаёте прекрасный цветочный венок.")
			complete = new /obj/item/clothing/head/poppy_crown(get_turf(user))
		else if(G.seed.kitchen_tag == "sunflower")
			to_chat(user, "Вы обвиваете обруч подсолнухами и создаёте прекрасный цветочный венок.")
			complete = new /obj/item/clothing/head/sunflower_crown(get_turf(user))
		else if(G.seed.kitchen_tag == "lavender")
			to_chat(user, "Вы обвиваете обруч лавандой и создаёте прекрасный цветочный венок.")
			complete = new /obj/item/clothing/head/lavender_crown(get_turf(user))
		else if(G.seed.kitchen_tag == "rose")
			to_chat(user, "Вы обвиваете обруч розами и создаёте прекрасный цветочный венок.")
			complete = new /obj/item/clothing/head/rose_crown(get_turf(user))
		user.drop_from_inventory(W)
		user.drop_from_inventory(src)
		qdel(W)
		qdel(src)
		user.put_in_hands(complete)
		return
	return ..()

//Flower crowns

/obj/item/clothing/head/sunflower_crown
	name = "подсолнечный венок"
	desc = "Цветочный венок, обвитый подсолнухами."
	icon_state = "sunflower_crown"
	body_parts_covered = 0
	drop_sound = 'sound/items/drop/herb.ogg'
	pickup_sound = 'sound/items/pickup/herb.ogg'

/obj/item/clothing/head/lavender_crown
	name = "лавандовый венок"
	desc = "Цветочный венок, обвитый лавандой."
	icon_state = "lavender_crown"
	body_parts_covered = 0
	drop_sound = 'sound/items/drop/herb.ogg'
	pickup_sound = 'sound/items/pickup/herb.ogg'

/obj/item/clothing/head/poppy_crown
	name = "маковый венок"
	desc = "Цветочный венок, обвитый маком."
	icon_state = "poppy_crown"
	body_parts_covered = 0
	drop_sound = 'sound/items/drop/herb.ogg'
	pickup_sound = 'sound/items/pickup/herb.ogg'

/obj/item/clothing/head/rose_crown
	name = "розовый венок"
	desc = "Цветочный венок, обвитый розами."
	icon_state = "poppy_crown"
	body_parts_covered = 0
	drop_sound = 'sound/items/drop/herb.ogg'
	pickup_sound = 'sound/items/pickup/herb.ogg'
