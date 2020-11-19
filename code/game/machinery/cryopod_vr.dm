//Overrides!

/obj/machinery/cryopod
	// The corresponding spawn point type that user despawning here will return at next round.
	// Note: We use a type instead of name so that its validity is checked at compile time.
	var/spawnpoint_type = /datum/spawnpoint/cryo

/obj/machinery/cryopod/robot
	spawnpoint_type = /datum/spawnpoint/cyborg

/obj/machinery/cryopod/robot/door/gateway
	name = "Телепорт"
	desc = "Телепорт, через который Вы могли попасть на станцию. Через него же можно её и покинуть."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "tele0"
	base_icon_state = "tele0"
	occupied_icon_state = "tele1"
	on_store_message = "покидает колонию через внестанционный телепорт."
	on_enter_occupant_message = "Телепорт активируется, и Вы проходите во вращающийся портал."
	spawnpoint_type = /datum/spawnpoint/gateway

/obj/machinery/computer/cryopod/gateway
	name = "Консоль мониторинга телепорта"
	desc = "Интерфейс между посетителями станции и системами мониторинга телепорта, регистрирующих всех посетителей, приходящих или уходящих через него."
/* VOREStation Edit
/obj/machinery/cryopod/robot/door/dorms
	desc = "A small elevator that goes down to the residential district."
	on_enter_occupant_message = "The elevator door closes slowly, ready to bring you down to the residential district."
	spawnpoint_type = /datum/spawnpoint/elevator

/obj/machinery/computer/cryopod/dorms
	name = "residential oversight console"
	desc = "An interface between visitors and the residential oversight systems tasked with keeping track of all visitors in the residential district."
*/

/obj/machinery/cryopod/proc/log_special_item(var/atom/movable/item,var/mob/to_despawn)
	ASSERT(item && to_despawn)
	
	var/loaded_from_key
	var/char_name = to_despawn.name
	var/item_name = item.name
	
	// Best effort key aquisition
	if(ishuman(to_despawn))
		var/mob/living/carbon/human/H = to_despawn
		if(H.original_player)
			loaded_from_key = H.original_player
	
	if(!loaded_from_key && to_despawn.mind && to_despawn.mind.loaded_from_ckey)
		loaded_from_key = to_despawn.mind.loaded_from_ckey
	
	else
		loaded_from_key = "INVALID"
	
	// Log to harrass them later
	log_game("CRYO [loaded_from_key]/([to_despawn.name]) отправляется в крио[item_name] ([item.type])")
	qdel(item)

	if(control_computer && control_computer.allow_items)
		control_computer.frozen_items += "[item_name] ([char_name])"
