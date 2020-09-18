/datum/data/pda/utility/flashlight
	name = "Enable Flashlight"
	icon = "lightbulb-o"

	var/fon = 0 //Is the flashlight function on?
	var/f_lum = 2 //Luminosity for the flashlight function

/datum/data/pda/utility/flashlight/start()
	fon = !fon
	name = fon ? "Выключить свет" : "Включить свет"
	pda.update_shortcuts()
	pda.set_light(fon ? f_lum : 0)

/datum/data/pda/utility/honk
	name = "Honk Synthesizer"
	icon = "smile-o"
	category = "Clown"

	var/last_honk //Also no honk spamming that's bad too

/datum/data/pda/utility/honk/start()
	if(!(last_honk && world.time < last_honk + 20))
		playsound(pda.loc, 'sound/items/bikehorn.ogg', 50, 1)
		last_honk = world.time

/datum/data/pda/utility/toggle_door
	name = "Toggle Door"
	icon = "external-link"
	var/remote_door_id = ""

// /datum/data/pda/utility/toggle_door/start()
// 	for(var/obj/machinery/door/poddoor/M in airlocks)
// 		if(M.id_tag == remote_door_id)
// 			if(M.density)
// 				M.open()
// 			else
// 				M.close()

/datum/data/pda/utility/scanmode/medical
	base_name = "Мед. сканер"
	icon = "heart-o"

/datum/data/pda/utility/scanmode/medical/scan_mob(mob/living/C as mob, mob/living/user as mob)
	C.visible_message("<span class=warning>[user] проанализировал жизненно важные органы [C]!</span>")

	user.show_message("<span class='notice'>Анализ результатов для [C]:</span>")
	user.show_message("<span class='notice'>    Общий статус: [C.stat > 1 ? "dead" : "[C.health - C.halloss]% healthy"]</span>", 1)
	user.show_message(text("<span class='notice'>    Особенности повреждений:</span> <span class='[]'>[]</span>-<span class='[]'>[]</span>-<span class='[]'>[]</span>-<span class='[]'>[]</span>",
			(C.getOxyLoss() > 50) ? "warning" : "", C.getOxyLoss(),
			(C.getToxLoss() > 50) ? "warning" : "", C.getToxLoss(),
			(C.getFireLoss() > 50) ? "warning" : "", C.getFireLoss(),
			(C.getBruteLoss() > 50) ? "warning" : "", C.getBruteLoss()
			), 1)
	user.show_message("<span class='notice'>    Key: Suffocation/Toxin/Burns/Brute</span>", 1)
	user.show_message("<span class='notice'>    Темп. тела: [C.bodytemperature-T0C]&deg;C ([C.bodytemperature*1.8-459.67]&deg;F)</span>", 1)
	if(C.tod && (C.stat == DEAD || (C.status_flags & FAKEDEATH)))
		user.show_message("<span class='notice'>    Время смерти: [C.tod]</span>")
	if(istype(C, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = C
		var/list/damaged = H.get_damaged_organs(1,1)
		user.show_message("<span class='notice'>Локальный урон, грубый/ожоги:</span>",1)
		if(length(damaged)>0)
			for(var/obj/item/organ/external/org in damaged)
				user.show_message(text("<span class='notice'>     []: <span class='[]'>[]</span>-<span class='[]'>[]</span></span>",
						capitalize(org.name), (org.brute_dam > 0) ? "warning" : "notice", org.brute_dam, (org.burn_dam > 0) ? "warning" : "notice", org.burn_dam),1)
		else
			user.show_message("<span class='notice'>    Конечности в порядке.</span>",1)

/datum/data/pda/utility/scanmode/dna
	base_name = "Сканер ДНК"
	icon = "link"

/datum/data/pda/utility/scanmode/dna/scan_mob(mob/living/C as mob, mob/living/user as mob)
	if(istype(C, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = C
		if(!istype(H.dna, /datum/dna))
			to_chat(user, "<span class=notice>На [H] отпечатков пальцев не найдено</span>")
		else
			to_chat(user, "<span class=notice>Отпечаток [H]: [md5(H.dna.uni_identity)]</span>")
	scan_blood(C, user)

/datum/data/pda/utility/scanmode/dna/scan_atom(atom/A as mob|obj|turf|area, mob/user as mob)
	scan_blood(A, user)

/datum/data/pda/utility/scanmode/dna/proc/scan_blood(atom/A, mob/user)
	if(!A.blood_DNA)
		to_chat(user, "<span class=notice>No blood found on [A]</span>")
		if(A.blood_DNA)
			qdel(A.blood_DNA)
	else
		to_chat(user, "<span class=notice>Blood found on [A]. Analysing...</span>")
		spawn(15)
			for(var/blood in A.blood_DNA)
				to_chat(user, "<span class=notice>Группа крови: [A.blood_DNA[blood]]\nДНК: [blood]</span>")

/datum/data/pda/utility/scanmode/halogen
	base_name = "Галогенный счетчик"
	icon = "exclamation-circle"

/datum/data/pda/utility/scanmode/halogen/scan_mob(mob/living/C as mob, mob/living/user as mob)
	C.visible_message("<span class=warning>[user] измеряет уровень радиации [C]!</span>")

	user.show_message("<span class=notice>Анализ результатов для [C]:</span>")
	if(C.radiation)
		user.show_message("<span class=notice>Уровень радиации: [C.radiation > 0 ? "</span><span class=danger>[C.radiation]" : "0"]</span>")
	else
		user.show_message("<span class=notice>Радиация не обнаружена.</span>")

/datum/data/pda/utility/scanmode/reagent
	base_name = "Сканер реагентов"
	icon = "flask"

/datum/data/pda/utility/scanmode/reagent/scan_atom(atom/A as mob|obj|turf|area, mob/user as mob)
	if(!isnull(A.reagents))
		if(A.reagents.reagent_list.len > 0)
			var/reagents_length = A.reagents.reagent_list.len
			to_chat(user, "<span class='notice'>[reagents_length] chemical agent[reagents_length > 1 ? "s" : ""] found.</span>")
			for(var/re in A.reagents.reagent_list)
				to_chat(user, "<span class='notice'>\t [re]</span>")
		else
			to_chat(user, "<span class='notice'>В [A] нет активных химических веществ.</span>")
	else
		to_chat(user, "<span class='notice'>В [A] не обнаружено значительных химических веществ..</span>")

/datum/data/pda/utility/scanmode/gas
	base_name = "Газометр"
	icon = "tachometer-alt"

/datum/data/pda/utility/scanmode/gas/scan_atom(atom/A as mob|obj|turf|area, mob/user as mob)
	pda.analyze_gases(A, user)

/datum/data/pda/utility/scanmode/notes
	base_name = "Note Scanner"
	icon = "clipboard"
	var/datum/data/pda/app/notekeeper/notes

/datum/data/pda/utility/scanmode/notes/start()
	. = ..()
	notes = pda.find_program(/datum/data/pda/app/notekeeper)

/datum/data/pda/utility/scanmode/notes/scan_atom(atom/A as mob|obj|turf|area, mob/user as mob)
	if(notes && istype(A, /obj/item/weapon/paper))
		var/obj/item/weapon/paper/P = A
		var/list/brlist = list("p", "/p", "br", "hr", "h1", "h2", "h3", "h4", "/h1", "/h2", "/h3", "/h4")

		// JMO 20140705: Makes scanned document show up properly in the notes. Not pretty for formatted documents,
		// as this will clobber the HTML, but at least it lets you scan a document. You can restore the original
		// notes by editing the note again. (Was going to allow you to edit, but scanned documents are too long.)
		var/raw_scan = sanitize_simple(P.info, list("\t" = "", "ÿ" = ""))
		var/formatted_scan = ""
		// Scrub out the tags (replacing a few formatting ones along the way)
		// Find the beginning and end of the first tag.
		var/tag_start = findtext(raw_scan, "<")
		var/tag_stop = findtext(raw_scan, ">")
		// Until we run out of complete tags...
		while(tag_start && tag_stop)
			var/pre = copytext(raw_scan, 1, tag_start) // Get the stuff that comes before the tag
			var/tag = lowertext(copytext(raw_scan, tag_start + 1, tag_stop)) // Get the tag so we can do intellegent replacement
			var/tagend = findtext(tag, " ") // Find the first space in the tag if there is one.
			// Anything that's before the tag can just be added as is.
			formatted_scan = formatted_scan + pre
			// If we have a space after the tag (and presumably attributes) just crop that off.
			if(tagend)
				tag = copytext(tag, 1, tagend)
			if(tag in brlist) // Check if it's I vertical space tag.
				formatted_scan = formatted_scan + "<br>" // If so, add some padding in.
			raw_scan = copytext(raw_scan, tag_stop + 1) // continue on with the stuff after the tag
			// Look for the next tag in what's left
			tag_start = findtext(raw_scan, "<")
			tag_stop = findtext(raw_scan, ">")
		// Anything that is left in the page. just tack it on to the end as is
		formatted_scan = formatted_scan + raw_scan
		// If there is something in there already, pad it out.
		if(length(notes.note) > 0)
			notes.note += "<br><br>"
		// Store the scanned document to the notes
		notes.note += "Документ просканирован. Edit to restore previous notes/delete scan.<br>----------<br>" + formatted_scan + "<br>"
		// notehtml ISN'T set to allow user to get their old notes back. A better implementation would add a "scanned documents"
		// feature to the PDA, which would better convey the availability of the feature, but this will work for now.
		// Inform the user
		to_chat(user, "<span class=notice>Paper scanned and OCRed to notekeeper.</span>")//concept of scanning paper copyright brainoblivion 2009

	else
		to_chat(user, "<span class=warning>Error scanning [A].</span>")
