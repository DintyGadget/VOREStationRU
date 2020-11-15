//////////////////////////////////
//		Head of Security
//////////////////////////////////
/datum/job/hos
	title = "Глава службы безопасности"
	flag = HOS
	departments_managed = list(DEPARTMENT_SECURITY)
	departments = list(DEPARTMENT_SECURITY, DEPARTMENT_COMMAND)
	sorting_order = 2
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Директором колонии"
	selection_color = "#8E2929"
	req_admin_notify = 1
	economic_modifier = 10
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)
	minimum_character_age = 25
	minimal_player_age = 14

	outfit_type = /decl/hierarchy/outfit/job/security/hos
	job_description = "	Глава службы безопасности отвечает за весь закрепленный за ним отдел, поддерживая на станции порядок. \
						От него ожидается своевременное информирование других глав и всего остального экипажа обо всех угрозах для рабочих условий. \
						При необходимости Глава службы безопасности может выполнять обязанности и других сотрудников свего отдела, такие как выдача оружия из арсенала в экстренных ситуациях."
	alt_titles = list("Главный командир" = /datum/alt_title/sec_commander, "Директор обороны" = /datum/alt_title/sec_chief)

// Head of Security Alt Titles
/datum/alt_title/sec_commander
	title = "Главный командир"

/datum/alt_title/sec_chief
	title = "Директор обороны"

//////////////////////////////////
//			Warden
//////////////////////////////////
/datum/job/warden
	title = "Надзиратель"
	flag = WARDEN
	departments = list(DEPARTMENT_SECURITY)
	sorting_order = 1
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Главой службы безопасности"
	selection_color = "#601C1C"
	economic_modifier = 5
	whitelist_only = 1
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_external_airlocks)
	minimal_player_age = 5

	outfit_type = /decl/hierarchy/outfit/job/security/warden
	job_description = "Надзиратель отвечает непосредственно за сам физический отдел службы безопасности, обеспечивая порядок в бриге и арсенале. \
						Надзиратель присматривает за преступниками, которые были отправлены в бриг, и обеспечивает их безопасность. Надзиратель также отвечает за \
						выдачу оружия из арсенала в случае экстренной ситуации, а также его своевременный возврат. При необходимости надзиратель может \
						также руководить всей службой безопасности."

//////////////////////////////////
//			Detective
//////////////////////////////////
/datum/job/detective
	title = "Детектив"
	flag = DETECTIVE
	departments = list(DEPARTMENT_SECURITY)
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Главой Безопасности"
	selection_color = "#601C1C"
	access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_eva, access_external_airlocks, access_brig) //Vorestation edit - access_brig
	minimal_access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_eva, access_external_airlocks)
	economic_modifier = 5
	minimal_player_age = 3

	outfit_type = /decl/hierarchy/outfit/job/security/detective
	job_description = "Дететив помогает службе безопасности идентифицировать преступников в розыске при помощи допросов и судебно-медицинской экспертизы. \
						В случае возникновения преступлений без свидетелей, или даже выживших, детектив пытается восстановить хронологию событий благодаря лишь одним уликам."
	alt_titles = list("Криминалист" = /datum/alt_title/forensic_tech)

// Detective Alt Titles
/datum/alt_title/forensic_tech
	title = "Криминалист"
	title_blurb = "Криминалист специализируется на уликах и работе в лаборатории, однако как и детектив обязуется помогать раскрывать преступления."
	title_outfit = /decl/hierarchy/outfit/job/security/detective/forensic

//////////////////////////////////
//		Security Officer
//////////////////////////////////
/datum/job/officer
	title = "Офицер безопасности"
	flag = OFFICER
	departments = list(DEPARTMENT_SECURITY)
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Главой Безопасности"
	selection_color = "#601C1C"
	economic_modifier = 4
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_external_airlocks)
	minimal_player_age = 3

	outfit_type = /decl/hierarchy/outfit/job/security/officer
	job_description = "Офицер безопасности поддерживает порядок и безопасность на всей станции в целом, оказывая противодействие как внешним угрозам, \
						так и внутренним. Офицер безопасности отвечает за здоровье, безопасность и срок каждого арестуемого заключенного. \
						Никто не выше закона, в том числе и сама служба безопасности и Командование."
	alt_titles = list("Младший офицер" = /datum/alt_title/junior_officer)

// Security Officer Alt Titles
/datum/alt_title/junior_officer
	title = "Младший офицер"
	title_blurb = "Младший офицер является неопытным офицером службы безопасности. Он был обучен, однако не имеет опыта, поэтому часто работает в паре \
					со старшим по званию. Младший офицер также часто берёт на себя более скучные задачи офицеров, \
					такие как патрулирование станции или занятие определенных постов."