//Based on the ERT setup

var/global/send_beruang = 0
var/can_call_traders = 1

/client/proc/trader_ship()
	set name = "Отправить Торговый Корабль Беруанг"
	set category = "Особые Команды"
	set desc = "Пригласите игроков присоединиться к Беруангу."

	if(!holder)
		to_chat(usr, "<span class='danger'>Эту команду могут использовать только администраторы.</span>")
		return
	if(!ticker)
		to_chat(usr, "<span class='danger'>Игра ещё не началась!</span>")
		return
	if(ticker.current_state == 1)
		to_chat(usr, "<span class='danger'>Раунд ещё не начался!</span>")
		return
	if(send_beruang)
		to_chat(usr, "<span class='danger'>Беруанг уже был отправлен в этом раунде!</span>")
		return
	if(alert("Хотите ли Вы отправить корабль Беруанг?",,"Да","Нет") != "Да")
		return
	if(get_security_level() == "red") // Allow admins to reconsider if the alert level is Red
		switch(alert("На станции красная тревога. Вы уверены в своём решении отправить торговцев?",,"Да","Нет"))
			if("Нет")
				return
	if(send_beruang)
		to_chat(usr, "<span class='danger'>Кто-то Вас уже опередил!</span>")
		return

	message_admins("[key_name_admin(usr)] отправляет Беруанг.", 1)
	log_admin("[key_name(usr)] использовал Отправить Торговый Корабль Беруанг.")
	trigger_trader_visit()

client/verb/JoinTraders()

	set name = "Присоединиться К Торговцам"
	set category = "IC"

	if(!MayRespawn(1))
		to_chat(usr, "<span class='warning'>Вы не можете присоединиться к торговцам.</span>")
		return

	if(istype(usr,/mob/observer/dead) || istype(usr,/mob/new_player))
		if(!send_beruang)
			to_chat(usr, "Беруанг сейчас не направляется в сторону станции.")
			return
		if(traders.current_antagonists.len >= traders.hard_cap)
			to_chat(usr, "Все слоты торговцев уже заполнены!")
			return
		traders.create_default(usr)
	else
		to_chat(usr, "Чтобы использовать это, необходимо быть в режиме наблюдателя или новым игроком.")

proc/trigger_trader_visit()
	if(!can_call_traders)
		return
	if(send_beruang)
		return

	command_announcement.Announce("Приближающийся перевозчик груза: Беруанг (Рег: VRS 22EB1F11C2).", "Контроль Трафика [station_name()]")

	can_call_traders = 0 // Only one call per round.
	send_beruang = 1
	consider_trader_load() //VOREStation Add

	sleep(600 * 5)
	send_beruang = 0 // Can no longer join the traders.
