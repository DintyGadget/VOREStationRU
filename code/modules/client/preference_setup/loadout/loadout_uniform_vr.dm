/datum/gear/uniform/suit/permit
	display_name = "Право на наготу"
	path = /obj/item/clothing/under/permit

//Polaris overrides
/datum/gear/uniform/solgov/pt/sifguard
	display_name = "Комплект, военная спортивная форма"
	path = /obj/item/clothing/under/solgov/pt/sifguard

/datum/gear/uniform/job_skirt/sci
	allowed_roles = list("Директор исследований","Учёный", "Ксенобиолог", "Ксеноботаник")

/datum/gear/uniform/job_turtle/science
	allowed_roles = list("Директор исследований", "Учёный", "Робототехник", "Ксенобиолог", "Ксеноботаник")


//KHI Uniforms
/datum/gear/uniform/job_khi/cmd
	display_name = "Униформа KHI: Управление"
	path = /obj/item/clothing/under/rank/khi/cmd
	allowed_roles = list("Глава службы безопасности","Директор колонии","Глава персонала","Главный инженер","Директор исследований","Главврач")

/datum/gear/uniform/job_khi/sec
	display_name = "Униформа KHI: СБ"
	path = /obj/item/clothing/under/rank/khi/sec
	allowed_roles = list("Глава службы безопасности", "Надзиратель", "Детектив", "Офицер безопасности")

/datum/gear/uniform/job_khi/med
	display_name = "Униформа KHI: Врач"
	path = /obj/item/clothing/under/rank/khi/med
	allowed_roles = list("Главврач","Врач","Химик","Парамедик","Geneticist","Военврач")

/datum/gear/uniform/job_khi/eng
	display_name = "Униформа KHI: Инженер"
	path = /obj/item/clothing/under/rank/khi/eng
	allowed_roles = list("Главный инженер","Атмосферный техник","Инженер")

/datum/gear/uniform/job_khi/sci
	display_name = "Униформа KHI: Учёный"
	path = /obj/item/clothing/under/rank/khi/sci
	allowed_roles = list("Директор исследований", "Учёный", "Робототехник", "Ксенобиолог", "Ксеноботаник", "Первопроходец", "Искатель")

//Federation jackets
/datum/gear/suit/job_fed/sec
	display_name = "Униформа Федерации: СБ"
	path = /obj/item/clothing/suit/storage/fluff/fedcoat
	allowed_roles = list("Глава службы безопасности", "Надзиратель", "Детектив", "Офицер безопасности")

/datum/gear/suit/job_fed/medsci
	display_name = "Униформа Федерации: Врач, Учёный"
	path = /obj/item/clothing/suit/storage/fluff/fedcoat/fedblue
	allowed_roles = list("Главврач","Врач","Химик","Парамедик","Geneticist","Директор исследований","Учёный", "Робототехник", "Ксенобиолог","Ксеноботаник","Первопроходец","Искатель","Военврач")

/datum/gear/suit/job_fed/eng
	display_name = "Униформа Федерации: Инженер"
	path = /obj/item/clothing/suit/storage/fluff/fedcoat/fedeng
	allowed_roles = list("Главный инженер","Атмосферный техник","Инженер")

// Trekie things
//TOS
/datum/gear/uniform/job_trek/cmd/tos
	display_name = "Униформа TOS: Управление"
	path = /obj/item/clothing/under/rank/trek/command
	allowed_roles = list("Глава службы безопасности","Директор колонии","Глава персонала","Главный инженер","Директор исследований","Главврач")

/datum/gear/uniform/job_trek/medsci/tos
	display_name = "Униформа TOS: Врач, Учёный"
	path = /obj/item/clothing/under/rank/trek/medsci
	allowed_roles = list("Главврач","Врач","Химик","Парамедик","Geneticist","Директор исследований","Учёный", "Робототехник", "Ксенобиолог", "Ксеноботаник", "Первопроходец", "Искатель", "Военврач")

/datum/gear/uniform/job_trek/eng/tos
	display_name = "Униформа TOS: Инженер, СБ"
	path = /obj/item/clothing/under/rank/trek/engsec
	allowed_roles = list("Главный инженер","Атмосферный техник","Инженер","Надзиратель","Детектив","Офицер безопасности","Глава службы безопасности")

//TNG
/datum/gear/uniform/job_trek/cmd/tng
	display_name = "Униформа TNG: Управление"
	path = /obj/item/clothing/under/rank/trek/command/next
	allowed_roles = list("Глава службы безопасности","Директор колонии","Глава персонала","Главный инженер","Директор исследований","Главврач")

/datum/gear/uniform/job_trek/medsci/tng
	display_name = "Униформа TNG: Врач, Учёный"
	path = /obj/item/clothing/under/rank/trek/medsci/next
	allowed_roles = list("Главврач","Врач","Химик","Парамедик","Geneticist","Директор исследований","Учёный", "Робототехник", "Ксенобиолог", "Ксеноботаник", "Первопроходец", "Искатель", "Военврач")

/datum/gear/uniform/job_trek/eng/tng
	display_name = "Униформа TNG: Инженер, СБ"
	path = /obj/item/clothing/under/rank/trek/engsec/next
	allowed_roles = list("Главный инженер","Атмосферный техник","Инженер","Надзиратель","Детектив","Офицер безопасности","Глава службы безопасности")

//VOY
/datum/gear/uniform/job_trek/cmd/voy
	display_name = "Униформа VOY: Управление"
	path = /obj/item/clothing/under/rank/trek/command/voy
	allowed_roles = list("Глава службы безопасности","Директор колонии","Глава персонала","Главный инженер","Директор исследований","Главврач")

/datum/gear/uniform/job_trek/medsci/voy
	display_name = "Униформа VOY: Врач, Учёный"
	path = /obj/item/clothing/under/rank/trek/medsci/voy
	allowed_roles = list("Главврач","Врач","Химик","Парамедик","Geneticist","Директор исследований","Учёный", "Робототехник", "Ксенобиолог", "Ксеноботаник", "Первопроходец", "Искатель", "Военврач")

/datum/gear/uniform/job_trek/eng/voy
	display_name = "Униформа VOY: Инженер, СБ"
	path = /obj/item/clothing/under/rank/trek/engsec/voy
	allowed_roles = list("Главный инженер","Атмосферный техник","Инженер","Надзиратель","Детектив","Офицер безопасности","Глава службы безопасности")

//DS9

/datum/gear/suit/job_trek/ds9_coat
	display_name = "Шинель DS9 (к униформе)"
	path = /obj/item/clothing/suit/storage/trek/ds9
	allowed_roles = list("Глава службы безопасности","Директор колонии","Глава персонала","Главный инженер","Директор исследований",
						"Главврач","Врач","Химик","Парамедик","Geneticist",
						"Учёный","Робототехник","Ксенобиолог","Ксеноботаник","Атмосферный техник",
						"Инженер","Надзиратель","Детектив","Офицер безопасности", "Первопроходец", "Искатель", "Военврач")


/datum/gear/uniform/job_trek/cmd/ds9
	display_name = "Униформа DS9: Управление"
	path = /obj/item/clothing/under/rank/trek/command/ds9
	allowed_roles = list("Глава службы безопасности","Директор колонии","Глава персонала","Главный инженер","Директор исследований","Главврач")

/datum/gear/uniform/job_trek/medsci/ds9
	display_name = "Униформа DS9: Врач, Учёный"
	path = /obj/item/clothing/under/rank/trek/medsci/ds9
	allowed_roles = list("Главврач","Врач","Химик","Парамедик","Geneticist","Директор исследований","Учёный", "Робототехник", "Ксенобиолог", "Ксеноботаник", "Первопроходец", "Искатель", "Военврач")

/datum/gear/uniform/job_trek/eng/ds9
	display_name = "Униформа DS9: Инженер, СБ"
	path = /obj/item/clothing/under/rank/trek/engsec/ds9
	allowed_roles = list("Главный инженер","Атмосферный техник","Инженер","Надзиратель","Детектив","Офицер безопасности","Глава службы безопасности")


//ENT
/datum/gear/uniform/job_trek/cmd/ent
	display_name = "Униформа ENT: Управление"
	path = /obj/item/clothing/under/rank/trek/command/ent
	allowed_roles = list("Глава службы безопасности","Директор колонии","Глава персонала","Главный инженер","Директор исследований","Главврач")

/datum/gear/uniform/job_trek/medsci/ent
	display_name = "Униформа ENT: Врач, Учёный"
	path = /obj/item/clothing/under/rank/trek/medsci/ent
	allowed_roles = list("Главврач","Врач","Химик","Парамедик","Geneticist","Директор исследований","Учёный", "Робототехник", "Ксенобиолог", "Ксеноботаник", "Первопроходец", "Искатель", "Военврач")

/datum/gear/uniform/job_trek/eng/ent
	display_name = "Униформа ENT: Инженер, СБ"
	path = /obj/item/clothing/under/rank/trek/engsec/ent
	allowed_roles = list("Главный инженер","Атмосферный техник","Инженер","Надзиратель","Детектив","Офицер безопасности","Глава службы безопасности")
/*
Swimsuits
*/

/datum/gear/uniform/swimsuits
	display_name = "Купальник (выбор)"
	path = /obj/item/weapon/storage/box/fluff/swimsuit

/datum/gear/uniform/swimsuits/New()
	..()
	var/list/swimsuits = list()
	for(var/swimsuit in typesof(/obj/item/weapon/storage/box/fluff/swimsuit))
		var/obj/item/weapon/storage/box/fluff/swimsuit/swimsuit_type = swimsuit
		swimsuits[initial(swimsuit_type.name)] = swimsuit_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(swimsuits))

/datum/gear/uniform/suit/gnshorts
	display_name = "Шорты, с ремнём"
	path = /obj/item/clothing/under/fluff/gnshorts

//Latex maid dress
/datum/gear/uniform/latexmaid
	display_name = "Униформа горничной, латекс"
	path = /obj/item/clothing/under/fluff/latexmaid

//Tron Siren outfit
/datum/gear/uniform/siren
	display_name = "Комбинезон, футуристический"
	path = /obj/item/clothing/under/fluff/siren

/datum/gear/uniform/suit/v_nanovest
	display_name = "Наножилет Varmacorp"
	path = /obj/item/clothing/under/fluff/v_nanovest

/*
Qipao
*/
/datum/gear/uniform/qipao
	display_name = "Ципао, черное"
	path = /obj/item/clothing/under/dress/qipao

/datum/gear/uniform/qipao_red
	display_name = "Ципао, красное"
	path = /obj/item/clothing/under/dress/qipao/red

/datum/gear/uniform/qipao_white
	display_name = "Ципао, белое"
	path = /obj/item/clothing/under/dress/qipao/white
