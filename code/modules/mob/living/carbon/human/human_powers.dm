// These should all be procs, you can add them to humans/subspecies by
// species.dm's inherent_verbs ~ Z

/mob/living/carbon/human/proc/tie_hair()
	set name = "Завязать Волосы"
	set desc = "Сменить Вашу причёску."
	set category = "IC"

	if(incapacitated())
		to_chat(src, "<span class='warning'>Вы не можете сейчас это сделать!</span>")
		return

	if(h_style)
		var/datum/sprite_accessory/hair/hair_style = hair_styles_list[h_style]
		var/selected_string
		if(!(hair_style.flags & HAIR_TIEABLE))
			to_chat(src, "<span class ='warning'>У Вас не настолько длинные волосы.</span>")
			return
		else
			var/list/datum/sprite_accessory/hair/valid_hairstyles = list()
			for(var/hair_string in hair_styles_list)
				var/list/datum/sprite_accessory/hair/test = hair_styles_list[hair_string]
				if(test.flags & HAIR_TIEABLE)
					valid_hairstyles.Add(hair_string)
			selected_string = input("Выберите новую причёску", "Ваша Причёска", hair_style) as null|anything in valid_hairstyles
		if(incapacitated())
			to_chat(src, "<span class='warning'>Вы не можете сейчас этого сделать!</span>")
			return
		else if(selected_string && h_style != selected_string)
			h_style = selected_string
			regenerate_icons()
			visible_message("<span class='notice'>[src] делает паузу, завязывая свои волосы.</span>")
		else
			to_chat(src, "<span class ='notice'>Это и есть Ваша причёска.</span>")

/mob/living/carbon/human/proc/tackle()
	set category = "Способности"
	set name = "Наброситься"
	set desc = "Tackle someone down."

	if(last_special > world.time)
		return

	if(stat || paralysis || stunned || weakened || lying || restrained() || buckled)
		to_chat(src, "Вы не можете наброситься на кого-либо в таком состоянии.")
		return

	var/list/choices = list()
	for(var/mob/living/M in view(1,src))
		if(!istype(M,/mob/living/silicon) && Adjacent(M))
			choices += M
	choices -= src

	var/mob/living/T = input(src,"На кого Вы хотите наброситься?") as null|anything in choices

	if(!T || !src || src.stat) return

	if(!Adjacent(T)) return

	if(last_special > world.time)
		return

	if(stat || paralysis || stunned || weakened || lying || restrained() || buckled)
		to_chat(src, "Вы не можете наброситься на кого-либо в таком состоянии.")
		return

	last_special = world.time + 50

	var/failed
	if(prob(75))
		T.Weaken(rand(0.5,3))
	else
		failed = 1

	playsound(src, 'sound/weapons/pierce.ogg', 25, 1, -1)
	if(failed)
		src.Weaken(rand(2,4))

	for(var/mob/O in viewers(src, null))
		if ((O.client && !( O.blinded )))
			O.show_message(text("<font color='red'><B>[] [failed ? "делает попытку наброситься" : "набрасывается"] на []!</font></B>", src, T), 1)

/mob/living/carbon/human/proc/commune()
	set category = "Способности"
	set name = "Взаимодействовать С Существом"
	set desc = "Отправить телепатическое сообщение невезучему получателю."

	var/list/targets = list()
	var/target = null
	var/text = null

	targets += getmobs() //Fill list, prompt user with list
	target = input("Выберите существо!", "Взаимодействовать С Существом", null, null) as null|anything in targets

	if(!target) return

	text = input("Что бы Вы хотели сказать?", "Взаимодействовать с Существом", null, null)

	text = sanitize(text)

	if(!text) return

	var/mob/M = targets[target]

	if(istype(M, /mob/observer/dead) || M.stat == DEAD)
		to_chat(src, "Даже [src.species.name] может разговаривать с мертвецами.")
		return

	log_say("(COMMUNE to [key_name(M)]) [text]",src)

	to_chat(M, "<font color='blue'>Словно свинцовые плиты, рухнувшие в океан, чужеродные мысли падают в глубины Ваших мыслей: [text]</font>")
	if(istype(M,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		if(H.species.name == src.species.name)
			return
		to_chat(H, "<font color='red'>У Вас начинает течь кровь из носа...</font>")
		H.drip(1)

/mob/living/carbon/human/proc/regurgitate()
	set name = "Изрыгнуть"
	set desc = "Опустошить Ваш живот."
	set category = "Способности"

	if(stomach_contents.len)
		for(var/mob/M in src)
			if(M in stomach_contents)
				stomach_contents.Remove(M)
				M.loc = loc
		src.visible_message("<font color='red'><B>[src] извергает содержимое своего живота!</B></font>")
	return

/mob/living/carbon/human/proc/psychic_whisper(mob/M as mob in oview())
	set name = "Экстрасенсорный Шёпот"
	set desc = "Прошептать кому-то на расстоянии."
	set category = "Способности"

	var/msg = sanitize(input("Сообщение:", "Экстрасенсорный Шёпот") as text|null)
	if(msg)
		log_say("(PWHISPER to [key_name(M)]) [msg]", src)
		to_chat(M, "<font color='green'>Вы слышите странный, чужеродный голос в своей голове... <i>[msg]</i></font>")
		to_chat(src, "<font color='green'>Вы сказали [M]: \"[msg]\"</font>")
	return

/mob/living/carbon/human/proc/diona_split_nymph()
	set name = "Разделиться"
	set desc = "Разделить свою человекоподобную форму на составляющие нимфы."
	set category = "Способности"
	diona_split_into_nymphs(5)	// Separate proc to void argments being supplied when used as a verb

/mob/living/carbon/human/proc/diona_split_into_nymphs(var/number_of_resulting_nymphs)
	var/turf/T = get_turf(src)

	var/mob/living/carbon/alien/diona/S = new(T)
	S.set_dir(dir)
	transfer_languages(src, S)

	if(mind)
		mind.transfer_to(S)

	message_admins("[src] разделяется на нимф; игрок управляет [key_name_admin(S)]")
	log_admin("\The [src] разделяется на нимф; игрок управляет [key_name(S)]")

	var/nymphs = 1

	for(var/mob/living/carbon/alien/diona/D in src)
		nymphs++
		D.forceMove(T)
		transfer_languages(src, D, WHITELISTED|RESTRICTED)
		D.set_dir(pick(NORTH, SOUTH, EAST, WEST))

	if(nymphs < number_of_resulting_nymphs)
		for(var/i in nymphs to (number_of_resulting_nymphs - 1))
			var/mob/M = new /mob/living/carbon/alien/diona(T)
			transfer_languages(src, M, WHITELISTED|RESTRICTED)
			M.set_dir(pick(NORTH, SOUTH, EAST, WEST))


	for(var/obj/item/W in src)
		drop_from_inventory(W)

	var/obj/item/organ/external/Chest = organs_by_name[BP_TORSO]

	if(Chest.robotic >= 2)
		visible_message("<span class='warning'>[src] слегка вздрагивает, затем извергает кластер нимф с влажным, склизким звуком.</span>")
		species = GLOB.all_species[SPECIES_HUMAN] // This is hard-set to default the body to a normal FBP, without changing anything.

		// Bust it
		src.death()

		for(var/obj/item/organ/internal/diona/Org in internal_organs) // Remove Nymph organs.
			qdel(Org)

		// Purge the diona verbs.
		verbs -= /mob/living/carbon/human/proc/diona_split_nymph
		verbs -= /mob/living/carbon/human/proc/regenerate

		for(var/obj/item/organ/external/E in organs) // Just fall apart.
			E.droplimb(TRUE)

	else
		visible_message("<span class='warning'>[src] вздрагивает, после чего разделяется на составляющие с влажным, склизким звуком.</span>")
		qdel(src)

/mob/living/carbon/human/proc/self_diagnostics()
	set name = "Самодиагностика"
	set desc = "Провести внутреннюю самодиагностику и уточнить полученные повреждения."
	set category = "IC"

	if(stat == DEAD) return

	to_chat(src, "<span class='notice'>Проводится самодиагностика, пожалуйста, подождите...</span>")

	spawn(50)
		var/output = "<span class='notice'>Результаты самодиагностики:\n</span>"

		output += "Внутренная температура: [convert_k2c(bodytemperature)] градусов по Цельсию\n"

		if(isSynthetic())
			output += "Текущий заряд батареии: [nutrition]\n"

		if(isSynthetic())
			var/toxDam = getToxLoss()
			if(toxDam)
				output += "Системная нестабильность: <span class='warning'>[toxDam > 25 ? "Высокая" : "Средняя"]</span>. Проведите очистку в ближайшей станции подзарядки.\n"
			else
				output += "Системная нестабильность: <span style='color:green;'>В порядке</span>\n"

		for(var/obj/item/organ/external/EO in organs)
			if(EO.robotic >= ORGAN_ASSISTED)
				if(EO.brute_dam || EO.burn_dam)
					output += "[EO.name] - <span class='warning'>[EO.burn_dam + EO.brute_dam > EO.min_broken_damage ? "Тяжёлые" : "Лёгкие"] повреждения</span>\n" //VOREStation Edit - Makes robotic limb damage scalable
				else
					output += "[EO.name] - <span style='color:green;'>В порядке</span>\n"

		for(var/obj/item/organ/IO in internal_organs)
			if(IO.robotic >= ORGAN_ASSISTED)
				if(IO.damage)
					output += "[IO.name] - <span class='warning'>[IO.damage > 10 ? "Тяжёлые" : "Лёгкие"] повреждения</span>\n"
				else
					output += "[IO.name] - <span style='color:green;'>В порядке</span>\n"

		to_chat(src,output)

/mob/living/carbon/human
	var/next_sonar_ping = 0

/mob/living/carbon/human/proc/sonar_ping()
	set name = "Прислушаться"
	set desc = "Позволяет прислушаться к звукам движения вокруг Вас."
	set category = "Способности"

	if(incapacitated())
		to_chat(src, "<span class='warning'>Вам нужно сперва выйти из этого состояния.</span>")
		return
	if(world.time < next_sonar_ping)
		to_chat(src, "<span class='warning'>Вам нужен ещё немножко времени, чтобы сконцентрироваться.</span>")
		return
	if(is_deaf() || is_below_sound_pressure(get_turf(src)))
		to_chat(src, "<span class='warning'>Вы сейчас глухи!</span>")
		return
	next_sonar_ping += 10 SECONDS
	var/heard_something = FALSE
	to_chat(src, "<span class='notice'>Вы прислушиваетесь к своему окружению...</span>")
	for(var/mob/living/L in range(client.view, src))
		var/turf/T = get_turf(L)
		if(!T || L == src || L.stat == DEAD || is_below_sound_pressure(T))
			continue
		heard_something = TRUE
		var/feedback = list()
		feedback += "<span class='notice'>Вам слышны звуки передвижения "
		var/direction = get_dir(src, L)
		if(direction)
			feedback += "в сторону [dir2text(direction)], "
			switch(get_dist(src, L) / client.view)
				if(0 to 0.2)
					feedback += "очень близко."
				if(0.2 to 0.4)
					feedback += "сравнительно близко."
				if(0.4 to 0.6)
					feedback += "неблизко."
				if(0.6 to 0.8)
					feedback += "где-то подальше."
				else
					feedback += "далеко."
		else // No need to check distance if they're standing right on-top of us
			feedback += "прямо над Вами."
		feedback += "</span>"
		to_chat(src,jointext(feedback,null))
	if(!heard_something)
		to_chat(src, "<span class='notice'>Вы не слышите передвижений помимо собственных.</span>")

/mob/living/carbon/human/proc/regenerate()
	set name = "Регенерировать"
	set desc = "Позволяет по новой вырастить конечности и залечить органы."
	set category = "Способности"

	if(nutrition < 250)
		to_chat(src, "<span class='warning'>У Вас не хватает биомассы на регенерацию!</span>")
		return

	if(active_regen)
		to_chat(src, "<span class='warning'>Вы уже регенерируете!</span>")
		return
	else
		active_regen = TRUE
		src.visible_message("<B>[src]</B> начинает заживлять своё тело...")

	var/delay_length = round(active_regen_delay * species.active_regen_mult)
	if(do_after(src,delay_length))
		adjust_nutrition(-200)

		for(var/obj/item/organ/I in internal_organs)
			if(I.robotic >= ORGAN_ROBOT) // No free robofix.
				continue
			if(I.damage > 0)
				I.damage = max(I.damage - 30, 0) //Repair functionally half of a dead internal organ.
				I.status = 0	// Wipe status, as it's being regenerated from possibly dead.
				to_chat(src, "<span class='notice'>Вы чувствуете что-то приятное в вашей [I.name]...</span>")

		// Replace completely missing limbs.
		for(var/limb_type in src.species.has_limbs)
			var/obj/item/organ/external/E = src.organs_by_name[limb_type]

			if(E && E.disfigured)
				E.disfigured = 0
			if(E && (E.is_stump() || (E.status & (ORGAN_DESTROYED|ORGAN_DEAD|ORGAN_MUTATED))))
				E.removed()
				qdel(E)
				E = null
			if(!E)
				var/list/organ_data = src.species.has_limbs[limb_type]
				var/limb_path = organ_data["path"]
				var/obj/item/organ/O = new limb_path(src)
				organ_data["descriptor"] = O.name
				to_chat(src, "<span class='notice'>Вы ощущаете что-то склизкое, пока ваша [O.name] переформировывается.</span>")

				var/agony_to_apply = round(0.66 * O.max_damage) // 66% of the limb's health is converted into pain.
				src.apply_damage(agony_to_apply, HALLOSS)

		for(var/organtype in species.has_organ) // Replace completely missing internal organs. -After- external ones, so they all should exist.
			if(!src.internal_organs_by_name[organtype])
				var/organpath = species.has_organ[organtype]
				var/obj/item/organ/Int = new organpath(src, TRUE)

				Int.rejuvenate(TRUE)

		handle_organs() // Update everything

		update_icons_body()
		active_regen = FALSE
	else
		to_chat(src, "<span class='critical'>Вашей регенерации помешали!</span>")
		adjust_nutrition(-75)
		active_regen = FALSE

/mob/living/carbon/human/proc/setmonitor_state()
	set name = "Сменить Изображение На Мониторе"
	set desc = "Изменить то, что отображается на Вашем мониторе."
	set category = "IC"
	if(stat)
		to_chat(src,"<span class='warning'>Вы должны быть на ногах, чтобы это сделать!</span>")
		return
	var/obj/item/organ/external/head/E = organs_by_name[BP_HEAD]
	if(!E)
		to_chat(src,"<span class='warning'>У Вас, вроде, нету головы!</span>")
		return
	var/datum/robolimb/robohead = all_robolimbs[E.model]
	if(!robohead.monitor_styles || !robohead.monitor_icon)
		to_chat(src,"<span class='warning'>У Вашей головы нет монитора, либо она не поддерживает изображения!</span>")
		return
	var/list/states
	if(!states)
		states = params2list(robohead.monitor_styles)
	var/choice = input("Пожалуйста, выберите иконку.") as null|anything in states
	if(choice)
		E.eye_icon_location = robohead.monitor_icon
		E.eye_icon = states[choice]
		to_chat(src,"<span class='warning'>Вы выставили на мониторе изображение [choice]!</span>")
		update_icons_body()
