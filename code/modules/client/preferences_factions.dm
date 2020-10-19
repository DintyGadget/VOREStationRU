var/global/list/seen_citizenships = list()
var/global/list/seen_systems = list()
var/global/list/seen_factions = list()
var/global/list/seen_antag_factions = list()
var/global/list/seen_religions = list()

//Commenting this out for now until I work the lists it into the event generator/journalist/chaplain.
/proc/UpdateFactionList(mob/living/carbon/human/M)
	/*if(M && M.client && M.client.prefs)
		seen_citizenships |= M.client.prefs.citizenship
		seen_systems      |= M.client.prefs.home_system
		seen_factions     |= M.client.prefs.faction
		seen_religions    |= M.client.prefs.religion*/
	return

// VOREStation Edits Start
var/global/list/citizenship_choices = list(
	"Земля",
	"Марс",
	"Сиф",
	"Бинма",
	"Могес",
	"Мералар",
	"Керр'Балак",
	"Колония Дева 3b",
	"Virgo 4 NT Compound",
	"Венера",
	"Тиамат",
	"Ан-Тахк-Эт"
	)

var/global/list/home_system_choices = list(
	"Дева-Эригон",
	"Сол",
	"Проксима Центавра",
	"Процион",
	"Вир",
	"Никс",
	"Тау Кита",
	"Керр'Валис",
	"Эпсилон Урсае Минорис",
	"Раркаджар"
	)


var/global/list/faction_choices = list(
	"ЦПСС",
	"United Fyrds",
	"Elysian Colonies",
	"Ares Confederation",
	"Vey Med",
	"Einstein Engines",
	"Вольный Торговый Союз",
	"NanoTrasen",
	"Ward-Takahashi GMB",
	"Gilthari Exports",
	"Grayson Manufactories Ltd.",
	"Aether Atmospherics",
	"Zeng-Hu Pharmaceuticals",
	"Hephaestus Industries",
	"Morpheus Cyberkinetics",
	"Xion Manufacturing Group"
	)
// VOREStation Edits Stop

var/global/list/antag_faction_choices = list()	//Should be populated after brainstorming. Leaving as blank in case brainstorming does not occur.

var/global/list/antag_visiblity_choices = list(
	"Hidden",
	"Shared",
	"Known"
	)

var/global/list/religion_choices = list(
	"Unitarianism",
	"Neopaganism",
	"Islam",
	"Christianity",
	"Judaism",
	"Hinduism",
	"Buddhism",
	"Pleromanism",
	"Spectralism",
	"Phact Shintoism",
	"Kishari Faith",
	"Hauler Faith",
	"Nock",
	"Singulitarian Worship",
	"Xilar Qall",
	"Tajr-kii Rarkajar",
	"Agnosticism",
	"Deism",
	"Neo-Moreauism",
	"Orthodox Moreauism"
	)