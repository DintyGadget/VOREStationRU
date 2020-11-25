/obj/item/clothing/glasses/proc/prescribe(var/mob/user)
	prescription = !prescription

	//Look it's really not that fancy. It's not ACTUALLY unique scrip data.
	if(prescription)
		name = "[initial(name)] (близ.)"
		user.visible_message("[user] заменяет линзы в [ru_getcase(src, "pcase")] на новые рецептурные.")
	else
		name = "[initial(name)]"
		user.visible_message("[user] заменяет линзы в [ru_getcase(src, "pcase")] на обыкновенные.")

	playsound(src,'sound/items/screwdriver.ogg', 50, 1)

//Prescription kit
/obj/item/device/glasses_kit
	name = "Набор рецептурных линз"
	desc = "Набор всех необходимых линз и инструментов для изготовления очков для слабовидящих."
	icon = 'icons/obj/device.dmi'
	icon_state = "modkit"
	var/scrip_loaded = 0

/obj/item/device/glasses_kit/afterattack(var/target, var/mob/living/carbon/human/user, var/proximity)
	if(!proximity)
		return
	if(!istype(user))
		return

	//Too difficult
	if(target == user)
		to_chat(user, "<span class='warning'>Вы не можете использовать это на своих глазах самостоятельно! Попросите кого-нибудь Вам помочь.</span>")
		return

	//We're applying a prescription
	if(istype(target,/obj/item/clothing/glasses))
		var/obj/item/clothing/glasses/G = target
		if(!scrip_loaded)
			to_chat(user, "<span class='warning'>Вам нужно сначала получить рецепт! Используйте набор на ком-нибудь.</span>")
			return

		if(do_after(user,5 SECONDS))
			G.prescribe(user)
			scrip_loaded = 0

	//We're getting a prescription
	else if(ishuman(target))
		var/mob/living/carbon/human/T = target
		if(T.glasses || (T.head && T.head.flags_inv & HIDEEYES))
			to_chat(user, "<span class='warning'>Глаза не должны быть ничем закрыты!</span>")
			return

		T.visible_message("[user] начинает проводить измерения для рецептурных линз [target].","[user] начинает проверять Ваши глаза. Не двигайтесь!")
		if(do_after(user,5 SECONDS,T))
			T.flash_eyes()
			scrip_loaded = 1
			T.visible_message("[user] заканчивает подготавливать линзы для [target].","<span class='warning'>Ай, слишком ярко!</span>")

	else
		..()

/obj/item/clothing/glasses/sunglasses/sechud/tactical
	item_flags = AIRTIGHT
	body_parts_covered = EYES

/obj/item/clothing/glasses/graviton/medgravpatch
	name = "Медицинская гравитонная повязка на глаз"
	desc = "Гравитонная повязка на глаз с медицинским оверлеем."
	icon = 'icons/obj/clothing/glasses_vr.dmi'
	icon_override = 'icons/mob/eyes_vr.dmi'
	icon_state = "medgravpatch"
	item_state_slots = list(slot_r_hand_str = "blindfold", slot_l_hand_str = "blindfold")
	action_button_name = "Переключить Повязку"
	off_state = "eyepatch"
	enables_planes = list(VIS_CH_STATUS,VIS_CH_HEALTH,VIS_FULLBRIGHT,VIS_MESONS)

/*---Tajaran-specific Eyewear---*/

/obj/item/clothing/glasses/tajblind
	name = "Вышитая повязка на глаза"
	desc = "Вышитая повязка, носимая таджара и позволяющая носителю видеть, однако скрывающая его глаза."
	icon = 'icons/obj/clothing/glasses_vr.dmi'
	icon_override = 'icons/mob/eyes_vr.dmi'
	icon_state = "tajblind"
	item_state = "tajblind"
	prescription = 1
	body_parts_covered = EYES

/obj/item/clothing/glasses/hud/health/tajblind
	name = "Легкая повязка на глаза"
	desc = "Вышитая повязка, носимая таджара и позволяющая носителю видеть, однако скрывающая его глаза. В эту установлен медицинский HUD."
	icon = 'icons/obj/clothing/glasses_vr.dmi'
	icon_override = 'icons/mob/eyes_vr.dmi'
	icon_state = "tajblind_med"
	item_state = "tajblind_med"
	body_parts_covered = EYES

/obj/item/clothing/glasses/sunglasses/sechud/tajblind
	name = "Глянцевая повязка на глаза"
	desc = "Вышитая повязка, носимая таджара и позволяющая носителю видеть, однако скрывающая его глаза. В эту установлен HUD службы безопасности."
	icon = 'icons/obj/clothing/glasses_vr.dmi'
	icon_override = 'icons/mob/eyes_vr.dmi'
	icon_state = "tajblind_sec"
	item_state = "tajblind_sec"
	prescription = 1
	body_parts_covered = EYES

/obj/item/clothing/glasses/meson/prescription/tajblind
	name = "Промышленная повязка на глаза"
	desc = "Вышитая повязка, носимая Таджара и позволяющая носителю видеть, однако скрывающая его глаза. В эту установлен мезонный визор."
	icon = 'icons/obj/clothing/glasses_vr.dmi'
	icon_override = 'icons/mob/eyes_vr.dmi'
	icon_state = "tajblind_meson"
	item_state = "tajblind_meson"
	off_state = "tajblind"
	body_parts_covered = EYES

/obj/item/clothing/glasses/material/prescription/tajblind
	name = "Шахтёрская повязка на глаза"
	desc = "Вышитая повязка, носимая таджара и позволяющая носителю видеть, однако скрывающая его глаза. В эту установлен материальный визор."
	icon = 'icons/obj/clothing/glasses_vr.dmi'
	icon_override = 'icons/mob/eyes_vr.dmi'
	icon_state = "tajblind_meson"
	item_state = "tajblind_meson"
	off_state = "tajblind"
	body_parts_covered = EYES

/obj/item/clothing/glasses
	sprite_sheets = list(
		SPECIES_TESHARI = 'icons/mob/species/seromi/eyes.dmi',
		SPECIES_VOX = 'icons/mob/species/vox/eyes.dmi',
		SPECIES_WEREBEAST = 'icons/mob/species/werebeast/eyes.dmi'
		)
