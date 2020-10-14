/obj/item/clothing/glasses/hud
	name = "HUD"
	desc = "Индикатор, отображающий важную информацию на стекле (почти) в реальном времени."
	flags = 0 //doesn't protect eyes because it's a monocle, duh
	origin_tech = list(TECH_MAGNET = 3, TECH_BIO = 2)

/obj/item/clothing/glasses/hud/health
	name = "медицинский HUD"
	desc = "Индикатор, сканирующий людей в поле зрения и отображающий на стекле информацию о их состоянии."
	icon_state = "healthhud"
	item_state_slots = list(slot_r_hand_str = "headset", slot_l_hand_str = "headset")
	body_parts_covered = 0
	enables_planes = list(VIS_CH_STATUS,VIS_CH_HEALTH)

/obj/item/clothing/glasses/hud/health/prescription
	name = "медицинский HUD (близорукость)"
	desc = "Медицинский HUD, интегрированный в рецептурные очки."
	prescription = 1
	icon_state = "healthhudpresc"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")

/obj/item/clothing/glasses/hud/security
	name = "HUD Службы Безопасности"
	desc = "Индикатор, сканирующий людей в поле зрения и отображающий на стекле информацию об их идентификации и записях Службы Безопасности."
	icon_state = "securityhud"
	item_state_slots = list(slot_r_hand_str = "headset", slot_l_hand_str = "headset")
	body_parts_covered = 0
	enables_planes = list(VIS_CH_ID,VIS_CH_WANTED,VIS_CH_IMPTRACK,VIS_CH_IMPLOYAL,VIS_CH_IMPCHEM)

/obj/item/clothing/glasses/hud/security/prescription
	name = "HUD Службы Безопасности (близорукость)"
	desc = "HUD Службы Безопасности, интегрированный в рецептурные очки."
	prescription = 1
	icon_state = "sechudpresc"
	item_state_slots = list(slot_r_hand_str = "glasses", slot_l_hand_str = "glasses")

/obj/item/clothing/glasses/hud/security/jensenshades
	name = "поляризованные очки"
	desc = "Поляризованные очки, предназначенные для расширения объема получаемой зрением информации."
	icon_state = "jensenshades"
	item_state_slots = list(slot_r_hand_str = "sunglasses", slot_l_hand_str = "sunglasses")
	vision_flags = SEE_MOBS
	see_invisible = SEE_INVISIBLE_NOLIGHTING
