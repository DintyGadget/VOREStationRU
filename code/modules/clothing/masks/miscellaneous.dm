/obj/item/clothing/mask/muzzle
	name = "кляп"
	desc = "Чтобы заглушать надоедливые звуки."
	icon_state = "muzzle"
	body_parts_covered = FACE
	w_class = ITEMSIZE_SMALL
	gas_transfer_coefficient = 0.90
	voicechange = 1

/obj/item/clothing/mask/muzzle/tape
	name = "кусочек скотча"
	desc = "Надежный самодельный кляп!"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "tape_cross"
	item_state_slots = list(slot_r_hand_str = null, slot_l_hand_str = null)
	w_class = ITEMSIZE_TINY

/obj/item/clothing/mask/muzzle/New()
    ..()
    say_messages = list("Ммф!", "Мфф мррфффф!", "Ммф мнффф!")
    say_verbs = list("бормочет", "говорит")

// Clumsy folks can't take the mask off themselves.
/obj/item/clothing/mask/muzzle/attack_hand(mob/living/user as mob)
	if(user.wear_mask == src && !user.IsAdvancedToolUser())
		return 0
	..()

/obj/item/clothing/mask/surgical
	name = "стерильная маска"
	desc = "Стерильная маска, используемая для препятствия распространения заболеваний."
	icon_state = "sterile"
	item_state_slots = list(slot_r_hand_str = "sterile", slot_l_hand_str = "sterile")
	w_class = ITEMSIZE_SMALL
	body_parts_covered = FACE
	item_flags = FLEXIBLEMATERIAL
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.01
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 60, rad = 0)
	var/hanging = 0

/obj/item/clothing/mask/surgical/proc/adjust_mask(mob_user)
	if(usr.canmove && !usr.stat)
		src.hanging = !src.hanging
		if (src.hanging)
			gas_transfer_coefficient = 1
			body_parts_covered = body_parts_covered & ~FACE
			armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
			icon_state = "steriledown"
			to_chat(usr, "Вы опускаете маску на подбородок.")
		else
			gas_transfer_coefficient = initial(gas_transfer_coefficient)
			body_parts_covered = initial(body_parts_covered)
			icon_state = initial(icon_state)
			armor = initial(armor)
			to_chat(usr, "Вы надеваете маску на лицо.")
		update_clothing_icon()

/obj/item/clothing/mask/surgical/verb/toggle()
	set category = "Объект"
	set name = "Отрегулировать Маску"
	set src in usr

	adjust_mask(usr)

/obj/item/clothing/mask/fakemoustache
	name = "поддельные усы"
	desc = "Внимание: усы поддельные."
	icon_state = "fake-moustache"
	flags_inv = HIDEFACE
	body_parts_covered = 0

/obj/item/clothing/mask/snorkel
	name = "плавательная маска"
	desc = "Для ценителей плаванья."
	icon_state = "snorkel"
	flags_inv = HIDEFACE
	body_parts_covered = 0

//scarves (fit in in mask slot)
//None of these actually have on-mob sprites...
/obj/item/clothing/mask/bluescarf
	name = "синий шарф"
	desc = "Синий шейный платок."
	icon_state = "blueneckscarf"
	body_parts_covered = FACE
	item_flags = FLEXIBLEMATERIAL
	w_class = ITEMSIZE_SMALL
	gas_transfer_coefficient = 0.90

/obj/item/clothing/mask/redscarf
	name = "красный шарф"
	desc = "Красный с белым шейный платок."
	icon_state = "redwhite_scarf"
	body_parts_covered = FACE
	item_flags = FLEXIBLEMATERIAL
	w_class = ITEMSIZE_SMALL
	gas_transfer_coefficient = 0.90

/obj/item/clothing/mask/greenscarf
	name = "зеленый шарф"
	desc = "Зеленый шейный платок."
	icon_state = "green_scarf"
	body_parts_covered = FACE
	item_flags = FLEXIBLEMATERIAL
	w_class = ITEMSIZE_SMALL
	gas_transfer_coefficient = 0.90

/obj/item/clothing/mask/ninjascarf
	name = "шарф ниндзя"
	desc = "Скрытный шарф черного цвета."
	icon_state = "ninja_scarf"
	body_parts_covered = FACE
	item_flags = FLEXIBLEMATERIAL
	w_class = ITEMSIZE_SMALL
	gas_transfer_coefficient = 0.90
	siemens_coefficient = 0

/obj/item/clothing/mask/pig
	name = "маска свиньи"
	desc = "Резиновая маска свиньи."
	icon_state = "pig"
	flags_inv = HIDEFACE|BLOCKHAIR
	w_class = ITEMSIZE_SMALL
	siemens_coefficient = 0.9
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/shark
	name = "маска акулы"
	desc = "Резиновая маска акулы."
	icon_state = "shark"
	flags_inv = HIDEFACE
	w_class = ITEMSIZE_SMALL
	siemens_coefficient = 0.9
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/dolphin
	name = "маска дельфина"
	desc = "Резиновая маска дельфина."
	icon_state = "dolphin"
	flags_inv = HIDEFACE
	w_class = ITEMSIZE_SMALL
	siemens_coefficient = 0.9
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/goblin
	name = "маска гоблина"
	desc = "Резиновая маска гоблина."
	icon_state = "goblin"
	flags_inv = HIDEFACE
	w_class = ITEMSIZE_SMALL
	siemens_coefficient = 0.9
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/demon
	name = "маска демона"
	desc = "Резиновая маска демона."
	icon_state = "demon"
	flags_inv = HIDEFACE
	w_class = ITEMSIZE_SMALL
	siemens_coefficient = 0.9
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/horsehead
	name = "маска лошади"
	desc = "Маска, изготовленная из винила и латекса в форме головы лошади."
	icon_state = "horsehead"
	flags_inv = HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	w_class = ITEMSIZE_SMALL
	siemens_coefficient = 0.9

/obj/item/clothing/mask/nock_scarab
	name = "маска Нока"
	desc = "Для последователей Нока, данная маска символизирует перерождение в качестве новой личности. Причинение маске вреда считается за нападение на самого носителя."
	icon_state = "nock_scarab"
	w_class = ITEMSIZE_SMALL
	body_parts_covered = HEAD|FACE

/obj/item/clothing/mask/nock_demon
	name = "маска Нока"
	desc = "Для последователей Нока, данная маска символизирует перерождение в качестве новой личности. Причинение маске вреда считается за нападение на самого носителя."
	icon_state = "nock_demon"
	w_class = ITEMSIZE_SMALL
	body_parts_covered = HEAD|FACE

/obj/item/clothing/mask/nock_life
	name = "маска Нока"
	desc = "Для последователей Нока, данная маска символизирует перерождение в качестве новой личности. Причинение маске вреда считается за нападение на самого носителя."
	icon_state = "nock_life"
	w_class = ITEMSIZE_SMALL
	body_parts_covered = HEAD|FACE

/obj/item/clothing/mask/nock_ornate
	name = "маска Нока"
	desc = "Для последователей Нока, данная маска символизирует перерождение в качестве новой личности. Причинение маске вреда считается за нападение на самого носителя."
	icon_state = "nock_ornate"
	w_class = ITEMSIZE_SMALL
	body_parts_covered = HEAD|FACE

/obj/item/clothing/mask/horsehead/New()
    ..()
    // The horse mask doesn't cause voice changes by default, the wizard spell changes the flag as necessary
    say_messages = list("ИИИИИИГОГО!", "ИИГОООГООО!", "ИГООГО!", "ИИИИИИИИИИИГОГО!", "ИГОГО!")
    say_verbs = list("whinnies", "neighs", "says")

/obj/item/clothing/mask/ai
	name = "маска наблюдения"
	desc = "Устанавливает прямое соединение с доступными сетями камер наблюдения."
	icon_state = "s-ninja"
	item_state_slots = list(slot_r_hand_str = "mime", slot_l_hand_str = "mime")
	flags_inv = HIDEFACE
	body_parts_covered = 0
	var/mob/observer/eye/aiEye/eye

/obj/item/clothing/mask/ai/New()
	eye = new(src)

/obj/item/clothing/mask/ai/equipped(var/mob/user, var/slot)
	..(user, slot)
	if(slot == slot_wear_mask)
		eye.owner = user
		user.eyeobj = eye

		for(var/datum/chunk/c in eye.visibleChunks)
			c.remove(eye)
		eye.setLoc(user)

/obj/item/clothing/mask/ai/dropped(var/mob/user)
	..()
	if(eye.owner == user)
		for(var/datum/chunk/c in eye.visibleChunks)
			c.remove(eye)

		eye.owner.eyeobj = null
		eye.owner = null

/obj/item/clothing/mask/bandana
	name = "черная бандана"
	desc = "Качественная черная бандана с нановолокнистой подкладкой. Носится как на голове, так и на лице."
	w_class = ITEMSIZE_TINY
	flags_inv = HIDEFACE
	slot_flags = SLOT_MASK|SLOT_HEAD
	body_parts_covered = FACE
	icon_state = "bandblack"
	item_state_slots = list(slot_r_hand_str = "bandblack", slot_l_hand_str = "bandblack")

/obj/item/clothing/mask/bandana/equipped(var/mob/user, var/slot)
	switch(slot)
		if(slot_wear_mask) //Mask is the default for all the settings
			flags_inv = initial(flags_inv)
			body_parts_covered = initial(body_parts_covered)
			icon_state = initial(icon_state)

		if(slot_head)
			flags_inv = 0
			body_parts_covered = HEAD
			icon_state = "[initial(icon_state)]_up"

	return ..()

/obj/item/clothing/mask/bandana/red
	name = "красная бандана"
	desc = "Качественная красная бандана с нановолокнистой подкладкой. Надевается как на макушку, так и на лицо."
	icon_state = "bandred"
	item_state_slots = list(slot_r_hand_str = "bandred", slot_l_hand_str = "bandred")

/obj/item/clothing/mask/bandana/blue
	name = "синяя бандана"
	desc = "Качественная синяя бандана с нановолокнистой подкладкой. Надевается как на макушку, так и на лицо."
	icon_state = "bandblue"
	item_state_slots = list(slot_r_hand_str = "bandblue", slot_l_hand_str = "bandblue")

/obj/item/clothing/mask/bandana/green
	name = "зеленая бандана"
	desc = "Качественная зеленая бандана с нановолокнистой подкладкой. Надевается как на макушку, так и на лицо."
	icon_state = "bandgreen"
	item_state_slots = list(slot_r_hand_str = "bandgreen", slot_l_hand_str = "bandgreen")

/obj/item/clothing/mask/bandana/gold
	name = "золотая бандана"
	desc = "Качественная бандана золотого цвета с нановолокнистой подкладкой. Надевается как на макушку, так и на лицо."
	icon_state = "bandgold"
	item_state_slots = list(slot_r_hand_str = "bandgold", slot_l_hand_str = "bandgold")

/obj/item/clothing/mask/bandana/skull
	name = "skull bandana"
	desc = "Качественная черная бандана с нановолокнистой подкладкой и изображением черепа. Надевается как на макушку, так и на лицо."
	icon_state = "bandskull"
	item_state_slots = list(slot_r_hand_str = "bandskull", slot_l_hand_str = "bandskull")

/obj/item/clothing/mask/veil
	name = "черная вуаль"
	desc = "Черная вуаль, надеваемая либо на похороны, либо готами."
	w_class = ITEMSIZE_TINY
	body_parts_covered = FACE
	icon_state = "veil"