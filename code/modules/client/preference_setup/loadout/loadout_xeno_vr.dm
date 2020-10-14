// Upstream things
/////

/datum/gear/suit/dept/cloak/research
	allowed_roles = list("Директор исследований","Ученый", "Роботехник", "Ксенобиолог", "Ксеноботаник")

/datum/gear/uniform/dept/undercoat/research
	allowed_roles = list("Директор исследований","Ученый", "Роботехник", "Ксенобиолог", "Ксеноботаник")

/////

/datum/gear/uniform/voxcasual
	display_name = "Вокс: Повседневная одежда"
	path = /obj/item/clothing/under/vox/vox_casual
	sort_category = "Расовая одежда"
	whitelisted = "Vox"

/datum/gear/uniform/voxrobes
	display_name = "Вокс: Удобная одежда"
	path = /obj/item/clothing/under/vox/vox_robes
	sort_category = "Расовая одежда"
	whitelisted = "Vox"

/datum/gear/accessory/vox
	display_name = "Вокс: Жилет с карманами"
	path = /obj/item/clothing/accessory/storage/vox
	sort_category = "Расовая одежда"
	whitelisted = "Vox"

/datum/gear/gloves/vox
	display_name = "Вокс: Изолирующие рукавицы"
	path = /obj/item/clothing/gloves/vox
	sort_category = "Расовая одежда"
	whitelisted = "Vox"

/datum/gear/shoes/vox
	display_name = "Вокс: Магнитные когти"
	path = /obj/item/clothing/shoes/magboots/vox
	sort_category = "Расовая одежда"
	whitelisted = "Vox"

/datum/gear/mask/vox
	display_name = "Вокс: Маска"
	path = /obj/item/clothing/mask/gas/swat/vox
	sort_category = "Расовая одежда"
	whitelisted = "Vox"

/datum/gear/mask/transparent
	display_name = "Прозрачная газовая маска"
	path = /obj/item/clothing/mask/breath/transparent
	sort_category = "Расовая одежда"

/datum/gear/uniform/loincloth
	display_name = "Набедренная повязка"
	path = /obj/item/clothing/suit/storage/fluff/loincloth
	sort_category = "Расовая одежда"

// Taj clothing
/datum/gear/eyes/tajblind
	display_name = "Таджара: Повязка на глаза"
	path = /obj/item/clothing/glasses/tajblind
	//whitelisted = SPECIES_TAJ
	sort_category = "Расовая одежда"

/datum/gear/eyes/medical/tajblind
	display_name = "Таджара: Повязка на глаза, медицинская (Медик)"
	path = /obj/item/clothing/glasses/hud/health/tajblind
	//whitelisted = SPECIES_TAJ
	sort_category = "Расовая одежда"

/datum/gear/eyes/meson/tajblind
	display_name = "Таджара: Повязка на глаза, защитная (Инженер, Ученый)"
	path = /obj/item/clothing/glasses/meson/prescription/tajblind
	//whitelisted = SPECIES_TAJ
	sort_category = "Расовая одежда"

/datum/gear/eyes/material/tajblind
	display_name = "Таджара: Повязка на глаза, шахтёрская (Шахтёр)"
	path = /obj/item/clothing/glasses/material/prescription/tajblind
	//whitelisted = SPECIES_TAJ
	sort_category = "Расовая одежда"

/datum/gear/eyes/security/tajblind
	display_name = "Таджара: Повязка на глаза, СБ (СБ)"
	path = /obj/item/clothing/glasses/sunglasses/sechud/tajblind
	//whitelisted = SPECIES_TAJ
	sort_category = "Расовая одежда"

// Taur stuff
/datum/gear/suit/taur/drake_cloak
	display_name = "Тавр: Плащ (Драконотавр)"
	path = /obj/item/clothing/suit/drake_cloak
	sort_category = "Расовая одежда"

/datum/gear/suit/taur/white_dress
	display_name = "Тавр: Свадебное платье (Тавр-лошадь, Волкотавр)"
	path = /obj/item/clothing/suit/taur_dress/white
	sort_category = "Расовая одежда"
