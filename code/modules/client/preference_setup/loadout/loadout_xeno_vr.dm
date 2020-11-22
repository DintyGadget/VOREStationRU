// Upstream things
/////

/datum/gear/suit/dept/cloak/research
	allowed_roles = list("Директор исследований","Учёный", "Робототехник", "Ксенобиолог", "Ксеноботаник")

/datum/gear/uniform/dept/undercoat/research
	allowed_roles = list("Директор исследований","Учёный", "Робототехник", "Ксенобиолог", "Ксеноботаник")

/////

/datum/gear/uniform/voxcasual
	display_name = "Вокс: Повседневная одежда"
	path = /obj/item/clothing/under/vox/vox_casual
	sort_category = "Расовая одежда"
	whitelisted = "Вокс"

/datum/gear/uniform/voxrobes
	display_name = "Вокс: Удобная одежда"
	path = /obj/item/clothing/under/vox/vox_robes
	sort_category = "Расовая одежда"
	whitelisted = "Вокс"

/datum/gear/accessory/vox
	display_name = "Вокс: Жилет с карманами"
	path = /obj/item/clothing/accessory/storage/vox
	sort_category = "Расовая одежда"
	whitelisted = "Вокс"

/datum/gear/gloves/vox
	display_name = "Вокс: Изолирующие рукавицы"
	path = /obj/item/clothing/gloves/vox
	sort_category = "Расовая одежда"
	whitelisted = "Вокс"

/datum/gear/shoes/vox
	display_name = "Вокс: Магнитные когти"
	path = /obj/item/clothing/shoes/magboots/vox
	sort_category = "Расовая одежда"
	whitelisted = "Вокс"

/datum/gear/mask/vox
	display_name = "Вокс: Маска"
	path = /obj/item/clothing/mask/gas/swat/vox
	sort_category = "Расовая одежда"
	whitelisted = "Вокс"

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
	display_name = "Таджара: Повязка на глаза, медицинская (Врач)"
	path = /obj/item/clothing/glasses/hud/health/tajblind
	//whitelisted = SPECIES_TAJ
	sort_category = "Расовая одежда"

/datum/gear/eyes/meson/tajblind
	display_name = "Таджара: Повязка на глаза, защитная (Инженер, Учёный)"
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

//Net new alternate job undercoats.
/datum/gear/suit/dept/undercoat/cap
	display_name = "Тешари: Накидка Директора колонии"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/cap_vr
	allowed_roles = list("Директор колонии")

/datum/gear/suit/dept/undercoat/psych
	display_name = "Тешари: Накидка психиатра"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/psych_vr
	allowed_roles = list("Психиатр")

/datum/gear/suit/dept/undercoat/rd
	display_name = "Тешари: Накидка Директора исследований"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/rd_vr
	allowed_roles = list("Директор исследований")

/datum/gear/suit/dept/undercoat/hos
	display_name = "Тешари: Накидка Главы службы безопасности"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/hos_vr
	allowed_roles = list("Глава службы безопасности")

/datum/gear/suit/dept/undercoat/hop
	display_name = "Тешари: Накидка Главы персонала"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/hop_vr
	allowed_roles = list("Глава персонала")

//Added to allow selection of alternate job undercoats.
./datum/gear/uniform/dept/undercoat/ce/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/qm/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/cmo/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/cargo/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/mining/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/security/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/service/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/engineer/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/atmos/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/research/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/robo/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/medical/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/chemistry/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/virology/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/paramedic/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/uniform/dept/undercoat/iaa/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(path))
		var/obj/item/clothing/under/seromi/undercoat/jobs/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

//Net new alternate cloak sprites.
/datum/gear/suit/cloak_vr
	display_name = "Тешари: Плащ (новый, выбор)"
	path = /obj/item/clothing/suit/storage/teshari/cloak_vr/standard
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/suit/cloak_vr/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(/obj/item/clothing/suit/storage/teshari/cloak_vr/standard))
		var/obj/item/clothing/suit/storage/teshari/cloak_vr/standard/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/cloak_vr_color
	display_name = "Тешари: Плащ (окрашиваемый, новый)"
	path = /obj/item/clothing/suit/storage/teshari/cloak_vr/standard/white
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/suit/cloak_vr_color/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

//Net new alternate job cloaks
/datum/gear/suit/dept/cloak/cap
	display_name = "Тешари: Плащ Директора колонии"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/cap_vr
	allowed_roles = list("Директор колонии")

/datum/gear/suit/dept/cloak/psych
	display_name = "Тешари: Плащ психиатра"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/psych_vr
	allowed_roles = list("Психиатр")

/datum/gear/suit/dept/cloak/rd
	display_name = "Тешари: Плащ Директора исследований"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/rd_vr
	allowed_roles = list("Директор исследований")

/datum/gear/suit/dept/cloak/hos
	display_name = "Тешари: Плащ Главы службы безопасности"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/hos_vr
	allowed_roles = list("Глава службы безопасности")

/datum/gear/suit/dept/cloak/hop
	display_name = "Тешари: Плащ Главы персонала"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/hop_vr
	allowed_roles = list("Глава персонала")

//Added to allow selection of alternate job cloaks.
/datum/gear/suit/dept/cloak/ce/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/qm/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/command/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/cmo/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/cargo/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/mining/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/security/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/service/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/engineer/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/atmos/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/research/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/robo/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/medical/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/chemistry/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/virology/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/paramedic/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/dept/cloak/iaa/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(path))
		var/obj/item/clothing/suit/storage/seromi/cloak/jobs/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

//Added from CHOMP
/datum/gear/suit/cloak_hood
	display_name = "Тешари: Плащ с капюшоном (выбор)"
	path = /obj/item/clothing/suit/storage/hooded/teshari/standard
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/suit/cloak_hood/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(/obj/item/clothing/suit/storage/hooded/teshari/standard))
		var/obj/item/clothing/suit/storage/seromi/cloak/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/beltcloak
	display_name = "Тешари: Плащ с ремнём (выбор)"
	path = /obj/item/clothing/suit/storage/seromi/beltcloak/standard
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/suit/beltcloak/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(/obj/item/clothing/suit/storage/seromi/beltcloak/standard))
		var/obj/item/clothing/suit/storage/seromi/beltcloak/standard/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/suit/beltcloak_color
	display_name = "Тешари: Плащ с ремнём (окрашиваемый)"
	path = /obj/item/clothing/suit/storage/seromi/beltcloak/standard/white_grey
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/suit/beltcloak_color/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice