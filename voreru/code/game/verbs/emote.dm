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

/mob/living/verb/emote1()
	set name = "���~"
	set category = "������"
	sounded_species = null
	emote("nya")

/mob/living/verb/emote2()
	set name = "�������"
	set category = "������"
	sounded_species = null
	emote("scream")

/mob/living/verb/emote3()
	set name = "�������� ��������"
	set category = "������"
	sounded_species = null
	emote("snap")

/mob/living/verb/emote4()
	set name = "���������"
	set category = "������"
	sounded_species = null
	emote("vomit")

/mob/living/verb/emote5()
	set name = "������ ����"
	set category = "������"
	sounded_species = null
	emote("handshake")

/mob/living/verb/emote6()
	set name = "������"
	set category = "������"
	sounded_species = null
	emote("hug")

/mob/living/verb/emote7()
	set name = "������"
	set category = "������"
	emote("growl")

/mob/living/verb/emote8()
	set name = "�������"
	set category = "������"
	emote("mrowl")

/mob/living/verb/emote9()
	set name = "������ (����)"
	set category = "������"
	emote("peep")

/mob/living/verb/emote10()
	set name = "��������"
	set category = "������"
	emote("chirp")

/mob/living/verb/emote11()
	set name = "���"
	set category = "������"
	emote("bark")

/mob/living/verb/emote12()
	set name = "�������"
	set category = "������"
	emote("bork")

/mob/living/verb/emote13()
	set name = "������� 2"
	set category = "������"
	emote("mrow")

/mob/living/verb/emote14()
	set name = "���������� ����"
	set category = "������"
	emote("hypno")

mob/living/verb/emote15()
	set name = "������"
	set category = "������"
	sounded_species = list(SPECIES_UNATHI)
	emote("hiss")

/mob/living/verb/emote16()
	set name = "��������"
	set category = "������"
	emote("laugh")

/mob/living/verb/emote17()
	set name = "��������"
	set category = "������"
	emote("giggle")

/mob/living/verb/emote18()
	set name = "�������"
	set category = "������"
	emote("cry")

/mob/living/verb/emote19()
	set name = "�������"
	set category = "������"
	emote("moan")

/mob/living/verb/emote20()
	set name = "�������"
	set category = "������"
	emote("snore")

/mob/living/verb/emote21()
	set name = "���������"
	set category = "������"
	emote("sigh")

/mob/living/verb/emote22()
	set name = "�������"
	set category = "������"
	emote("yawn")

/mob/living/verb/emote23()
	set name = "����������"
	set category = "������"
	emote("smile")

/mob/living/verb/emote24()
	set name = "������ �������"
	set category = "������"
	emote("shake")

/mob/living/verb/emote25()
	set name = "�������� ��������"
	set category = "������"
	emote("crack")

/mob/living/verb/emote26()
	set name = "���������"
	set category = "������"
	emote("mumble")

/mob/living/verb/emote27()
	set name = "�������"
	set category = "������"
	emote("grumble")

/mob/living/verb/emote28()
	set name = "�������"
	set category = "������"
	emote("cough")

/mob/living/verb/emote29()
	set name = "������ �����"
	set category = "������"
	emote("salute")