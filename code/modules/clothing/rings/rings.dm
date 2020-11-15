//Generic Ring

/obj/item/clothing/gloves/ring
	name = "обычное кольцо"
	desc = "Украшение тороидальной формы."
	icon_state = "material"
	drop_sound = 'sound/items/drop/ring.ogg'

/////////////////////////////////////////
//Standard Rings
/obj/item/clothing/gloves/ring/engagement
	name = "обручальное кольцо"
	desc = "Обручальное кольцо. Выглядит довольно дорого."
	icon_state = "diamond"

/obj/item/clothing/gloves/ring/engagement/attack_self(mob/user)
	user.visible_message("<span class='warning'>[user] становится на колено, показывая [src].</span>","<span class='warning'>Вы становитесь на колено, показывая [src].</span>")

/obj/item/clothing/gloves/ring/cti
	name = "кольцо CTI"
	desc = "Памятное кольцо выпускника университета CTI."
	icon_state = "cti-grad"

/obj/item/clothing/gloves/ring/mariner
	name = "кольцо Mariner University"
	desc = "Памятное кольцо выпускника Mariner University."
	icon_state = "mariner-grad"


/////////////////////////////////////////
//Reagent Rings

/obj/item/clothing/gloves/ring/reagent
	flags = OPENCONTAINER
	origin_tech = list(TECH_MATERIAL = 2, TECH_ILLEGAL = 4)

/obj/item/clothing/gloves/ring/reagent/New()
	..()
	create_reagents(15)

/obj/item/clothing/gloves/ring/reagent/equipped(var/mob/living/carbon/human/H)
	..()
	if(istype(H) && H.gloves==src)

		if(reagents.total_volume)
			to_chat(H, "<span class='danger'>Надевая [src], Вы чувствуете укол.</span>")
			if(H.reagents)
				var/contained = reagents.get_reagents()
				var/trans = reagents.trans_to_mob(H, 15, CHEM_BLOOD)
				add_attack_logs(usr, H, "[name] вводит [trans] units [contained]")
	return

//Sleepy Ring
/obj/item/clothing/gloves/ring/reagent/sleepy
	name = "серебряное кольцо"
	desc = "Кольцо, кажущееся на вид серебряным."
	icon_state = "material"
	origin_tech = list(TECH_MATERIAL = 2, TECH_ILLEGAL = 5)

/obj/item/clothing/gloves/ring/reagent/sleepy/New()
	..()
	reagents.add_reagent("chloralhydrate", 15) // Less than a sleepy-pen, but still enough to knock someone out

/////////////////////////////////////////
//Seals and Signet Rings
/obj/item/clothing/gloves/ring/seal/secgen
	name = "официальная печать Генерального Секретаря"
	desc = "Официальная печать Генерального Секретаря Центрального Правительства Сол украшает это кольцо."
	icon_state = "seal-secgen"

/obj/item/clothing/gloves/ring/seal/mason
	name = "масонское кольцо"
	desc = "На этом масонском кольце изображены циркуль и наугольник."
	icon_state = "seal-masonic"

/obj/item/clothing/gloves/ring/seal/signet
	name = "кольцо-печатка"
	desc = "Кольцо-печатка, для случаев, когда подписывать письма ручкой Вам кажется недостаточно изощрённым делом."
	icon_state = "seal-signet"
	var/nameset = FALSE

/obj/item/clothing/gloves/ring/seal/signet/attack_self(mob/user)
	if(nameset)
		to_chat(user, "<span class='notice'>[src] уже принадлежит кому-то!</span>")
		return

	to_chat(user, "<span class='notice'>[src] теперь принадлежит Вам!</span>")
	change_name(user)
	nameset = TRUE

/obj/item/clothing/gloves/ring/seal/signet/proc/change_name(var/signet_name = "Неизвестно")
	name = "кольцо-печатка [signet_name]"
	desc = "Кольцо-печатка, принадлежащая [signet_name], потому что подписывать письма ручкой кому-то показалось недостаточно изощрённым делом."
