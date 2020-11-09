/mob/living/carbon/human/dummy
	no_vore = TRUE //Dummies don't need bellies.

/mob/living/carbon/human/sergal/New(var/new_loc)
	h_style = "Сергал: Простая"
	..(new_loc, "Сергал")

/mob/living/carbon/human/akula/New(var/new_loc)
	..(new_loc, "Акула")

/mob/living/carbon/human/nevrean/New(var/new_loc)
	..(new_loc, "Невреан")

/mob/living/carbon/human/xenochimera/New(var/new_loc)
	..(new_loc, "Ксенохимера")

/mob/living/carbon/human/spider/New(var/new_loc)
	..(new_loc, "Василиссан")

/mob/living/carbon/human/vulpkanin/New(var/new_loc)
	..(new_loc, "Вульпканин")

/mob/living/carbon/human/protean/New(var/new_loc)
	..(new_loc, "Протеан")

/mob/living/carbon/human/alraune/New(var/new_loc)
	..(new_loc, "Алрауне")

/mob/living/carbon/human/shadekin/New(var/new_loc)
	..(new_loc, SPECIES_SHADEKIN)