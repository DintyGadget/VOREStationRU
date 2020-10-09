// Define a place to save in character setup
/datum/preferences
	var/vantag_volunteer = 0	// What state I want to be in, in terms of being affected by antags.
	var/vantag_preference = VANTAG_NONE	// Whether I'd like to volunteer to be an antag at some point.

// Definition of the stuff for Sizing
/datum/category_item/player_setup_item/vore/vantag
	name = "VS Events"
	sort_order = 6

/datum/category_item/player_setup_item/vore/vantag/load_character(var/savefile/S)
	S["vantag_volunteer"]	>> pref.vantag_volunteer
	S["vantag_preference"]	>> pref.vantag_preference

/datum/category_item/player_setup_item/vore/vantag/save_character(var/savefile/S)
	S["vantag_volunteer"]	<< pref.vantag_volunteer
	S["vantag_preference"]	<< pref.vantag_preference

/datum/category_item/player_setup_item/vore/vantag/sanitize_character()
	pref.vantag_volunteer	= sanitize_integer(pref.vantag_volunteer, 0, 1, initial(pref.vantag_volunteer))
	pref.vantag_preference	= sanitize_inlist(pref.vantag_preference, vantag_choices_list, initial(pref.vantag_preference))

/datum/category_item/player_setup_item/vore/vantag/copy_to_mob(var/mob/living/carbon/human/character)
	if(character && !istype(character,/mob/living/carbon/human/dummy))
		character.vantag_pref = pref.vantag_preference
		BITSET(character.hud_updateflag, VANTAG_HUD)

/datum/category_item/player_setup_item/vore/vantag/content(var/mob/user)
	. += "<br>"
	. += "<b>Участие в ивентах:</b> <a [pref.vantag_volunteer ? "class='linkOn'" : ""] href='?src=\ref[src];toggle_vantag_volunteer=1'><b>[pref.vantag_volunteer ? "Да" : "Нет"]</b></a><br>"
	. += "<b>Предпочтения в ивентах:</b> <a href='?src=\ref[src];change_vantag=1'><b>[vantag_choices_list[pref.vantag_preference]]</b></a><br>"

/datum/category_item/player_setup_item/vore/vantag/OnTopic(var/href, var/list/href_list, var/mob/user)
	if(href_list["toggle_vantag_volunteer"])
		pref.vantag_volunteer = pref.vantag_volunteer ? 0 : 1
		return TOPIC_REFRESH

	else if(href_list["change_vantag"])
		var/list/names_list = list()
		for(var/C in vantag_choices_list)
			names_list[vantag_choices_list[C]] = C

		var/selection = input(user, "Как Вы хотите взаимодействовать с персонажами ивентов в плане ERP? Им будет виден Ваш выбор в интерфейсе. Персонажи ивентов - это избранные и заспавненные админами игроки с, вероятно, назначенными целями, которые обязаны соблюдать предпочтения ERP и RP так же, как и любой другой игрок, однако RP с ними может быть коротки, если у них нет времени, или за ними погоня.", "Предпочтения в ивентах") as null|anything in names_list
		if(selection && selection != "Normal")
			pref.vantag_preference = names_list[selection]

		return TOPIC_REFRESH
	return ..()
