/obj/item/clothing/gloves/ring/wedding
	name = "Золотое свадебное кольцо"
	desc = "Подтверждает верность другому человеку. Сверкает золотыми бликами."
	icon = 'icons/obj/clothing/gloves_vr.dmi'
	icon_state = "wedring_g"
	item_state = "wedring_g"
	var/partnername = ""

/obj/item/clothing/gloves/ring/wedding/attack_self(mob/user)
	partnername = copytext_char(sanitize(input(user, "Хотите ли Вы изменить голографическую надпись на кольце?", "Введите своего супруга/супруга.", "Солнышко") as null|text),1,MAX_NAME_LEN)
	name = "[initial(name)] ([partnername])"
	ncase = "[initial(ncase)] ([partnername])"
	gcase = "[initial(gcase)] ([partnername])"
	dcase = "[initial(dcase)] ([partnername])"
	acase = "[initial(acase)] ([partnername])"
	icase = "[initial(icase)] ([partnername])"
	pcase = "[initial(pcase)] ([partnername])"

/obj/item/clothing/gloves/ring/wedding/silver
	name = "Серебряное свадебное кольцо"
	desc = "Подтверждает верность другому человеку. Сверкает серебряными бликами."
	icon_state = "wedring_s"
	item_state = "wedring_s"
