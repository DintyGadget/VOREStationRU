/* Surgery Tools
 * Contains:
 *		Retractor
 *		Hemostat
 *		Cautery
 *		Surgical Drill
 *		Scalpel
 *		Circular Saw
 */

/obj/item/weapon/surgical
	name = "Surgical tool"
	desc = "Этого здесь быть не должно, помогите."
	icon = 'icons/obj/surgery.dmi'
	w_class = ITEMSIZE_SMALL
	drop_sound = 'sound/items/drop/weldingtool.ogg'
	pickup_sound = 'sound/items/pickup/weldingtool.ogg'
	var/helpforce = 0	//For help intent things

/obj/item/weapon/surgical/attack(mob/M, mob/user)
	if(user.a_intent == I_HELP)	//A tad messy, but this should stop people from smacking their patients in surgery
		return 0
	..()

/*
 * Retractor
 */

/obj/item/weapon/surgical/retractor
	name = "retractor"
	desc = "Убирает вещи."
	icon_state = "retractor"
	matter = list(DEFAULT_WALL_MATERIAL = 10000, "glass" = 5000)
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	drop_sound = 'sound/items/drop/scrap.ogg'

/*
 * Hemostat
 */
/obj/item/weapon/surgical/hemostat
	name = "hemostat"
	desc = "Вы думаете, что видели это раньше."
	icon_state = "hemostat"
	matter = list(DEFAULT_WALL_MATERIAL = 5000, "glass" = 2500)
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	attack_verb = list("attacked", "pinched")
	drop_sound = 'sound/items/drop/scrap.ogg'

/*
 * Cautery
 */
/obj/item/weapon/surgical/cautery
	name = "cautery"
	desc = "Это останавливает кровотечение."
	icon_state = "cautery"
	matter = list(DEFAULT_WALL_MATERIAL = 5000, "glass" = 2500)
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	attack_verb = list("burnt")
	drop_sound = 'sound/items/drop/scrap.ogg'

/*
 * Surgical Drill
 */
/obj/item/weapon/surgical/surgicaldrill
	name = "surgical drill"
	desc = "Вы можете сверлить с помощью этого предмета. Вы копаете?"
	icon_state = "drill"
	hitsound = 'sound/weapons/circsawhit.ogg'
	matter = list(DEFAULT_WALL_MATERIAL = 15000, "glass" = 10000)
	force = 15.0
	w_class = ITEMSIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	attack_verb = list("drilled")
	drop_sound = 'sound/items/drop/accessory.ogg'

	suicide_act(mob/user)
		var/datum/gender/TU = gender_datums[user.get_visible_gender()]
		to_chat(viewers(user),pick("<span class='danger'>\The [user] is pressing \the [src] to [TU.his] temple and activating it! It looks like [TU.hes] trying to commit suicide.</span>",
		                       "<span class='danger'>\The [user] is pressing \the [src] to [TU.his] chest and activating it! It looks like [TU.hes] trying to commit suicide.</span>"))
		return (BRUTELOSS)

/*
 * Scalpel
 */
/obj/item/weapon/surgical/scalpel
	name = "scalpel"
	desc = "Режьте, режьте и еще раз режьте."
	icon_state = "scalpel"
	force = 10.0
	sharp = 1
	edge = 1
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_EARS
	throwforce = 5.0
	throw_speed = 3
	throw_range = 5
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 10000, "glass" = 5000)
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	drop_sound = 'sound/items/drop/knife.ogg'

	suicide_act(mob/user)
		var/datum/gender/TU = gender_datums[user.get_visible_gender()]
		to_chat(viewers(user),pick("<span class='danger'>\The [user] is slitting [TU.his] wrists with the [src.name]! It looks like [TU.hes] trying to commit suicide.</span>", \
		                      "<span class='danger'>\The [user] is slitting [TU.his] throat with the [src.name]! It looks like [TU.hes] trying to commit suicide.</span>", \
		                      "<span class='danger'>\The [user] is slitting [TU.his] stomach open with the [src.name]! It looks like [TU.hes] trying to commit seppuku.</span>"))
		return (BRUTELOSS)

/*
 * Researchable Scalpels
 */
/obj/item/weapon/surgical/scalpel/laser1
	name = "laser scalpel"
	desc = "Скальпель с направленным лазером для более точной резки без попадания крови на поле. Это выглядит просто и может быть улучшено."
	icon_state = "scalpel_laser1_on"
	damtype = "fire"

/obj/item/weapon/surgical/scalpel/laser2
	name = "laser scalpel"
	desc = "Скальпель с направленным лазером для более точной резки без попадания крови на поле. Этот выглядит несколько продвинутым."
	icon_state = "scalpel_laser2_on"
	damtype = "fire"
	force = 12.0

/obj/item/weapon/surgical/scalpel/laser3
	name = "laser scalpel"
	desc = "Скальпель с направленным лазером для более точной резки без попадания крови на поле. Этот выглядит как вершина точных энергетических столовых приборов!"
	icon_state = "scalpel_laser3_on"
	damtype = "fire"
	force = 15.0

/obj/item/weapon/surgical/scalpel/manager
	name = "incision management system"
	desc = "Настоящее расширение тела хирурга, это чудо мгновенно и полностью подготавливает разрез, позволяя немедленно приступить к терапевтическим этапам."
	icon_state = "scalpel_manager_on"
	force = 7.5

/obj/item/weapon/surgical/scalpel/ripper
	name = "organ pincers"
	desc = "Ужасающий клинок с большим металлическим шипом в центре. Инструмент используется для быстрого удаления органов у пациентов, которые, мы надеемся, этого захотят."
	icon_state = "organ_ripper"
	item_state = "bone_setter"
	force = 15.0
	toolspeed = 0.75
	origin_tech = list(TECH_MATERIAL = 5, TECH_BIO = 3, TECH_ILLEGAL = 2)

/*
 * Circular Saw
 */
/obj/item/weapon/surgical/circular_saw
	name = "circular saw"
	desc = "Для резки в тяжелых условиях."
	icon_state = "saw3"
	hitsound = 'sound/weapons/circsawhit.ogg'
	drop_sound = 'sound/items/drop/accessory.ogg'
	force = 15.0
	w_class = ITEMSIZE_NORMAL
	throwforce = 9.0
	throw_speed = 3
	throw_range = 5
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 20000,"glass" = 10000)
	attack_verb = list("attacked", "slashed", "sawed", "cut")
	sharp = 1
	edge = 1

/obj/item/weapon/surgical/circular_saw/manager
	name = "energetic bone diverter"
	desc = "Для тяжелой резки (и запечатывания) с помощью науки!"
	icon_state = "adv_saw"
	item_state = "saw3"
	hitsound = 'sound/weapons/emitter2.ogg'
	damtype = SEARING
	w_class = ITEMSIZE_LARGE
	origin_tech = list(TECH_BIO = 4, TECH_MATERIAL = 6, TECH_MAGNET = 6)
	matter = list(DEFAULT_WALL_MATERIAL = 12500)
	attack_verb = list("attacked", "slashed", "seared", "cut")
	toolspeed = 0.75

//misc, formerly from code/defines/weapons.dm
/obj/item/weapon/surgical/bonegel
	name = "bone gel"
	desc = "Для фиксации костей."
	icon_state = "bone-gel"
	force = 0
	throwforce = 1.0
	drop_sound = 'sound/items/drop/bottle.ogg'

/obj/item/weapon/surgical/FixOVein
	name = "FixOVein"
	desc = "Like bone gel. For veins."
	icon_state = "fixovein"
	force = 0
	throwforce = 1.0
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 3)
	var/usage_amount = 10
	drop_sound = 'sound/items/drop/accessory.ogg'

/obj/item/weapon/surgical/bonesetter
	name = "bone setter"
	desc = "Put them in their place."
	icon_state = "bone_setter"
	force = 8.0
	throwforce = 9.0
	throw_speed = 3
	throw_range = 5
	attack_verb = list("attacked", "hit", "bludgeoned")
	drop_sound = 'sound/items/drop/scrap.ogg'

/obj/item/weapon/surgical/bone_clamp
	name = "bone clamp"
	desc = "Лучший способ быстро исправить кость."
	icon_state = "bone_clamp"
	force = 8
	throwforce = 9
	throw_speed = 3
	throw_range = 5
	attack_verb = list("attacked", "hit", "bludgeoned")

// Cyborg Tools

/obj/item/weapon/surgical/retractor/cyborg
	toolspeed = 0.5

/obj/item/weapon/surgical/hemostat/cyborg
	toolspeed = 0.5

/obj/item/weapon/surgical/cautery/cyborg
	toolspeed = 0.5

/obj/item/weapon/surgical/surgicaldrill/cyborg
	toolspeed = 0.5

/obj/item/weapon/surgical/scalpel/cyborg
	toolspeed = 0.5

/obj/item/weapon/surgical/circular_saw/cyborg
	toolspeed = 0.5

/obj/item/weapon/surgical/bonegel/cyborg
	toolspeed = 0.5

/obj/item/weapon/surgical/FixOVein/cyborg
	toolspeed = 0.5

/obj/item/weapon/surgical/bonesetter/cyborg
	toolspeed = 0.5


// Alien Tools
/obj/item/weapon/surgical/retractor/alien
	icon = 'icons/obj/abductor.dmi'
	toolspeed = 0.25

/obj/item/weapon/surgical/hemostat/alien
	icon = 'icons/obj/abductor.dmi'
	toolspeed = 0.25

/obj/item/weapon/surgical/cautery/alien
	icon = 'icons/obj/abductor.dmi'
	toolspeed = 0.25

/obj/item/weapon/surgical/surgicaldrill/alien
	icon = 'icons/obj/abductor.dmi'
	toolspeed = 0.25

/obj/item/weapon/surgical/scalpel/alien
	icon = 'icons/obj/abductor.dmi'
	toolspeed = 0.25

/obj/item/weapon/surgical/circular_saw/alien
	icon = 'icons/obj/abductor.dmi'
	toolspeed = 0.25

/obj/item/weapon/surgical/FixOVein/alien
	icon = 'icons/obj/abductor.dmi'
	toolspeed = 0.25

/obj/item/weapon/surgical/bone_clamp/alien
	icon = 'icons/obj/abductor.dmi'
	toolspeed = 0.75
