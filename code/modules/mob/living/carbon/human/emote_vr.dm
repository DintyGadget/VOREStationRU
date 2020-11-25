/mob
	var/nextemote = 1

/mob/living/carbon/human/proc/handle_emote_vr(var/act,var/m_type=1,var/message = null)
	//Reduces emote spamming
	if(nextemote >= world.time)// || user.stat != CONSCIOUS
		return 1
	nextemote = world.time + 12

	switch(act)
		if("vwag")
			if(toggle_tail_vr(message = 1))
				m_type = 1
				message = "[wagging ? "начинает" : "прекращает"] вилять хвостом."
			else
				return 1
		if("vflap")
			if(toggle_wing_vr(message = 1))
				m_type = 1
				message = "[flapping ? "начинает" : "прекращает"] взмахивать крыльями."
			else
				return 1
		if("mlem")
			message = "делает млем своим язычком себе к носу. Млем."
			m_type = 1
		if("blep")
			message = "показывает свой язык. Блеп."
			m_type = 1
		if("awoo")
			m_type = 2
			message = "издаёт 'Авууу!'."
			playsound(src, 'sound/voice/awoo.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("awoo2")
			m_type = 2
			message = "издаёт 'Авууу!'."
			playsound(src, 'sound/voice/long_awoo.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("growl")
			m_type = 2
			message = "издаёт рык."
			playsound(src, 'sound/voice/growl.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("woof")
			m_type = 2
			message = "издаёт 'Вуф!'."
			playsound(src, 'sound/voice/woof.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("woof2")
			m_type = 2
			message = "издаёт 'Вуф!'."
			playsound(src, 'sound/voice/woof2.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("nya")
			message = "издаёт 'Ня!'."
			m_type = 2
			playsound(src, 'sound/voice/nya.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("mrowl")
			message = "издаёт 'Мрряур!'."
			m_type = 2
			playsound(src, 'sound/voice/mrow.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("peep")
			message = "чирикает как птичка."
			m_type = 2
			playsound(src, 'sound/voice/peep.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("chirp")
			message = "чирикает!"
			playsound(src, 'sound/misc/nymphchirp.ogg', 50, 0, preference = /datum/client_preference/emote_noises)
			m_type = 2
		if("hoot")
			message = "гудит по-филински!"
			playsound(src, 'sound/voice/hoot.ogg', 50, 1, ,-1, preference = /datum/client_preference/emote_noises)
			m_type = 2
		if("weh")
			message = "издаёт 'Вех!'."
			m_type = 2
			playsound(src, 'sound/voice/weh.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("merp")
			message = "издаёт 'Мерп!'."
			m_type = 2
			playsound(src, 'sound/voice/merp.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("myarp")
			message = "издаёт 'Мярп!'."
			m_type = 2
			playsound(src, 'sound/voice/myarp.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("bark")
			message = "издаёт 'Гав!'."
			m_type = 2
			playsound(src, 'sound/voice/bark2.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("bork")
			m_type = 2
			message = "издаёт 'Гов!'."
			playsound(src, 'sound/voice/bork.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if ("mrow")
			m_type = 2
			message = "издаёт 'Мряу!'."
			playsound(src, 'sound/voice/mrow.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if ("hypno")
			m_type = 2
			message = "загадочно гудит."
			playsound(src, 'sound/voice/hypno.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("hiss")
			message = "шипит."
			m_type = 2
			playsound(src, 'sound/voice/hiss.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("rattle")
			message = "крокочет!"
			m_type = 2
			playsound(src, 'sound/voice/rattle.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("squeak")
			message = "издаёт писк."
			m_type = 2
			playsound(src, 'sound/effects/mouse_squeak.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("geck")
			message = "издаёт 'Гекеке!'.!"
			m_type = 2
			playsound(src, 'sound/voice/geck.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("baa")
			message = "издаёт 'Бее!'."
			m_type = 2
			playsound(src, 'sound/voice/baa.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("baa2")
			message = "блеет."
			m_type = 2
			playsound(src, 'sound/voice/baa2.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("deathgasp2")
			message = "[species.get_death_message()]"
			m_type = 1
			playsound(src, 'sound/voice/deathgasp2.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("mar")
			message = "издаёт 'Мар!'."
			m_type = 2
			playsound(src, 'sound/voice/mar.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("wurble")
			message = "издаёт бурлыканье."
			m_type = 2
			playsound(src, 'sound/voice/wurble.ogg', 50, 1, -1, preference = /datum/client_preference/emote_noises)
		if("snort")
			message = "фыркает от смеха!"
			m_type = 2
			playsound(src, 'sound/voice/Snort.ogg', 50, 0, preference = /datum/client_preference/emote_noises)
		if("meow")
			message = "нежно мяукает!"
			m_type = 2
			playsound(src, 'sound/voice/Meow.ogg', 50, 0, preference = /datum/client_preference/emote_noises)
		if("moo")
			message = "вдыхает и издаёт 'Муу!'."
			m_type = 2
			playsound(src, 'sound/voice/Moo.ogg', 50, 0, preference = /datum/client_preference/emote_noises)
		if("croak")
			message = "крокочет в глотке, раздувая щёки."
			m_type = 2
			playsound(src, 'sound/voice/Croak.ogg', 50, 0, preference = /datum/client_preference/emote_noises)
		if("gao")
			message = "издаёт 'Гао!'."
			m_type = 2
			playsound(src, 'sound/voice/gao.ogg', 50, 0, preference = /datum/client_preference/emote_noises)
		if("cackle")
			message = "истерически ржёт!"
			m_type = 2
			playsound(src, 'sound/voice/YeenCackle.ogg', 50, 0, preference = /datum/client_preference/emote_noises)
		if("nsay")
			nsay()
			return TRUE
		if("nme")
			nme()
			return TRUE
		if("flip")
			var/list/involved_parts = list(BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)
			//Check if they are physically capable
			if(sleeping || resting || buckled || weakened || restrained() || involved_parts.len < 2)
				to_chat(src, "<span class='warning'>Вы не можете сделать сальто в таком состоянии!</span>")
				return 1
			else
				nextemote += 12 //Double delay
				handle_flip_vr()
				message = "делает сальто!"
				m_type = 1
		if("vhelp") //Help for Virgo-specific emotes.
			to_chat(src, "vwag, vflap, mlem, blep, awoo, awoo2, growl, nya, peep, chirp, hoot, weh, merp, myarp, bark, bork, mrow, mrowl, hypno, hiss, rattle, squeak, geck, baa, baa2, mar, wurble, snort, meow, moo, croak, gao, cackle, nsay, nme, flip")
			return TRUE

	if(message)
		custom_emote(m_type,message)
		return TRUE

	return FALSE


/mob/living/carbon/human/proc/handle_flip_vr()
	var/original_density = density
	var/original_passflags = pass_flags

	//Briefly un-dense to dodge projectiles
	density = FALSE

	//Parkour!
	var/parkour_chance = 20 //Default
	if(species)
		parkour_chance = species.agility
	if(prob(parkour_chance))
		pass_flags |= PASSTABLE
	else
		Confuse(1) //Thud

	if(dir & WEST)
		SpinAnimation(7,1,0)
	else
		SpinAnimation(7,1,1)

	spawn(7)
		density = original_density
		pass_flags = original_passflags

/mob/living/carbon/human/proc/toggle_tail_vr(var/setting,var/message = 0)
	if(!tail_style || !tail_style.ani_state)
		if(message)
			to_chat(src, "<span class='warning'>Ваш хвост такое не поддерживает.</span>")
		return 0

	var/new_wagging = isnull(setting) ? !wagging : setting
	if(new_wagging != wagging)
		wagging = new_wagging
		update_tail_showing()
	return 1

/mob/living/carbon/human/proc/toggle_wing_vr(var/setting,var/message = 0)
	if(!wing_style || !wing_style.ani_state)
		if(message)
			to_chat(src, "<span class='warning'>Ваш хвост такое не поддерживает.</span>")
		return 0

	var/new_flapping = isnull(setting) ? !flapping : setting
	if(new_flapping != flapping)
		flapping = setting
		update_wing_showing()
	return 1

/mob/living/carbon/human/verb/toggle_gender_identity_vr()
	set name = "Установить Гендер"
	set desc = "Установить местоимения в тексте вашего Осмотра и эмоутах."
	set category = "IC"
	var/new_gender_identity = input("Пожалуйста, выберите свой новый гендер.") as null|anything in list(FEMALE, MALE, NEUTER, PLURAL, HERM)
	if(!new_gender_identity)
		return 0
	change_gender_identity(new_gender_identity)
	return 1

/mob/living/carbon/human/verb/switch_tail_layer()
	set name = "Сменить Слой Хвоста"
	set category = "IC"
	set desc = "Сменить преобладающий слой хвоста."
	tail_alt = !tail_alt
	update_tail_showing()

/mob/living/carbon/human/verb/hide_wings_vr()
	set name = "Спрятать/Показать Крылья"
	set category = "IC"
	set desc = "Спрятать крылья, или показать, если они уже запрятаны."
	wings_hidden = !wings_hidden
	update_wing_showing()
	var/message = ""
	if(!wings_hidden)
		message = "раскрывает свои крылья!"
	else
		message = "прячет свои крылья."
	visible_message("[src] [message]")
