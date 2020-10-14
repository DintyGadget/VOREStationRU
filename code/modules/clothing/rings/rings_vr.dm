/obj/item/clothing/gloves/ring/wedding
	name = "золотое свадебное кольцо"
	desc = "Подтверждает верность другому человек. Сверкает золотыми бликами."
	icon = 'icons/obj/clothing/gloves_vr.dmi'
	icon_state = "wedring_g"
	item_state = "wedring_g"
	var/partnername = ""

/obj/item/clothing/gloves/ring/wedding/attack_self(mob/user)
	partnername = copytext_char(sanitize(input(user, "Хотите ли Вы изменить голографическую надпись на кольцо?", "Введите своего супруга/супруга.", "Солнышко") as null|text),1,MAX_NAME_LEN)
	name = "[initial(name)] - [partnername]"

/obj/item/clothing/gloves/ring/wedding/silver
	name = "серебряное свадебное кольцо"
	desc = "Подтверждает верность другому человек. Сверкает серебряными бликами."
	icon_state = "wedring_s"
	item_state = "wedring_s"
