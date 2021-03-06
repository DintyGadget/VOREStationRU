#define PERSIST_SPAWN		0x01	// Persist spawnpoint based on location of despawn/logout.
#define PERSIST_WEIGHT		0x02	// Persist mob weight
#define PERSIST_ORGANS		0x04	// Persist the status (normal/amputated/robotic/etc) and model (for robotic) status of organs
#define PERSIST_MARKINGS	0x08	// Persist markings
#define PERSIST_SIZE		0x10	// Persist size
#define PERSIST_COUNT		5		// Number of valid bits in this bitflag.  Keep this updated!
#define PERSIST_DEFAULT		PERSIST_SPAWN|PERSIST_ORGANS|PERSIST_MARKINGS|PERSIST_SIZE // Default setting for new folks

// Define a place to save in character setup
/datum/preferences
	var/persistence_settings = PERSIST_DEFAULT	// Control what if anything is persisted for this character between rounds.

// Definition of the stuff for Sizing
/datum/category_item/player_setup_item/vore/persistence
	name = "Persistence"
	sort_order = 5

/datum/category_item/player_setup_item/vore/persistence/load_character(var/savefile/S)
	S["persistence_settings"]		>> pref.persistence_settings
	sanitize_character() // Don't let new characters start off with nulls

/datum/category_item/player_setup_item/vore/persistence/save_character(var/savefile/S)
	S["persistence_settings"]		<< pref.persistence_settings

/datum/category_item/player_setup_item/vore/persistence/sanitize_character()
	pref.persistence_settings		= sanitize_integer(pref.persistence_settings, 0, (1<<(PERSIST_COUNT+1)-1), initial(pref.persistence_settings))

/datum/category_item/player_setup_item/vore/persistence/content(var/mob/user)
	. = list()
	. += "<b>Запоминание событий на следующий раунд</b><br>"
	. += "<table>"

	. += "<tr><td title=\"Устанавливает местоположение спавна в зависимости от того, где Вы покинули раунд.\">Сохранять место прибытия: </td>"
	. += make_yesno(PERSIST_SPAWN)
	. += "</tr>"

	. += "<tr><td title=\"Сохраняет вес персонажа до следующего раунда.\">Сохранять вес: </td>"
	. += make_yesno(PERSIST_WEIGHT)
	. += "</tr>"

	. += "<tr><td title=\"Обновляет состояние частей тела и органов (нормальный/ампутированный/роботизированный и т. д.) на основе того, что у Вас есть в конце раунда.\">Запоминать части тела: </td>"
	. += make_yesno(PERSIST_ORGANS)
	. += "</tr>"

	. += "<tr><td title=\"Обновляет особенности тела (тип, цвет) на основе того, что у Вас есть в конце раунда.\">Сохранять особенности тела: </td>"
	. += make_yesno(PERSIST_MARKINGS)
	. += "</tr>"

	. += "<tr><td title=\"Обновляет масштаб персонажа, основываясь на том, каким Вы были в конце раунда.\">Сохранять размер: </td>"
	. += make_yesno(PERSIST_SIZE)
	. += "</tr>"

	. += "</table>"
	return jointext(., "")

/datum/category_item/player_setup_item/vore/persistence/proc/make_yesno(var/bit)
	if(pref.persistence_settings & bit)
		return "<td><span class='linkOn'><b>Да</b></span></td> <td><a href='?src=\ref[src];toggle_off=[bit]'>Нет</a></td>"
	else
		return "<td><a href='?src=\ref[src];toggle_on=[bit]'>Да</a></td> <td><span class='linkOn'><b>Нет</b></span></td>"

/datum/category_item/player_setup_item/vore/persistence/OnTopic(var/href, var/list/href_list, var/mob/user)
	if(href_list["toggle_on"])
		var/bit = text2num(href_list["toggle_on"])
		pref.persistence_settings |= bit
		return TOPIC_REFRESH
	else if(href_list["toggle_off"])
		var/bit = text2num(href_list["toggle_off"])
		pref.persistence_settings &= ~bit
		return TOPIC_REFRESH
	return ..()
