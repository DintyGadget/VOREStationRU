/datum/job/centcom_officer //For Business
	title = "Офицер Центрального Командования"
	departments = list("Central Command")
	department_accounts = list(DEPARTMENT_COMMAND, DEPARTMENT_ENGINEERING, DEPARTMENT_MEDICAL, DEPARTMENT_RESEARCH, DEPARTMENT_SECURITY, DEPARTMENT_CARGO, DEPARTMENT_PLANET, DEPARTMENT_CIVILIAN)
	faction = "Station"
	total_positions = 2
	spawn_positions = 1
	supervisors = "уполномоченными лицами корпорации и Корпоративным Регулированием"
	selection_color = "#1D1D4F"
	access = list()
	minimal_access = list()
	minimal_player_age = 14
	economic_modifier = 20
	whitelist_only = 1
	latejoin_only = 1
	outfit_type = /decl/hierarchy/outfit/job/centcom_officer
	job_description = "Офицер Центрального командования находится здесь по служебным делам. Большую часть времени. Как бы то ни было, он VIP."

	minimum_character_age = 25
	ideal_character_age = 40

	pto_type = PTO_CIVILIAN

	get_access()
		return get_all_accesses().Copy()

/*/datum/job/centcom_visitor //For Pleasure // You mean for admin abuse... -Ace
	title = "CentCom Visitor"
	department = "Гражданские"
	head_position = 1
	faction = "Station"
	total_positions = 2
	spawn_positions = 1
	supervisors = "company officials and Corporate Regulations"
	selection_color = "#1D1D4F"
	idtype = /obj/item/weapon/card/id/centcom
	access = list()
	minimal_access = list()
	minimal_player_age = 14
	economic_modifier = 20
	whitelist_only = 1
	latejoin_only = 1

	minimum_character_age = 25
	ideal_character_age = 40

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/centcom(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom, slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/device/pda/centcom(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/white(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/beret/centcom/officer(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/omnihud(H), slot_l_store)

		H.implant_loyalty()

		return 1

	get_access()
		var/access = get_all_accesses()
		return access*/

/datum/job/clown
	title = "Клоун"
	flag = CLOWN
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "святым духом рофланов"
	selection_color = "#515151"
	economic_modifier = 1
	job_description = "Клоун обязуется развлекать персонал и поддерживать хороший настрой силой безвредных розыгрышей и смешных шуток!"
	whitelist_only = 1
	latejoin_only = 1
	outfit_type = /decl/hierarchy/outfit/job/clown
	pto_type = PTO_CIVILIAN
	alt_titles = list("Шут" = /datum/alt_title/jester, "Дурак" = /datum/alt_title/fool)

/datum/alt_title/jester
	title = "Шут"

/datum/alt_title/fool
	title = "Дурак"

/datum/job/clown/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels, access_entertainment)
	else
		return list(access_entertainment)

/datum/job/mime
	title = "Мим"
	flag = MIME
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "святым духом искусства"
	selection_color = "#515151"
	economic_modifier = 1
	job_description = "Мим развлекает персонал и поддерживает настрой силой невероятных выступлений и актёрской игры!"
	alt_titles = list("Позёр" = /datum/alt_title/poseur)
	whitelist_only = 1
	latejoin_only = 1
	outfit_type = /decl/hierarchy/outfit/job/mime
	pto_type = PTO_CIVILIAN

/datum/alt_title/poseur
	title = "Позёр"

/datum/job/mime/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels, access_entertainment)
	else
		return list(access_entertainment)
