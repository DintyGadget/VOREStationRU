// verb for admins to set custom event
/client/proc/cmd_admin_change_custom_event()
	set category = "Fun"
	set name = "Change Custom Event"

	if(!holder)
		to_chat(src, "Only administrators may use this command.")
		return

	var/input = sanitize(input(usr, "Enter the description of the custom event. Be descriptive. To cancel the event, make this blank or hit cancel.", "Custom Event", custom_event_msg) as message|null, MAX_PAPER_MESSAGE_LEN, extra = 0)
	if(!input || input == "")
		custom_event_msg = null
		log_admin("[usr.key] has cleared the custom event text.")
		message_admins("[key_name_admin(usr)] has cleared the custom event text.")
		return

	log_admin("[usr.key] has changed the custom event text.")
	message_admins("[key_name_admin(usr)] has changed the custom event text.")

	custom_event_msg = input

	to_world("<h1 class='alert'>Custom Event</h1>")
	to_world("<h2 class='alert'>A custom event is starting. OOC Info:</h2>")
	to_world("<span class='alert'>[custom_event_msg]</span>")
	to_world("<br>")

// normal verb for players to view info
/client/verb/cmd_view_custom_event()
	set category = "OOC"
	set name = "Проверить Авторские Эвенты"

	if(!custom_event_msg || custom_event_msg == "")
		to_chat(src, "<span class='filter_notice'>Сейчас не происходит никаких эвентов.</span>")
		to_chat(src, "<span class='filter_notice'>Не исключено, что админ не настроил эту информацию.</span>")
		return

	to_chat(src, "<h1 class='filter_notice alert'>Авторский эвент</h1>")
	to_chat(src, "<h2 class='filter_notice alert'>Сейчас происходит авторский эвент. OOC информация:</h2>")
	to_chat(src, "<span class='filter_notice alert'>[custom_event_msg]<br></span>")
