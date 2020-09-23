/*
 *	Everything derived from the common cardboard box.
 *	Basically everything except the original is a kit (starts full).
 *
 *	Contains:
 *		Empty box, starter boxes (survival/engineer),
 *		Latex glove and sterile mask boxes,
 *		Syringe, beaker, dna injector boxes,
 *		Blanks, flashbangs, and EMP grenade boxes,
 *		Tracking and chemical implant boxes,
 *		Prescription glasses and drinking glass boxes,
 *		Condiment bottle and silly cup boxes,
 *		Donkpocket and monkeycube boxes,
 *		ID and security PDA cart boxes,
 *		Handcuff, mousetrap, and pillbottle boxes,
 *		Snap-pops and matchboxes,
 *		Replacement light boxes.
 *
 *		For syndicate call-ins see uplink_kits.dm
 */

/obj/item/weapon/storage/box
	name = "box"
	desc = "Это просто обычная коробка."
	icon_state = "box"
	item_state = "syringe_kit"
	center_of_mass = list("x" = 13,"y" = 10)
	var/foldable = /obj/item/stack/material/cardboard	// BubbleWrap - if set, can be folded (when empty) into a sheet of cardboard
	var/trash = null  // if set, can be crushed into a trash item when empty
	max_w_class = ITEMSIZE_SMALL
	max_storage_space = INVENTORY_BOX_SPACE
	use_sound = 'sound/items/storage/box.ogg'
	drop_sound = 'sound/items/drop/cardboardbox.ogg'
	pickup_sound = 'sound/items/pickup/cardboardbox.ogg'

// BubbleWrap - A box can be folded up to make card
/obj/item/weapon/storage/box/attack_self(mob/user as mob)
	if(..()) return

	//try to fold it
	if(ispath(foldable))
		if (contents.len)
			return
		var/found = 0
		// Close any open UI windows first
		for(var/mob/M in range(1))
			if (M.s_active == src)
				close(M)
			if (M == user)
				found = 1
		if (!found)	// User is too far away
			return
		// Now make the cardboard
		to_chat(user, "<span class='notice'>You fold [src] flat.</span>")
		playsound(src, 'sound/items/storage/boxfold.ogg', 30, 1)
		new foldable(get_turf(src))
		qdel(src)

	//try to crush it
	if(ispath(trash))
		if(contents.len &&  user.a_intent == I_HURT)  // only crumple with things inside on harmintent.
			user.visible_message(SPAN_DANGER("[user] crushes \the [src], spilling its contents everywhere!"), SPAN_DANGER("You crush \the [src], spilling its contents everywhere!"))
			spill()
		else
			to_chat(user, SPAN_NOTICE("You crumple up \the [src].")) //make trash
		playsound(src.loc, 'sound/items/drop/wrapper.ogg', 30, 1)
		var/obj/item/trash = new src.trash()
		qdel(src)
		user.put_in_hands(trash)


/obj/item/weapon/storage/box/survival
	name = "emergency supply box"
	desc = "Спасательный набор, выдаваемый членам экипажа для использования в чрезвычайных ситуациях."
	starts_with = list(
		/obj/item/clothing/mask/breath
	)

/obj/item/weapon/storage/box/survival/synth
	name = "synthetic supply box"
	desc = "Набор выживания, выдаваемая синтетическим членам экипажа для использования в чрезвычайных ситуациях."
	starts_with = list(
	)

/obj/item/weapon/storage/box/survival/comp
	name = "emergency supply box"
	desc = "Комплексный набор выживания, выдаваемый членам экипажа для использования в чрезвычайных ситуациях. Содержит дополнительные материалы."
	icon_state = "survival"
	starts_with = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/device/flashlight/glowstick,
		/obj/item/weapon/reagent_containers/food/snacks/candy/proteinbar,
		/obj/item/clothing/mask/breath
	)

/obj/item/weapon/storage/box/gloves
	name = "box of latex gloves"
	desc = "Содержит белые перчатки."
	icon_state = "latex"
	starts_with = list(/obj/item/clothing/gloves/sterile/latex = 7)

/obj/item/weapon/storage/box/masks
	name = "box of sterile masks"
	desc = "Эта коробка содержит стерильные маски."
	icon_state = "sterile"
	starts_with = list(/obj/item/clothing/mask/surgical = 7)

/obj/item/weapon/storage/box/syringes
	name = "box of syringes"
	desc = "Коробка, полная шприцов."
	icon_state = "syringe"
	starts_with = list(/obj/item/weapon/reagent_containers/syringe = 7)

/obj/item/weapon/storage/box/syringegun
	name = "box of syringe gun cartridges"
	desc = "Коробка, полная баллончиков со сжатым газом."
	icon_state = "syringe"
	starts_with = list(/obj/item/weapon/syringe_cartridge = 7)

/obj/item/weapon/storage/box/beakers
	name = "box of beakers"
	desc = "Коробка, полная мензурок."
	icon_state = "beaker"
	starts_with = list(/obj/item/weapon/reagent_containers/glass/beaker = 7)

/obj/item/weapon/storage/box/injectors
	name = "box of DNA injectors"
	desc = "Кажется, в этой коробке находятся форсунки."
	starts_with = list(
		/obj/item/weapon/dnainjector/h2m = 3,
		/obj/item/weapon/dnainjector/m2h = 3
	)

/obj/item/weapon/storage/box/blanks
	name = "box of blank shells"
	desc = "На фронтальной части коробки имеется изображение оружия и несколько предупреждающих знаков."
	icon_state = "blankshot_box"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(/obj/item/ammo_casing/a12g/blank = 8)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/blanks/large
	starts_with = list(/obj/item/ammo_casing/a12g/blank = 16)

/obj/item/weapon/storage/box/beanbags
	name = "box of beanbag shells"
	desc = "На фронтальной части коробки имеется изображение оружия и несколько предупреждающих знаков.<br>ВНИМАНИЕ: Боевые патроны. Неправильное использование может привести к серьезным травмам или смерти."
	icon_state = "beanshot_box"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(/obj/item/ammo_casing/a12g/beanbag = 8)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/beanbags/large/New()
	starts_with = list(/obj/item/ammo_casing/a12g/beanbag = 16)

/obj/item/weapon/storage/box/shotgunammo
	name = "box of shotgun slugs"
	desc = "На фронтальной части коробки имеется изображение оружия и несколько предупреждающих знаков.<br>ВНИМАНИЕ: Боевые патроны. Неправильное использование может привести к серьезным травмам или смерти."
	icon_state = "lethalshellshot_box"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(/obj/item/ammo_casing/a12g = 8)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/shotgunammo/large
	starts_with = list(/obj/item/ammo_casing/a12g = 16)

/obj/item/weapon/storage/box/shotgunshells
	name = "box of shotgun shells"
	desc = "На фронтальной части коробки имеется изображение оружия и несколько предупреждающих знаков.<br>ВНИМАНИЕ: Боевые патроны. Неправильное использование может привести к серьезным травмам или смерти."
	icon_state = "lethalslug_box"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(/obj/item/ammo_casing/a12g/pellet = 8)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/shotgunshells/large
	starts_with = list(/obj/item/ammo_casing/a12g/pellet = 16)

/obj/item/weapon/storage/box/flashshells
	name = "box of illumination shells"
	desc = "На фронтальной части коробки имеется изображение оружия и несколько предупреждающих знаков.<br>ВНИМАНИЕ: Боевые патроны. Неправильное использование может привести к серьезным травмам или смерти."
	icon_state = "illumshot_box"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(/obj/item/ammo_casing/a12g/flash = 8)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/flashshells/large
	starts_with = list(/obj/item/ammo_casing/a12g/flash = 16)

/obj/item/weapon/storage/box/stunshells
	name = "box of stun shells"
	desc = "На фронтальной части коробки имеется изображение оружия и несколько предупреждающих знаков.<br>ВНИМАНИЕ: Боевые патроны. Неправильное использование может привести к серьезным травмам или смерти."
	icon_state = "stunshot_box"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(/obj/item/ammo_casing/a12g/stunshell = 8)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/stunshells/large
	starts_with = list(/obj/item/ammo_casing/a12g/stunshell = 16)

/obj/item/weapon/storage/box/practiceshells
	name = "box of practice shells"
	desc = "На фронтальной части коробки имеется изображение оружия и несколько предупреждающих знаков.<br>ВНИМАНИЕ: Боевые патроны. Неправильное использование может привести к серьезным травмам или смерти."
	icon_state = "blankshot_box"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(/obj/item/ammo_casing/a12g/practice = 8)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/practiceshells/large
	starts_with = list(/obj/item/ammo_casing/a12g/practice = 16)

/obj/item/weapon/storage/box/empshells
	name = "box of emp shells"
	desc = "На фронтальной части коробки имеется изображение оружия и несколько предупреждающих знаков."
	icon_state = "empshot_box"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(/obj/item/ammo_casing/a12g/emp = 8)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/empshells/large
	starts_with = list(/obj/item/ammo_casing/a12g/emp = 16)

/obj/item/weapon/storage/box/flechetteshells
	name = "box of shotgun flechettes"
	desc = "На фронтальной части коробки имеется изображение оружия и несколько предупреждающих знаков.<br>ВНИМАНИЕ: Боевые патроны. Неправильное использование может привести к серьезным травмам или смерти."
	icon_state = "lethalslug_box"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(/obj/item/ammo_casing/a12g/flechette = 8)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/flechetteshells/large
	starts_with = list(/obj/item/ammo_casing/a12g/flechette = 16)

/obj/item/weapon/storage/box/sniperammo
	name = "box of 14.5mm shells"
	desc = "На фронтальной части коробки имеется изображение оружия и несколько предупреждающих знаков.<br>ВНИМАНИЕ: Боевые патроны. Неправильное использование может привести к серьезным травмам или смерти."
	starts_with = list(/obj/item/ammo_casing/a145 = 7)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/sniperammo/highvel
	name = "box of 14.5mm sabot shells"
	desc = "На фронтальной части коробки имеется изображение оружия и несколько предупреждающих знаков.<br>ВНИМАНИЕ: Боевые патроны. Неправильное использование может привести к серьезным травмам или смерти."
	starts_with = list(/obj/item/ammo_casing/a145/highvel = 7)

/obj/item/weapon/storage/box/flashbangs
	name = "box of flashbangs (WARNING)"
	desc = "<B>ВНИМАНИЕ: Эти устройства чрезвычайно опасны и могут вызвать слепоту или глухоту при повторном использовании.</B>"
	icon_state = "flashbang"
	starts_with = list(/obj/item/weapon/grenade/flashbang = 7)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/emps
	name = "box of emp grenades"
	desc = "Коробка с 5 ЭМИ гранатами военного класса.<br> ВНИМАНИЕ: Не используйте рядом с неэкранированной электроникой или биомеханическими аугментациями, это может привести к смерти или необратимому параличу."
	icon_state = "emp"
	starts_with = list(/obj/item/weapon/grenade/empgrenade = 7)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/empslite
	name = "box of low yield emp grenades"
	desc = "Коробка, содержащий 5 ЭМИ-гранат малой мощности.<br> WARNING: Do not use near unshielded electronics or biomechanical augmentations, death or permanent paralysis may occur."
	icon_state = "emp"
	starts_with = list(/obj/item/weapon/grenade/empgrenade/low_yield = 7)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/smokes
	name = "box of smoke bombs"
	desc = "Коробка с 7 дымовыми шашками."
	icon_state = "flashbang"
	starts_with = list(/obj/item/weapon/grenade/smokebomb = 7)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/anti_photons
	name = "box of anti-photon grenades"
	desc = "Коробка с 7 экспериментальными фотонными гранатами."
	icon_state = "flashbang"
	starts_with = list(/obj/item/weapon/grenade/anti_photon = 7)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/frags
	name = "box of fragmentation grenades (WARNING)"
	desc = "Коробка с 7 осколочными гранатами военного назначения.<br> ВНИМАНИЕ: Эти устройства чрезвычайно опасны и могут привести к потере конечности или смерти при повторном использовании."
	icon_state = "frag"
	starts_with = list(/obj/item/weapon/grenade/explosive = 7)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/frags_half_box
	name = "box of fragmentation grenades (WARNING)"
	desc = "Коробка с 4-мя осколочными гранатами военного назначения.<br> ВНИМАНИЕ: Эти устройства чрезвычайно опасны и могут привести к потере конечности или смерти при повторном использовании."
	icon_state = "frag"
	starts_with = list(/obj/item/weapon/grenade/explosive = 4)
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/weapon/storage/box/metalfoam
	name = "box of metal foam grenades."
	desc = "Коробка с 7 гранатами из пенопласта."
	icon_state = "flashbang"
	starts_with = list(/obj/item/weapon/grenade/chem_grenade/metalfoam = 7)

/obj/item/weapon/storage/box/teargas
	name = "box of teargas grenades"
	desc = "Коробка с 7 гранатами со слезоточивым газом."
	icon_state = "flashbang"
	starts_with = list(/obj/item/weapon/grenade/chem_grenade/teargas = 7)

/obj/item/weapon/storage/box/flare
	name = "box of flares"
	desc = "Коробка с 4 ракетами."
	starts_with = list(/obj/item/device/flashlight/flare = 4)

/obj/item/weapon/storage/box/trackimp
	name = "boxed tracking implant kit"
	desc = "Коробка, полная вещей для слежения за подонками."
	icon_state = "implant"
	starts_with = list(
		/obj/item/weapon/implantcase/tracking = 4,
		/obj/item/weapon/implanter,
		/obj/item/weapon/implantpad,
		/obj/item/weapon/locator
	)

/obj/item/weapon/storage/box/chemimp
	name = "boxed chemical implant kit"
	desc = "Коробка с вещами, используемыми для имплантации химикатов."
	icon_state = "implant"
	starts_with = list(
		/obj/item/weapon/implantcase/chem = 5,
		/obj/item/weapon/implanter,
		/obj/item/weapon/implantpad
	)

/obj/item/weapon/storage/box/camerabug
	name = "mobile camera pod box"
	desc = "Коробка с мобильными камерами."
	icon_state = "pda"
	starts_with = list(
		/obj/item/device/camerabug = 6,
		/obj/item/device/bug_monitor
	)

/obj/item/weapon/storage/box/rxglasses
	name = "box of prescription glasses"
	desc = "В этой коробке находятся очки для задротов."
	icon_state = "glasses"
	starts_with = list(/obj/item/clothing/glasses/regular = 7)

/obj/item/weapon/storage/box/cdeathalarm_kit
	name = "death alarm kit"
	desc = "Коробка с вещами, которые используются для установки сигналов о смерти."
	icon_state = "implant"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(
		/obj/item/weapon/implantcase/death_alarm = 7,
		/obj/item/weapon/implanter
	)

/obj/item/weapon/storage/box/condimentbottles
	name = "box of condiment bottles"
	desc = "На ней большой мазок кетчупа."
	starts_with = list(/obj/item/weapon/reagent_containers/food/condiment = 7)

/obj/item/weapon/storage/box/cups
	name = "box of paper cups"
	desc = "На лицевой стороне изображены бумажные стаканчики."
	starts_with = list(/obj/item/weapon/reagent_containers/food/drinks/sillycup = 7)

/obj/item/weapon/storage/box/donkpockets
	name = "box of donk-pockets"
	desc = "<B>Инструкция:</B> <I>Нагрейте в микроволновой печи. Продукт остынет, если его не съесть в течение семи минут.</I>"
	icon_state = "donk_kit"
	starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/donkpocket = 7)

/obj/item/weapon/storage/box/sinpockets
	name = "box of sin-pockets"
	desc = "<B>Инструкция:</B> <I>Раздавите нижнюю часть упаковки, чтобы вызвать химический нагрев. Подождите 20 секунд перед употреблением. Продукт остынет, если его не съесть в течение семи минут.</I>"
	icon_state = "donk_kit"
	starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/donkpocket/sinpocket = 7)

/obj/item/weapon/storage/box/buns
	name = "box of bread buns"
	desc = "Свежеиспеченный в какой-то момент хлеб, за последние несколько месяцев."
	icon_state = "bun_box"
	max_storage_space = ITEMSIZE_COST_NORMAL * 5
	starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/bun = 12)

/obj/item/weapon/storage/box/monkeycubes
	name = "monkey cube box"
	desc = "Кубики обезьяны бренда Drymate. Просто добавьте воды!"
	icon = 'icons/obj/food.dmi'
	icon_state = "monkeycubebox"
	can_hold = list(/obj/item/weapon/reagent_containers/food/snacks/monkeycube)
	starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped = 4)

/obj/item/weapon/storage/box/monkeycubes/farwacubes
	name = "farwa cube box"
	desc = "Кубики фарвы марки Drymate, поставляемые с Мералара. Просто добавьте воды!"
	starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped/farwacube = 4)

/obj/item/weapon/storage/box/monkeycubes/stokcubes
	name = "stok cube box"
	desc = "Кубики кочегарки марки Drymate, отгруженные с Могеса. Просто добавьте воды!"
	starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped/stokcube = 4)

/obj/item/weapon/storage/box/monkeycubes/neaeracubes
	name = "neaera cube box"
	desc = "Кубики neaera марки Drymate, поставляемые с Керр'Балака. Просто добавьте воды!"
	starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped/neaeracube = 4)

/obj/item/weapon/storage/box/ids
	name = "box of spare IDs"
	desc = "Внутри много пустых ID."
	icon_state = "id"
	starts_with = list(/obj/item/weapon/card/id = 7)

/obj/item/weapon/storage/box/seccarts
	name = "box of spare R.O.B.U.S.T. Cartridges"
	desc = "Коробка с R.O.B.U.S.T. Картриджами, используемые службой безопасности."
	icon_state = "pda"
	starts_with = list(/obj/item/weapon/cartridge/security = 7)

/obj/item/weapon/storage/box/handcuffs
	name = "box of spare handcuffs"
	desc = "Коробка с наручниками."
	icon_state = "handcuff"
	starts_with = list(/obj/item/weapon/handcuffs = 7)

/obj/item/weapon/storage/box/mousetraps
	name = "box of Pest-B-Gon mousetraps"
	desc = "<B><FONT color='red'>ВНИМАНИЕ:</FONT></B> <I>Храните в недоступном для детей месте</I>."
	icon_state = "mousetraps"
	starts_with = list(/obj/item/device/assembly/mousetrap = 7)

/obj/item/weapon/storage/box/pillbottles
	name = "box of pill bottles"
	desc = "На передней панели изображены баночки с таблетками."
	starts_with = list(/obj/item/weapon/storage/pill_bottle = 7)

/obj/item/weapon/storage/box/snappops
	name = "snap pop box"
	desc = "Восемь фантиков веселья! Возраст от 8 лет и старше. Не подходит для детей."
	icon = 'icons/obj/toy.dmi'
	icon_state = "spbox"
	can_hold = list(/obj/item/toy/snappop)
	starts_with = list(/obj/item/toy/snappop = 8)

/obj/item/weapon/storage/box/matches
	name = "matchbox"
	desc = "Небольшая коробка спичек премиум-класса Space-Proof."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "matchbox"
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_BELT
	can_hold = list(/obj/item/weapon/flame/match)
	starts_with = list(/obj/item/weapon/flame/match = 10)
	drop_sound = 'sound/items/drop/matchbox.ogg'
	pickup_sound =  'sound/items/pickup/matchbox.ogg'

/obj/item/weapon/storage/box/matches/attackby(var/obj/item/weapon/flame/match/W, var/mob/user)
	if(istype(W) && !W.lit && !W.burnt)
		if(prob(25))
			W.light(user)
			user.visible_message("<span class='notice'>[user] manages to light the match on the matchbox.</span>")
		else
			playsound(src, 'sound/items/cigs_lighters/matchstick_hit.ogg', 25, 0, -1)
	W.update_icon()
	return

/obj/item/weapon/storage/box/autoinjectors
	name = "box of injectors"
	desc = "Содержит автоинжекторы."
	icon_state = "syringe"
	starts_with = list(/obj/item/weapon/reagent_containers/hypospray/autoinjector = 7)

/obj/item/weapon/storage/box/lights
	name = "box of replacement bulbs"
	icon = 'icons/obj/storage.dmi'
	icon_state = "light"
	desc = "Эта коробка имеет форму внутри, так что туда подходят только световые трубки и лампочки."
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	storage_slots = 24
	can_hold = list(/obj/item/weapon/light/tube, /obj/item/weapon/light/bulb)
	max_storage_space = ITEMSIZE_COST_SMALL * 24 //holds 24 items of w_class 2
	use_to_pickup = 1 // for picking up broken bulbs, not that most people will try

/obj/item/weapon/storage/box/lights/bulbs
	starts_with = list(/obj/item/weapon/light/bulb = 24)

/obj/item/weapon/storage/box/lights/tubes
	name = "box of replacement tubes"
	icon_state = "lighttube"
	starts_with = list(/obj/item/weapon/light/tube = 24)

/obj/item/weapon/storage/box/lights/mixed
	name = "box of replacement lights"
	icon_state = "lightmixed"
	starts_with = list(
		/obj/item/weapon/light/tube = 16,
		/obj/item/weapon/light/bulb = 8
	)

/obj/item/weapon/storage/box/freezer
	name = "portable freezer"
	desc = "Это изящное ударопрочное устройство сохранит ваши \"продукты\" красивыми и не испорченными."
	icon = 'icons/obj/storage.dmi'
	icon_state = "portafreezer"
	item_state_slots = list(slot_r_hand_str = "medicalpack", slot_l_hand_str = "medicalpack")
	foldable = null
	max_w_class = ITEMSIZE_NORMAL
	can_hold = list(/obj/item/organ)
	max_storage_space = ITEMSIZE_COST_NORMAL * 5 // Formally 21.  Odd numbers are bad.
	use_to_pickup = 1 // for picking up broken bulbs, not that most people will try

/obj/item/weapon/storage/box/freezer/Entered(var/atom/movable/AM)
	if(istype(AM, /obj/item/organ))
		var/obj/item/organ/O = AM
		O.preserved = 1
		for(var/obj/item/organ/organ in O)
			organ.preserved = 1
	..()

/obj/item/weapon/storage/box/freezer/Exited(var/atom/movable/AM)
	if(istype(AM, /obj/item/organ))
		var/obj/item/organ/O = AM
		O.preserved = 0
		for(var/obj/item/organ/organ in O)
			organ.preserved = 0
	..()

/obj/item/weapon/storage/box/ambrosia
	name = "ambrosia seeds box"
	desc = "Содержит семена, которые вам нужны, чтобы получить немного кайфа."
	starts_with = list(/obj/item/seeds/ambrosiavulgarisseed = 7)

/obj/item/weapon/storage/box/ambrosiadeus
	name = "ambrosia deus seeds box"
	desc = "Содержит семена, необходимые для получения правильного здорового кайфа."
	starts_with = list(/obj/item/seeds/ambrosiadeusseed = 7)
