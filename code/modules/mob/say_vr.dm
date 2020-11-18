//////////////////////////////////////////////////////
////////////////////SUBTLE COMMAND////////////////////
//////////////////////////////////////////////////////

/mob/verb/me_verb_subtle(message as message) //This would normally go in say.dm
	set name = "Скрытый Эмоут"
	set category = "IC"
	set desc = "Отправить эмоут людям поблизости (а также охотнику/добыче)"

	if(say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "Речь на данный момент отключена админами.")
		return

	message = sanitize_or_reflect(message,src) //VOREStation Edit - Reflect too-long messages (within reason)
	if(!message)
		return

	set_typing_indicator(FALSE)
	if(use_me)
		usr.emote_vr("me",4,message)
	else
		usr.emote_vr(message)

/mob/proc/custom_emote_vr(var/m_type=1,var/message = null) //This would normally go in emote.dm
	if(stat || !use_me && usr == src)
		to_chat(src, "Вы не можете сейчас отправлять эмоуты.")
		return

	var/muzzled = is_muzzled()
	if(m_type == 2 && muzzled) return

	var/input
	if(!message)
		input = sanitize_or_reflect(input(src,"Введите эмоут для отображения.") as text|null, src)
	else
		input = message

	if(input)
		log_subtle(message,src)
		message = "<span class='emote'><B>[src]</B> <I>[input]</I></span>"
	else
		return

	if (message)
		var/undisplayed_message = "<span class='emote'><B>[src]</B> <I>делает что-то скрытное, что нельзя разглядеть.</I></span>"
		message = encode_html_emphasis(message)

		var/list/vis = get_mobs_and_objs_in_view_fast(get_turf(src),1,2) //Turf, Range, and type 2 is emote
		var/list/vis_mobs = vis["mobs"]
		var/list/vis_objs = vis["objs"]

		for(var/vismob in vis_mobs)
			var/mob/M = vismob
			if(isobserver(M) && !is_preference_enabled(/datum/client_preference/whisubtle_vis) && !M.client?.holder)
				spawn(0)
					M.show_message(undisplayed_message, 2)
			else
				spawn(0)
					M.show_message(message, 2)

		for(var/visobj in vis_objs)
			var/obj/O = visobj
			spawn(0)
				O.see_emote(src, message, 2)

/mob/proc/emote_vr(var/act, var/type, var/message) //This would normally go in say.dm
	if(act == "me")
		return custom_emote_vr(type, message)

#define MAX_HUGE_MESSAGE_LEN 8192
#define POST_DELIMITER_STR "\<\>"
/proc/sanitize_or_reflect(message,user)
	//Way too long to send
	if(length(message) > MAX_HUGE_MESSAGE_LEN)
		fail_to_chat(user)
		return

	message = sanitize(message, max_length = MAX_HUGE_MESSAGE_LEN)

	//Came back still too long to send
	if(length(message) > MAX_MESSAGE_LEN)
		fail_to_chat(user,message)
		return null
	else
		return message

// returns true if it failed
/proc/reflect_if_needed(message, user)
	if(length(message) > MAX_HUGE_MESSAGE_LEN)
		fail_to_chat(user)
		return TRUE
	return FALSE

/proc/fail_to_chat(user,message)
	if(!message)
		to_chat(user, "<span class='danger'>Ваше сообщение НЕ БЫЛО отправлено, либо потому что оно СЛИШКОМ длинное, либо вычищено системой до пустоты.</span>")
		return

	var/length = length(message)
	var/posts = CEILING((length/MAX_MESSAGE_LEN), 1)
	to_chat(user,message)
	to_chat(user, "<span class='danger'>^ Это сообщение НЕ БЫЛО отправлено ^ -- В нём [length] знаков, а предел - [MAX_MESSAGE_LEN]. Разбейте его на [posts] сообщения.</span>")
#undef MAX_HUGE_MESSAGE_LEN
