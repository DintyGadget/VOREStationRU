//STRIKE TEAMS
//Thanks to Kilakk for the admin-button portion of this code.

var/global/send_emergency_team = 0 // Used for automagic response teams
                                   // 'admin_emergency_team' for admin-spawned response teams
var/ert_base_chance = 10 // Default base chance. Will be incremented by increment ERT chance.
var/can_call_ert
var/silent_ert = 0

/client/proc/response_team()
	set name = "Отправить Группу Аварийного Реагирования"
	set category = "Особые Команды"
	set desc = "Отправляет на станцию группу аварийного реагирования."

	if(!holder)
		to_chat(usr, "<span class='danger'>Только администраторы могут использовать эту команду.</span>")
		return
	if(!ticker)
		to_chat(usr, "<span class='danger'>Игра ещё не началась!</span>")
		return
	if(ticker.current_state == 1)
		to_chat(usr, "<span class='danger'>Раунд ещё не начался!</span>")
		return
	if(send_emergency_team)
		to_chat(usr, "<span class='danger'>[using_map.boss_name] уже отправил группу экстренного реагирования!</span>")
		return
	if(alert("Хотите ли Вы отправить бригаду экстренного реагирования?",,"Да","Нет") != "Да")
		return
	if(alert("Хотите ли Вы, чтобы было объявлено об этой группе реагирования?",,"Да","Нет") != "Да")
		silent_ert = 1
	if(get_security_level() != "red") // Allow admins to reconsider if the alert level isn't Red
		switch(alert("На станции не красная тревога. Вы уверены в своём решении отправить группу реагирования?",,"Да","Нет"))
			if("Нет")
				return
	if(send_emergency_team)
		to_chat(usr, "<span class='danger'>Похоже, кто-то вас опередил!</span>")
		return

	message_admins("[key_name_admin(usr)] отправляет группу аварийного реагирования.", 1)
	log_admin("[key_name(usr)] использовал Отправить Группу Аварийного Реагирования.")
	trigger_armed_response_team(1)

client/verb/JoinResponseTeam()

	set name = "Присоединиться К ГЭР"
	set category = "IC"

	if(!MayRespawn(1))
		to_chat(usr, "<span class='warning'>В настоящее время Вы не можете присоединиться к группе реагирования.</span>")
		return

	if(istype(usr,/mob/observer/dead) || istype(usr,/mob/new_player))
		if(!send_emergency_team)
			to_chat(usr, "В настоящее время группа экстренного реагирования не отправляется.")
			return
		if(jobban_isbanned(usr, "Syndicate") || jobban_isbanned(usr, "Emergency Response Team") || jobban_isbanned(usr, "Офицер безопасности"))
			to_chat(usr, "<span class='danger'>Вам запрещена работа в группе экстренного реагирования!</span>")
			return
		if(ert.current_antagonists.len >= ert.hard_cap)
			to_chat(usr, "Бригада экстренного реагирования уже заполнена!")
			return
		ert.create_default(usr)
	else
		to_chat(usr, "Чтобы использовать это, Вы должны быть наблюдателем или новым игроком.")

// returns a number of dead players in %
proc/percentage_dead()
	var/total = 0
	var/deadcount = 0
	for(var/mob/living/carbon/human/H in mob_list)
		if(H.client) // Monkeys and mice don't have a client, amirite?
			if(H.stat == 2) deadcount++
			total++

	if(total == 0) return 0
	else return round(100 * deadcount / total)

// counts the number of antagonists in %
proc/percentage_antagonists()
	var/total = 0
	var/antagonists = 0
	for(var/mob/living/carbon/human/H in mob_list)
		if(is_special_character(H) >= 1)
			antagonists++
		total++

	if(total == 0) return 0
	else return round(100 * antagonists / total)

// Increments the ERT chance automatically, so that the later it is in the round,
// the more likely an ERT is to be able to be called.
proc/increment_ert_chance()
	while(send_emergency_team == 0) // There is no ERT at the time.
		if(get_security_level() == "green")
			ert_base_chance += 1
		if(get_security_level() == "yellow")
			ert_base_chance += 1
		if(get_security_level() == "violet")
			ert_base_chance += 2
		if(get_security_level() == "orange")
			ert_base_chance += 2
		if(get_security_level() == "blue")
			ert_base_chance += 2
		if(get_security_level() == "red")
			ert_base_chance += 3
		if(get_security_level() == "delta")
			ert_base_chance += 10           // Need those big guns
		sleep(600 * 3) // Minute * Number of Minutes


proc/trigger_armed_response_team(var/force = 0)
	if(!can_call_ert && !force)
		return
	if(send_emergency_team)
		return

	var/send_team_chance = ert_base_chance // Is incremented by increment_ert_chance.
	send_team_chance += 2*percentage_dead() // the more people are dead, the higher the chance
	send_team_chance += percentage_antagonists() // the more antagonists, the higher the chance
	send_team_chance = min(send_team_chance, 100)

	if(force) send_team_chance = 100

	// there's only a certain chance a team will be sent
	if(!prob(send_team_chance))
		command_announcement.Announce("Похоже, для [station_name()] была запрошена группа аварийного реагирования. К сожалению, в настоящее время мы не смогли отправить никого.", "[using_map.boss_name]")
		can_call_ert = 0 // Only one call per round, ladies.
		return
	if(silent_ert == 0)
		command_announcement.Announce("Похоже, для [station_name()]была запрошена группа аварийного реагирования. Мы подготовим и отправим её в кратчайшие сроки.", "[using_map.boss_name]")

	can_call_ert = 0 // Only one call per round, gentleman.
	send_emergency_team = 1
	consider_ert_load() //VOREStation Add

	sleep(600 * 5)
	send_emergency_team = 0 // Can no longer join the ERT.
