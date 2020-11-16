/datum/job/hos
	disallow_jobhop = TRUE
	pto_type = PTO_SECURITY
	dept_time_required = 60

	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
						access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
						access_construction,
						access_heads, access_hos, access_RC_announce, access_keycard_auth, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
						access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
						access_construction,
						access_heads, access_hos, access_RC_announce, access_keycard_auth, access_external_airlocks)
	alt_titles = list("Главный командир" = /datum/alt_title/sec_commander, "Директор обороны" = /datum/alt_title/sec_chief, "Директор безопасности" = /datum/alt_title/security_manager)

/datum/alt_title/security_manager
	title = "Директор безопасности"


/datum/job/warden
	pto_type = PTO_SECURITY
	dept_time_required = 20
	alt_titles = list("Сторож брига" = /datum/alt_title/brig_sentry, "Заведующий арсеналом" = /datum/alt_title/armory_superintendent)

/datum/alt_title/brig_sentry
	title = "Сторож брига"

/datum/alt_title/armory_superintendent
	title = "Заведующий арсеналом"


/datum/job/detective
	pto_type = PTO_SECURITY
	alt_titles = list("Сыщик" = /datum/alt_title/investigator, "Инспектор службы безопасности" = /datum/alt_title/security_inspector, "Криминалист" = /datum/alt_title/forensic_tech)

/datum/alt_title/investigator
	title = "Сыщик"

/datum/alt_title/security_inspector
	title = "Инспектор службы безопасности"


/datum/job/officer
	total_positions = 5
	spawn_positions = 5
	pto_type = PTO_SECURITY
	alt_titles = list("Патрульный офицер" = /datum/alt_title/patrol_officer, "Охранник" = /datum/alt_title/security_guard, "Младший офицер" = /datum/alt_title/junior_officer)

/datum/alt_title/patrol_officer
	title = "Патрульный офицер"

/datum/alt_title/security_guard
	title = "Охранник"