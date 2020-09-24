/turf/simulated/shuttle/wall/alien/blue
	name = "hybrid wall"
	desc = "Кажется немного более дружелюбным, чем если бы стена была зловеще фиолетовой."
	icon = 'icons/turf/shuttle_alien_blue.dmi'
	light_color = "#1fdbf4" // Cyan-ish

/turf/simulated/shuttle/wall/alien/blue/hard_corner
	name = "hybrid wall"
	icon_state = "alien-hc"
	hard_corner = 1

/turf/simulated/shuttle/wall/alien/blue/no_join
	name = "hybrid wall"
	icon_state = "alien-nj"
	join_group = null

/turf/simulated/flesh
	name = "flesh wall"
	desc = "Мясистая поверхность этой стены приятно хлюпает под вашим прикосновением но выглядит и чувствует себя чрезвычайно сильной."
	icon = 'icons/turf/stomach_vr.dmi'
	icon_state = "flesh"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/flesh/colour
	name = "flesh wall"
	desc = "Мясистая поверхность этой стены приятно хлюпает под вашим прикосновением но выглядит и чувствует себя чрезвычайно сильной."
	icon = 'icons/turf/stomach_vr.dmi'
	icon_state = "colorable-wall"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/flesh/attackby()
	return

/turf/simulated/flesh/Initialize(mapload)
	. = ..()
	update_icon(1)

var/list/flesh_overlay_cache = list()

/turf/simulated/flesh/update_icon(var/update_neighbors)
	cut_overlays()

	if(density)
		icon = 'icons/turf/stomach_vr.dmi'
		icon_state = "flesh"
		for(var/direction in cardinal)
			var/turf/T = get_step(src,direction)
			if(istype(T) && !T.density)
				var/place_dir = turn(direction, 180)
				if(!flesh_overlay_cache["flesh_side_[place_dir]"])
					flesh_overlay_cache["flesh_side_[place_dir]"] = image('icons/turf/stomach_vr.dmi', "flesh_side", dir = place_dir)
				add_overlay(flesh_overlay_cache["flesh_side_[place_dir]"])

	if(update_neighbors)
		for(var/direction in alldirs)
			if(istype(get_step(src, direction), /turf/simulated/flesh))
				var/turf/simulated/flesh/F = get_step(src, direction)
				F.update_icon()

/turf/simulated/gore
	name = "wall of viscera"
	desc = "Его вены пульсируют тошнотворно быстро, в то время как некоторые участки стены поднимаются и опускаются мягко, очень похоже на медленное, осознанное дыхание."
	icon = 'icons/goonstation/turf/meatland.dmi'
	icon_state = "bloodwall_2"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/goreeyes
	name = "wall of viscera"
	desc = "Странные глаза усеивают стену. Когда вы подходите слишком близко, глаза фиксируются на вас, в то время как их зрачки сильно дрожат. Каждая розетка соединена серией извивающихся жил."
	icon = 'icons/goonstation/turf/meatland.dmi'
	icon_state = "bloodwall_4"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/wall/flock
	icon = 'icons/goonstation/featherzone.dmi'
	icon_state = "flockwall0"
	base_state = "flockwall"
	hard_corner = 1 //They're all HC
	true_name = "wall"

/turf/simulated/shuttle/wall/flock/Initialize()
	. = ..()
	set_light(3,3,"#26c5a9")

/turf/simulated/wall/rplastitanium
	icon_state = "rwall-plastitanium"
	icon = 'icons/turf/wall_masks_vr.dmi'
/turf/simulated/wall/rplastitanium/Initialize(mapload)
	. = ..(mapload, MAT_PLASTITANIUM,MAT_PLASTITANIUM,MAT_PLASTITANIUM)

	/turf/simulated/wall/plastitanium
	icon_state = "wall-plastitanium"
	icon = 'icons/turf/wall_masks_vr.dmi'
/turf/simulated/wall/plastitanium/Initialize(mapload)
	. = ..(mapload, MAT_PLASTITANIUM, null,MAT_PLASTITANIUM)

