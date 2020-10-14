// Eyes
/datum/gear/eyes
	display_name = "Повязка"
	path = /obj/item/clothing/glasses/eyepatch
	slot = slot_glasses
	sort_category = "Очки"

/datum/gear/eyes/eyepatchwhite
	display_name = "Повязка (окрашиваемая)"
	path = /obj/item/clothing/glasses/eyepatchwhite
	slot = slot_glasses
	sort_category = "Очки"

/datum/gear/eyes/eyepatchwhite/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/eyes/glasses
	display_name = "Очки, близорукость"
	path = /obj/item/clothing/glasses/regular

/datum/gear/eyes/glasses/green
	display_name = "Очки, зеленые"
	path = /obj/item/clothing/glasses/gglasses

/datum/gear/eyes/glasses/prescriptionhipster
	display_name = "Очки, хипстер"
	path = /obj/item/clothing/glasses/regular/hipster

/datum/gear/eyes/glasses/monocle
	display_name = "Монокль"
	path = /obj/item/clothing/glasses/monocle

/datum/gear/eyes/goggles
	display_name = "Защитные очки, простые"
	path = /obj/item/clothing/glasses/goggles

/datum/gear/eyes/goggles/scanning
	display_name = "Защитные очки, сканер"
	path = /obj/item/clothing/glasses/regular/scanners

/datum/gear/eyes/goggles/science
	display_name = "Защитные очки, научные"
	path = /obj/item/clothing/glasses/science

/datum/gear/eyes/security
	display_name = "СБ: HUD Службы Безопасности"
	path = /obj/item/clothing/glasses/hud/security
	allowed_roles = list("Офицер безопасности","Глава безопасности","Надзиратель", "Детектив")

/datum/gear/eyes/security/prescriptionsec
	display_name = "СБ: HUD Службы Безопасности, близорукость"
	path = /obj/item/clothing/glasses/hud/security/prescription

/datum/gear/eyes/security/sunglasshud
	display_name = "СБ: HUD Службы Безопасности, солнечные"
	path = /obj/item/clothing/glasses/sunglasses/sechud

/datum/gear/eyes/security/aviator
	display_name = "СБ: HUD Службы Безопасности, авиаторы"
	path = /obj/item/clothing/glasses/sunglasses/sechud/aviator

/datum/gear/eyes/security/aviator/prescription
	display_name = "СБ: HUD Службы Безопасности, авиаторы, близорукость"
	path = /obj/item/clothing/glasses/sunglasses/sechud/aviator/prescription

/datum/gear/eyes/medical
	display_name = "Медик: Медицинский HUD"
	path = /obj/item/clothing/glasses/hud/health
	allowed_roles = list("Медик","Главврач","Химик","Парамедик","Geneticist", "Психиатр", "Search and Rescue")

/datum/gear/eyes/medical/prescriptionmed
	display_name = "Медик: Медицинский HUD, близорукость"
	path = /obj/item/clothing/glasses/hud/health/prescription

/datum/gear/eyes/medical/aviator
	display_name = "Медик: Медицинский HUD, авиаторы"
	path = /obj/item/clothing/glasses/hud/health/aviator

/datum/gear/eyes/medical/aviator/prescription
	display_name = "Медик: Медицинский HUD, авиаторы, близорукость"
	path = /obj/item/clothing/glasses/hud/health/aviator/prescription

/datum/gear/eyes/meson
	display_name = "Мезонный сканер (Инж, Науч, Шахт)"
	path = /obj/item/clothing/glasses/meson
	allowed_roles = list("Инженер","Главный инженер","Атмосферный техник", "Ученый", "Директор исследований", "Шахтер")

/datum/gear/eyes/meson/prescription
	display_name = "Мезонный сканер, близорукость (Инж, Науч, Шахт)"
	path = /obj/item/clothing/glasses/meson/prescription

/datum/gear/eyes/material
	display_name = "Шахтёр: Оптический сканер материалов"
	path = /obj/item/clothing/glasses/material
	allowed_roles = list("Шахтер","Интендант")

/datum/gear/eyes/material/prescription
	display_name = "Шахтёр: Оптический сканер материалов, близорукость"
	path = /obj/item/clothing/glasses/material/prescription

/datum/gear/eyes/meson/aviator
	display_name = "Мезонный сканер, авиаторы (Инж, Науч, Шахт)"
	path = /obj/item/clothing/glasses/meson/aviator

/datum/gear/eyes/meson/aviator/prescription
	display_name = "Мезонный сканер, авиаторы, близорукость (Инж, Науч, Шахт)"
	path = /obj/item/clothing/glasses/meson/aviator/prescription

/datum/gear/eyes/glasses/fakesun
	display_name = "Солнечные очки, стильные"
	path = /obj/item/clothing/glasses/fakesunglasses

/datum/gear/eyes/glasses/fakeaviator
	display_name = "Солнечные очки, авиаторы"
	path = /obj/item/clothing/glasses/fakesunglasses/aviator

/datum/gear/eyes/sun
	display_name = "Солнечные очки (СБ/Управление)"
	path = /obj/item/clothing/glasses/sunglasses
	allowed_roles = list("Офицер безопасности","Глава безопасности","Надзиратель","Директор колонии","Глава персонала","Интендант","Агент внутренних дел","Детектив")

/datum/gear/eyes/sun/shades
	display_name = "Солнечные очки, толстые (СБ/Управление)"
	path = /obj/item/clothing/glasses/sunglasses/big

/datum/gear/eyes/sun/aviators
	display_name = "Солнечные очки, авиаторы (СБ/Управление)"
	path = /obj/item/clothing/glasses/sunglasses/aviator

/datum/gear/eyes/sun/prescriptionsun
	display_name = "Солнечные очки, близорукость (СБ/Управление)"
	path = /obj/item/clothing/glasses/sunglasses/prescription

/datum/gear/eyes/circuitry
	display_name = "Защитные очки, программируемые (пустые)"
	path = /obj/item/clothing/glasses/circuitry

/datum/gear/eyes/glasses/rimless
	display_name = "Очки, без оправы"
	path = /obj/item/clothing/glasses/rimless

/datum/gear/eyes/glasses/prescriptionrimless
	display_name = "Очки, без оправы, близорукость"
	path = /obj/item/clothing/glasses/regular/rimless

/datum/gear/eyes/glasses/thin
	display_name = "Очки, тонкая оправа"
	path = /obj/item/clothing/glasses/thin

/datum/gear/eyes/glasses/prescriptionthin
	display_name = "Очки, тонкая оправа, близорукость"
	path = /obj/item/clothing/glasses/regular/thin
