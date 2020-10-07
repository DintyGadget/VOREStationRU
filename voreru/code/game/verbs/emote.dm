/mob/living/var/emoteCooldown = (5 SECONDS)
/mob/living/var/emoteLastUse = -1000

var/list/sounded_species = null

/mob/living/proc/emoteCooldownCheck()
	if(emoteLastUse <= (world.time - emoteCooldown))
		emoteLastUse = world.time
		return 1
	else
		to_chat(src, "<span class='warning'>����� �������� ������ ������ �� ����� [emoteCooldown / 10] ������.</span>")
		return 0

/mob/living/verb/laugh1()
	set name = "���~"
	set category = "������"
	sounded_species = null
	emote("nya")

/mob/living/verb/laugh1()
	set name = "�������"
	set category = "������"
	sounded_species = null
	emote("scream")

/mob/living/verb/laugh1()
	set name = "�������� ��������"
	set category = "������"
	sounded_species = null
	emote("snap")

/mob/living/verb/laugh1()
	set name = "���������"
	set category = "������"
	sounded_species = null
	emote("vomit")

/mob/living/verb/laugh1()
	set name = "������ ����"
	set category = "������"
	sounded_species = null
	emote("handshake")

/mob/living/verb/laugh1()
	set name = "������"
	set category = "������"
	sounded_species = null
	emote("hug")

/mob/living/verb/laugh4()
	set name = "������"
	set category = "������"
	emote("growl")

/mob/living/verb/laugh7()
	set name = "�������"
	set category = "������"
	emote("mrowl")

/mob/living/verb/laugh8()
	set name = "������ (����)"
	set category = "������"
	emote("peep")

/mob/living/verb/laugh9()
	set name = "��������"
	set category = "������"
	emote("chirp")

/mob/living/verb/laugh14()
	set name = "���"
	set category = "������"
	emote("bark")

/mob/living/verb/laugh15()
	set name = "�������"
	set category = "������"
	emote("bork")

/mob/living/verb/laugh16()
	set name = "������� 2"
	set category = "������"
	emote("mrow")

/mob/living/verb/laugh17()
	set name = "���������� ����"
	set category = "������"
	emote("hypno")

mob/living/verb/laugh18()
	set name = "������"
	set category = "������"
	sounded_species = list(SPECIES_UNATHI)
	emote("hiss")

/mob/living/verb/laugh()
	set name = "��������"
	set category = "������"
	emote("laugh")

/mob/living/verb/giggle()
	set name = "��������"
	set category = "������"
	emote("giggle")

/mob/living/verb/cry()
	set name = "�������"
	set category = "������"
	emote("cry")

/mob/living/verb/moan()
	set name = "�������"
	set category = "������"
	emote("moan")

/mob/living/verb/snore()
	set name = "�������"
	set category = "������"
	emote("snore")

/mob/living/verb/sigh()
	set name = "���������"
	set category = "������"
	emote("sigh")

/mob/living/verb/yawn()
	set name = "�������"
	set category = "������"
	emote("yawn")

/mob/living/verb/yawn()
	set name = "����������"
	set category = "������"
	emote("smile")

/mob/living/verb/yawn()
	set name = "������ �������"
	set category = "������"
	emote("shake")

/mob/living/verb/yawn()
	set name = "�������� ��������"
	set category = "������"
	emote("crack")

/mob/living/verb/yawn()
	set name = "���������"
	set category = "������"
	emote("mumble")

/mob/living/verb/yawn()
	set name = "�������"
	set category = "������"
	emote("grumble")

/mob/living/verb/yawn()
	set name = "�������"
	set category = "������"
	emote("cough")

/mob/living/verb/yawn()
	set name = "������ �����"
	set category = "������"
	emote("salute")