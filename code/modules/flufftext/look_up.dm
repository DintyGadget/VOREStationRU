// Implements a verb to make your character look upward, mostly intended for the surface.

/mob/living/verb/look_up()
	set name = "Посмотреть Наверх"
	set category = "IC"
	set desc = "Посмотреть вверх в надежде на то, что на потолке нет пауков."

	to_chat(usr, "Вы смотрите вверх...")

	var/turf/T = get_turf(usr)
	if(!T) // In null space.
		to_chat(usr, span("warning", "Вы, кажется, находитесь в месте, где нет никакого понятия о направлении. У Вас есть проблемы посерьезнее."))
		return

	if(!T.outdoors) // They're inside.
		to_chat(usr, "Вы не видите ничего интересного.")
		return

	else // They're outside and hopefully on a planet.
		var/datum/planet/P = SSplanets.z_to_planet[T.z]
		if(!P)
			to_chat(usr, span("warning", "Вы, кажется, находитесь снаружи, но не на планете... Что-то не так."))
			return

		var/datum/weather_holder/WH = P.weather_holder

		// Describe the current weather.
		if(WH.current_weather.observed_message)
			to_chat(usr, WH.current_weather.observed_message)

		// If we can see the sky, we'll see things like sun position, phase of the moon, etc.
		if(!WH.current_weather.sky_visible)
			to_chat(usr, "Вы не можете ясно видеть небо из-за того, что на улице [WH.current_weather.name].")
		else
			// Sun-related output.
			if(P.sun_name)
				var/afternoon = P.current_time.seconds_stored > (P.current_time.seconds_in_day / 2)

				var/sun_message = null
				switch(P.sun_position)
					if(0 to 0.4) // Night
						sun_message = "Сейчас ночь, и [P.sun_name] не видно."
					if(0.4 to 0.5) // Twilight
						sun_message = "Сейчас сумерки, однако [P.sun_name] не видно."
					if(0.5 to 0.7) // Sunrise/set.
						sun_message = "[P.sun_name] постепенно [!afternoon ? "восходит" : "заходит"] на горизонте."
					if(0.7 to 0.9) // Morning/evening
						sun_message = "[P.sun_name] находится [!afternoon ? "за зенитом" : "дальше зенита"]."
					if(0.9 to 1.0) // Noon
						sun_message = "Ровно полдень. [P.sun_name] прямо над Вами."

				to_chat(usr, sun_message)

			// Now for the moon.
			if(P.moon_name)
				if(P.moon_phase == MOON_PHASE_NEW_MOON)
					to_chat(usr, "[P.moon_name] не видна. Вероятно, новолуние.")
				else
					to_chat(usr, "[P.moon_name] сейчас в фазе [P.moon_phase].")

