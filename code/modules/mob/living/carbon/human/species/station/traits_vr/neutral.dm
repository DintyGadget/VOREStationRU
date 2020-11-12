/datum/trait/metabolism_up
	name = "Быстрый метаболизм"
	desc = "Вы быстрее перевариваете проглоченные и введенные реагенты, и в Вас быстрее просыпается голод (скорость Тешари)."
	cost = 0
	var_changes = list("metabolic_rate" = 1.2, "hunger_factor" = 0.2, "metabolism" = 0.06) // +20% rate and 4x hunger (Teshari level)
	excludes = list(/datum/trait/metabolism_down, /datum/trait/metabolism_apex)

/datum/trait/metabolism_down
	name = "Медленный метаболизм"
	desc = "Вы обрабатываете проглоченные и введенные реагенты медленнее, и менее часто хотите есть."
	cost = 0
	var_changes = list("metabolic_rate" = 0.8, "hunger_factor" = 0.04, "metabolism" = 0.0012) // -20% of default.
	excludes = list(/datum/trait/metabolism_up, /datum/trait/metabolism_apex)

/datum/trait/metabolism_apex
	name = "Пиковый метаболизм"
	desc = "Наконец-то достойное оправдание вашим хищническим действиям. По сути, удваивает метаболизм. Подходит для персонажей с большим аппетитом."
	cost = 0
	var_changes = list("metabolic_rate" = 1.4, "hunger_factor" = 0.4, "metabolism" = 0.012) // +40% rate and 8x hunger (Double Teshari)
	excludes = list(/datum/trait/metabolism_up, /datum/trait/metabolism_down)

/datum/trait/coldadapt
	name = "Хладнокровный"
	desc = "Вы способны выдерживать гораздо более низкие температуры, чем другие расы, и даже можете чувствовать себя комфортно в очень холодных условиях. Вы также более уязвимы к жаркой окружающей среде и имеете более низкую температуру тела в результате такой адаптации."
	cost = 0
	var_changes = list("cold_level_1" = 200,  "cold_level_2" = 150, "cold_level_3" = 90, "breath_cold_level_1" = 180, "breath_cold_level_2" = 100, "breath_cold_level_3" = 60, "cold_discomfort_level" = 210, "heat_level_1" = 305, "heat_level_2" = 360, "heat_level_3" = 700, "breath_heat_level_1" = 345, "breath_heat_level_2" = 380, "breath_heat_level_3" = 780, "heat_discomfort_level" = 295, "body_temperature" = 290)
	excludes = list(/datum/trait/hotadapt)

/datum/trait/hotadapt
	name = "Теплокровный"
	desc = "Вы способны выдерживать гораздо более высокие температуры, чем другие расы, и даже можете чувствовать себя комфортно в очень жаркой среде. Вы также более уязвимы к холоду, и вследствие этих адаптаций имеете повышенную температура тела."
	cost = 0
	var_changes = list("heat_level_1" = 420, "heat_level_2" = 460, "heat_level_3" = 1100, "breath_heat_level_1" = 440, "breath_heat_level_2" = 510, "breath_heat_level_3" = 1500, "heat_discomfort_level" = 390, "cold_level_1" = 280, "cold_level_2" = 220, "cold_level_3" = 140, "breath_cold_level_1" = 260, "breath_cold_level_2" = 240, "breath_cold_level_3" = 120, "cold_discomfort_level" = 280, "body_temperature" = 330)
	excludes = list(/datum/trait/coldadapt)

/datum/trait/autohiss_unathi
	name = "Шипение (Унати)"
	desc = "You roll your S's and x's"
	cost = 0
	var_changes = list(
	autohiss_basic_map = list(
			"с" = list("сс", "ссс", "сссс")
		),
	autohiss_extra_map = list(
			"кс" = list("кс", "ксс", "кссс")
		),
	autohiss_exempt = list("Синта'унати"))

	excludes = list(/datum/trait/autohiss_tajaran)

/datum/trait/autohiss_tajaran
	name = "Шипение (Таджара)"
	desc = "You roll your R's."
	cost = 0
	var_changes = list(
	autohiss_basic_map = list(
			"r" = list("rr", "rrr", "rrrr")
		),
	autohiss_exempt = list("Сиик"))
	excludes = list(/datum/trait/autohiss_unathi)
e
/datum/trait/bloodsucker
	name = "Кровосос"
	desc = "Позволяет получать питательные вещества только за счет чужой крови. В качестве компенсации Вы получаете клыки, которые можно использовать для получения крови с добычи."
	cost = 0
	var_changes = list("gets_food_nutrition" = 0) //The verb is given in human.dm

/datum/trait/bloodsucker/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/carbon/human/proc/bloodsuck

/datum/trait/succubus_drain
	name = "Истощение суккуба"
	desc = "Делает вас способным получать питание от истощения добычи в ваших руках."
	cost = 0

/datum/trait/succubus_drain/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/carbon/human/proc/succubus_drain
	H.verbs |= /mob/living/carbon/human/proc/succubus_drain_finalize
	H.verbs |= /mob/living/carbon/human/proc/succubus_drain_lethal

/datum/trait/feeder
	name = "Съедобный"
	desc = "Позволяет Вам кормить свою добычу, используя ваше собственное тело."
	cost = 0

/datum/trait/feeder/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/carbon/human/proc/slime_feed

/datum/trait/hard_vore
	name = "Жестокий хищник"
	desc = "Позволяет отрывать конечности и вырывать внутренние органы."
	cost = 0 //I would make this cost a point, since it has some in game value, but there are easier, less damaging ways to perform the same functions.

/datum/trait/hard_vore/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/shred_limb

/datum/trait/trashcan
	name = "Мусорка"
	desc = "Позволяет переваривать мусор самостоятельно вместо того, чтобы искать мусорное ведро или мусорить, как животное."
	cost = 0
	var_changes = list("trashcan" = 1)

/datum/trait/trashcan/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/eat_trash

/datum/trait/gem_eater
	name = "Рудоед"
	desc = "Вы получаете питание только из сырой руды и очищенных минералов. Нет ничего, что удовлетворяет аппетит лучше, чем драгоценные камни, экзотические или редкие минералы, и у Вас чертовски хороший вкус. Все остальное ниже Вашего достоинства."
	cost = 0
	var_changes = list("gets_food_nutrition" = 0, "eat_minerals" = 1)

/datum/trait/gem_eater/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/eat_minerals

/datum/trait/glowing_eyes
	name = "Светящиеся глаза"
	desc = "Ваши глаза светятся в темноте. Жутко! И немного показушно."
	cost = 0
	var_changes = list("has_glowing_eyes" = 1)

/datum/trait/glowing_body
	name = "Светящееся тело"
	desc = "Ваше тело светится примерно так же, как фонарик ПДА! Настраиваемый цвет и переключение на вкладке способностей в игре."
	cost = 0
/datum/trait/glowing_body/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/glow_toggle
	H.verbs |= /mob/living/proc/glow_color

// Spicy Food Traits, from negative to positive.
/datum/trait/spice_intolerance_extreme
	name = "Крайняя непереносимость специй"
	desc = "Острый (и чили) перец в три раза крепче. (Это не влияет на перцовый баллончик.)"
	cost = 0
	var_changes = list("spice_mod" = 3) // 300% as effective if spice_mod is set to 1. If it's not 1 in species.dm, update this!

/datum/trait/spice_intolerance_basic
	name = "Сильная непереносимость специй"
	desc = "Пряный (и чили) перец в два раза крепче. (Это не влияет на перцовый баллончик.)"
	cost = 0
	var_changes = list("spice_mod" = 2) // 200% as effective if spice_mod is set to 1. If it's not 1 in species.dm, update this!

/datum/trait/spice_intolerance_slight
	name = "Легкая непереносимость специй"
	desc = "У вас есть небольшая борьба с острой пищей. Острые (и холодные) перцы в полтора раза сильнее. (Это не влияет на перцовый баллончик.)"
	cost = 0
	var_changes = list("spice_mod" = 1.5) // 150% as effective if spice_mod is set to 1. If it's not 1 in species.dm, update this!

/datum/trait/spice_tolerance_basic
	name = "Толерантность к специям"
	desc = "Острый (и чили) перец крепче всего на три четверти. (Это не влияет на перцовый баллончик.)"
	cost = 0
	var_changes = list("spice_mod" = 0.75) // 75% as effective if spice_mod is set to 1. If it's not 1 in species.dm, update this!

/datum/trait/spice_tolerance_advanced
	name = "Сильная толерантность к специям"
	desc = "Острый (и чили) перец вдвое слабее. (Это не влияет на перцовый баллончик.)"
	cost = 0
	var_changes = list("spice_mod" = 0.5) // 50% as effective if spice_mod is set to 1. If it's not 1 in species.dm, update this!

/datum/trait/spice_immunity
	name = "Экстремальная толерантность к специям"
	desc = "Острый (и чили) перец в принципе неэффективен! (Это не влияет на перцовый баллончик.)"
	cost = 0
	var_changes = list("spice_mod" = 0.25) // 25% as effective if spice_mod is set to 1. If it's not 1 in species.dm, update this!

// Alcohol Traits Start Here, from negative to positive.
/datum/trait/alcohol_intolerance_advanced
	name = "Посаженная печень"
	desc = "Если бухать, так только если держать бухло в своих руках, да и даже так его лучше сильно не вдыхать. Напитки в три раза крепче."
	cost = 0
	var_changes = list("alcohol_mod" = 3) // 300% as effective if alcohol_mod is set to 1. If it's not 1 in species.dm, update this!

/datum/trait/alcohol_intolerance_basic
	name = "Слабая печень"
	desc = "Вам тяжело употреблять алкоголь. Может быть, Вы просто никогда не принимали его, а может, он Вам не нравится ... в любом случае, напитки в два раза крепче."
	cost = 0
	var_changes = list("alcohol_mod" = 2) // 200% as effective if alcohol_mod is set to 1. If it's not 1 in species.dm, update this!

/datum/trait/alcohol_intolerance_slight
	name = "Трезвенник"
	desc = "Вы не очень хорошо ладите с алкоголем. Напитки в полтора раза крепче."
	cost = 0
	var_changes = list("alcohol_mod" = 1.5) // 150% as effective if alcohol_mod is set to 1. If it's not 1 in species.dm, update this!

/datum/trait/alcohol_tolerance_basic
	name = "Железная печень"
	desc = "Вы можете пить гораздо больше, чем остальные любители сока! Арр! Напитки только на три четверти крепче."
	cost = 0
	var_changes = list("alcohol_mod" = 0.75) // 75% as effective if alcohol_mod is set to 1. If it's not 1 in species.dm, update this!

/datum/trait/alcohol_tolerance_advanced
	name = "Стальная печень"
	desc = "Напитки трепещут перед Вашей мощью! Вы можете пить алкоголь в два раза больше, чем все эти худобрюхие! Напитки в два раза менее крепкие."
	cost = 0
	var_changes = list("alcohol_mod" = 0.5) // 50% as effective if alcohol_mod is set to 1. If it's not 1 in species.dm, update this!

/datum/trait/alcohol_immunity
	name = "Дюрасталевая печень"
	desc = "Вы так много пили, что большинство спиртных напитков даже не опьяняют вас. Вам понадобится аж какой-нибудь Пан-Галактический или пинта Смертозвона, чтобы Вас хотя бы слегка торкнуло."
	cost = 0
	var_changes = list("alcohol_mod" = 0.25) // 25% as effective if alcohol_mod is set to 1. If it's not 1 in species.dm, update this!
// Alcohol Traits End Here.