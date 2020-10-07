/mob/living/var/emoteCooldown = (5 SECONDS)
/mob/living/var/emoteLastUse = -1000

var/list/sounded_species = null

/mob/living/proc/emoteCooldownCheck()
	if(emoteLastUse <= (world.time - emoteCooldown))
		emoteLastUse = world.time
		return 1
	else
		to_chat(src, "<span class='warning'>Между эмоциями должно пройти не менее [emoteCooldown / 10] секунд.</span>")
		return 0

/mob/living/verb/laugh1()
	set name = "Нья~"
	set category = "Эмоции"
	sounded_species = null
	emote("nya")

/mob/living/verb/laugh1()
	set name = "Кричать"
	set category = "Эмоции"
	sounded_species = null
	emote("scream")

/mob/living/verb/laugh1()
	set name = "Щелкнуть пальцами"
	set category = "Эмоции"
	sounded_species = null
	emote("snap")

/mob/living/verb/laugh1()
	set name = "Блевануть"
	set category = "Эмоции"
	sounded_species = null
	emote("vomit")

/mob/living/verb/laugh1()
	set name = "Пожать руку"
	set category = "Эмоции"
	sounded_species = null
	emote("handshake")

/mob/living/verb/laugh1()
	set name = "Обнять"
	set category = "Эмоции"
	sounded_species = null
	emote("hug")

/mob/living/verb/laugh4()
	set name = "Рычать"
	set category = "Эмоции"
	emote("growl")

/mob/living/verb/laugh7()
	set name = "Мяукать"
	set category = "Эмоции"
	emote("mrowl")

/mob/living/verb/laugh8()
	set name = "Пищать (птич)"
	set category = "Эмоции"
	emote("peep")

/mob/living/verb/laugh9()
	set name = "Чирикать"
	set category = "Эмоции"
	emote("chirp")

/mob/living/verb/laugh14()
	set name = "Лай"
	set category = "Эмоции"
	emote("bark")

/mob/living/verb/laugh15()
	set name = "Тявкать"
	set category = "Эмоции"
	emote("bork")

/mob/living/verb/laugh16()
	set name = "Мяукать 2"
	set category = "Эмоции"
	emote("mrow")

/mob/living/verb/laugh17()
	set name = "Загадочный звук"
	set category = "Эмоции"
	emote("hypno")

mob/living/verb/laugh18()
	set name = "Шипеть"
	set category = "Эмоции"
	sounded_species = list(SPECIES_UNATHI)
	emote("hiss")

/mob/living/verb/laugh()
	set name = "Смеяться"
	set category = "Эмоции"
	emote("laugh")

/mob/living/verb/giggle()
	set name = "Хихикать"
	set category = "Эмоции"
	emote("giggle")

/mob/living/verb/cry()
	set name = "Плакать"
	set category = "Эмоции"
	emote("cry")

/mob/living/verb/moan()
	set name = "Стонать"
	set category = "Эмоции"
	emote("moan")

/mob/living/verb/snore()
	set name = "Храпеть"
	set category = "Эмоции"
	emote("snore")

/mob/living/verb/sigh()
	set name = "Вздохнуть"
	set category = "Эмоции"
	emote("sigh")

/mob/living/verb/yawn()
	set name = "Зевнуть"
	set category = "Эмоции"
	emote("yawn")

/mob/living/verb/yawn()
	set name = "Улыбнуться"
	set category = "Эмоции"
	emote("smile")

/mob/living/verb/yawn()
	set name = "Трясти головой"
	set category = "Эмоции"
	emote("shake")

/mob/living/verb/yawn()
	set name = "Хрустеть пальцами"
	set category = "Эмоции"
	emote("crack")

/mob/living/verb/yawn()
	set name = "Бормотать"
	set category = "Эмоции"
	emote("mumble")

/mob/living/verb/yawn()
	set name = "Ворчать"
	set category = "Эмоции"
	emote("grumble")

/mob/living/verb/yawn()
	set name = "Кашлять"
	set category = "Эмоции"
	emote("cough")

/mob/living/verb/yawn()
	set name = "Отдать честь"
	set category = "Эмоции"
	emote("salute")