/* fuck if i know why this is here but it was here before i got here -- Rhahirr
/proc/intonation(text)
	if (copytext_char(text,-1) == "!")
		text = "<b>[text]</b>"
	return text
*/

/proc/ru_countreagents(var/input, single_text = "единица", few_text = "единицы", many_text = "единиц")
	var/a = input % 100
	var/b = input % 10
	if (a > 10 && a < 20)
		return "[input] [many_text]"
	if (b > 1 && b < 5)
		return "[input] [few_text]"
	if (b == 1)
		return "[input] [single_text]"
	return "[input] [many_text]"

/proc/ru_countitems(var/list/input, single_text = "единица", few_text = "единицы", many_text = "единиц")
	var/a = input.len % 100
	var/b = input.len % 10
	if (a > 10 && a < 20)
		return "[input.len] [many_text]"
	if (b > 1 && b < 5)
		return "[input.len] [few_text]"
	if (b == 1)
		return "[input.len] [single_text]"
	return "[input.len] [many_text]"