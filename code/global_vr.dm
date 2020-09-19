/hook/startup/proc/modules_vr()
	robot_module_types += "Соб-медик"
	robot_module_types += "Соб-охраны"
	robot_module_types += "Соб-уборщик"
	robot_module_types += "Соб-науч"
	robot_module_types += "Соб-инженер"
	robot_module_types += "Соб-сервис"
	robot_module_types += "Соб-шахтер"
	return 1

var/list/shell_module_types = list(
	"Standard", "Service", "Clerical", "Service-Hound"
)

var/list/eventdestinations = list() // List of scatter landmarks for VOREStation event portals

var/global/list/acceptable_fruit_types= list(
											"ambrosia",
											"apple",
											"banana",
											"berries",
											"cabbage",
											"carrot",
											"celery",
											"cherry",
											"chili",
											"cocoa",
											"corn",
											"durian",
											"eggplant",
											"grapes",
											"greengrapes",
											"harebells",
											"lavender",
											"lemon",
											"lettuce",
											"lime",
											"onion",
											"orange",
											"peanut",
											"poppies",
											"potato",
											"pumpkin",
											"rice",
											"rose",
											"rhubarb",
											"soybean",
											"spineapple",
											"sugarcane",
											"sunflowers",
											"tomato",
											"vanilla",
											"watermelon",
											"wheat",
											"whitebeet")
