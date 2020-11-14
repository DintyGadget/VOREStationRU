

/obj/item/clothing/gloves/yellow
	desc = "Эти перчатки защищают носителя от удара током."
	name = "изолирующие перчатки"
	icon_state = "yellow"
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	drop_sound = 'sound/items/drop/rubber.ogg'
	pickup_sound = 'sound/items/pickup/rubber.ogg'

/obj/item/clothing/gloves/fyellow                             //Cheap Chinese Crap
	desc = "Эти перчатки - дешевая копия настоящих изолирующих перчаток. Что могло бы пойти не так?"
	name = "дешевые изолирующие перчатки"
	icon_state = "yellow"
	siemens_coefficient = 1			//Set to a default of 1, gets overridden in initialize()
	permeability_coefficient = 0.05
	drop_sound = 'sound/items/drop/rubber.ogg'
	pickup_sound = 'sound/items/pickup/rubber.ogg'

/obj/item/clothing/gloves/fyellow/Initialize()
	. = ..()
	//Picks a value between 0 and 1.25, in 5% increments // VOREStation edit
	var/shock_pick = rand(0,15) // VOREStation Edit
	siemens_coefficient = shock_pick * 0.05

/obj/item/clothing/gloves/black
	desc = "Эти перчатки толстые и огнеустойчивые."
	name = "черные перчатки"
	icon_state = "black"
	permeability_coefficient = 0.05

	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/orange
	name = "оранжевые перчатки"
	desc = "Пара перчаток, в них нет ничего особенного."
	icon_state = "orange"

/obj/item/clothing/gloves/red
	name = "красные перчатки"
	desc = "Пара перчаток, в них нет ничего особенного."
	icon_state = "red"

/obj/item/clothing/gloves/rainbow
	name = "радужные перчатки"
	desc = "Пара перчаток, в них нет ничего особенного."
	icon_state = "rainbow"

/obj/item/clothing/gloves/blue
	name = "синие перчатки"
	desc = "Пара перчаток, в них нет ничего особенного."
	icon_state = "blue"

/obj/item/clothing/gloves/purple
	name = "фиолетовые перчатки"
	desc = "Пара перчаток, в них нет ничего особенного."
	icon_state = "purple"

/obj/item/clothing/gloves/green
	name = "зеленые перчатки"
	desc = "Пара перчаток, в них нет ничего особенного."
	icon_state = "green"

/obj/item/clothing/gloves/grey
	name = "серые перчатки"
	desc = "Пара перчаток, в них нет ничего особенного."
	icon_state = "gray"

/obj/item/clothing/gloves/light_brown
	name = "светло-коричневые перчатки"
	desc = "Пара перчаток, в них нет ничего особенного."
	icon_state = "lightbrown"

/obj/item/clothing/gloves/brown
	name = "коричневые перчатки"
	desc = "Пара перчаток, в них нет ничего особенного."
	icon_state = "brown"

/obj/item/clothing/gloves/evening
	desc = "Пара перчаток длиной по локость. Стильно!"
	name = "вечерние перчатки"
	icon_state = "evening_gloves"
	addblends = "evening_gloves_a"

	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

obj/item/clothing/gloves/fingerless
	desc = "Пара перчаток, совсем не защищающих пальцы."
	name = "перчатки без пальцев"
	icon_state = "fingerlessgloves"
	fingerprint_chance = 100