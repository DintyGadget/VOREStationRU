/datum/category_item/player_setup_item/player_global/ui
	name = "UI"
	sort_order = 1

/datum/category_item/player_setup_item/player_global/ui/load_preferences(var/savefile/S)
	S["UI_style"]		>> pref.UI_style
	S["UI_style_color"]	>> pref.UI_style_color
	S["UI_style_alpha"]	>> pref.UI_style_alpha
	S["ooccolor"]		>> pref.ooccolor
	S["tooltipstyle"]	>> pref.tooltipstyle
	S["client_fps"]		>> pref.client_fps
	S["ambience_freq"]	>> pref.ambience_freq
	S["ambience_chance"] >> pref.ambience_chance
	S["tgui_fancy"]		>> pref.tgui_fancy
	S["tgui_lock"]		>> pref.tgui_lock

/datum/category_item/player_setup_item/player_global/ui/save_preferences(var/savefile/S)
	S["UI_style"]		<< pref.UI_style
	S["UI_style_color"]	<< pref.UI_style_color
	S["UI_style_alpha"]	<< pref.UI_style_alpha
	S["ooccolor"]		<< pref.ooccolor
	S["tooltipstyle"]	<< pref.tooltipstyle
	S["client_fps"]		<< pref.client_fps
	S["ambience_freq"]	<< pref.ambience_freq
	S["ambience_chance"] << pref.ambience_chance
	S["tgui_fancy"]		<< pref.tgui_fancy
	S["tgui_lock"]		<< pref.tgui_lock

/datum/category_item/player_setup_item/player_global/ui/sanitize_preferences()
	pref.UI_style			= sanitize_inlist(pref.UI_style, all_ui_styles, initial(pref.UI_style))
	pref.UI_style_color		= sanitize_hexcolor(pref.UI_style_color, initial(pref.UI_style_color))
	pref.UI_style_alpha		= sanitize_integer(pref.UI_style_alpha, 0, 255, initial(pref.UI_style_alpha))
	pref.ooccolor			= sanitize_hexcolor(pref.ooccolor, initial(pref.ooccolor))
	pref.tooltipstyle		= sanitize_inlist(pref.tooltipstyle, all_tooltip_styles, initial(pref.tooltipstyle))
	pref.client_fps			= sanitize_integer(pref.client_fps, 0, MAX_CLIENT_FPS, initial(pref.client_fps))
	pref.ambience_freq		= sanitize_integer(pref.ambience_freq, 0, 60, initial(pref.ambience_freq)) // No more than once per hour.
	pref.ambience_chance 	= sanitize_integer(pref.ambience_chance, 0, 100, initial(pref.ambience_chance)) // 0-100 range.
	pref.tgui_fancy		= sanitize_integer(pref.tgui_fancy, 0, 1, initial(pref.tgui_fancy))
	pref.tgui_lock		= sanitize_integer(pref.tgui_lock, 0, 1, initial(pref.tgui_lock))

/datum/category_item/player_setup_item/player_global/ui/content(var/mob/user)
	. = "<b>Тема интерфейса:</b> <a href='?src=\ref[src];select_style=1'><b>[pref.UI_style]</b></a><br>"
	. += "<b>Своя тема</b> (рекомендуется для темы White):<br>"
	. += "- Цвет: <a href='?src=\ref[src];select_color=1'><b>[pref.UI_style_color]</b></a> [color_square(hex = pref.UI_style_color)] <a href='?src=\ref[src];reset=ui'>Сброс</a><br>"
	. += "- Альфа-слой (прозрачность): <a href='?src=\ref[src];select_alpha=1'><b>[pref.UI_style_alpha]</b></a> <a href='?src=\ref[src];reset=alpha'>Сброс</a><br>"
	. += "<b>Стиль подсказок:</b> <a href='?src=\ref[src];select_tooltip_style=1'><b>[pref.tooltipstyle]</b></a><br>"
	. += "<b>FPS клиента:</b> <a href='?src=\ref[src];select_client_fps=1'><b>[pref.client_fps]</b></a><br>"
	. += "<b>Частота звуков окружения:</b> <a href='?src=\ref[src];select_ambience_freq=1'><b>[pref.ambience_freq]</b></a><br>"
	. += "<b>Шанс звуков окружения:</b> <a href='?src=\ref[src];select_ambience_chance=1'><b>[pref.ambience_chance]</b></a><br>"
	. += "<b>Режим окна tgui:</b> <a href='?src=\ref[src];tgui_fancy=1'><b>[(pref.tgui_fancy) ? "Fancy (default)" : "Compatible (slower)"]</b></a><br>"
	. += "<b>Расположение окна tgui:</b> <a href='?src=\ref[src];tgui_lock=1'><b>[(pref.tgui_lock) ? "Primary Monitor" : "Free (default)"]</b></a><br>"
	if(can_select_ooc_color(user))
		. += "<b>Цвет ООС:</b>�"
		if(pref.ooccolor == initial(pref.ooccolor))
			. += "<a href='?src=\ref[src];select_ooc_color=1'><b>Using Default</b></a><br>"
		else
			. += "<a href='?src=\ref[src];select_ooc_color=1'><b>[pref.ooccolor]</b></a> [color_square(hex = pref.ooccolor)]�<a href='?src=\ref[src];reset=ooc'>reset</a><br>"

/datum/category_item/player_setup_item/player_global/ui/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["select_style"])
		var/UI_style_new = input(user, "Выберите тему интерфейса.", "Character Preference", pref.UI_style) as null|anything in all_ui_styles
		if(!UI_style_new || !CanUseTopic(user)) return TOPIC_NOACTION
		pref.UI_style = UI_style_new
		return TOPIC_REFRESH

	else if(href_list["select_color"])
		var/UI_style_color_new = input(user, "Выберите цвет темы, темные цвета не рекомендуются!", "Global Preference", pref.UI_style_color) as color|null
		if(isnull(UI_style_color_new) || !CanUseTopic(user)) return TOPIC_NOACTION
		pref.UI_style_color = UI_style_color_new
		return TOPIC_REFRESH

	else if(href_list["select_alpha"])
		var/UI_style_alpha_new = input(user, "Выберите уровень альфа-слоя темы (прозрачность), от 50 до 255.", "Global Preference", pref.UI_style_alpha) as num|null
		if(isnull(UI_style_alpha_new) || (UI_style_alpha_new < 50 || UI_style_alpha_new > 255) || !CanUseTopic(user)) return TOPIC_NOACTION
		pref.UI_style_alpha = UI_style_alpha_new
		return TOPIC_REFRESH

	else if(href_list["select_ooc_color"])
		var/new_ooccolor = input(user, "Выберите свой цвет ООС.", "Global Preference") as color|null
		if(new_ooccolor && can_select_ooc_color(user) && CanUseTopic(user))
			pref.ooccolor = new_ooccolor
			return TOPIC_REFRESH

	else if(href_list["select_tooltip_style"])
		var/tooltip_style_new = input(user, "Выберите стиль оформления подсказок.", "Global Preference", pref.tooltipstyle) as null|anything in all_tooltip_styles
		if(!tooltip_style_new || !CanUseTopic(user)) return TOPIC_NOACTION
		pref.tooltipstyle = tooltip_style_new
		return TOPIC_REFRESH

	else if(href_list["select_client_fps"])
		var/fps_new = input(user, "Введите FPS клиента (1-200, 0 использует FPS сервера).", "Global Preference", pref.client_fps) as null|num
		if(isnull(fps_new) || !CanUseTopic(user)) return TOPIC_NOACTION
		if(fps_new < 0 || fps_new > MAX_CLIENT_FPS) return TOPIC_NOACTION
		pref.client_fps = fps_new
		if(pref.client)
			pref.client.fps = fps_new
		return TOPIC_REFRESH

	else if(href_list["select_ambience_freq"])
		var/ambience_new = input(user, "Введите, как часто Вам хочется слышать звуки окружения (раз в 1-60 минут, 0 для отключения)", "Global Preference", pref.ambience_freq) as null|num
		if(isnull(ambience_new) || !CanUseTopic(user)) return TOPIC_NOACTION
		if(ambience_new < 0 || ambience_new > 60) return TOPIC_NOACTION
		pref.ambience_freq = ambience_new
		return TOPIC_REFRESH

	else if(href_list["select_ambience_chance"])
		var/ambience_chance_new = input(user, "Введите шанс воспроизведения звуков окружения (при входе в комнату, или случайно). 35 означает 35% шанс воспроизвести звук. Допускаются значения от 0 до 100. 0 полностью отключает звуки окружения. Частота звуков окружения так же на это влияет.", "Global Preference", pref.ambience_freq) as null|num
		if(isnull(ambience_chance_new) || !CanUseTopic(user)) return TOPIC_NOACTION
		if(ambience_chance_new < 0 || ambience_chance_new > 100) return TOPIC_NOACTION
		pref.ambience_chance = ambience_chance_new
		return TOPIC_REFRESH

	else if(href_list["tgui_fancy"])
		pref.tgui_fancy = !pref.tgui_fancy
		return TOPIC_REFRESH

	else if(href_list["tgui_lock"])
		pref.tgui_lock = !pref.tgui_lock
		return TOPIC_REFRESH

	else if(href_list["reset"])
		switch(href_list["reset"])
			if("ui")
				pref.UI_style_color = initial(pref.UI_style_color)
			if("alpha")
				pref.UI_style_alpha = initial(pref.UI_style_alpha)
			if("ooc")
				pref.ooccolor = initial(pref.ooccolor)
		return TOPIC_REFRESH

	return ..()

/datum/category_item/player_setup_item/player_global/ui/proc/can_select_ooc_color(var/mob/user)
	return config.allow_admin_ooccolor && check_rights(R_ADMIN|R_EVENT|R_FUN, 0, user)
