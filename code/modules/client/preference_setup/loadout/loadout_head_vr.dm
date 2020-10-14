/*/datum/gear/head/cap/sol
	display_name = "cap, sol"
	path = /obj/item/clothing/head/soft/sol*/

/datum/gear/head/headbando
	display_name = "Повязка на голову"
	path = /obj/item/clothing/head/fluff/headbando

/datum/gear/head/maid
	display_name = "Головной убор горничной"
	path = /obj/item/clothing/head/headband/maid

/datum/gear/head/headbando/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

//Detective alternative
/datum/gear/head/detective_alt
	display_name = "СБ: Киберскоп (Детектив)"
	path = /obj/item/clothing/head/helmet/detective_alt
	allowed_roles = list("Глава безопасности", "Детектив")