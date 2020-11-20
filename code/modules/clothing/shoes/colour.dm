
/obj/item/clothing/shoes/black
	name = "Чёрные кроссовки"
	icon_state = "black"
	desc = "Пара кроссовок чёрного цвета."

/obj/item/clothing/shoes/brown
	name = "Коричневые кроссовки"
	desc = "Пара кроссовок коричневого цвета."
	icon_state = "brown"

/obj/item/clothing/shoes/blue
	name = "Синие кроссовки"
	desc = "Пара кроссовок синего цвета."
	icon_state = "blue"

/obj/item/clothing/shoes/green
	name = "Зелёные кроссовки"
	desc = "Пара кроссовок зелёного цвета."
	icon_state = "green"

/obj/item/clothing/shoes/yellow
	name = "Жёлтые кроссовки"
	desc = "Пара кроссовок жёлтого цвета."
	icon_state = "yellow"

/obj/item/clothing/shoes/purple
	name = "Фиолетовые кроссовки"
	desc = "Пара кроссовок фиолетового цвета."
	icon_state = "purple"

/obj/item/clothing/shoes/red
	name = "Красные кроссовки"
	desc = "Пара кроссовок красного цвета."
	icon_state = "red"

/obj/item/clothing/shoes/white
	name = "Белые кроссовки"
	desc = "Пара кроссовок белого цвета."
	icon_state = "white"
	permeability_coefficient = 0.01

/obj/item/clothing/shoes/rainbow
	name = "Радужные кроссовки"
	desc = "Пара ярких разноцветных кроссовок."
	icon_state = "rain_bow"

/obj/item/clothing/shoes/flats
	name = "Чёрные балетки"
	desc = "Стильные чёрные балетки."
	icon_state = "flatsblack"
	item_state_slots = list(slot_r_hand_str = "black", slot_l_hand_str = "black")

/obj/item/clothing/shoes/flats/white
	name = "Белые балетки"
	desc = "Яркие белые балетки."
	icon_state = "flatswhite"
	addblends = "flatswhite_a"
	item_state_slots = list(slot_r_hand_str = "white", slot_l_hand_str = "white")

/obj/item/clothing/shoes/flats/white/color
	name = "Балетки"
	desc = "Стильные балетки."

/obj/item/clothing/shoes/flats/red
	name = "Красные балетки"
	desc = "Балетки рубинового красного цвета."
	icon_state = "flatsred"
	item_state_slots = list(slot_r_hand_str = "red", slot_l_hand_str = "red")

/obj/item/clothing/shoes/flats/purple
	name = "Фиолетовые балетки"
	desc = "Балетки королевского фиолетового цвета."
	icon_state = "flatspurple"
	item_state_slots = list(slot_r_hand_str = "purple", slot_l_hand_str = "purple")

/obj/item/clothing/shoes/flats/blue
	name = "Синие балетки"
	desc = "Яркие синие балетки."
	icon_state = "flatsblue"
	item_state_slots = list(slot_r_hand_str = "blue", slot_l_hand_str = "blue")

/obj/item/clothing/shoes/flats/brown
	name = "Коричневые балетки"
	desc = "Яркие балетки коричневого цвета."
	icon_state = "flatsbrown"
	item_state_slots = list(slot_r_hand_str = "brown", slot_l_hand_str = "brown")

/obj/item/clothing/shoes/flats/orange
	name = "Оранжевые балетки"
	desc = "Блестящие балетки оранжевого цвета."
	icon_state = "flatsorange"
	item_state_slots = list(slot_r_hand_str = "orange", slot_l_hand_str = "orange")

/obj/item/clothing/shoes/orange
	name = "Оранжевые кроссовки"
	desc = "Пара кроссовок оранжевого цвета."
	icon_state = "orange"
	var/obj/item/weapon/handcuffs/chained = null

/obj/item/clothing/shoes/orange/proc/attach_cuffs(var/obj/item/weapon/handcuffs/cuffs, mob/user as mob)
	if (chained) return

	user.drop_item()
	cuffs.loc = src
	chained = cuffs
	slowdown = 15
	icon_state = "orange1"

/obj/item/clothing/shoes/orange/proc/remove_cuffs(mob/user as mob)
	if (!chained) return

	user.put_in_hands(chained)
	chained.add_fingerprint(user)

	slowdown = initial(slowdown)
	icon_state = "orange"
	chained = null

/obj/item/clothing/shoes/orange/attack_self(mob/user as mob)
	..()
	remove_cuffs(user)

/obj/item/clothing/shoes/orange/attackby(H as obj, mob/user as mob)
	..()
	if (istype(H, /obj/item/weapon/handcuffs))
		attach_cuffs(H, user)

/obj/item/clothing/shoes/hitops
	name = "Охотничьи ботинки"
	desc = "Пара ботинок, достигающих дальше лодыжек. Основаны на не выходящем из моды дизайне многовековой давности."
	icon_state = "whitehi"

/obj/item/clothing/shoes/hitops/red
	name = "Красные охотничьи ботинки"
	icon_state = "redhi"

/obj/item/clothing/shoes/hitops/brown
	name = "Коричневые охотничьи ботинки"
	icon_state = "brownhi"

/obj/item/clothing/shoes/hitops/black
	name = "Чёрные охотничьи ботинки"
	icon_state = "blackhi"

/obj/item/clothing/shoes/hitops/orange
	name = "Оранжевые охотничьи ботинки"
	icon_state = "orangehi"

/obj/item/clothing/shoes/hitops/blue
	name = "Синие охотничьи ботинки"
	icon_state = "bluehi"

/obj/item/clothing/shoes/hitops/green
	name = "Зелёные охотничьи ботинки"
	icon_state = "greenhi"

/obj/item/clothing/shoes/hitops/purple
	name = "Фиолетовые охотничьи ботинки"
	icon_state = "purplehi"

/obj/item/clothing/shoes/hitops/yellow
	name = "Жёлтые охотничьи ботинки"
	icon_state = "yellowhi"