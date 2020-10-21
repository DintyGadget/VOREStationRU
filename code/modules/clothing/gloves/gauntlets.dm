/*
 *	WORKS FOR RIGS, NOT AS A STANDALONE RIGHT NOW
 *
 *	TODO: 	FIX QUICK_EQUIP SO IT DOESN'T EQUIP THESE TO YOUR BACK WHEN YOU HAVE NO GLOVES
 *			CHECK SLOWDOWN ON EQUIP/UNEQUIP
 *			ADD SPRITES FOR ANY ACTUAL GAUNTLET ITEMS, THE BASE GLOVE ITEM HAS NO SPRITE, FOR GOOD REASON
 */

/obj/item/clothing/gloves/gauntlets	//Used to cover gloves, otherwise act as gloves.
	name = "наручи"
	desc = "Эти перчатки надеваются поверх других перчаток."
	glove_level = 3
	overgloves = 1
	punch_force = 5
	var/obj/item/clothing/gloves/gloves = null	//Undergloves

/obj/item/clothing/gloves/gauntlets/mob_can_equip(mob/user, slot, disable_warning = FALSE)
	var/mob/living/carbon/human/H = user
	if(H.gloves)
		gloves = H.gloves
		if(!istype(gloves))
			to_chat(user, "Вы не можете надеть [src], так как на Вас [H.gloves].")
			gloves = null
			return 0
		if(gloves.overgloves)
			to_chat(user, "Вы не можете надеть [src], так как на Вас [H.gloves].")
			gloves = null
			return 0
		H.drop_from_inventory(gloves)
		gloves.forceMove(src)

	if(!..())
		if(gloves)
			if(H.equip_to_slot_if_possible(gloves, slot_gloves))
				gloves = null
			return 0
	if(gloves)
		to_chat(user, "Вы надеваете [src] поверх перчаток.")
	wearer = H
	return 1

/obj/item/clothing/gloves/gauntlets/dropped()
	var/mob/living/carbon/human/H = wearer
	if(gloves)
		if(!H.equip_to_slot_if_possible(gloves, slot_gloves))
			gloves.forceMove(get_turf(src))
		if(ring)
			gloves.ring = ring
		src.gloves = null
	wearer = null