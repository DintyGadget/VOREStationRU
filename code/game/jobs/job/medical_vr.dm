/datum/job/cmo
	disallow_jobhop = TRUE
	pto_type = PTO_MEDICAL
	dept_time_required = 60

	access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_psychiatrist, access_eva, access_external_airlocks, access_maint_tunnels)

	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_psychiatrist, access_eva, access_external_airlocks, access_maint_tunnels)
	alt_titles = list("Главный анатом" = /datum/alt_title/chief_physician, "Заведующий медотдела" = /datum/alt_title/medical_director, "Менеджер здравоохранения" = /datum/alt_title/healthcare_manager)

/datum/alt_title/chief_physician
	title = "Главный анатом"

/datum/alt_title/medical_director
	title = "Заведующий медотдела"

/datum/alt_title/healthcare_manager
	title = "Менеджер здравоохранения"


/datum/job/doctor
	spawn_positions = 5
	pto_type = PTO_MEDICAL
	alt_titles = list("Доктор" = /datum/alt_title/physician, "Врач-практикант" = /datum/alt_title/medical_practitioner, "Хирург" = /datum/alt_title/surgeon,
						"Врач скорой помощи" = /datum/alt_title/emergency_physician, "Медсестра" = /datum/alt_title/nurse, "Медицинский сотрудник" = /datum/alt_title/orderly,
						"Вирусолог" = /datum/alt_title/virologist, "Офтальмолог" = /datum/alt_title/oculist)


/datum/alt_title/physician
	title = "Доктор"

/datum/alt_title/medical_practitioner
	title = "Врач-практикант"

/datum/alt_title/orderly
	title = "Медицинский сотрудник"
	title_blurb = "Медицинский сотрудник помогает врачам с ручной и грязной работой."
	title_outfit = /decl/hierarchy/outfit/job/medical/doctor/nurse

/datum/alt_title/oculist
	title = "Офтальмолог"
	title_blurb = "Офтальмолог, пускай и знаком с методами оказания медицинской помощи, специализируется на лечении глаз и выдаче рецептурных очков."

/datum/job/chemist
	pto_type = PTO_MEDICAL
	alt_titles = list("Фармацевт" = /datum/alt_title/pharmacist, "Фармаколог" = /datum/alt_title/pharmacologist)

/datum/alt_title/pharmacologist
	title = "Фармаколог"
	title_blurb = "Фармаколог специализируется на изготовлении лекарств и выдаче таковых персоналу по рецепту."