// Alien clothing.

/datum/gear/suit/zhan_furs
	display_name = "Таджара: Одежда Дзан-Казан"
	path = /obj/item/clothing/suit/tajaran/furs
	sort_category = "Расовая одежда"

/datum/gear/head/zhan_scarf
	display_name = "Таджара: Платок Дзан"
	path = /obj/item/clothing/head/tajaran/scarf
	whitelisted = SPECIES_TAJ
	sort_category = "Расовая одежда"

/datum/gear/suit/unathi_mantle
	display_name = "Унатхи: Мантия из шкуры"
	path = /obj/item/clothing/suit/unathi/mantle
	cost = 1
	sort_category = "Расовая одежда"

/datum/gear/ears/skrell/chains	//Chains
	display_name = "Скрелл: Цепочка для хвоста"
	path = /obj/item/clothing/ears/skrell/chain
	sort_category = "Расовая одежда"
	whitelisted = SPECIES_SKRELL

/datum/gear/ears/skrell/chains/New()
	..()
	var/list/chaintypes = list()
	for(var/chain_style in typesof(/obj/item/clothing/ears/skrell/chain))
		var/obj/item/clothing/ears/skrell/chain/chain = chain_style
		chaintypes[initial(chain.name)] = chain
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(chaintypes))

/datum/gear/ears/skrell/bands
	display_name = "Скрелл: Повязка для хвоста"
	path = /obj/item/clothing/ears/skrell/band
	sort_category = "Расовая одежда"
	whitelisted = SPECIES_SKRELL

/datum/gear/ears/skrell/bands/New()
	..()
	var/list/bandtypes = list()
	for(var/band_style in typesof(/obj/item/clothing/ears/skrell/band))
		var/obj/item/clothing/ears/skrell/band/band = band_style
		bandtypes[initial(band.name)] = band
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(bandtypes))

/datum/gear/ears/skrell/cloth/short
	display_name = "Скрелл: Повязка для хвоста"
	path = /obj/item/clothing/ears/skrell/cloth_male/black
	sort_category = "Расовая одежда"
	whitelisted = SPECIES_SKRELL

/datum/gear/ears/skrell/cloth/short/New()
	..()
	var/list/shorttypes = list()
	for(var/short_style in typesof(/obj/item/clothing/ears/skrell/cloth_male))
		var/obj/item/clothing/ears/skrell/cloth_male/short = short_style
		shorttypes[initial(short.name)] = short
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(shorttypes))

/datum/gear/ears/skrell/cloth/long
	display_name = "Скрелл: Платок для хвоста"
	path = /obj/item/clothing/ears/skrell/cloth_female/black
	sort_category = "Расовая одежда"
	whitelisted = SPECIES_SKRELL

/datum/gear/ears/skrell/cloth/long/New()
	..()
	var/list/longtypes = list()
	for(var/long_style in typesof(/obj/item/clothing/ears/skrell/cloth_female))
		var/obj/item/clothing/ears/skrell/cloth_female/long = long_style
		longtypes[initial(long.name)] = long
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(longtypes))

/datum/gear/ears/skrell/colored/band
	display_name = "Скрелл: Повязка для хвоста (окрашиваемая)"
	path = /obj/item/clothing/ears/skrell/colored/band
	sort_category = "Расовая одежда"
	whitelisted = SPECIES_SKRELL

/datum/gear/ears/skrell/colored/band/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/ears/skrell/colored/chain
	display_name = "Скрелл: Цепочка для хвоста (окрашиваемая)"
	path = /obj/item/clothing/ears/skrell/colored/chain
	sort_category = "Расовая одежда"
	whitelisted = SPECIES_SKRELL

/datum/gear/ears/skrell/colored/chain/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/uniform/smock
	display_name = "Тешари: Халат (выбор)"
	path = /obj/item/clothing/under/seromi/smock
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/uniform/smock/New()
	..()
	var/list/smocks = list()
	for(var/smock in typesof(/obj/item/clothing/under/seromi/smock))
		var/obj/item/clothing/under/seromi/smock/smock_type = smock
		smocks[initial(smock_type.name)] = smock_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(smocks))

/datum/gear/uniform/undercoat
	display_name = "Тешари: Накидка (выбор)"
	path = /obj/item/clothing/under/seromi/undercoat/standard
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/uniform/undercoat/New()
	..()
	var/list/undercoats = list()
	for(var/undercoat in typesof(/obj/item/clothing/under/seromi/undercoat/standard))
		var/obj/item/clothing/under/seromi/undercoat/standard/undercoat_type = undercoat
		undercoats[initial(undercoat_type.name)] = undercoat_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(undercoats))

/datum/gear/suit/cloak
	display_name = "Тешари: Плащ (выбор)"
	path = /obj/item/clothing/suit/storage/seromi/cloak/standard
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/suit/cloak/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(/obj/item/clothing/suit/storage/seromi/cloak/standard))
		var/obj/item/clothing/suit/storage/seromi/cloak/standard/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))

/datum/gear/uniform/harness
	display_name = "Упряжь для снаряжения"
	path = /obj/item/clothing/under/harness
	sort_category = "Расовая одежда"

/datum/gear/shoes/footwraps
	display_name = "Обмотки для ступней"
	path = /obj/item/clothing/shoes/footwraps
	sort_category = "Расовая одежда"
	cost = 1

/datum/gear/shoes/footwraps/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/uniform/cohesionsuits
	display_name = "Прометеан: Костюм поддержания когезии (выбор)"
	path = /obj/item/clothing/under/cohesion
	sort_category = "Расовая одежда"

/datum/gear/uniform/cohesionsuits/New()
	..()
	var/list/cohesionsuits = list()
	for(var/cohesionsuit in (typesof(/obj/item/clothing/under/cohesion)))
		var/obj/item/clothing/under/cohesion/cohesion_type = cohesionsuit
		cohesionsuits[initial(cohesion_type.name)] = cohesion_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cohesionsuits))

/datum/gear/uniform/dept
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/uniform/dept/undercoat/ce
	display_name = "Тешари: Накидка Главного Инженера"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/ce
	allowed_roles = list("Главный инженер")

/datum/gear/uniform/dept/undercoat/ce_w
	display_name = "Тешари: Накидка Главного Инженера, белая"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/ce_w
	allowed_roles = list("Главный инженер")

/datum/gear/uniform/dept/undercoat/qm
	display_name = "Тешари: Накидка Квартирмейстера"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/qm
	allowed_roles = list("Интендант")

/datum/gear/uniform/dept/undercoat/command
	display_name = "Тешари: Накидка Управления"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/command
	allowed_roles = list("Директор колонии","Глава персонала","Глава безопасности","Главный инженер","Главврач","Директор исследований")

/datum/gear/uniform/dept/undercoat/command_g
	display_name = "Тешари: Накидка Управления, золотые пуговицы"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/command_g
	allowed_roles = list("Директор колонии","Глава персонала","Глава безопасности","Главный инженер","Главврач","Директор исследований")

/datum/gear/uniform/dept/undercoat/cmo
	display_name = "Тешари: Накидка Главврача"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/cmo
	allowed_roles = list("Главврач")

/datum/gear/uniform/dept/undercoat/cargo
	display_name = "Тешари: Накидка карго"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/cargo
	allowed_roles = list("Грузчик","Интендант","Шахтер")

/datum/gear/uniform/dept/undercoat/mining
	display_name = "Тешари: Накидка шахтёра"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/mining
	allowed_roles = list("Интендант","Шахтер")

/datum/gear/uniform/dept/undercoat/security
	display_name = "Тешари: Накидка Службы Безопасности"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/sec
	allowed_roles = list("Глава безопасности","Детектив","Надзиратель","Офицер безопасности")

/datum/gear/uniform/dept/undercoat/service
	display_name = "Тешари: Накидка работника сервиса"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/service
	allowed_roles = list("Глава персонала","Бармен","Ботаник","Уборщик","Шеф-повар","Библиотекарь")

/datum/gear/uniform/dept/undercoat/engineer
	display_name = "Тешари: Накидка инженера"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/engineer
	allowed_roles = list("Главный инженер","Инженер")

/datum/gear/uniform/dept/undercoat/atmos
	display_name = "Тешари: Накидка атмосферщика"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/atmos
	allowed_roles = list("Главный инженер","Атмосферный техник")

/datum/gear/uniform/dept/undercoat/research
	display_name = "Тешари: Накидка ученого"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/sci
	allowed_roles = list("Директор исследований","Ученый", "Роботехник", "Ксенобиолог")

/datum/gear/uniform/dept/undercoat/robo
	display_name = "Тешари: Накидка робототехника"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/robo
	allowed_roles = list("Роботехник")

/datum/gear/uniform/dept/undercoat/medical
	display_name = "Тешари: Накидка медика"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/medical
	allowed_roles = list("Медик","Главврач","Химик","Парамедик","Geneticist", "Психиатр")

/datum/gear/uniform/dept/undercoat/chemistry
	display_name = "Тешари: Накидка химика"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/chemistry
	allowed_roles = list("Химик")

/datum/gear/uniform/dept/undercoat/virology
	display_name = "Тешари: Накидка вирусолога"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/viro
	allowed_roles = list("Медик")

/datum/gear/uniform/dept/undercoat/paramedic
	display_name = "Тешари: Накидка парамедика"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/para
	allowed_roles = list("Парамедик")

/datum/gear/uniform/dept/undercoat/iaa
	display_name = "Тешари: Накидка агента внутренних дел"
	path = /obj/item/clothing/under/seromi/undercoat/jobs/iaa
	allowed_roles = list("Агент внутренних дел")

/datum/gear/suit/dept/cloak/
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/suit/cloak/dept/ce
	display_name = "Тешари: Плащ Главного Инженера"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/ce
	allowed_roles = list("Главный инженер")

/datum/gear/suit/dept/cloak/qm
	display_name = "Тешари: Плащ Квартирмейстера"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/qm
	allowed_roles = list("Интендант")

/datum/gear/suit/dept/cloak/command
	display_name = "Тешари: Плащ Управления"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/command
	allowed_roles = list("Директор колонии","Глава персонала","Глава безопасности","Главный инженер","Главврач","Директор исследований")

/datum/gear/suit/dept/cloak/cmo
	display_name = "Тешари: Плащ Главврача"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/cmo
	allowed_roles = list("Главврач")

/datum/gear/suit/dept/cloak/cargo
	display_name = "Тешари: Плащ карго"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/cargo
	allowed_roles = list("Грузчик","Интендант","Шахтер")

/datum/gear/suit/dept/cloak/mining
	display_name = "Тешари: Плащ шахтёра"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/mining
	allowed_roles = list("Интендант","Шахтер")

/datum/gear/suit/dept/cloak/security
	display_name = "Тешари: Плащ Службы Безопасности"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/sec
	allowed_roles = list("Глава безопасности","Детектив","Надзиратель","Офицер безопасности")

/datum/gear/suit/dept/cloak/service
	display_name = "Тешари: Плащ работника сервиса"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/service
	allowed_roles = list("Глава персонала","Бармен","Ботаник","Уборщик","Шеф-повар","Библиотекарь")

/datum/gear/suit/dept/cloak/engineer
	display_name = "Тешари: Плащ инженера"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/eningeer
	allowed_roles = list("Главный инженер","Инженер")

/datum/gear/suit/dept/cloak/atmos
	display_name = "Тешари: Плащ атмосферщика"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/atmos
	allowed_roles = list("Главный инженер","Атмосферный техник")

/datum/gear/suit/dept/cloak/research
	display_name = "Тешари: Плащ ученого"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/sci
	allowed_roles = list("Директор исследований","Ученый", "Роботехник", "Ксенобиолог")

/datum/gear/suit/dept/cloak/robo
	display_name = "Тешари: Плащ робототехника"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/robo
	allowed_roles = list("Роботехник")

/datum/gear/suit/dept/cloak/medical
	display_name = "Тешари: Плащ медика)"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/medical
	allowed_roles = list("Медик","Главврач","Химик","Парамедик","Geneticist", "Психиатр")

/datum/gear/suit/dept/cloak/chemistry
	display_name = "Тешари: Плащ химика"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/chemistry
	allowed_roles = list("Химик")

/datum/gear/suit/dept/cloak/virology
	display_name = "Тешари: Плащ вирусолога"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/viro
	allowed_roles = list("Медик")

/datum/gear/suit/dept/cloak/paramedic
	display_name = "Тешари: Плащ парамедика"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/para
	allowed_roles = list("Парамедик")

/datum/gear/suit/dept/cloak/iaa
	display_name = "Тешари: Плащ агента внутренних дел"
	path = /obj/item/clothing/suit/storage/seromi/cloak/jobs/iaa
	allowed_roles = list("Агент внутренних дел")

/datum/gear/uniform/smockcolor
	display_name = "Тешари: Халат (окрашиваемый)"
	path = /obj/item/clothing/under/seromi/smock/white
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/uniform/smockcolor/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/uniform/undercoatcolor
	display_name = "Тешари: Накидка (окрашиваемая)"
	path = /obj/item/clothing/under/seromi/undercoat/standard/white_grey
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/uniform/undercoatcolor/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/suit/cloakcolor
	display_name = "Тешари: Плащ (окрашиваемый)"
	path = /obj/item/clothing/suit/storage/seromi/cloak/standard/white_grey
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/suit/cloakcolor/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice
/datum/gear/suit/labcoat_tesh
	display_name = "Тешари: Лаб. халат (окрашиваемый)"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/teshari
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/suit/labcoat_tesh/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/suit/teshcoat
	display_name = "Тешари: Пальтишко, темное (окрашиваемая полоса)"
	path = /obj/item/clothing/suit/storage/toggle/tesharicoat
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/suit/teshcoat/New()
	..()

	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/suit/teshcoatwhite
	display_name = "Тешари: Пальтишко (окрашиваемое)"
	path = /obj/item/clothing/suit/storage/toggle/tesharicoatwhite
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/suit/teshcoatwhite/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/accessory/teshneckscarf
	display_name = "Тешари: Шарф (окрашиваемый)"
	path = /obj/item/clothing/accessory/scarf/teshari/neckscarf
	whitelisted = SPECIES_TESHARI
	sort_category = "Расовая одежда"

/datum/gear/accessory/teshneckscarf/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/shoes/toelessjack
	display_name = "Ботинки, без пальцев"
	path = /obj/item/clothing/shoes/boots/jackboots/toeless


/datum/gear/shoes/toelessknee
	display_name = "Ботинки, без пальцев, по колени"
	path = /obj/item/clothing/shoes/boots/jackboots/toeless/knee

/datum/gear/shoes/toelessthigh
	display_name = "Ботинки, без пальцев, по бёдра"
	path = /obj/item/clothing/shoes/boots/jackboots/toeless/thigh