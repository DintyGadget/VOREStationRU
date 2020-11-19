/////////////////////////////////////////
//Material Rings
/obj/item/clothing/gloves/ring/material
	icon = 'icons/obj/clothing/rings.dmi'
	icon_state = "material"

/obj/item/clothing/gloves/ring/material/New(var/newloc, var/new_material)
	..(newloc)
	if(!new_material)
		new_material = DEFAULT_WALL_MATERIAL
	material = get_material_by_name(new_material)
	if(!istype(material))
		qdel(src)
		return
	//name = "[material.display_name] ring"
	//desc = "A ring made from [material.display_name]."
	color = material.icon_colour

/obj/item/clothing/gloves/ring/material/get_material()
	return material

/obj/item/clothing/gloves/ring/material/wood/New(var/newloc)
	..(newloc, "wood")
	name = "Деревянное кольцо"
	desc = "Кольцо из дерева."

/obj/item/clothing/gloves/ring/material/plastic/New(var/newloc)
	..(newloc, "plastic")
	name = "Пластиковое кольцо"
	desc = "Кольцо из пластика."

/obj/item/clothing/gloves/ring/material/iron/New(var/newloc)
	..(newloc, "iron")
	name = "Железное кольцо"
	desc = "Кольцо из железа."

/obj/item/clothing/gloves/ring/material/steel/New(var/newloc)
	..(newloc, "steel")
	name = "Стальное кольцо"
	desc = "Кольцо из стали."

/obj/item/clothing/gloves/ring/material/silver/New(var/newloc)
	..(newloc, "silver")
	name = "Серебряное кольцо"
	desc = "Кольцо из серебра."

/obj/item/clothing/gloves/ring/material/gold/New(var/newloc)
	..(newloc, "gold")
	name = "Золотое кольцо"
	desc = "Кольцо из золота."

/obj/item/clothing/gloves/ring/material/platinum/New(var/newloc)
	..(newloc, "platinum")
	name = "Платиновое кольцо"
	desc = "Кольцо из платины."

/obj/item/clothing/gloves/ring/material/phoron/New(var/newloc)
	..(newloc, "phoron")
	name = "Фороновое кольцо"
	desc = "Кольцо из форона."

/obj/item/clothing/gloves/ring/material/glass/New(var/newloc)
	..(newloc, "glass")
	name = "Стеклянное кольцо"
	desc = "Кольцо из стекла."