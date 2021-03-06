GLOBAL_LIST_BOILERPLATE(all_pai_cards, /obj/item/device/paicard)

/obj/item/device/paicard
	name = "персональный ИИ"
	icon = 'icons/obj/pda.dmi'
	icon_state = "pai"
	item_state = "electronic"
	w_class = ITEMSIZE_SMALL
	slot_flags = SLOT_BELT
	origin_tech = list(TECH_DATA = 2)
	show_messages = 0
	preserve_item = 1

	var/obj/item/device/radio/radio
	var/looking_for_personality = 0
	var/mob/living/silicon/pai/pai

/obj/item/device/paicard/relaymove(var/mob/user, var/direction)
	if(user.stat || user.stunned)
		return
	var/obj/item/weapon/rig/rig = src.get_rig()
	if(istype(rig))
		rig.forced_move(direction, user)

/obj/item/device/paicard/New()
	..()
	overlays += "pai-off"

/obj/item/device/paicard/Destroy()
	//Will stop people throwing friend pAIs into the singularity so they can respawn
	if(!isnull(pai))
		pai.death(0)
	QDEL_NULL(radio)
	return ..()

// VOREStation Edit - Allow everyone to become a pAI
/obj/item/device/paicard/attack_ghost(mob/user as mob)
	if(pai != null) //Have a person in them already?
		return ..()

	var/choice = input(user, "Вы точно хотите поселиться в этом пИИ?") in list("Да", "Нет")
	if(choice == "Нет")
		return ..()

	var/pai_name = input(user, "Выберите имя своего персонажа", "Имя Персонажа") as text
	var/actual_pai_name = sanitize_name(pai_name)
	if(isnull(actual_pai_name))
		return ..()

	var/turf/location = get_turf(src)
	var/obj/item/device/paicard/card = new(location)
	var/mob/living/silicon/pai/new_pai = new(card)
	qdel(src)
	new_pai.key = user.key
	card.setPersonality(new_pai)
	new_pai.SetName(actual_pai_name)
	return ..()
// VOREStation Edit End

/obj/item/device/paicard/attack_self(mob/user)
	if (!in_range(src, user))
		return
	user.set_machine(src)
	var/dat = {"
		<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">
		<html>
			<head>
				<style>
					body {
					    margin-top:5px;
					    font-family:Verdana;
					    color:white;
					    font-size:13px;
					    background-image:url('uiBackground.png');
					    background-repeat:repeat-x;
					    background-color:#272727;
						background-position:center top;
					}
					table {
					    font-size:13px;
					    margin-left:-2px;
					}
					table.request {
					    border-collapse:collapse;
					}
					table.desc {
					    border-collapse:collapse;
					    font-size:13px;
					    border: 1px solid #161616;
					    width:100%;
					}
					table.download {
					    border-collapse:collapse;
					    font-size:13px;
					    border: 1px solid #161616;
					    width:100%;
					}
					tr.d0 td, tr.d0 th {
					    background-color: #506070;
					    color: white;
					}
					tr.d1 td, tr.d1 th {
					    background-color: #708090;
					    color: white;
					}
					tr.d2 td {
					    background-color: #00FF00;
					    color: white;
					    text-align:center;
					}
					td.button {
					    border: 1px solid #161616;
					    background-color: #40628a;
					}
					td.button {
					    border: 1px solid #161616;
					    background-color: #40628a;
					    text-align: center;
					}
					td.button_red {
					    border: 1px solid #161616;
					    background-color: #B04040;
					    text-align: center;
					}
					td.download {
					    border: 1px solid #161616;
					    background-color: #40628a;
					    text-align: center;
					}
					th {
					    text-align:left;
					    width:125px;
					}
					td.request {
					    width:140px;
					    vertical-align:top;
					}
					td.radio {
					    width:90px;
					    vertical-align:top;
					}
					td.request {
					    vertical-align:top;
					}
					a {
					    color:#4477E0;
					}
					a.button {
					    color:white;
					    text-decoration: none;
					}
					h2 {
					    font-size:15px;
					}
				</style>
			</head>
			<body>
	"}

	if(pai)
		dat += {"
			<b><font size='3px'>Персональный ИИ</font></b><br><br>
			<table class="request">
				<tr>
					<td class="request">Установленная личность:</td>
					<td>[pai.name]</td>
				</tr>
				<tr>
					<td class="request">Основная директива:</td>
					<td>[pai.pai_law0]</td>
				</tr>
				<tr>
					<td class="request">Второстепенные директивы:</td>
					<td>[pai.pai_laws]</td>
				</tr>
			</table>
			<br>
		"}
		dat += {"
			<table>
				<td class="button">
					<a href='byond://?src=\ref[src];setlaws=1' class='button'>Конфигурация директив</a>
				</td>
			</table>
		"}
		if(pai && (!pai.master_dna || !pai.master))
			dat += {"
				<table>
					<td class="button">
						<a href='byond://?src=\ref[src];setdna=1' class='button'>Отпечатать ДНК источника</a>
					</td>
				</table>
			"}
		dat += "<br>"
		if(radio)
			dat += "<b>Канал связи радио</b>"
			dat += {"
				<table class="request">
					<tr>
						<td class="radio">Передача:</td>
						<td><a href='byond://?src=\ref[src];wires=4'>[radio.broadcasting ? "<font color=#55FF55>En" : "<font color=#FF5555>Dis" ]abled</font></a>

						</td>
					</tr>
					<tr>
						<td class="radio">Прием:</td>
						<td><a href='byond://?src=\ref[src];wires=2'>[radio.listening ? "<font color=#55FF55>En" : "<font color=#FF5555>Dis" ]abled</font></a>

						</td>
					</tr>
				</table>
				<br>
			"}
		else //</font></font>
			dat += "<b>Канал связи радио</b><br>"
			dat += "<font color=red><i>Программное обеспечение радио не установлено. Пожалуйста, установите личность пИИ для загрузки ПО.</i></font><br>"
		dat += {"
			<table>
				<td class="button_red"><a href='byond://?src=\ref[src];wipe=1' class='button'>Стереть текущую личность пИИ.</a>

				</td>
			</table>
		"}
	else
		if(looking_for_personality)
			dat += {"
				<b><font size='3px'>Модуль запроса пИИ</font></b><br><br>
				<p>Запрашиваем личности ИИ из центральной базы данных... если записи в базе отсутствуют, или не отображена подходящая запись, повторите попытку позже, т.к. могут быть загружены дополнительные личности.</p>
				<img src='loading.gif' /> Ищем личности...<br><br>

				<table>
					<tr>
						<td class="button">
							<a href='byond://?src=\ref[src];request=1' class="button">Обновить доступные личности</a>
						</td>
					</tr>
				</table><br>
			"}
		else
			dat += {"
				<b><font size='3px'>Модуль запроса пИИ</font></b><br><br>
			    <p>Личность не загружена.</p>
				<table>
					<tr>
						<td class="button"><a href='byond://?src=\ref[src];request=1' class="button">Запросить личность</a>
						</td>
					</tr>
				</table>
				<br>
				<p>Каждое нажатие этой кнопки отправляет запрос доступным личностям. Ответ на запрос занимает в среднем от 15 секунд до нескольких минут.</p>
			"}
	user << browse(dat, "window=paicard")
	onclose(user, "paicard")
	return

/obj/item/device/paicard/Topic(href, href_list)

	if(!usr || usr.stat)
		return

	if(href_list["setdna"])
		if(pai.master_dna)
			return
		var/mob/M = usr
		if(!istype(M, /mob/living/carbon))
			to_chat(usr, "<font color=blue>У Вас отсутствует ДНК, либо Ваше ДНК не совместимо с этим девайсом.</font>")
		else
			var/datum/dna/dna = usr.dna
			pai.master = M.real_name
			pai.master_dna = dna.unique_enzymes
			to_chat(pai, "<font color = red><h3>Вы были привязаны к мастеру.</h3></font>")
	if(href_list["request"])
		src.looking_for_personality = 1
		paiController.findPAI(src, usr)
	if(href_list["wipe"])
		var/confirm = input("Вы УВЕРЕНЫ, что хотите удалить текущую личность? Это действие невозможно отменить.", "Деинсталляция Личности") in list("Да", "Нет")
		if(confirm == "Да")
			for(var/mob/M in src)
				to_chat(M, "<font color = #ff0000><h2>Вы чувствуете, как реальность ускользает от Вас...</h2></font>")
				to_chat(M, "<font color = #ff4d4d><h3>Байт за байтом, Вы теряете чувство самоосознания.</h3></font>")
				to_chat(M, "<font color = #ff8787><h4>Вашы мысли Вас покидают.</h4></font>")
				to_chat(M, "<font color = #ffc4c4><h5>забвение... </h5></font>")
				M.death(0)
			removePersonality()
	if(href_list["wires"])
		var/t1 = text2num(href_list["wires"])
		switch(t1)
			if(4)
				radio.ToggleBroadcast()
			if(2)
				radio.ToggleReception()
	if(href_list["setlaws"])
		var/newlaws = sanitize(input("Введите любые дополнительные законы, которым обязан следовать Ваш пИИ. Учтите, что эти законы не выше принадлежности пИИ к мастеру. Конфликтующие директивы будут проигнорированы.", "Конфигурация Директив пИИ", pai.pai_laws) as message)
		if(newlaws)
			pai.pai_laws = newlaws
			to_chat(pai, "Ваши второстепенные директивы были обновлены. Ваши новые директивы:")
			to_chat(pai, "Основная директива: <br>[pai.pai_law0]")
			to_chat(pai, "Второстепенные директивы: <br>[pai.pai_laws]")
	attack_self(usr)

// 		WIRE_SIGNAL = 1
//		WIRE_RECEIVE = 2
//		WIRE_TRANSMIT = 4

/obj/item/device/paicard/proc/setPersonality(mob/living/silicon/pai/personality)
	src.pai = personality
	src.overlays += "pai-happy"

/obj/item/device/paicard/proc/removePersonality()
	src.pai = null
	src.overlays.Cut()
	src.overlays += "pai-off"

/obj/item/device/paicard
	var/current_emotion = 1
/obj/item/device/paicard/proc/setEmotion(var/emotion)
	if(pai)
		src.overlays.Cut()
		switch(emotion)
			if(1) src.overlays += "pai-happy"
			if(2) src.overlays += "pai-cat"
			if(3) src.overlays += "pai-extremely-happy"
			if(4) src.overlays += "pai-face"
			if(5) src.overlays += "pai-laugh"
			if(6) src.overlays += "pai-off"
			if(7) src.overlays += "pai-sad"
			if(8) src.overlays += "pai-angry"
			if(9) src.overlays += "pai-what"
			if(10) src.overlays += "pai-neutral"
			if(11) src.overlays += "pai-silly"
			if(12) src.overlays += "pai-nose"
			if(13) src.overlays += "pai-smirk"
			if(14) src.overlays += "pai-exclamation"
			if(15) src.overlays += "pai-question"
		current_emotion = emotion

/obj/item/device/paicard/proc/alertUpdate()
	var/turf/T = get_turf_or_move(src.loc)
	for (var/mob/M in viewers(T))
		M.show_message("<span class='notice'>На пИИ мигает сообщение, \"Новые личности доступны для загрузки.\"</span>", 3, "<span class='notice'>пИИ издаёт электронное пиканье.</span>", 2)

/obj/item/device/paicard/emp_act(severity)
	for(var/mob/M in src)
		M.emp_act(severity)

/obj/item/device/paicard/ex_act(severity)
	if(pai)
		pai.ex_act(severity)
	else
		qdel(src)

/obj/item/device/paicard/see_emote(mob/living/M, text)
	if(pai && pai.client && !pai.canmove)
		var/rendered = "<span class='message'>[text]</span>"
		pai.show_message(rendered, 2)
	..()

/obj/item/device/paicard/show_message(msg, type, alt, alt_type)
	if(pai && pai.client)
		var/rendered = "<span class='message'>[msg]</span>"
		pai.show_message(rendered, type)
	..()
