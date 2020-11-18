/mob/living/carbon/human/verb/give(var/mob/living/carbon/target in living_mobs(1))
	set category = "IC"
	set name = "Дать"

	// TODO :  Change to incapacitated() on merge.
	if(src.stat || src.lying || src.resting || src.handcuffed)
		return
	if(!istype(target) || target.stat || target.lying || target.resting || target.handcuffed || target.client == null)
		return

	var/obj/item/I = src.get_active_hand()
	if(!I)
		I = src.get_inactive_hand()
	if(!I)
		to_chat(src, "<span class='warning'>У Вас в руках нет ничего, что можно было бы передать [target].</span>")
		return

	if(alert(target,"[src] хочет дать Вам \a [I]. Примете ли Вы?","Передача Предмета","Да","Нет") == "Нет") //VOREStation Edit - make yes on the left to be consistent with other dialogs
		target.visible_message("<span class='notice'>[src] пытается передать [I] [target], \
		однако [target] не соглашается.</span>")
		return

	if(!I) return

	if(!Adjacent(target))
		to_chat(src, "<span class='warning'>Вам нужно оставаться вблизи, чтобы передать предмет.</span>")
		to_chat(target, "<span class='warning'>[src] отходит слишком далеко для передачи.</span>")
		return

	if(I.loc != src || !src.item_is_in_hands(I))
		to_chat(src, "<span class='warning'>Вам нужно держать предмет в своих руках.</span>")
		to_chat(target, "<span class='warning'>[src], кажется, передумывает передавать Вам [I].</span>")
		return

	if(target.hands_are_full())
		to_chat(target, "<span class='warning'>Ваши руки заняты.</span>")
		to_chat(src, "<span class='warning'>Руки вашей цели уже заняты.</span>")
		return

	if(src.unEquip(I))
		target.put_in_hands(I) // If this fails it will just end up on the floor, but that's fitting for things like dionaea.
		target.visible_message("<span class='notice'>[src] передаёт [I] [target].</span>")
