/obj/item/clothing/head/centhat/customs
	desc = "Формальный головной убор офицеров таможни Сол."

/obj/item/clothing/head/fish
	name = "Череп рыбы"
	desc = "Вы же... не собираетесь реально его надевать?"
	icon_state = "fishskull"
	icon = 'icons/obj/clothing/hats_vr.dmi'
	icon_override = 'icons/mob/head_vr.dmi'
	flags_inv = HIDEEARS|BLOCKHAIR

/obj/item/clothing/head/crown
	name = "Корона"
	desc = "Какая роскошь!"
	icon_state = "crown"
	icon = 'icons/obj/clothing/hats_vr.dmi'
	icon_override = 'icons/mob/head_vr.dmi'

/obj/item/clothing/head/fancy_crown
	name = "Роскошная корона"
	desc = "Какая необычнайная роскошь!"
	icon_state = "fancycrown"
	icon = 'icons/obj/clothing/hats_vr.dmi'
	icon_override = 'icons/mob/head_vr.dmi'

/obj/item/clothing/head/shiny_hood
	icon_override = 'icons/mob/modular_shiny_vr.dmi'
	icon = 'icons/obj/clothing/modular_shiny_vr.dmi'
	name = "Блестящий капюшон"
	desc = "В нём любой похож на супергероя! Нужно только не забыть костюм!"
	icon_state = "hood_o"
	flags_inv = HIDEFACE|BLOCKHAIR
	body_parts_covered = FACE|HEAD

/obj/item/clothing/head/shiny_hood/poly
	name = "Полихромный блестящий капюшон"
	icon_state = "hood_col_o"
	polychromic = TRUE

/obj/item/clothing/head/shiny_hood/closed
	name = "Блестящий капюшон"
	desc = "В нём любой похож на супергероя! Нужно только не забыть свои сверхсилы!"
	icon_state = "hood_c"
	gas_transfer_coefficient = 0.90

/obj/item/clothing/head/shiny_hood/closed/poly
	name = "Полихромный блестящий капюшон"
	icon_state = "hood_col_o"
	polychromic = TRUE