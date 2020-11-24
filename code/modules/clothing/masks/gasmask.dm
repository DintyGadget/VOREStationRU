/obj/item/clothing/mask/gas
	name = "Противогаз"
	desc = "Маска, которая закрывает лицо и может быть подсоединена к источнику воздуха. Фильтрует вредные газы."
	icon_state = "gas_alt"
	item_flags = BLOCK_GAS_SMOKE_EFFECT | AIRTIGHT | ALLOW_SURVIVALFOOD
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = FACE|EYES
	w_class = ITEMSIZE_NORMAL
	item_state_slots = list(slot_r_hand_str = "gas_alt", slot_l_hand_str = "gas_alt")
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	var/gas_filter_strength = 1			//For gas mask filters
	var/list/filtered_gases = list("phoron", "nitrous_oxide")
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 75, rad = 0)
	pickup_sound = 'sound/items/pickup/rubber.ogg'

/obj/item/clothing/mask/gas/filter_air(datum/gas_mixture/air)
	var/datum/gas_mixture/gas_filtered = new

	for(var/g in filtered_gases)
		if(air.gas[g])
			gas_filtered.gas[g] = air.gas[g] * gas_filter_strength
			air.gas[g] -= gas_filtered.gas[g]

	air.update_values()
	gas_filtered.update_values()

	return gas_filtered

/obj/item/clothing/mask/gas/clear
	name = "Противогаз"
	desc = "Маска, которая закрывает лицо прозрачным защитным экраном и может быть подсоединена к источнику воздуха. Фильтрует вредные газы."
	icon_state = "gas_clear"
	flags_inv = null

/obj/item/clothing/mask/gas/half
	name = "Респиратор"
	desc = "Компактный, но надёжный противогаз, который может быть подсоединен к источнику воздуха."
	icon_state = "halfgas"
	siemens_coefficient = 0.7
	body_parts_covered = FACE
	w_class = ITEMSIZE_SMALL
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 0, bomb = 0, bio = 55, rad = 0)

//Turn it into a hailer mask
/obj/item/clothing/mask/gas/half/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/device/hailer))
		playsound(src, 'sound/items/Screwdriver.ogg', 50, 1)
		user.drop_item(src)
		var/obj/item/clothing/mask/gas/sechailer/N = new /obj/item/clothing/mask/gas/sechailer(src.loc)
		N.fingerprints = src.fingerprints
		N.fingerprintshidden = src.fingerprintshidden
		N.fingerprintslast = src.fingerprintslast
		N.suit_fibers = src.suit_fibers
		N.hailer = I
		I.loc = N
		if(!isturf(N.loc))
			user.put_in_hands(N)
		qdel(src)
	..()

//Plague Dr suit can be found in clothing/suits/bio.dm
/obj/item/clothing/mask/gas/plaguedoctor
	name = "Маска чумного доктора"
	desc = "Старый дизайн на новый лад. Эта маска не только очищает входящий воздух от форона, но и может быть подсоединена к источнику воздуха."
	icon_state = "plaguedoctor"
	item_state_slots = list(slot_r_hand_str = "gas", slot_l_hand_str = "gas")
	armor = list(melee = 0, bullet = 0, laser = 2,energy = 2, bomb = 0, bio = 90, rad = 0)
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/gas/swat
	name = "Маска СОБР"
	desc = "Плотно прилегающая маска, которая может быть подсоединена к источнику воздуха."
	icon_state = "swat"
	siemens_coefficient = 0.7
	body_parts_covered = FACE|EYES

// Vox mask, has special code for eating
/obj/item/clothing/mask/gas/swat/vox
	name = "Маска пришельца"
	desc = "Изготовлена явно не на человеческое лицо."
	flags = PHORONGUARD
	item_flags = BLOCK_GAS_SMOKE_EFFECT | AIRTIGHT
	species_restricted = list(SPECIES_VOX)
	filtered_gases = list("oxygen", "nitrous_oxide")
	var/mask_open = FALSE	// Controls if the Vox can eat through this mask
	action_button_name = "Переключить Питательный Порт"

/obj/item/clothing/mask/gas/swat/vox/proc/feeding_port(mob/user)
	if(user.canmove && !user.stat)
		mask_open = !mask_open
		if(mask_open)
			body_parts_covered = EYES
			to_chat(user, "Маска сдвигается, позволяя Вам принимать пищу.")
		else
			body_parts_covered = FACE|EYES
			to_chat(user, "Ваша маска опускается, прикрывая Ваш рот.")
	return

/obj/item/clothing/mask/gas/swat/vox/attack_self(mob/user)
	feeding_port(user)
	..()

/obj/item/clothing/mask/gas/zaddat
	name = "Противогаз заддат"
	desc = "Маска, фильтрующая азот - жизненно необходима для заддат. Может быть подсоединена к источнику воздуха и перенастроена для безопасного принятия пищи."
	icon_state = "zaddat_mask"
	item_state = "vax_mask"
	//body_parts_covered = 0
	species_restricted = list(SPECIES_ZADDAT)
	flags_inv = HIDEEARS //semi-transparent
	filtered_gases = list("phoron", "nitrogen", "nitrous_oxide")

/obj/item/clothing/mask/gas/syndicate
	name = "Тактическая маска"
	desc = "Плотно прилегающая маска, которая может быть подсоединена к источнику воздуха."
	icon_state = "swat"
	siemens_coefficient = 0.7

/obj/item/clothing/mask/gas/explorer
	name = "Противогаз искателя"
	desc = "Противогаз военного качества, который может быть подсоединен к источнику воздуха."
	icon_state = "explorer"
	item_state_slots = list(slot_r_hand_str = "gas", slot_l_hand_str = "gas")
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 5, bomb = 0, bio = 50, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/mask/gas/clown_hat
	name = "Парик и маска клоуна"
	desc = "Клоун -- не клоун без своего парика и маски."
	icon_state = "clown"
	item_state_slots = list(slot_r_hand_str = "clown_hat", slot_l_hand_str = "clown_hat")

/obj/item/clothing/mask/gas/sexyclown
	name = "Парик и маска сексапильного клоуна"
	desc = "Женская маска клоуна для заинтересованных трансвеститов или представителей профессии среди женского пола."
	icon_state = "sexyclown"
	item_state_slots = list(slot_r_hand_str = "clown_hat", slot_l_hand_str = "clown_hat")

/obj/item/clothing/mask/gas/mime
	name = "Маска мима"
	desc = "Традиционная маска мима. Выражение лица стремноватое."
	icon_state = "mime"
	item_state_slots = list(slot_r_hand_str = "mime", slot_l_hand_str = "mime")

/obj/item/clothing/mask/gas/monkeymask
	name = "Маска мартышки"
	desc = "Маска, необходимая при отыгрыше мартышки."
	icon_state = "monkeymask"
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/gas/sexymime
	name = "Маска сексапильного мима"
	desc = "Традиционная маска мима женского пола."
	icon_state = "sexymime"
	item_state_slots = list(slot_r_hand_str = "mime", slot_l_hand_str = "mime")

/obj/item/clothing/mask/gas/guy
	name = "Маска Гая Фокса"
	desc = "Маска в стиле Гая Фокса."
	icon_state = "guyfawkes"
	flags_inv = HIDEEARS|HIDEFACE
	item_state_slots = list(slot_r_hand_str = "mime", slot_l_hand_str = "mime")

/obj/item/clothing/mask/gas/commando
	name = "Противогаз коммандо"
	icon_state = "fullgas"
	item_state_slots = list(slot_r_hand_str = "swat", slot_l_hand_str = "swat")
	siemens_coefficient = 0.2

/obj/item/clothing/mask/gas/cyborg
	name = "Визор киборга"
	desc = "Бип буп."
	icon_state = "death"

/obj/item/clothing/mask/gas/owl_mask
	name = "Маска филина"
	desc = "Уух!"
	icon_state = "owl"
	body_parts_covered = HEAD|FACE|EYES
