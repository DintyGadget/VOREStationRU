/mob/living
	var/datum/language/default_language

/mob/living/verb/set_default_language(language as null|anything in languages)
	set name = "Установить Основной Язык"
	set category = "IC"

	if (only_species_language && language != GLOB.all_languages[src.species_language])
		to_chat(src, "<span class='notice'>Вы знаете только язык Вашей расы, [src.species_language].</span>")
		return 0

	if(language == GLOB.all_languages[src.species_language])
		to_chat(src, "<span class='notice'>Вы теперь будете разговаривать на своём основном языке, [language ? language : "Общий"], если не укажете в сообщении другой язык.</span>")
	else if (language)

		if(language && !can_speak(language))
			to_chat(src, "<span class='notice'>Вы не можете говорить на этом языке.</span>")
			return

		to_chat(src, "<span class='notice'>Вы теперь будете разговаривать на языке [language], если не укажете в сообщении другой язык.</span>")
	else
		to_chat(src, "<span class='notice'>Вы теперь будете разговаривать на своём основном языке, если не укажете в сообщении другой язык.</span>")
	default_language = language

// Silicons can't neccessarily speak everything in their languages list
/mob/living/silicon/set_default_language(language as null|anything in speech_synthesizer_langs)
	..()

/mob/living/verb/check_default_language()
	set name = "Проверить Основной Язык"
	set category = "IC"

	if(default_language)
		to_chat(src, "<span class='notice'>Вы сейчас говорите на языке [default_language] по умолчанию.</span>")
	else
		to_chat(src, "<span class='notice'>Ваш текущий основной язык по умолчанию принадлежит Вашей расе или типу моба.</span>")
