/mob/living/carbon/human/examine(mob/user)
	// . = ..() //Note that we don't call parent. We build the list by ourselves.

	var/skip_gear = 0
	var/skip_body = 0

	if(alpha <= EFFECTIVE_INVIS)
		return src.loc.examine(user) // Returns messages as if they examined wherever the human was

	var/looks_synth = looksSynthetic()

	//exosuits and helmets obscure our view and stuff.
	if(wear_suit)
		if(wear_suit.flags_inv & HIDESUITSTORAGE)
			skip_gear |= EXAMINE_SKIPSUITSTORAGE

		if(wear_suit.flags_inv & HIDEJUMPSUIT)
			skip_body |= EXAMINE_SKIPARMS | EXAMINE_SKIPLEGS | EXAMINE_SKIPBODY | EXAMINE_SKIPGROIN
			skip_gear |= EXAMINE_SKIPJUMPSUIT | EXAMINE_SKIPTIE | EXAMINE_SKIPHOLSTER

		else if(wear_suit.flags_inv & HIDETIE)
			skip_gear |= EXAMINE_SKIPTIE | EXAMINE_SKIPHOLSTER

		else if(wear_suit.flags_inv & HIDEHOLSTER)
			skip_gear |= EXAMINE_SKIPHOLSTER

		if(wear_suit.flags_inv & HIDESHOES)
			skip_gear |= EXAMINE_SKIPSHOES
			skip_body |= EXAMINE_SKIPFEET

		if(wear_suit.flags_inv & HIDEGLOVES)
			skip_gear |= EXAMINE_SKIPGLOVES
			skip_body |= EXAMINE_SKIPHANDS

	if(w_uniform)
		if(w_uniform.body_parts_covered & LEGS)
			skip_body |= EXAMINE_SKIPLEGS
		if(w_uniform.body_parts_covered & ARMS)
			skip_body |= EXAMINE_SKIPARMS
		if(w_uniform.body_parts_covered & UPPER_TORSO)
			skip_body |= EXAMINE_SKIPBODY
		if(w_uniform.body_parts_covered & LOWER_TORSO)
			skip_body |= EXAMINE_SKIPGROIN

	if(gloves && (gloves.body_parts_covered & HANDS))
		skip_body |= EXAMINE_SKIPHANDS

	if(shoes && (shoes.body_parts_covered & FEET))
		skip_body |= EXAMINE_SKIPFEET

	if(head)
		if(head.flags_inv & HIDEMASK)
			skip_gear |= EXAMINE_SKIPMASK
		if(head.flags_inv & HIDEEYES)
			skip_gear |= EXAMINE_SKIPEYEWEAR
			skip_body |= EXAMINE_SKIPEYES
		if(head.flags_inv & HIDEEARS)
			skip_gear |= EXAMINE_SKIPEARS
		if(head.flags_inv & HIDEFACE)
			skip_body |= EXAMINE_SKIPFACE

	if(wear_mask && (wear_mask.flags_inv & HIDEFACE))
		skip_body |= EXAMINE_SKIPFACE

	//This is what hides what
	var/list/hidden = list(
		BP_GROIN = skip_body & EXAMINE_SKIPGROIN,
		BP_TORSO = skip_body & EXAMINE_SKIPBODY,
		BP_HEAD  = skip_body & EXAMINE_SKIPHEAD,
		BP_L_ARM = skip_body & EXAMINE_SKIPARMS,
		BP_R_ARM = skip_body & EXAMINE_SKIPARMS,
		BP_L_HAND= skip_body & EXAMINE_SKIPHANDS,
		BP_R_HAND= skip_body & EXAMINE_SKIPHANDS,
		BP_L_FOOT= skip_body & EXAMINE_SKIPFEET,
		BP_R_FOOT= skip_body & EXAMINE_SKIPFEET,
		BP_L_LEG = skip_body & EXAMINE_SKIPLEGS,
		BP_R_LEG = skip_body & EXAMINE_SKIPLEGS)

	var/datum/gender/T = gender_datums[get_visible_gender()]

	if((skip_gear & EXAMINE_SKIPJUMPSUIT) && (skip_body & EXAMINE_SKIPFACE)) //big suits/masks/helmets make it hard to tell their gender
		T = gender_datums[PLURAL]

	else if(species && species.ambiguous_genders)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			if(H.species && !istype(species, H.species))
				T = gender_datums[PLURAL]// Species with ambiguous_genders will not show their true gender upon examine if the examiner is not also the same species.
		if(!(issilicon(user) || isobserver(user))) // Ghosts and borgs are all knowing
			T = gender_datums[PLURAL]

	if(!T)
		// Just in case someone VVs the gender to something strange. It'll runtime anyway when it hits usages, better to CRASH() now with a helpful message.
		CRASH("Gender datum was null; key was '[((skip_gear & EXAMINE_SKIPJUMPSUIT) && (skip_body & EXAMINE_SKIPFACE)) ? PLURAL : gender]'")

	var/name_ender = ""
	if(!((skip_gear & EXAMINE_SKIPJUMPSUIT) && (skip_body & EXAMINE_SKIPFACE)))
		//VOREStation Add Start
		if(custom_species)
			name_ender = ", <b>[src.custom_species]</b>"
		else if(looks_synth)
		//VOREStation Add End
			var/use_gender = "синтетик"
			if(gender == MALE)
				use_gender = "андроид"
			else if(gender == FEMALE)
				use_gender = "гиноид"

			name_ender = ", <b><font color='#555555'>[use_gender]!</font></b>[species.get_additional_examine_text(src)]"

		else if(species.name != "Человек")
			name_ender = ", <b><font color='[species.get_flesh_colour(src)]'> [species.get_examine_name()]!</font></b>[species.get_additional_examine_text(src)]"

	var/list/msg = list("<meta charset=\"utf-8\"><span class='info'>*---------*","Это [bicon(src)] <EM>[src.name]</EM>[name_ender]")

	//uniform - lazily edited
	if(w_uniform && !(skip_gear & EXAMINE_SKIPJUMPSUIT) && w_uniform.show_examine)
		//Ties
		var/tie_msg
		if(istype(w_uniform,/obj/item/clothing/under) && !(skip_gear & EXAMINE_SKIPTIE))
			var/obj/item/clothing/under/U = w_uniform
			if(LAZYLEN(U.accessories))
				var/list/accessories_visible = list() //please let this fix the stupid fucking runtimes
				if(skip_gear & EXAMINE_SKIPHOLSTER)
					for(var/obj/item/clothing/accessory/A in U.accessories)
						if(A.show_examine && !istype(A, /obj/item/clothing/accessory/holster)) // If we're supposed to skip holsters, actually skip them
							accessories_visible.Add(A)
				else
					for(var/obj/item/clothing/accessory/A in U.accessories)
						if(A.concealed_holster == 0 && A.show_examine)
							accessories_visible.Add(A)

				if(accessories_visible.len)
					tie_msg += " На [T.ru_g_gcase] одежде [english_list(accessories_visible)]."

		if(w_uniform.blood_DNA)
			msg += "<span class='warning'>[capitalize(T.ru_g_gcase)] [bicon(w_uniform)] [w_uniform.name] в [(w_uniform.blood_color != SYNTH_BLOOD_COLOUR) ? "крови" : "масле"]![tie_msg]</span>"
		else
			msg += "На [T.ru_g_pcase] [bicon(w_uniform)], [w_uniform].[tie_msg]"

	//head -- XenosStation Edited for proper grammar
	if(head && !(skip_gear & EXAMINE_SKIPHELMET) && head.show_examine)
		if(head.blood_DNA)
			msg += "<span class='warning'>[capitalize(T.ru_g_ncase)] ходит [bicon(head)] [(head.blood_color != SYNTH_BLOOD_COLOUR) ? "окровавлен" : "замаслен"][head.rugender == "male" ? "ном" : head.rugender == "female" ? "ной" : gloves.rugender == "plural" ? "ных" : "ном"] [head.pcase]!</span>"
		else
			msg += "[capitalize(T.ru_g_ncase)] ходит в [bicon(head)] [head.pcase]."

	//suit/armour -- lazily edited
	if(wear_suit)
		var/tie_msg
		if(istype(wear_suit,/obj/item/clothing/suit))
			var/obj/item/clothing/suit/U = wear_suit
			if(LAZYLEN(U.accessories))
				tie_msg += " К нему прилагается [english_list(U.accessories)]."

		if(wear_suit.blood_DNA)
			msg += "<span class='warning'>На [T.ru_g_pcase] [bicon(wear_suit)] в [(wear_suit.blood_color != SYNTH_BLOOD_COLOUR) ? "крови" : "масле"] [wear_suit.name][tie_msg]!</span>"
		else
			msg += "На [T.ru_g_pcase] [bicon(wear_suit)], [wear_suit].[tie_msg]"

		//suit/armour storage -- edited BADLY
		if(s_store && !(skip_gear & EXAMINE_SKIPSUITSTORAGE) && s_store.show_examine)
			if(s_store.blood_DNA)
				msg += "<span class='warning'>Поверх [T.ru_g_gcase] костюма [bicon(s_store)] [s_store.name] в [(s_store.blood_color != SYNTH_BLOOD_COLOUR) ? "крови" : "масле"]!</span>"
			else
				msg += "Поверх [wear_suit.name][T.ru_g_ncase] носит [bicon(s_store)] [s_store] поверх ."

	//back -- lazily edited
	if(back && !(skip_gear & EXAMINE_SKIPBACKPACK) && back.show_examine)
		if(back.blood_DNA)
			msg += "<span class='warning'>[bicon(back)] на [T.ru_g_gcase] спине в [(back.blood_color != SYNTH_BLOOD_COLOUR) ? "крови" : "масле"]!</span>"
		else
			msg += "На [T.ru_g_gcase] спине [bicon(back)] [back]."

	//left hand -- lazily edited
	if(l_hand && l_hand.show_examine)
		if(l_hand.blood_DNA)
			msg += "<span class='warning'>[bicon(l_hand)] в [T.ru_g_gcase] левой руке в [(l_hand.blood_color != SYNTH_BLOOD_COLOUR) ? "крови" : "масле"]!</span>"
		else
			msg += "В [T.ru_g_gcase] левой руке [bicon(l_hand)] [l_hand]."

	//right hand -- lazily edited
	if(r_hand && r_hand.show_examine)
		if(r_hand.blood_DNA)
			msg += "<span class='warning'>[bicon(r_hand)] в [T.ru_g_gcase] правой руке в [(r_hand.blood_color != SYNTH_BLOOD_COLOUR) ? "крови" : "масле"]!</span>"
		else
			msg += "В [T.ru_g_gcase] правой руке [bicon(r_hand)] [r_hand]."

	//gloves -- XenosStation Edited for proper grammar
	if(gloves && !(skip_gear & EXAMINE_SKIPGLOVES) && gloves.show_examine)
		if(gloves.blood_DNA)
			msg += "<span class='warning'>[capitalize(T.ru_g_gcase)] руки в [bicon(gloves)] [(gloves.blood_color != SYNTH_BLOOD_COLOUR) ? "окровавлен" : "замаслен"][gloves.rugender == "male" ? "ном" : gloves.rugender == "female" ? "ной" : gloves.rugender == "plural" ? "ных" : "ном"] [gloves.pcase]!</span>"
		else
			msg += "[capitalize(T.ru_g_gcase)] руки в [bicon(gloves)] [gloves.pcase]."
	else if(blood_DNA && !(skip_body & EXAMINE_SKIPHANDS))
		msg += "<span class='warning'>[capitalize(T.ru_g_gcase)] руки в [(hand_blood_color != SYNTH_BLOOD_COLOUR) ? "масле" : "крови"]!</span>"

	//handcuffed? -- XenosStation Edited for proper grammar
	if(handcuffed && handcuffed.show_examine)
		if(istype(handcuffed, /obj/item/weapon/handcuffs/cable))
			msg += "<span class='warning'>[capitalize(T.ru_g_ncase)] [bicon(handcuffed)] связан[T.ru_g_ncase == "он" ? "" : T.ru_g_ncase == "она" ? "а" : T.ru_g_ncase == "они" ? "ы" : "о"] проводом!</span>"
		else
			msg += "<span class='warning'>[capitalize(T.ru_g_ncase)] [bicon(handcuffed)] в наручниках!</span>"

	//buckled -- XenosStation Edited for proper grammar
	if(buckled)
		msg += "<span class='warning'>[capitalize(T.ru_g_ncase)] [bicon(buckled)] посажен[T.ru_g_ncase == "он" ? "" : T.ru_g_ncase == "она" ? "а" : T.ru_g_ncase == "они" ? "ы" : "о"] в [buckled]!</span>"

	//belt -- lazily edited
	if(belt && !(skip_gear & EXAMINE_SKIPBELT) && belt.show_examine)
		if(belt.blood_DNA)
			msg += "<span class='warning'>[T.He] [T.has] [bicon(belt)] [belt.gender==PLURAL?"some":"a"] [(belt.blood_color != SYNTH_BLOOD_COLOUR) ? "blood" : "oil"]-stained [belt.name] about [T.his] waist!</span>"
		else
			msg += "На [T.ru_g_gcase] талии [bicon(belt)] [belt]."

	//shoes -- lazily edited
	if(shoes && !(skip_gear & EXAMINE_SKIPSHOES) && shoes.show_examine)
		if(shoes.blood_DNA)
			//msg += "<span class='warning'>[capitalize(T.ru_g_ncase)] [T.ru_g_ncase == "они" ? "носят" : "носит"] [bicon(shoes)] [(shoes.blood_color != SYNTH_BLOOD_COLOUR) ? "окровавлен" : "замаслен"][shoes.rugender == "male" ? "ный" : shoes.rugender == "female" ? "ная" : shoes.rugender == "plural" ? "ные" : "ное"] [shoes.ncase]!</span>"
			msg += "<span class='warning'>[capitalize(T.ru_g_gcase)] [shoes] в [(feet_blood_color != SYNTH_BLOOD_COLOUR) ? "крови" : "масле"]!</span>"
		else
			msg += "[capitalize(T.ru_g_ncase)] [T.ru_g_ncase == "они" ? "носят" : "носит"] [bicon(shoes)] [shoes]."
	else if(feet_blood_DNA && !(skip_body & EXAMINE_SKIPHANDS))
		msg += "<span class='warning'>[capitalize(T.ru_g_gcase)] ступни в [(feet_blood_color != SYNTH_BLOOD_COLOUR) ? "крови" : "масле"]!</span>"

	//mask -- XenosStation Edited for proper grammar
	if(wear_mask && !(skip_gear & EXAMINE_SKIPMASK) && wear_mask.show_examine)
		/*var/descriptor = "on [T.his] face"
		if(istype(wear_mask, /obj/item/weapon/grenade) && check_has_mouth())
			descriptor = "in [T.his] mouth"

		if(wear_mask.blood_DNA)
			msg += "<span class='warning'>[T.He] [T.has] [bicon(wear_mask)] [wear_mask.gender==PLURAL?"some":"a"] [(wear_mask.blood_color != SYNTH_BLOOD_COLOUR) ? "blood" : "oil"]-stained [wear_mask.name] [descriptor]!</span>"
		else
			msg += "[T.He] [T.has] [bicon(wear_mask)] \a [wear_mask] [descriptor]."
		*/

		// purely because i like to keep things fancy
		if(istype(wear_mask, /obj/item/weapon/grenade) && check_has_mouth())
			if(wear_mask.blood_DNA)
				msg += "<span class='warning'>У [T.ru_g_gcase_b] во рту [bicon(wear_mask)][(wear_mask.blood_color != SYNTH_BLOOD_COLOUR) ? "окровавлен" : "замаслен"][wear_mask.rugender == "male" ? "ный" : wear_mask.rugender == "female" ? "ная" : wear_mask.rugender == "plural" ? "ные" : "ное"] [wear_mask.ncase]!</span>"
			else
				msg += "У [T.ru_g_gcase_b] во рту [bicon(wear_mask)][wear_mask.ncase]."
		else
			if(wear_mask.blood_DNA)
				msg += "<span class='warning'>[capitalize(T.ru_g_ncase)] [T.ru_g_ncase == "они" ? "ходят" : "ходит"] в [bicon(wear_mask)][(wear_mask.blood_color != SYNTH_BLOOD_COLOUR) ? "окровавлен" : "замаслен"][wear_mask.rugender == "male" ? "ном" : wear_mask.rugender == "female" ? "ной" : wear_mask.rugender == "plural" ? "ных" : "ном"] [wear_mask.pcase]!</span>"
			else
				msg += "[capitalize(T.ru_g_ncase)] [T.ru_g_ncase == "они" ? "ходят" : "ходит"] в [bicon(wear_mask)] [wear_mask.pcase]."

	//eyes -- XenosStation Edited for proper grammar
	if(glasses && !(skip_gear & EXAMINE_SKIPEYEWEAR) && glasses.show_examine)
		if(glasses.blood_DNA)
			msg += "<span class='warning'>На [T.ru_g_gcase] глазах [bicon(glasses)] [(glasses.blood_color != SYNTH_BLOOD_COLOUR) ? "окровавлен" : "замаслен"][glasses.rugender == "male" ? "ный" : glasses.rugender == "female" ? "ная" : gloves.rugender == "plural" ? "ные" : "ное"] [glasses.ncase]!</span>"
		else
			msg += "На [T.ru_g_gcase] глазах [bicon(glasses)] [glasses.ncase]"

	//left ear - Edited lazily
	if(l_ear && !(skip_gear & EXAMINE_SKIPEARS) && l_ear.show_examine)
		msg += "На [T.ru_g_gcase] левом ухе [bicon(l_ear)] [l_ear]."

	//right ear - Edited lazily
	if(r_ear && !(skip_gear & EXAMINE_SKIPEARS) && r_ear.show_examine)
		msg += "На [T.ru_g_gcase] правом ухе [bicon(r_ear)] [r_ear]."

	//ID - Edited lazily
	if(wear_id && wear_id.show_examine)
		/*var/id
		if(istype(wear_id, /obj/item/device/pda))
			var/obj/item/device/pda/pda = wear_id
			id = pda.owner
		else if(istype(wear_id, /obj/item/weapon/card/id)) //just in case something other than a PDA/ID card somehow gets in the ID slot :[
			var/obj/item/weapon/card/id/idcard = wear_id
			id = idcard.registered_name
		if(id && (id != real_name) && (get_dist(src, usr) <= 1) && prob(10))
			msg += "<span class='warning'>[T.He] [T.is] wearing [bicon(wear_id)] \a [wear_id] yet something doesn't seem right...</span>"
		else*/
		msg += "При [T.ru_g_pcase] [bicon(wear_id)] [wear_id]."

	//Jitters
	if(is_jittery)
		if(jitteriness >= 300)
			msg += "<span class='warning'><B>Бьется в конвульсиях!</B></span>"
		else if(jitteriness >= 200)
			msg += "<span class='warning'>На нервах.</span>"
		else if(jitteriness >= 100)
			msg += "<span class='warning'>Слегка дергается.</span>"

	//splints
	for(var/organ in BP_ALL)
		var/obj/item/organ/external/o = get_organ(organ)
		if(o && o.splinted && o.splinted.loc == o)
			msg += "<span class='warning'>[T.He] [T.has] \a [o.splinted] on [T.his] [o.name]!</span>"

	if(suiciding)
		msg += "<span class='warning'> похоже, кончает жизнь самоубийством ... надежды на выздоровление нет.</span>"

	//VOREStation Add
	var/list/vorestrings = list()
	vorestrings += examine_weight()
	vorestrings += examine_nutrition()
	vorestrings += examine_bellies()
	vorestrings += examine_pickup_size()
	vorestrings += examine_step_size()
	vorestrings += examine_nif()
	vorestrings += examine_chimera()
	for(var/entry in vorestrings)
		if(entry == "" || entry == null)
			vorestrings -= entry
	msg += vorestrings
	//VOREStation Add End

	if(mSmallsize in mutations)
		msg += "[T.He] [T.is] very short!"

	if (src.stat)
		msg += "<span class='warning'>[T.He] [T.is]n't responding to anything around [T.him] and seems to be asleep.</span>"
		if((stat == 2 || src.losebreath) && get_dist(user, src) <= 3)
			msg += "<span class='warning'>[T.He] [T.does] not appear to be breathing.</span>"
		if(istype(user, /mob/living/carbon/human) && !user.stat && Adjacent(user))
			user.visible_message("<b>[usr]</b> checks [src]'s pulse.", "You check [src]'s pulse.")
		spawn(15)
			if(isobserver(user) || (Adjacent(user) && !user.stat)) // If you're a corpse then you can't exactly check their pulse, but ghosts can see anything
				if(pulse == PULSE_NONE)
					to_chat(user, "<span class='deadsay'>[T.He] [T.has] no pulse[src.client ? "" : " and [T.his] soul has departed"]...</span>")
				else
					to_chat(user, "<span class='deadsay'>[T.He] [T.has] a pulse!</span>")

	if(fire_stacks)
		msg += "[T.He] [T.is] covered in some liquid."
	if(on_fire)
		msg += "<span class='warning'>[T.He] [T.is] on fire!.</span>"

	var/ssd_msg = species.get_ssd(src)
	if(ssd_msg && (!should_have_organ("brain") || has_brain()) && stat != DEAD)
		if(!key)
			msg += "<span class='deadsay'>[T.He] [T.is] [ssd_msg]. It doesn't look like [T.he] [T.is] waking up anytime soon.</span>"
		else if(!client)
			msg += "<span class='deadsay'>[T.He] [T.is] [ssd_msg].</span>"
		//VOREStation Add Start
		if(client && ((client.inactivity / 10) / 60 > 10)) //10 Minutes
			msg += "\[Inactive for [round((client.inactivity/10)/60)] minutes\]"
		else if(disconnect_time)
			msg += "\[Disconnected/ghosted [round(((world.realtime - disconnect_time)/10)/60)] minutes ago\]"
		//VOREStation Add End

	var/list/wound_flavor_text = list()
	var/list/is_bleeding = list()
	var/applying_pressure = ""

	for(var/organ_tag in species.has_limbs)

		var/list/organ_data = species.has_limbs[organ_tag]
		var/organ_descriptor = organ_data["descriptor"]

		var/obj/item/organ/external/E = organs_by_name[organ_tag]
		if(!E)
			wound_flavor_text["[organ_descriptor]"] = "<span class='warning'><b>[T.He] [T.is] missing [T.his] [organ_descriptor].</b></span>"
		else if(E.is_stump())
			wound_flavor_text["[organ_descriptor]"] = "<span class='warning'><b>[T.He] [T.has] a stump where [T.his] [organ_descriptor] should be.</b></span>"
		else
			continue

	for(var/obj/item/organ/external/temp in organs)
		if(temp)
			if((temp.organ_tag in hidden) && hidden[temp.organ_tag])
				continue //Organ is hidden, don't talk about it
			if(temp.status & ORGAN_DESTROYED)
				wound_flavor_text["[temp.name]"] = "<span class='warning'><b>[T.He] [T.is] missing [T.his] [temp.name].</b></span>"
				continue

			if(!looks_synth && temp.robotic == ORGAN_ROBOT)
				if(!(temp.brute_dam + temp.burn_dam))
					wound_flavor_text["[temp.name]"] = "[T.He] [T.has] a [temp.name]."
				else
					wound_flavor_text["[temp.name]"] = "<span class='warning'>[T.He] [T.has] a [temp.name] with [temp.get_wounds_desc()]!</span>"
				continue
			else if(temp.wounds.len > 0 || temp.open)
				if(temp.is_stump() && temp.parent_organ && organs_by_name[temp.parent_organ])
					var/obj/item/organ/external/parent = organs_by_name[temp.parent_organ]
					wound_flavor_text["[temp.name]"] = "<span class='warning'>[T.He] has [temp.get_wounds_desc()] on [T.his] [parent.name].</span>"
				else
					wound_flavor_text["[temp.name]"] = "<span class='warning'>[T.He] has [temp.get_wounds_desc()] on [T.his] [temp.name].</span>"
			else
				wound_flavor_text["[temp.name]"] = ""
			if(temp.dislocated == 2)
				wound_flavor_text["[temp.name]"] += "<span class='warning'>[T.His] [temp.joint] is dislocated!</span>"
			if(temp.brute_dam > temp.min_broken_damage || (temp.status & (ORGAN_BROKEN | ORGAN_MUTATED)))
				wound_flavor_text["[temp.name]"] += "<span class='warning'>[T.His] [temp.name] is dented and swollen!</span>"

			if(temp.germ_level > INFECTION_LEVEL_TWO && !(temp.status & ORGAN_DEAD))
				wound_flavor_text["[temp.name]"] += "<span class='warning'>[T.His] [temp.name] looks very infected!</span>"
			else if(temp.status & ORGAN_DEAD)
				wound_flavor_text["[temp.name]"] += "<span class='warning'>[T.His] [temp.name] looks rotten!</span>"

			if(temp.status & ORGAN_BLEEDING)
				is_bleeding["[temp.name]"] += "<span class='danger'>[T.His] [temp.name] is bleeding!</span>"

			if(temp.applied_pressure == src)
				applying_pressure = "<span class='info'>[T.He] is applying pressure to [T.his] [temp.name].</span>"

	for(var/limb in wound_flavor_text)
		var/flavor = wound_flavor_text[limb]
		if(flavor)
			msg += flavor
	for(var/limb in is_bleeding)
		var/blood = is_bleeding[limb]
		if(blood)
			msg += blood
	for(var/implant in get_visible_implants(0))
		msg += "<span class='danger'>[src] [T.has] \a [implant] sticking out of [T.his] flesh!</span>"
	if(digitalcamo)
		msg += "[T.He] [T.is] repulsively uncanny!"

	if(hasHUD(user,"security"))
		var/perpname = name
		var/criminal = "None"

		if(wear_id)
			if(istype(wear_id, /obj/item/weapon/card/id))
				var/obj/item/weapon/card/id/I = wear_id
				perpname = I.registered_name
			else if(istype(wear_id, /obj/item/device/pda))
				var/obj/item/device/pda/P = wear_id
				perpname = P.owner

		for (var/datum/data/record/R in data_core.security)
			if(R.fields["name"] == perpname)
				criminal = R.fields["criminal"]

		msg += "<span class='deptradio'>Criminal status:</span> <a href='?src=\ref[src];criminal=1'>\[[criminal]\]</a>"
		msg += "<span class='deptradio'>Security records:</span> <a href='?src=\ref[src];secrecord=`'>\[Читать\]</a>  <a href='?src=\ref[src];secrecordadd=`'>\[Добавить заметку\]</a>"

	if(hasHUD(user,"medical"))
		var/perpname = name
		var/medical = "None"

		if(wear_id)
			if(istype(wear_id, /obj/item/weapon/card/id))
				var/obj/item/weapon/card/id/I = wear_id
				perpname = I.registered_name
			else if(istype(wear_id, /obj/item/device/pda))
				var/obj/item/device/pda/P = wear_id
				perpname = P.owner

		for (var/datum/data/record/R in data_core.medical)
			if (R.fields["name"] == perpname)
				medical = R.fields["p_stat"]

		msg += "<span class='deptradio'>Physical status:</span> <a href='?src=\ref[src];medical=1'>\[[medical]\]</a>"
		msg += "<span class='deptradio'>Medical records:</span> <a href='?src=\ref[src];medrecord=`'>\[Читать\]</a> <a href='?src=\ref[src];medrecordadd=`'>\[Добавить заметку\]</a>"


	var/flavor_text = print_flavor_text()
	if(flavor_text)
		msg += "[flavor_text]"

	// VOREStation Start
	if(ooc_notes)
		msg += "<span class = 'deptradio'>Заметки OOC:</span> <a href='?src=\ref[src];ooc_notes=1'>\[Открыть\]</a>"
	msg += "<span class='deptradio'><a href='?src=\ref[src];vore_prefs=1'>\[Механические параметры Vore\]</a></span>"
	// VOREStation End
	msg += "*---------*</span>"
	if(applying_pressure)
		msg += applying_pressure

	var/show_descs = show_descriptors_to(user)
	if(show_descs)
		msg += "<span class='notice'>[jointext(show_descs, "<br>")]</span>"

	if(pose)
		if(!findtext(pose, regex("\[.?!]$"))) // Will be zero if the last character is not a member of [.?!]
			pose = addtext(pose,".") //Makes sure all emotes end with a period.
		msg += "<br>[T.He] [pose]" //<br> intentional, extra gap.

	return msg

//Helper procedure. Called by /mob/living/carbon/human/examine() and /mob/living/carbon/human/Topic() to determine HUD access to security and medical records.
/proc/hasHUD(mob/M as mob, hudtype)
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		if(hasHUD_vr(H,hudtype)) return 1 //VOREStation Add - Added records access for certain modes of omni-hud glasses
		switch(hudtype)
			if("security")
				return istype(H.glasses, /obj/item/clothing/glasses/hud/security) || istype(H.glasses, /obj/item/clothing/glasses/sunglasses/sechud)
			if("medical")
				return istype(H.glasses, /obj/item/clothing/glasses/hud/health)
	else if(istype(M, /mob/living/silicon/robot))
		var/mob/living/silicon/robot/R = M
		switch(hudtype)
			if("security")
				return R.hudmode == "Служба безопасности"
			if("medical")
				return R.hudmode == "Медицинский отдел"
	return 0
