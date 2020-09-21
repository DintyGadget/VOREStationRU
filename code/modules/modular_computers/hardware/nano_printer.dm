/obj/item/weapon/computer_hardware/nano_printer
	name = "nano printer"
	desc = "Небольшой встроенный принтер с модулем переработки бумаги."
	power_usage = 50
	origin_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	critical = 0
	icon_state = "printer"
	hardware_size = 1
	var/stored_paper = 5
	var/max_paper = 10

/obj/item/weapon/computer_hardware/nano_printer/diagnostics(var/mob/user)
	..()
	to_chat(user, "Уровень буфера бумаги: [stored_paper]/[max_paper]")

/obj/item/weapon/computer_hardware/nano_printer/proc/print_text(var/text_to_print, var/paper_title = null)
	if(!stored_paper)
		return 0
	if(!enabled)
		return 0
	if(!check_functionality())
		return 0

	var/obj/item/weapon/paper/P = new/obj/item/weapon/paper(get_turf(holder2))

	// Damaged printer causes the resulting paper to be somewhat harder to read.
	if(damage > damage_malfunction)
		P.info = stars(text_to_print, 100-malfunction_probability)
	else
		P.info = text_to_print
	if(paper_title)
		P.name = paper_title
	P.update_icon()
	P.fields = count_fields(P.info)
	P.updateinfolinks()

	stored_paper--
	return 1

/obj/item/weapon/computer_hardware/nano_printer/proc/count_fields(var/info)
//Count the fields. This is taken directly from paper.dm, /obj/item/weapon/paper/proc/parsepencode(). -Hawk_v3
	var/fields = 0
	var/t = info
	var/laststart = 1
	while(1)
		var/i = findtext(t, "<span class=\"paper_field\">", laststart)	//</span>
		if(i==0)
			break
		laststart = i+1
		fields++
	return fields

/obj/item/weapon/computer_hardware/nano_printer/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/paper))
		if(stored_paper >= max_paper)
			to_chat(user, "Вы пытаетесь добавить [W] в [src], но его лоток для бумаги заполнен.")
			return

		to_chat(user, "Вы добавляете [W] в [src].")
		qdel(W)
		stored_paper++
	else if(istype(W, /obj/item/weapon/paper_bundle))
		var/obj/item/weapon/paper_bundle/B = W
		var/num_of_pages_added = 0
		if(stored_paper >= max_paper)
			to_chat(user, "Вы пытаетесь добавить [W] в [src], но его лоток для бумаги заполнен.")
			return
		for(var/obj/item/weapon/bundleitem in B) //loop through items in bundle
			if(istype(bundleitem, /obj/item/weapon/paper)) //if item is paper (and not photo), add into the bin
				B.pages.Remove(bundleitem)
				qdel(bundleitem)
				num_of_pages_added++
				stored_paper++
			if(stored_paper >= max_paper) //check if the printer is full yet
				to_chat(user, "Принтер заполнен до отказа.")
				break
		if(B.pages.len == 0) //if all its papers have been put into the printer, delete bundle
			qdel(W)
		else if(B.pages.len == 1) //if only one item left, extract item and delete the one-item bundle
			user.drop_from_inventory(B)
			user.put_in_hands(B[1])
			qdel(B)
		else //if at least two items remain, just update the bundle icon
			B.update_icon()
		to_chat(user, "Вы добавляете [num_of_pages_added] листов бумаги [W] в [src].")
	return

/obj/item/weapon/computer_hardware/nano_printer/Destroy()
	if(holder2 && (holder2.nano_printer == src))
		holder2.nano_printer = null
	holder2 = null
	return ..()