// Inherits from /book/ so it can fit on bookshelves.
/obj/item/weapon/book/codex // Vorestation Edits throughout this object.
	name = "Туристический Гид по Человеческому Космосу: Вирго-Эригон"
	desc = "Содержит полезную информацию о мире вокруг. Написан, похоже, для туристов Вирго-Эригон, будь то человек или нет. \
	На обложке маленькими приветливыми буквами подписано 'Не Паникуйте'."
	icon_state = "codex"
	item_state = "book4"
	unique = TRUE
	var/datum/codex_tree/tree = null
	var/root_type = /datum/lore/codex/category/main_virgo_lore	//Runtimes on codex_tree.dm, line 18 with a null here

/obj/item/weapon/book/codex/Initialize()
	tree = new(src, root_type)
	. = ..()

/obj/item/weapon/book/codex/attack_self(mob/user)
	if(!tree)
		tree = new(src, root_type)
	icon_state = "[initial(icon_state)]-open"
	tree.display(user)

/obj/item/weapon/book/codex/lore/vir // Vorestation Edits throughout this object.
	name = "Туристический Гид по Человеческому Космосу: Вирго-Эригон"
	desc = "Содержит полезную информацию о мире вокруг. Написан, похоже, для туристов Вирго-Эригон, будь то человек или нет. \
	На обложке маленькими приветливыми буквами подписано 'Не Паникуйте'."
	icon_state = "codex"
	root_type = /datum/lore/codex/category/main_virgo_lore
	libcategory = "Справочник"

/obj/item/weapon/book/codex/lore/robutt
	name = "Гид по Искусственным Телам Для Потребителей"
	desc = "Рекомендуется к прочтению всему недавно кибернетизированному персоналу, а также позитроникам и прямоходящим синтетикам."
	icon_state = "codex_robutt"
	item_state = "book6"
	root_type = /datum/lore/codex/category/main_robutts
	libcategory = "Справочник"

/obj/item/weapon/book/codex/lore/news
	name = "карманный вестник Daedalus"
	desc = "Регулярно обновляемый компендиум недавних событий. Крайне необходим для всех новоприбывших в систему Вир и тех, кому интересна политика."
	icon_state = "newscodex"
	item_state = "book1"
	w_class = ITEMSIZE_SMALL
	root_type = /datum/lore/codex/category/main_news
	libcategory = "Справочник"
	drop_sound = 'sound/items/drop/device.ogg'

/* //VORESTATION REMOVAL
// Combines SOP/Regs/Law
/obj/item/weapon/book/codex/corp_regs
	name = "NanoTrasen Regulatory Compendium"
	desc = "Contains large amounts of information on Standard Operating Procedure, Corporate Regulations, and important regional laws.  The best friend of \
	Internal Affairs."
	icon_state = "corp_regs"
	item_state = "book10"
	root_type = /datum/lore/codex/category/main_corp_regs
	throwforce = 5 // Throw the book at 'em.
	libcategory = "Reference"
*/
