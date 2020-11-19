/obj/item/clothing/head/hardhat
	name = "Каска"
	desc = "Головной убор со встроенным фонариком, защищающий голову при работе в опасных условиях."
	icon_state = "hardhat0_yellow"
	brightness_on = 4 //luminosity when on
	light_overlay = "hardhat_light"
	armor = list(melee = 30, bullet = 5, laser = 20,energy = 10, bomb = 20, bio = 10, rad = 20)
	flags_inv = 0
	siemens_coefficient = 0.9
	action_button_name = "Переключить Фонарик"
	w_class = ITEMSIZE_NORMAL
	ear_protection = 1
	drop_sound = 'sound/items/drop/helm.ogg'
	pickup_sound = 'sound/items/pickup/helm.ogg'

/obj/item/clothing/head/hardhat/orange
	icon_state = "hardhat0_orange"
	name = "Оранжевая каска"

/obj/item/clothing/head/hardhat/red
	icon_state = "hardhat0_red"
	name = "Пожарная каска"
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	min_pressure_protection = 0.2* ONE_ATMOSPHERE
	max_pressure_protection = 20 * ONE_ATMOSPHERE


/obj/item/clothing/head/hardhat/white
	icon_state = "hardhat0_white"
	name = "Глянцевая каска"
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	min_pressure_protection = 0.2* ONE_ATMOSPHERE
	max_pressure_protection = 20 * ONE_ATMOSPHERE

/obj/item/clothing/head/hardhat/dblue
	name = "Синяя каска"
	icon_state = "hardhat0_dblue"

/obj/item/clothing/head/hardhat/ranger
	var/hatcolor = "white"
	name = "Шлем рейнджера"
	desc = "Особый шлем Гоу-Гоу ГЭР-Рейнджеров, предоставляющий защиту в вакууме и воздух, а также фильтрующий газы. \
	Обладает инфракрасными визором и, иногда, мезонным визором для поиска пробитий, а также радио... Ну, в сериале, конечно. У этого же шлема есть только фонарик."
	icon = 'icons/obj/clothing/ranger.dmi'
	icon_state = "ranger_helmet"
	light_overlay = "helmet_light"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR

/obj/item/clothing/head/hardhat/ranger/Initialize()
	. = ..()
	if(icon_state == "ranger_helmet")
		icon_state = "[hatcolor]_ranger_helmet"

/obj/item/clothing/head/hardhat/ranger/black
	hatcolor = "black"

/obj/item/clothing/head/hardhat/ranger/pink
	hatcolor = "pink"

/obj/item/clothing/head/hardhat/ranger/green
	hatcolor = "green"

/obj/item/clothing/head/hardhat/ranger/cyan
	hatcolor = "cyan"

/obj/item/clothing/head/hardhat/ranger/orange
	hatcolor = "orange"

/obj/item/clothing/head/hardhat/ranger/yellow
	hatcolor = "yellow"