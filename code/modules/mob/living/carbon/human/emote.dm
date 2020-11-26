/mob/living/carbon/human/emote(var/act,var/m_type=1,var/message = null)
	var/param = null

	var/datum/gender/T = gender_datums[get_visible_gender()]

	if(findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext_char(act, t1 + 1, length(act) + 1)
		act = copytext_char(act, 1, t1)

	var/muzzled = is_muzzled()
	//var/m_type = 1

	for(var/obj/item/organ/O in organs)
		for(var/obj/item/weapon/implant/I in O)
			if(I.implanted)
				I.trigger(act, src)

	if(stat == DEAD && (act != "deathgasp"))
		return

	if(attempt_vr(src, "handle_emote_vr", list(act, m_type, message))) return //VOREStation Add - Custom Emote Handler

	switch(act)
		if("airguitar")
			if(!restrained())
				message = "играет на воображаемой гитаре и качает головой как обезьяна."
				m_type = 1

		//Machine-only emotes
		if("ping", "beep", "buzz", "yes", "ye", "dwoop", "no", "rcough", "rsneeze")

			if(!isSynthetic())
				to_chat(src, "<span class='warning'>Вы не синтетик.</span>")
				return

			var/M = null
			if(param)
				for(var/mob/A in view(null, null))
					if(param == A.name)
						M = A
						break
			if(!M)
				param = null

			var/display_msg = "пикает."
			var/use_sound = 'sound/machines/twobeep.ogg'
			if(act == "buzz")
				display_msg = "жужжит"
				use_sound = 'sound/machines/buzz-sigh.ogg'
			else if(act == "ping")
				display_msg = "издаёт пиканье"
				use_sound = 'sound/machines/ping.ogg'
			else if(act == "yes" || act == "ye")
				display_msg = "издаёт положительный бип"
				use_sound = 'sound/machines/synth_yes.ogg'
			else if(act == "dwoop")
				display_msg = "радостно чирикает"
				use_sound = 'sound/machines/dwoop.ogg'
			else if(act == "no")
				display_msg = "издаёт отрицательный бип"
				use_sound = 'sound/machines/synth_no.ogg'
			else if(act == "rcough")
				display_msg = "издаёт роботический кашель"
				if(get_gender() == FEMALE)
					use_sound = pick('sound/effects/mob_effects/f_machine_cougha.ogg','sound/effects/mob_effects/f_machine_coughb.ogg')
				else
					use_sound = pick('sound/effects/mob_effects/m_machine_cougha.ogg','sound/effects/mob_effects/m_machine_coughb.ogg', 'sound/effects/mob_effects/m_machine_coughc.ogg')
			else if(act == "rsneeze")
				display_msg = "издаёт роботический чих"
				if(get_gender() == FEMALE)
					use_sound = 'sound/effects/mob_effects/machine_sneeze.ogg'
				else
					use_sound = 'sound/effects/mob_effects/f_machine_sneeze.ogg'

			if(param)
				message = "[display_msg] на [param]."
			else
				message = "[display_msg]."
			playsound(src, use_sound, 50, 0, preference = /datum/client_preference/emote_noises) //VOREStation Add
			m_type = 1

		//Promethean-only emotes
		if("squish")
			/* VOREStation Removal Start - Eh. People can squish maybe.
			if(species.bump_flag != SLIME) //This should definitely do it.
				to_chat(src, "<span class='warning'>You are not a slime thing!</span>")
				return
			*/ //VOREStation Removal End
			playsound(src, 'sound/effects/slime_squish.ogg', 50, 0, preference = /datum/client_preference/emote_noises) //VOREStation Add //Credit to DrMinky (freesound.org) for the sound.
			message = "издаёт хлюпающий звук."
			m_type = 1

		//Skrell-only emotes
		if("warble")
			if(species.name != SPECIES_SKRELL)
				to_chat(src, "<span class='warning'>Вы не скрелл!</span>")
				return

			playsound(src, 'sound/effects/warble.ogg', 50, 0, preference = /datum/client_preference/emote_noises) //VOREStation Add // Copyright CC BY 3.0 alienistcog (freesound.org) for the sound.
			message = "варблит."
			m_type = 2

		if("blink")
			message = "моргает."
			m_type = 1

		if("blink_r")
			message = "несколько раз моргает."
			m_type = 1

		if("bow")
			if(!buckled)
				var/M = null
				if(param)
					for(var/mob/A in view(null, null))
						if(param == A.name)
							M = A
							break
				if(!M)
					param = null

				if(param)
					message = "поклоняется [param]."
				else
					message = "поклоняется."
			m_type = 1

		if("custom")
			var/input = sanitize(input("Введите эмоут.") as text|null)
			if(!input)
				return
			var/input2 = input("Это видимый или слышимый эмоут?") in list("Видимый","Слышимый")
			if(input2 == "Видимый")
				m_type = 1
			else if(input2 == "Слышимый")
				if(miming)
					return
				m_type = 2
			else
				alert("Этот эмоут нельзя использовать, он должен быть либо видимым, либо слышимым.")
				return
			return custom_emote(m_type, input)

		if("me")

			//if(silent && silent > 0 && findtext(message,"\"",1, null) > 0)
			//	return //This check does not work and I have no idea why, I'm leaving it in for reference.

			if(client)
				if(client.prefs.muted & MUTE_IC)
					to_chat(src, "<font color='red'>Вы не можете отправлять IC сообщения (мут).</font>")
					return
			if(stat)
				return
			if(!(message))
				return
			return custom_emote(m_type, message)

		if("salute")
			if(!buckled)
				var/M = null
				if(param)
					for(var/mob/A in view(null, null))
						if(param == A.name)
							M = A
							break
				if(!M)
					param = null

				if(param)
					message = "отдает честь [param]."
				else
					message = "отдает честь."
			m_type = 1

		if("choke")
			if(miming)
				message = "отчаянно хватается за свою глотку!"
				m_type = 1
			else
				if(!muzzled)
					message = "давится!"
					m_type = 2
				else
					message = "издаёт громкий звук."
					m_type = 2

		if("clap")
			if(!restrained())
				message = "хлопает."
				playsound(src, 'sound/misc/clapping.ogg')
				m_type = 2
				if(miming)
					m_type = 1

		if("flap")
			if(!restrained())
				message = "порхает своими крыльями."
				m_type = 2
				if(miming)
					m_type = 1

		if("aflap")
			if(!restrained())
				message = "НЕДОВОЛЬНО порхает своими крыльями!"
				m_type = 2
				if(miming)
					m_type = 1

		if("drool")
			message = "истекает слюной."
			m_type = 1

		if("eyebrow")
			message = "приподнимает бровь."
			m_type = 1

		if("chuckle")
			if(miming)
				message = "хохочет, на вид."
				m_type = 1
			else
				if(!muzzled)
					message = "хохочет."
					m_type = 2
				else
					message = "издаёт звук."
					m_type = 2

		if("twitch")
			message = "вздрагивает."
			m_type = 1

		if("twitch_v")
			message = "сильно вздрагивает."
			m_type = 1

		if("faint")
			message = "падает в обморок."
			if(sleeping)
				return //Can't faint while asleep
			Sleeping(10)
			m_type = 1

		if("cough", "coughs")
			if(miming)
				message = "кажется, кашляет!"
				m_type = 1
			else
				if(!muzzled)
					var/robotic = 0
					m_type = 2
					if(should_have_organ(O_LUNGS))
						var/obj/item/organ/internal/lungs/L = internal_organs_by_name[O_LUNGS]
						if(L && L.robotic == 2)	//Hard-coded to 2, incase we add lifelike robotic lungs
							robotic = 1
					if(!robotic)
						message = "кашляет!"
						if(get_gender() == FEMALE)
							if(species.female_cough_sounds)
								playsound(src, pick(species.female_cough_sounds), 120, preference = /datum/client_preference/emote_noises) //VOREStation Add
						else
							if(species.male_cough_sounds)
								playsound(src, pick(species.male_cough_sounds), 120, preference = /datum/client_preference/emote_noises) //VOREStation Add
					else
						message = "издаёт роботический кашель."
						var/use_sound
						if(get_gender() == FEMALE)
							use_sound = pick('sound/effects/mob_effects/f_machine_cougha.ogg','sound/effects/mob_effects/f_machine_coughb.ogg')
						else
							use_sound = pick('sound/effects/mob_effects/m_machine_cougha.ogg','sound/effects/mob_effects/m_machine_coughb.ogg', 'sound/effects/mob_effects/m_machine_coughc.ogg')
						playsound(src, use_sound, 50, 0, preference = /datum/client_preference/emote_noises) //VOREStation Add
				else
					message = "издаёт громкий звук."
					m_type = 2

		if("frown")
			message = "нахмуривается."
			m_type = 1

		if("nod")
			message = "кивает."
			m_type = 1

		if("blush")
			message = "краснеет."
			m_type = 1

		if("wave")
			message = "машет рукой."
			m_type = 1

		if("gasp")
			if(miming)
				message = "кажется, задыхается!"
				m_type = 1
			else
				if(!muzzled)
					message = "задыхается!"
					m_type = 2
					if(get_gender() == FEMALE)
						playsound(src, pick(species.female_gasp_sound), 80, 1)
					else
						playsound(src, pick(species.male_gasp_sound), 80, 1) //default to male screams if no gender is present.
				else
					message = "издает слабый звук."
					m_type = 2

		if("deathgasp")
			message = "[species.get_death_message()]"
			m_type = 1

		if("giggle")
			if(miming)
				message = "молча хихикает!"
				m_type = 1
			else
				if(!muzzled)
					message = "хихикает."
					m_type = 2
					if(get_gender() == FEMALE)
						playsound(src, pick(species.female_giggle_sounds), 80, 1)
					else
						playsound(src, pick(species.male_giggle_sounds), 80, 1) //default to male screams if no gender is present.
				else
					message = "издаёт звук."
					m_type = 2

		if("glare")
			var/M = null
			if(param)
				for(var/mob/A in view(null, null))
					if(param == A.name)
						M = A
						break
			if(!M)
				param = null

			if(param)
				message = "недовольно пялится на [param]."
			else
				message = "недовольно пялится."

		if("stare")
			var/M = null
			if(param)
				for(var/mob/A in view(null, null))
					if(param == A.name)
						M = A
						break
			if(!M)
				param = null

			if(param)
				message = "пялится на [param]."
			else
				message = "пялится."

		if("look")
			var/M = null
			if(param)
				for(var/mob/A in view(null, null))
					if(param == A.name)
						M = A
						break

			if(!M)
				param = null

			if(param)
				message = "смотрит на [param]."
			else
				message = "смотрит."
			m_type = 1

		if("grin")
			message = "ухмыляется."
			m_type = 1

		if("cry")
			if(miming)
				message = "плачет."
				m_type = 1
			else
				if(!muzzled)
					message = "плачет."
					m_type = 2
					if(get_gender() == FEMALE)
						playsound(src, pick(species.female_cry_sounds), 80, 1)
					else
						playsound(src, pick(species.male_cry_sounds), 80, 1) //default to male crys if no gender is present.
				else
					message = "издаёт слабый звук. [T.he] [get_visible_gender() == NEUTER ? "хмурится" : "хмурится"]." // no good, non-unwieldy alternative to this ternary at the moment
					m_type = 2

		if("sigh")
			if(miming)
				message = "вздыхает."
				m_type = 1
			else
				if(!muzzled)
					message = "вздыхает."
					m_type = 2
					if(get_gender() == FEMALE)
						playsound(src, pick(species.female_sigh_sounds), 80, 1)
					else
						playsound(src, pick(species.male_sigh_sounds), 80, 1) //default to male sighs if no gender is present.
				else
					message = "издаёт слабый звук."
					m_type = 2

		if("laugh")
			if(miming)
				message = "разрывается смехом."
				m_type = 1
			else
				if(!muzzled)
					message = "смеётся."
					m_type = 2
					if(get_gender() == FEMALE)
						playsound(src, pick(species.female_laugh_sounds), 80, 1)
					else
						playsound(src, pick(species.male_laugh_sounds), 80, 1) //default to male laughs if no gender is present.
				else
					message = "издаёт звук."
					m_type = 2

		if("mumble")
			message = "бормочет!"
			m_type = 2
			if(miming)
				m_type = 1

		if("grumble")
			if(miming)
				message = "ворчит!"
				m_type = 1
			if(!muzzled)
				message = "ворчит!"
				m_type = 2
			else
				message = "издает звук."
				m_type = 2

		if("groan")
			if(miming)
				message = "недовольно бурчит!"
				m_type = 1
			else
				if(!muzzled)
					message = "недовольно бурчит!"
					m_type = 2
				else
					message = "издаёт громкий звук."
					m_type = 2

		if("moan")
			if(miming)
				message = "стонет!"
				m_type = 1
			else
				message = "стонет!"
				m_type = 2
				if(get_gender() == FEMALE)
					playsound(src, pick(species.female_moan_sounds), 80, 1)
				else
					playsound(src, pick(species.male_moan_sounds), 80, 1) //default to male moans if no gender is present.

		if("johnny")
			var/M
			if(param)
				M = param
			if(!M)
				param = null
			else
				if(miming)
					message = "втягивает дым из сигареты и выдувает дым в форме \"[M]\" в воздухе."
					m_type = 1
				else
					message = "говорит, \"[M], бога ради. У него была семья.\" [name] втягивает дым из сигареты и выдувает в воздухе его имя."
					m_type = 2

		if("point")
			if(!restrained())
				var/mob/M = null
				if(param)
					for(var/atom/A as mob|obj|turf|area in view(null, null))
						if(param == A.name)
							M = A
							break

				if(!M)
					message = "показывает пальцем."
				else
					pointed(M)

				if(M)
					message = "показывает пальцем на [M]."
				else
			m_type = 1

		if("crack")
			if(!restrained())
				message = "хрустит костяшками пальцев."
				playsound(src, 'sound/voice/knuckles.ogg', 50, 1, preference = /datum/client_preference/emote_noises)
				m_type = 1

		if("raise")
			if(!restrained())
				message = "поднимает руку."
			m_type = 1

		if("shake")
			message = "качает головой."
			m_type = 1

		if("shrug")
			message = "пожимает плечами."
			m_type = 1

		if("signal")
			if(!restrained())
				var/t1 = round(text2num(param))
				if(isnum(t1))
					if(t1 <= 5 && (!r_hand || !l_hand))
						message = "показывает несколько пальцев ([t1])."
					else if(t1 <= 10 && (!r_hand && !l_hand))
						message = "показывает несколько пальцев ([t1])"
			m_type = 1

		if("smile")
			message = "улыбается."
			m_type = 1

		if("shiver")
			message = "пробирается дрожью."
			m_type = 2
			if(miming)
				m_type = 1

		if("pale")
			message = "бледнеет на секундду."
			m_type = 1

		if("tremble")
			message = "дрожит в ужасе!"
			m_type = 1

		if("sneeze", "sneezes")
			if(miming)
				message = "чихает."
				m_type = 1
			else
				if(!muzzled)
					var/robotic = 0
					m_type = 2
					if(should_have_organ(O_LUNGS))
						var/obj/item/organ/internal/lungs/L = internal_organs_by_name[O_LUNGS]
						if(L && L.robotic == 2)	//Hard-coded to 2, incase we add lifelike robotic lungs
							robotic = 1
					if(!robotic)
						message = "чихает."
						if(get_gender() == FEMALE)
							playsound(src, species.female_sneeze_sound, 70, preference = /datum/client_preference/emote_noises) //VOREStation Add
						else
							playsound(src, species.male_sneeze_sound, 70, preference = /datum/client_preference/emote_noises) //VOREStation Add
						m_type = 2
					else
						message = "издаёт роботический чих"
						var/use_sound
						if(get_gender() == FEMALE)
							use_sound = 'sound/effects/mob_effects/machine_sneeze.ogg'
						else
							use_sound = 'sound/effects/mob_effects/f_machine_sneeze.ogg'
						playsound(src, use_sound, 50, 0, preference = /datum/client_preference/emote_noises) //VOREStation Add
				else
					message = "издаёт странный звук."
					m_type = 2

		if("sniff")
			message = "принюхивается."
			m_type = 2
			if(miming)
				m_type = 1

		if("snore")
			if(miming)
				message = "храпит."
				m_type = 1
			else
				if(!muzzled)
					message = "храпит."
					m_type = 2
					if(get_gender() == FEMALE)
						playsound(src, pick(species.female_snore_sounds), 80, 1)
					else
						playsound(src, pick(species.male_snore_sounds), 80, 1) //default to male moans if no gender is present.
				else
					message = "издаёт звук."
					m_type = 2

		if("whimper")
			if(miming)
				message = "в мучениях, кажется."
				m_type = 1
			else
				if(!muzzled)
					message = "скулит."
					m_type = 2
				else
					message = "издаёт тихий звук."
					m_type = 2

		if("wink")
			message = "подмигивает."
			m_type = 1

		if("yawn")
			if(!muzzled)
				message = "зевает."
				m_type = 2
				if(get_gender() == FEMALE)
					playsound(src, pick(species.female_yawn_sounds), 80, 1)
				else
					playsound(src, pick(species.male_yawn_sounds), 80, 1) //default to male yawns if no gender is present.
				if(miming)
					m_type = 1

		if("collapse")
			Paralyse(2)
			message = "падает на пол!"
			m_type = 2
			if(miming)
				m_type = 1

		if("hug")
			m_type = 1
			if(!restrained())
				var/M = null
				if(param)
					for(var/mob/A in view(1, null))
						if(param == A.name)
							M = A
							break
				if(M == src)
					M = null

				if(M)
					message = "обнимает [M]."
				else
					message = "обнимает себя."

		if("handshake")
			m_type = 1
			if(!restrained() && !r_hand)
				var/mob/living/M = null
				if(param)
					for(var/mob/living/A in view(1, null))
						if(param == A.name)
							M = A
							break
				if(M == src)
					M = null

				if(M)
					if(M.canmove && !M.r_hand && !M.restrained())
						message = "жмёт руку [M]."
					else
						message = "протягивает руку [M]."

		if("dap")
			m_type = 1
			if(!restrained())
				var/M = null
				if(param)
					for(var/mob/A in view(1, null))
						if(param == A.name)
							M = A
							break
				if(M)
					message = "обменивается дапом с [M]."
				else
					message = "хочет обменяться с кем-то дапами, а не с кем. Обменивается сам с собой. Позор."

		if("slap", "slaps")
			m_type = 1
			if(!restrained())
				var/M = null
				if(param)
					for(var/mob/A in view(1, null))
						if(param == A.name)
							M = A
							break
				if(M)
					message = "<span class='danger'>шлёпает [M] по лицу. Ауч!</span>"
					playsound(src, 'sound/effects/snap.ogg', 50, 1, preference = /datum/client_preference/emote_noises) //VOREStation Add
					if(ishuman(M)) //Snowflakey!
						var/mob/living/carbon/human/H = M
						if(istype(H.wear_mask,/obj/item/clothing/mask/smokable))
							H.drop_from_inventory(H.wear_mask)
				else
					message = "<span class='danger'>шлёпает себя по лицу!</span>"
					playsound(src, 'sound/effects/snap.ogg', 50, 1, preference = /datum/client_preference/emote_noises) //VOREStation Add

		if("scream", "screams")
			if(miming)
				message = "издаёт крик!"
				m_type = 1
			else
				if(!muzzled)
					message = "[species.scream_verb]!"
					m_type = 2
					// Removed, pending the location of some actually good, properly licensed sounds.
					if(get_gender() == FEMALE)
						playsound(src, "[species.female_scream_sound]", 80, 1)
					else
						playsound(src, "[species.male_scream_sound]", 80, 1) //default to male screams if no gender is present.
				else
					message = "издает очень громкий шум."
					m_type = 2

		if("snap", "snaps")
			m_type = 2
			var/mob/living/carbon/human/H = src
			var/obj/item/organ/external/L = H.get_organ("l_hand")
			var/obj/item/organ/external/R = H.get_organ("r_hand")
			var/left_hand_good = 0
			var/right_hand_good = 0
			if(L && (!(L.status & ORGAN_DESTROYED)) && (!(L.splinted)) && (!(L.status & ORGAN_BROKEN)))
				left_hand_good = 1
			if(R && (!(R.status & ORGAN_DESTROYED)) && (!(R.splinted)) && (!(R.status & ORGAN_BROKEN)))
				right_hand_good = 1

			if(!left_hand_good && !right_hand_good)
				to_chat(usr, "У Вас должна быть хотя бы одна рука в исправном состоянии, чтобы щёлкнуть пальцами.")
				return

			message = "щелкает пальцами."
			playsound(src, 'sound/effects/fingersnap.ogg', 50, 1, -3, preference = /datum/client_preference/emote_noises) //VOREStation Add

		if("swish")
			animate_tail_once()

		if("wag", "sway")
			animate_tail_start()

		if("qwag", "fastsway")
			animate_tail_fast()

		if("swag", "stopsway")
			animate_tail_stop()

		if("vomit")
			if(isSynthetic())
				to_chat(src, "<span class='warning'>Вы не можете блевануть.</span>")
				return
			vomit()
			return

		if("whistle" || "whistles")
			if(!muzzled)
				message = "насвистывает мелодию."
				playsound(src, 'sound/misc/longwhistle.ogg', preference = /datum/client_preference/emote_noises) //VOREStation Add
			else
				message = "издает легкий гул, попытавшись свистнуть."

		if("qwhistle")
			if(!muzzled)
				message = "тихонько свистит."
				playsound(src, 'sound/misc/shortwhistle.ogg', preference = /datum/client_preference/emote_noises) //VOREStation Add
			else
				message = "издает легкий гул, попытавшись свистнуть."

		if("help")
			to_chat(src, "<span class='filter_say'>blink, blink_r, blush, bow-(none)/mob, burp, choke, chuckle, clap, collapse, cough, cry, custom, deathgasp, drool, eyebrow, fastsway/qwag, \
					frown, gasp, giggle, glare-(none)/mob, grin, groan, grumble, handshake, hug-(none)/mob, laugh, look-(none)/mob, moan, mumble, nod, pale, point-atom, \
					raise, salute, scream, sneeze, shake, shiver, shrug, sigh, signal-#1-10, slap-(none)/mob, smile, sneeze, sniff, snore, stare-(none)/mob, stopsway/swag, sway/wag, swish, tremble, twitch, \
					twitch_v, vomit, whimper, wink, yawn. Prometheans: squish Synthetics: beep, buzz, dwoop, yes, no, rcough, rsneeze, ping. Skrell: warble</span>")

		else
			to_chat(src, "<span class='filter_say'><font color='blue'>Нельзя использовать эмоут '[act]'. Скажите *help и *vhelp для полного перечня.</font></span>") //VOREStation Edit, mention *vhelp for Virgo-specific emotes located in emote_vr.dm.

	if(message)
		custom_emote(m_type,message)

/mob/living/carbon/human/verb/pose()
	set name = "Установить Позу"
	set desc = "Установить описание, отображаемое при осмотре Вашего персонажа."
	set category = "IC"

	//var/datum/gender/T = gender_datums[get_visible_gender()]

	pose = sanitize(input(usr, "Это [src]...", "Поза", null)  as text)

/mob/living/carbon/human/verb/set_flavor()
	set name = "Установить Описание Персонажа"
	set desc = "Установить расширенное описание внешности Вашего персонажа."
	set category = "IC"

	var/HTML = "<meta charset=\"utf-8\"><body>"
	HTML += "<tt><center>"
	HTML += "<b>Обновить описание персонажа</b> <hr />"
	HTML += "<br></center>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=general'>Общая:</a> "
	HTML += TextPreview(flavor_texts["general"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=head'>Голова:</a> "
	HTML += TextPreview(flavor_texts["head"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=face'>Лицо:</a> "
	HTML += TextPreview(flavor_texts["face"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=eyes'>Глаза:</a> "
	HTML += TextPreview(flavor_texts["eyes"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=torso'>Тело:</a> "
	HTML += TextPreview(flavor_texts["torso"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=arms'>Руки:</a> "
	HTML += TextPreview(flavor_texts["arms"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=hands'>Кисти:</a> "
	HTML += TextPreview(flavor_texts["hands"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=legs'>Ноги:</a> "
	HTML += TextPreview(flavor_texts["legs"])
	HTML += "<br>"
	HTML += "<a href='byond://?src=\ref[src];flavor_change=feet'>Стопы:</a> "
	HTML += TextPreview(flavor_texts["feet"])
	HTML += "<br>"
	HTML += "<hr />"
	HTML +="<a href='?src=\ref[src];flavor_change=done'>\[Готово\]</a>"
	HTML += "<tt>"
	src << browse(HTML, "window=flavor_changes;size=430x300")
