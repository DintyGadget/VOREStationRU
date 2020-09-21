/obj/item/weapon/computer_hardware/hard_drive/
	name = "basic hard drive"
	desc = "Небольшой энергоэффективный твердотельный накопитель емкостью 128GQ для использования в базовых компьютерах, где требуется энергоэффективность."
	power_usage = 25					// SSD or something with low power usage
	icon_state = "hdd_normal"
	hardware_size = 1
	origin_tech = list(TECH_DATA = 1, TECH_ENGINEERING = 1)
	var/max_capacity = 128
	var/used_capacity = 0
	var/list/stored_files = list()		// List of stored files on this drive. DO NOT MODIFY DIRECTLY!

/obj/item/weapon/computer_hardware/hard_drive/advanced
	name = "advanced hard drive"
	desc = "Небольшой гибридный жесткий диск с объемом памяти 256GQ для использования в компьютерах более высокого класса, где требуется баланс между энергоэффективностью и емкостью."
	max_capacity = 256
	origin_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	power_usage = 50 					// Hybrid, medium capacity and medium power storage
	icon_state = "hdd_advanced"
	hardware_size = 2

/obj/item/weapon/computer_hardware/hard_drive/super
	name = "super hard drive"
	desc = "Небольшой жесткий диск с объемом памяти 512GQ для использования в кластерных решениях хранения, где емкость важнее энергоэффективности."
	max_capacity = 512
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 3)
	power_usage = 100					// High-capacity but uses lots of power, shortening battery life. Best used with APC link.
	icon_state = "hdd_super"
	hardware_size = 2

/obj/item/weapon/computer_hardware/hard_drive/cluster
	name = "cluster hard drive"
	desc = "Большой кластер хранения, состоящий из нескольких жестких дисков для использования в системах хранения большой емкости. Вместимость 2048GQ."
	power_usage = 500
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4)
	max_capacity = 2048
	icon_state = "hdd_cluster"
	hardware_size = 3

// For tablets, etc. - highly power efficient.
/obj/item/weapon/computer_hardware/hard_drive/small
	name = "small hard drive"
	desc = "Небольшой высокоэффективный твердотельный накопитель для портативных устройств."
	power_usage = 10
	origin_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	max_capacity = 64
	icon_state = "hdd_small"
	hardware_size = 1

/obj/item/weapon/computer_hardware/hard_drive/micro
	name = "micro hard drive"
	desc = "Небольшой микро-жесткий диск для портативных устройств."
	power_usage = 2
	origin_tech = list(TECH_DATA = 1, TECH_ENGINEERING = 1)
	max_capacity = 32
	icon_state = "hdd_micro"
	hardware_size = 1

/obj/item/weapon/computer_hardware/hard_drive/diagnostics(var/mob/user)
	..()
	// 999 is a byond limit that is in place. It's unlikely someone will reach that many files anyway, since you would sooner run out of space.
	to_chat(user, "Состояние файловой таблицы NT-NFS: [stored_files.len]/999")
	to_chat(user, "Емкость накопителя: [used_capacity]/[max_capacity]GQ")

// Use this proc to add file to the drive. Returns 1 on success and 0 on failure. Contains necessary sanity checks.
/obj/item/weapon/computer_hardware/hard_drive/proc/store_file(var/datum/computer_file/F)
	if(!F || !istype(F))
		return 0

	if(!can_store_file(F.size))
		return 0

	if(!check_functionality())
		return 0

	if(!stored_files)
		return 0

	// This file is already stored. Don't store it again.
	if(F in stored_files)
		return 0

	F.holder = src
	stored_files.Add(F)
	recalculate_size()
	return 1

// Use this proc to add file to the drive. Returns 1 on success and 0 on failure. Contains necessary sanity checks.
/obj/item/weapon/computer_hardware/hard_drive/proc/install_default_programs()
	store_file(new/datum/computer_file/program/computerconfig(src)) 		// Computer configuration utility, allows hardware control and displays more info than status bar
	store_file(new/datum/computer_file/program/ntnetdownload(src))			// NTNet Downloader Utility, allows users to download more software from NTNet repository
	store_file(new/datum/computer_file/program/filemanager(src))			// File manager, allows text editor functions and basic file manipulation.


// Use this proc to remove file from the drive. Returns 1 on success and 0 on failure. Contains necessary sanity checks.
/obj/item/weapon/computer_hardware/hard_drive/proc/remove_file(var/datum/computer_file/F)
	if(!F || !istype(F))
		return 0

	if(!stored_files)
		return 0

	if(!check_functionality())
		return 0

	if(F in stored_files)
		stored_files -= F
		recalculate_size()
		return 1
	else
		return 0

// Loops through all stored files and recalculates used_capacity of this drive
/obj/item/weapon/computer_hardware/hard_drive/proc/recalculate_size()
	var/total_size = 0
	for(var/datum/computer_file/F in stored_files)
		total_size += F.size

	used_capacity = total_size

// Checks whether file can be stored on the hard drive.
/obj/item/weapon/computer_hardware/hard_drive/proc/can_store_file(var/size = 1)
	// In the unlikely event someone manages to create that many files.
	// BYOND is acting weird with numbers above 999 in loops (infinite loop prevention)
	if(stored_files.len >= 999)
		return 0
	if(used_capacity + size > max_capacity)
		return 0
	else
		return 1

// Checks whether we can store the file. We can only store unique files, so this checks whether we wouldn't get a duplicity by adding a file.
/obj/item/weapon/computer_hardware/hard_drive/proc/try_store_file(var/datum/computer_file/F)
	if(!F || !istype(F))
		return 0
	var/name = F.filename + "." + F.filetype
	for(var/datum/computer_file/file in stored_files)
		if((file.filename + "." + file.filetype) == name)
			return 0
	return can_store_file(F.size)



// Tries to find the file by filename. Returns null on failure
/obj/item/weapon/computer_hardware/hard_drive/proc/find_file_by_name(var/filename)
	if(!check_functionality())
		return null

	if(!filename)
		return null

	if(!stored_files)
		return null

	for(var/datum/computer_file/F in stored_files)
		if(F.filename == filename)
			return F
	return null

/obj/item/weapon/computer_hardware/hard_drive/Destroy()
	if(holder2 && (holder2.hard_drive == src))
		holder2.hard_drive = null
	stored_files = null
	return ..()

/obj/item/weapon/computer_hardware/hard_drive/New()
	install_default_programs()
	..()