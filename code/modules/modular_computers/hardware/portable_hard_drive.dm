// These are basically USB data sticks and may be used to transfer files between devices
/obj/item/weapon/computer_hardware/hard_drive/portable
	name = "basic data crystal"
	desc = "Небольшой кристалл с отпечатанными фотонными схемами, который можно использовать для хранения данных. Его вместимость составляет 16GQ."
	power_usage = 10
	icon_state = "flashdrive_basic"
	hardware_size = 1
	max_capacity = 16
	origin_tech = list(TECH_DATA = 1)

/obj/item/weapon/computer_hardware/hard_drive/portable/advanced
	name = "advanced data crystal"
	desc = "Небольшой кристалл с запечатанными фотонными схемами высокой плотности, которые можно использовать для хранения данных. Его вместимость составляет 64GQ."
	power_usage = 20
	icon_state = "flashdrive_advanced"
	hardware_size = 1
	max_capacity = 64
	origin_tech = list(TECH_DATA = 2)

/obj/item/weapon/computer_hardware/hard_drive/portable/super
	name = "super data crystal"
	desc = "Небольшой кристалл с запечатанными фотонными схемами сверхплотности, которые можно использовать для хранения данных. Его вместимость составляет 256GQ."
	power_usage = 40
	icon_state = "flashdrive_super"
	hardware_size = 1
	max_capacity = 256
	origin_tech = list(TECH_DATA = 4)

/obj/item/weapon/computer_hardware/hard_drive/portable/New()
	..()
	stored_files = list()
	recalculate_size()

/obj/item/weapon/computer_hardware/hard_drive/portable/Destroy()
	if(holder2 && (holder2.portable_drive == src))
		holder2.portable_drive = null
	return ..()