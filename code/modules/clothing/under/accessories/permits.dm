//This'll be used for gun permits, such as for heads of staff, antags, and bartenders

/obj/item/clothing/accessory/permit
	name = "лицензия"
	desc = "Лицензия на что-либо."
	icon = 'icons/obj/card.dmi'
	icon_state = "permit"
	w_class = ITEMSIZE_TINY
	slot = ACCESSORY_SLOT_MEDAL
	var/owner = 0	//To prevent people from just renaming the thing if they steal it

/obj/item/clothing/accessory/permit/attack_self(mob/user as mob)
	if(isliving(user))
		if(!owner)
			set_name(user.name)
			to_chat(user, "[src] записывается на Ваше имя.")
		else
			to_chat(user, "[src] уже имеет владельца!")

/obj/item/clothing/accessory/permit/proc/set_name(var/new_name)
	owner = 1
	if(new_name)
		src.name += " ([new_name])"
		desc += " Принадлежит [new_name]."

/obj/item/clothing/accessory/permit/emag_act(var/remaining_charges, var/mob/user)
	to_chat(user, "Вы перенастраиваете именной механизм!")
	owner = 0

/obj/item/clothing/accessory/permit/gun
	name = "лицензия на оружие"
	desc = "Карточка, дающая владельцу право на ношение огнестрельного оружия."

/obj/item/clothing/accessory/permit/gun/bar
	name = "лицензия на барный дробовик"
	desc = "Карточка, дающая владельцу право на ношение дробовика в баре."

/obj/item/clothing/accessory/permit/gun/planetside
	name = "лицензия на оружие на планете"
	desc = "Карточка, дающая владельцу право на ношение огнестрельного оружия при выходе на поверхность."

/obj/item/clothing/accessory/permit/drone
	name = "карта идентификации дрона"
	desc = "Карточка, изготавливаемая EIO. Означает, что носитель является дроном. По закону, дроны обязуются иметь при себе эту карту на территории Сол."
	icon_state = "permit_drone"