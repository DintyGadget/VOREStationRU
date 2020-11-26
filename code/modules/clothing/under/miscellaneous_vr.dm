/obj/item/clothing/under/customs
	desc = "Стандартная таможенная униформа Сол. На ней множество нашивок."

/obj/item/clothing/var/hides_bulges = FALSE // OwO wats this?

/obj/item/clothing/under/permit
	name = "лицензия на наготу"
	desc = "Эта карточка позволяет носителю исполнять свои обязанности без рабочей формы. Обычно выдаётся работникам, которым нечего скрывать."
	icon = 'icons/obj/card.dmi'
	icon_state = "guest"
	body_parts_covered = 0
	equip_sound = null

	sprite_sheets = list()

	item_state = "golem"  //This is dumb and hacky but was here when I got here.
	worn_state = "golem"  //It's basically just a coincidentally black iconstate in the file.

/obj/item/clothing/under/bluespace
	name = "Bluespace-костюм"
	icon_state = "lingchameleon"
	item_icons = list(
			slot_l_hand_str = 'icons/mob/items/lefthand_uniforms.dmi',
			slot_r_hand_str = 'icons/mob/items/righthand_uniforms.dmi',
			)
	item_state = "lingchameleon"
	worn_state = "lingchameleon"
	desc = "Как насчёт сегодня поискривлять пространство и время? Нынче только этим все и занимаются.\
			Позволяет изменить собственный размер и скрыть свой настоящий вес."
	hides_bulges = TRUE
	var/original_size



/obj/item/clothing/under/bluespace/verb/toggle_fibers()
		set category = "Object"
		set name = "Отрегулировать Фибры"
		set desc = "Отрегулировать фибры костюма. Скрывает, либо показывает Ваш живот."
		set src in usr

		adjust_fibers(usr)
		..()

/obj/item/clothing/under/bluespace/proc/adjust_fibers(mob/user)
	if(hides_bulges == FALSE)
		hides_bulges = TRUE
		to_chat(user, "Вы стягиваете фибры костюма, скрывая живот(ы).")
	else
		hides_bulges = FALSE
		to_chat(user, "Вы распускаете фибры костюма, раскрывая живот(ы).")



/obj/item/clothing/under/bluespace/verb/resize()
	set name = "Изменить Размер"
	set category = "Object"
	set src in usr
	bluespace_size(usr)
	..()



/obj/item/clothing/under/bluespace/proc/bluespace_size(mob/usr as mob)
	if (!ishuman(usr))
		return

	var/mob/living/carbon/human/H = usr

	if (H.stat || H.restrained())
		return

	if (src != H.w_uniform)
		to_chat(H,"<span class='warning'>Необходимо носить униформу на СЕБЕ, чтобы изменить свой размер.</span>")
		return

	var/new_size = input("Введите желаемый размер (25-200%)", "Изменить Размер", 200) as num|null

	//Check AGAIN because we accepted user input which is blocking.
	if (src != H.w_uniform)
		to_chat(H,"<span class='warning'>Необходимо носить униформу на СЕБЕ, чтобы изменить свой размер.</span>")
		return

	if (H.stat || H.restrained())
		return

	if (isnull(H.size_multiplier))
		to_chat(H,"<span class='warning'>Униформа поправляет Ваш якобы микроскопический размер.</span>")
		H.resize(RESIZE_NORMAL)
		H.update_icons() //Just want the matrix transform
		return

	if (!ISINRANGE(new_size,25,200))
		to_chat(H,"<span class='notice'>Предохранитель в униформе не позволяет Вам выбрать такой размер.</span>")
		return

	else if(new_size)
		if(new_size != H.size_multiplier)
			if(!original_size)
				original_size = H.size_multiplier
			H.resize(new_size/100)
			H.visible_message("<span class='warning'>[H] изменяет свой размер, пока пространство вокруг фигуры искривляется!</span>","<span class='notice'>Пространство вокруг Вас искривляется, пока Вы изменяете свой размер!</span>")
		else //They chose their current size.
			return

/obj/item/clothing/under/bluespace/mob_can_unequip(mob/M, slot, disable_warning = 0)
	. = ..()
	if(. && ishuman(M) && original_size)
		var/mob/living/carbon/human/H = M
		H.resize(original_size)
		original_size = null
		H.visible_message("<span class='warning'>[H] возвращается к обычному размеру, пока пространство вокруг фигуры искривляется!</span>","<span class='notice'>Пространство вокруг Вас искривляется, пока Вы возвращаетесь к привычному размеру!</span>")

//Same as Nanotrasen Security Uniforms
/obj/item/clothing/under/ert
	armor = list(melee = 5, bullet = 10, laser = 10, energy = 5, bomb = 5, bio = 0, rad = 0)

/obj/item/clothing/under/dress/qipao
	name = "ципао"
	desc = "Прилегающее женское платье из Китая."
	icon = 'icons/obj/clothing/uniforms_vr.dmi'
	icon_override = 'icons/mob/uniform_vr.dmi'
	icon_state = "qipao"
	item_state = "qipao"

/obj/item/clothing/under/dress/qipao/white
	name = "белый ципао"
	icon_state = "qipao_white"
	item_state = "qipao_white"

/obj/item/clothing/under/dress/qipao/red
	name = "красный ципао"
	icon_state = "qipao_red"
	item_state = "qipao_red"
