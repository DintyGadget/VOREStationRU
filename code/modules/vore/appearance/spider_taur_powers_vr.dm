/obj/item/clothing/suit/web_bindings
	icon = 'icons/vore/custom_clothes_vr.dmi'
	icon_override = 'icons/vore/custom_clothes_vr.dmi'
	name = "кокон из паутины"
	desc = "Сплетённый кокон из паутины, полностью сковывающий жертву."
	icon_state = "web_bindings"
	item_state = "web_bindings_mob"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL

/mob/living/proc/weaveWebBindings()
	set name = "Сплести Паутину"
	set category = "Species Powers"
	if(nutrition >= 30) //This isn't a huge problem. This is so you can bind people up.
		src.visible_message("<span class='notice'>[src] вытягивает паутину и сплетаёт её в кокон!</span>")
		adjust_nutrition(-30)
		spawn(30) //5 seconds to weave the bindings~
			var/obj/item/clothing/suit/web_bindings/bindings = new() //This sprite is amazing, I must say.
			src.put_in_hands(bindings)
	else
		to_chat(src, "В Вас недостаточно питательных веществ, чтобы плести паутину!") //CK~
