
/client/New()
	..()
	dir = NORTH

/client/verb/spinleft()
	set name = "Повернуть Вид Против Стрелки"
	set category = "OOC"
	dir = turn(dir, 90)

/client/verb/spinright()
	set name = "Повернуть Вид По Стрелке"
	set category = "OOC"
	dir = turn(dir, -90)

