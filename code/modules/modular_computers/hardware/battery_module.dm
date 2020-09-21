// This device is wrapper for actual power cell. I have decided to not use power cells directly as even low-end cells available on station
// have tremendeous capacity in comparsion. Higher tier cells would provide your device with nearly infinite battery life, which is something i want to avoid.
/obj/item/weapon/computer_hardware/battery_module
	name = "standard battery"
	desc = "Стандартный элемент питания, обычно встречающийся в портативных микрокомпьютерах высокого класса или ноутбуках низкого уровня. Его вместимость 750."
	icon_state = "battery_normal"
	critical = 1
	malfunction_probability = 1
	origin_tech = list(TECH_POWER = 1, TECH_ENGINEERING = 1)
	var/battery_rating = 750
	var/obj/item/weapon/cell/battery = null

/obj/item/weapon/computer_hardware/battery_module/advanced
	name = "advanced battery"
	desc = "Продвинутая ячейка питания, часто используемая в большинстве ноутбуков. Он слишком велик для установки в устройства меньшего размера. Его вместимость 1100."
	icon_state = "battery_advanced"
	origin_tech = list(TECH_POWER = 2, TECH_ENGINEERING = 2)
	hardware_size = 2
	battery_rating = 1100

/obj/item/weapon/computer_hardware/battery_module/super
	name = "super battery"
	desc = "Очень продвинутый блок питания, часто используемый в высокопроизводительных устройствах или в качестве источника бесперебойного питания для важных консолей или серверов. Его вместимость 1500."
	icon_state = "battery_super"
	origin_tech = list(TECH_POWER = 3, TECH_ENGINEERING = 3)
	hardware_size = 2
	battery_rating = 1500

/obj/item/weapon/computer_hardware/battery_module/ultra
	name = "ultra battery"
	desc = "Очень продвинутый большой силовой элемент. Его часто используют в качестве источника бесперебойного питания для критически важных консолей или серверов. Его вместимость 2000."
	icon_state = "battery_ultra"
	origin_tech = list(TECH_POWER = 5, TECH_ENGINEERING = 4)
	hardware_size = 3
	battery_rating = 2000

/obj/item/weapon/computer_hardware/battery_module/micro
	name = "micro battery"
	desc = "Небольшая ячейка питания, обычно встречающаяся в большинстве портативных микрокомпьютеров. Вместимость 500."
	icon_state = "battery_micro"
	origin_tech = list(TECH_POWER = 2, TECH_ENGINEERING = 2)
	battery_rating = 500

/obj/item/weapon/computer_hardware/battery_module/nano
	name = "nano battery"
	desc = "Крошечный элемент питания, обычно встречающийся в портативных микрокомпьютерах низкого уровня. Вместимость 300."
	icon_state = "battery_nano"
	origin_tech = list(TECH_POWER = 1, TECH_ENGINEERING = 1)
	battery_rating = 300

// This is not intended to be obtainable in-game. Intended for adminbus and debugging purposes.
/obj/item/weapon/computer_hardware/battery_module/lambda
	name = "lambda coil"
	desc = "Очень сложный источник питания, совместимый с различными компьютерами. Он способен обеспечивать питание почти неограниченное время."
	icon_state = "battery_lambda"
	hardware_size = 1
	battery_rating = 30000

/obj/item/weapon/computer_hardware/battery_module/lambda/New()
	..()
	battery = new/obj/item/weapon/cell/infinite(src)

/obj/item/weapon/computer_hardware/battery_module/diagnostics(var/mob/user)
	..()
	to_chat(user, "Заряд внутренней батареи: [battery.charge]/[battery.maxcharge] CU")

/obj/item/weapon/computer_hardware/battery_module/New()
	battery = new/obj/item/weapon/cell(src)
	battery.maxcharge = battery_rating
	battery.charge = 0
	..()

/obj/item/weapon/computer_hardware/battery_module/Destroy()
	qdel_null(battery)
	return ..()

/obj/item/weapon/computer_hardware/battery_module/proc/charge_to_full()
	if(battery)
		battery.charge = battery.maxcharge

/obj/item/weapon/computer_hardware/battery_module/get_cell()
	return battery