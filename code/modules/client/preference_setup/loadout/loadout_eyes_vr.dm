/datum/gear/eyes/medical
	allowed_roles = list("Медик","Главврач","Химик","Парамедик","Geneticist", "Психиатр", "Военврач")

/datum/gear/eyes/meson
	display_name = "Оптический мезонный сканер (Инж, Науч)"
	allowed_roles = list("Инженер","Главный инженер","Атмосферный техник", "Ученый", "Директор исследований", "Искатель", "Первопроходец")

/datum/gear/eyes/arglasses
	display_name = "AR-очки"
	path = /obj/item/clothing/glasses/omnihud

/datum/gear/eyes/arglassespres
	display_name = "AR-очки, близорукость"
	path = /obj/item/clothing/glasses/omnihud/prescription

/datum/gear/eyes/arglasses/sec
	display_name = "AR-S очки (СБ)"
	path = /obj/item/clothing/glasses/omnihud/sec
	allowed_roles = list("Офицер безопасности","Глава безопасности","Надзиратель","Детектив")

/datum/gear/eyes/arglasses/sci
	display_name = "AR-R очки (Ученый)"
	path = /obj/item/clothing/glasses/omnihud/rnd
	allowed_roles = list("Директор исследований","Ученый","Ксенобиолог","Ксеноботаник","Роботехник")

/datum/gear/eyes/arglasses/eng
	display_name = "AR-E очки (Инженер)"
	path = /obj/item/clothing/glasses/omnihud/eng
	allowed_roles = list("Инженер","Главный инженер","Атмосферный техник")

/datum/gear/eyes/arglasses/med
	display_name = "AR-M очки (Медик)"
	path = /obj/item/clothing/glasses/omnihud/med
	allowed_roles = list("Медик","Главврач","Химик","Парамедик","Geneticist", "Психиатр", "Военврач")

/datum/gear/eyes/arglasses/all
	display_name = "AR-B очки (ДК, ГП)"
	path = /obj/item/clothing/glasses/omnihud/all
	cost = 2
	allowed_roles = list("Директор колонии","Глава персонала")

/datum/gear/eyes/spiffygogs
	display_name = "Стильные оранжевые очки"
	path = /obj/item/clothing/glasses/fluff/spiffygogs

/datum/gear/eyes/science_proper
	display_name = "Научные очки (без оверлея)"
	path = /obj/item/clothing/glasses/fluff/science_proper

/datum/gear/eyes/meson/retinal
	display_name = "Ретинальный проектор (Инж, Науч, Шахт)"
	path = /obj/item/clothing/glasses/omnihud/eng/meson

/datum/gear/eyes/security/secpatch
	display_name = "HUD-повязка, СБ"
	path = /obj/item/clothing/glasses/hud/security/eyepatch

/datum/gear/eyes/medical/medpatch
	display_name = "HUD-повязка, Мед"
	path = /obj/item/clothing/glasses/hud/health/eyepatch