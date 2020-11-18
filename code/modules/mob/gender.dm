
/var/list/gender_datums = list()

/hook/startup/proc/populate_gender_datum_list()
	for(var/type in typesof(/datum/gender))
		var/datum/gender/G = new type
		gender_datums[G.key] = G
	return 1

/datum/gender
	var/key  = "plural"

	var/He   = "Они"
	var/he   = "они"
	var/His  = "Их"
	var/his  = "их"
	var/him  = "их"
	var/has  = "have"
	var/is   = "are"
	var/does = "do"
	var/himself = "себя"
	var/s = ""
	var/hes = "they're"

/datum/gender/male
	key  = "male"

	He   = "Он"
	he   = "он"
	His  = "Его"
	his  = "его"
	him  = "его"
	has  = "has"
	is   = "is"
	does = "does"
	himself = "себя"
	s = ""
	hes = "он"

/datum/gender/female
	key  = "female"

	He   = "Она"
	he   = "она"
	His  = "Её"
	his  = "её"
	him  = "её"
	has  = "has"
	is   = "is"
	does = "does"
	himself = "себя"
	s = ""
	hes = "она"

/datum/gender/neuter
	key = "neuter"

	He   = "Оно"
	he   = "он"
	His  = "его"
	his  = "его"
	him  = "его"
	has  = "has"
	is   = "is"
	does = "does"
	himself = "себя"
	s = ""
	hes = "оно"
