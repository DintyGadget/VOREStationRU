/obj/item/clothing/head/centhat
	name = "Головной убор ЦК"
	icon_state = "centcom"
	desc = "Приятно быть императором."
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/centhat/customs
	name = "Таможенная фуражка"
	desc = "Формальный головной убор офицеров таможни Сол."
	icon_state = "customshat"

/obj/item/clothing/head/pin
	icon_state = "pin"
	addblends = "pin_a"
	name = "Заколка для волос"
	desc = "Милая заколочка для волос."
	slot_flags = SLOT_HEAD | SLOT_EARS
	body_parts_covered = 0
	drop_sound = 'sound/items/drop/accessory.ogg'
	pickup_sound = 'sound/items/pickup/accessory.ogg'

/obj/item/clothing/head/pin/pink
	icon_state = "pinkpin"
	addblends = null
	name = "Розовая заколка"

/obj/item/clothing/head/pin/clover
	icon_state = "cloverpin"
	name = "Заколка с клевером"
	addblends = null
	desc = "Заколка в форме листа клевера."

/obj/item/clothing/head/pin/butterfly
	icon_state = "butterflypin"
	name = "Заколка с бабочкой"
	addblends = null
	desc = "Заколка в форме яркой голубой бабочки."

/obj/item/clothing/head/pin/magnetic
	icon_state = "magnetpin"
	name = "Магнитная 'заколка'"
	addblends = null
	desc = "Наконец-то, заколка, которую могут использовать даже роботы."
	matter = list(DEFAULT_WALL_MATERIAL = 10)

/obj/item/clothing/head/pin/flower
	name = "Красная цветочная заколка"
	icon_state = "hairflower"
	addblends = null
	desc = "Приятно пахнет."

/obj/item/clothing/head/pin/flower/blue
	icon_state = "hairflower_blue"
	name = "Синяя цветочная заколка"

/obj/item/clothing/head/pin/flower/pink
	icon_state = "hairflower_pink"
	name = "Розовая цветочная заколка"

/obj/item/clothing/head/pin/flower/yellow
	icon_state = "hairflower_yellow"
	name = "Жёлтая цветочная заколка"

/obj/item/clothing/head/pin/flower/violet
	icon_state = "hairflower_violet"
	name = "Фиолетовая цветочная заколка"

/obj/item/clothing/head/pin/flower/orange
	icon_state = "hairflower_orange"
	name = "Оранжевая цветочная заколка"

/obj/item/clothing/head/pin/flower/white
	icon_state = "hairflower_white"
	addblends = "hairflower_white_a"
	name = "Цветочная заколка"

/obj/item/clothing/head/pin/bow
	icon_state = "bow"
	addblends = "bow_a"
	name = "Бантик"
	desc = "Ленточка, завязанная в бантик с зажимом для крепления на волосы."
	item_state_slots = list(slot_r_hand_str = "pill", slot_l_hand_str = "pill")

/obj/item/clothing/head/pin/bow/big
	icon_state = "whiteribbon"
	name = "Ленточка"

/obj/item/clothing/head/pin/bow/big/red
	icon_state = "redribbon"
	name = "Красная ленточка"
	addblends = null

/obj/item/clothing/head/powdered_wig
	name = "Пудрёный парик"
	desc = "Это пудрёный парик."
	icon_state = "pwig"

/obj/item/clothing/head/that
	name = "Цилиндр"
	desc = "Цилиндр. На вид весьма еврейский."
	icon_state = "tophat"
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/redcoat
	name = "Шапка красного мундира"
	icon_state = "redcoat"
	item_state_slots = list(slot_r_hand_str = "pirate", slot_l_hand_str = "pirate")
	desc = "<i>'Не путать с красногвардейцами.'</i>"
	body_parts_covered = 0

/obj/item/clothing/head/mailman
	name = "Фуражка почтальона"
	icon_state = "mailman"
	item_state_slots = list(slot_r_hand_str = "hopcap", slot_l_hand_str = "hopcap")
	desc = "<i>Чух-чух!</i>"
	body_parts_covered = 0

/obj/item/clothing/head/plaguedoctorhat
	name = "Шляпа чумного доктора"
	desc = "Такие шляпы носили чумные докторы. Они так, для красоты."
	icon_state = "plaguedoctor"
	item_state_slots = list(slot_r_hand_str = "tophat", slot_l_hand_str = "tophat")
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/hasturhood
	name = "Капюшон Хастура"
	desc = "Невыразимо стильный."
	icon_state = "hasturhood"
	item_state_slots = list(slot_r_hand_str = "enginering_beret", slot_l_hand_str = "enginering_beret")
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/nursehat
	name = "Головной убор медсестры"
	desc = "Позволяет быстро опознать обученный медицинский персонал."
	icon_state = "nursehat"
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/syndicatefake
	name = "Муляжный красный шлем"
	item_state_slots = list(slot_r_hand_str = "syndicate-helm-black-red", slot_l_hand_str = "syndicate-helm-black-red")
	icon_state = "syndicate"
	desc = "Пластиковый поддельный космический шлем кровожадных наемников. Это лишь муляж, в космос в нём выходить не следует!"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	siemens_coefficient = 2.0
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/cueball
	name = "Шлем-сфера"
	desc = "Огромная неприметная сфера, которая надевается на голову. Что вообще в ней можно увидеть?"
	icon_state = "cueball"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/greenbandana
	name = "Зелёная бандана"
	desc = "Зеленая бандана с искусно вышитой полосой."
	icon_state = "greenbandana"
	flags_inv = 0
	body_parts_covered = 0

/obj/item/clothing/head/cardborg
	name = "Шлем картонного киборга"
	desc = "Шлем, изготовленный из коробки."
	icon_state = "cardborg_h"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = HEAD|FACE|EYES
	drop_sound = 'sound/items/drop/cardboardbox.ogg'
	pickup_sound = 'sound/items/pickup/cardboardbox.ogg'

/obj/item/clothing/head/justice
	name = "Головной убор справедливости"
	desc = "Боритесь за правое дело!"
	icon_state = "justicered" //Does this even exist?
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD|EYES

/obj/item/clothing/head/justice/blue
	icon_state = "justiceblue"

/obj/item/clothing/head/justice/yellow
	icon_state = "justiceyellow"

/obj/item/clothing/head/justice/green
	icon_state = "justicegreen"

/obj/item/clothing/head/justice/pink
	icon_state = "justicepink"

/obj/item/clothing/head/rabbitears
	name = "Кроличьи ушки"
	desc = "Делают носителя на вид абсолютно бесполезным, однако придают особый шарм."
	icon_state = "bunny"
	body_parts_covered = 0

/obj/item/clothing/head/flatcap
	name = "Плоская кепка"
	desc = "Кепка работяги."
	icon_state = "flat_cap"
	item_state_slots = list(slot_r_hand_str = "detective", slot_l_hand_str = "detective")
	siemens_coefficient = 0.9 //...what?

/obj/item/clothing/head/flatcap/grey
	icon_state = "flat_capw"
	addblends = "flat_capw_a"
	item_state_slots = list(slot_r_hand_str = "greysoft", slot_l_hand_str = "greysoft")

/obj/item/clothing/head/pirate
	name = "Пиратская шляпа"
	desc = "Йо-хо-хо."
	icon_state = "pirate"
	body_parts_covered = 0

/obj/item/clothing/head/hgpiratecap
	name = "Пиратская шляпа"
	desc = "Йо-хо-хо."
	icon_state = "hgpiratecap"
	item_state_slots = list(slot_r_hand_str = "hoscap", slot_l_hand_str = "hoscap")
	body_parts_covered = 0

/obj/item/clothing/head/bandana
	name = "Пиратская бандана"
	desc = "Йо-хо-хо."
	icon_state = "bandana"
	item_state_slots = list(slot_r_hand_str = "redbandana", slot_l_hand_str = "redbandana")

/obj/item/clothing/head/bowler
	name = "Котелок"
	desc = "Клуб истинных джентльменов!"
	icon_state = "bowler"
	item_state_slots = list(slot_r_hand_str = "tophat", slot_l_hand_str = "tophat")
	body_parts_covered = 0

//stylish bs12 hats

/obj/item/clothing/head/bowlerhat
	name = "Котелок"
	icon_state = "bowler_hat"
	item_state_slots = list(slot_r_hand_str = "tophat", slot_l_hand_str = "tophat")
	desc = "Для исключительных джентльменов."
	body_parts_covered = 0

/obj/item/clothing/head/beaverhat
	name = "Бобровая шапка"
	icon_state = "beaver_hat"
	item_state_slots = list(slot_r_hand_str = "tophat", slot_l_hand_str = "tophat")
	desc = "Мягкий и теплый мех и согревает, и придает стиль."

/obj/item/clothing/head/boaterhat
	name = "Шляпа лодочника"
	icon_state = "boater_hat"
	item_state_slots = list(slot_r_hand_str = "tophat", slot_l_hand_str = "tophat")
	desc = "Последний писк летней моды."

/obj/item/clothing/head/fedora
	name = "Федора"
	icon_state = "fedora"
	item_state_slots = list(slot_r_hand_str = "detective", slot_l_hand_str = "detective")
	desc = "Стильный головной убор."

/obj/item/clothing/head/fedora/brown
	name = "Федора"
	desc = "Коричневая федора. В зависимости от носителя, является либо последним писком детективной моды, либо убогой попыткой выглядеть круто."
	icon_state = "detective"
	allowed = list(/obj/item/weapon/reagent_containers/food/snacks/candy_corn, /obj/item/weapon/pen)

/obj/item/clothing/head/fedora/grey
	icon_state = "detective2"
	item_state_slots = list(slot_r_hand_str = "detective", slot_l_hand_str = "detective")
	desc = "Серая федора. В зависимости от носителя, является либо последним писком детективной моды, либо убогой попыткой выглядеть круто."


/obj/item/clothing/head/feathertrilby
	name = "Фётровая шляпа"
	icon_state = "feather_trilby"
	item_state_slots = list(slot_r_hand_str = "detective", slot_l_hand_str = "detective")
	desc = "Стильная шляпа с пёрышком."

/obj/item/clothing/head/fez
	name = "Феска"
	icon_state = "fez"
	desc = "Всем стоит носить по феске. Они прикольные."

/obj/item/clothing/head/cowboy_hat
	name = "Ковбойская шляпа"
	desc = "Для тех, у кого очень громкие шпоры."
	icon_state = "cowboyhat"
	body_parts_covered = 0

/obj/item/clothing/head/cowboy_hat/black
	name = "Чёрная ковбойская шляпа"
	desc = "В ней порой мерещится старое кантри."
	icon_state = "cowboy_black"

/obj/item/clothing/head/cowboy_hat/wide
	name = "Широкая ковбойская шляпа"
	desc = "Потому что справедливость сама себя не восстановит."
	icon_state = "cowboy_wide"

/obj/item/clothing/head/cowboy_hat/small
	name = "Маленькая ковбойская шляпа"
	desc = "Для самых крохотных ковбоев."
	icon_state = "cowboy_small"

/obj/item/clothing/head/witchwig
	name = "Парик костюма ведьмы"
	desc = "Ииииии~хихихихихихи!"
	icon_state = "witch"
	flags_inv = BLOCKHAIR
	siemens_coefficient = 2.0

/obj/item/clothing/head/chicken
	name = "Голова куриного костюма"
	desc = "Кудах!"
	icon_state = "chickenhead"
	flags_inv = BLOCKHAIR
	siemens_coefficient = 0.7
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/bearpelt
	name = "Медвежья шапка"
	desc = "Пушистая."
	icon_state = "bearpelt"
	item_state_slots = list(slot_r_hand_str = "beret_black", slot_l_hand_str = "beret_black")
	flags_inv = BLOCKHAIR
	siemens_coefficient = 0.7

/obj/item/clothing/head/xenos
	name = "Ксеноморфный шлем"
	icon_state = "xenos"
	item_state_slots = list(slot_r_hand_str = "xenos_helm", slot_l_hand_str = "xenos_helm")
	desc = "Изготовлен из инопланетной хитиновой шкуры."
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	siemens_coefficient = 2.0
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/philosopher_wig
	name = "Парик философа"
	desc = "Модная катастрофа из эпохи Возрождения старой Земли. Неотъемлемый элемент философских дискуссий."
	icon_state = "philosopher_wig"
	item_state_slots = list(slot_r_hand_str = "pwig", slot_l_hand_str = "pwig")
	flags_inv = BLOCKHAIR
	siemens_coefficient = 2.0 //why is it so conductive?!
	body_parts_covered = 0

/obj/item/clothing/head/orangebandana //themij: Taryn Kifer
	name = "Оранжевая бандана"
	desc = "Оранжевая ткань, предназначенная для ношения на голове."
	icon_state = "orange_bandana"
	body_parts_covered = 0

/obj/item/clothing/head/hijab
	name = "Хиджаб"
	desc = "Используется для прикрытия головы и груди."
	icon_state = "hijab"
	addblends = "hijab_a"
	item_state_slots = list(slot_r_hand_str = "beret_white", slot_l_hand_str = "beret_white")
	body_parts_covered = 0
	flags_inv = BLOCKHAIR

/obj/item/clothing/head/kippa
	name = "Ермолка"
	desc = "Небольшой головной убор без полей."
	icon_state = "kippa"
	addblends = "kippa_a"
	body_parts_covered = 0

/obj/item/clothing/head/turban
	name = "Тюрбан"
	desc = "Кусок ткани, обмотанный вокруг головы."
	icon_state = "turban"
	addblends = "turban_a"
	item_state_slots = list(slot_r_hand_str = "beret_white", slot_l_hand_str = "beret_white")
	body_parts_covered = 0
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/taqiyah
	name = "Тафья"
	desc = "Плоская круглая шапочка, плотно закрывающая макушку."
	icon_state = "taqiyah"
	addblends = "taqiyah_a"
	item_state_slots = list(slot_r_hand_str = "taq", slot_l_hand_str = "taq")

/obj/item/clothing/head/beanie
	name = "Шапка"
	desc = "Теплая зимняя шапка без полей. Эта плотно прилегает к голове."
	icon_state = "beanie"
	addblends = "beanie_a"
	body_parts_covered = 0

/obj/item/clothing/head/beanie_loose
	name = "Свисающая шапка"
	desc = "Теплая зимняя шапка без полей. Эта свисает с головы."
	icon_state = "beanie_hang"
	addblends = "beanie_hang_a"
	body_parts_covered = 0

/obj/item/clothing/head/beretg
	name = "Берет"
	desc = "Берет: излюбленный художниками головной убор."
	icon_state = "beret_g"
	addblends = "beret_g_a"
	body_parts_covered = 0

/obj/item/clothing/head/sombrero
	name = "Сомбреро"
	desc = "Головной убор с широкими полями, популярный в Мексике."
	icon_state = "sombrero"
	body_parts_covered = 0

/obj/item/clothing/head/headband/maid
	name = "Повязка горничной"
	desc = "Благодаря этой повязке волосы не мешаются во время оказания... услуг."
	icon_state = "maid"
	body_parts_covered = 0

/obj/item/clothing/head/maangtikka
	name = "Манг тикка"
	desc = "Индийский аксессуар, инкрустированный самоцветами."
	icon_state = "maangtikka"
	body_parts_covered = 0
	drop_sound = 'sound/items/drop/ring.ogg'
	pickup_sound = 'sound/items/pickup/ring.ogg'

/obj/item/clothing/head/jingasa
	name = "Дзингаса"
	desc = "Широкая плоская шляпа из Японии, прикрывающая от дождя."
	icon_state = "jingasa"
	body_parts_covered = 0
	item_state_slots = list(slot_r_hand_str = "taq", slot_l_hand_str = "taq")

/obj/item/clothing/head/cowl
	name = "Чёрный капюшон"
	desc = "Черный капюшон с золотым обрамлением. От него отдает культом, но смотрится он стильно."
	icon_state = "cowl"
	body_parts_covered = 0

/obj/item/clothing/head/cowl
	name = "Белый капюшон"
	desc = "Белый капюшон с золотым обрамлением. От него отдает культом, но смотрится он стильно."
	icon_state = "whitecowl"
	body_parts_covered = 0

/obj/item/clothing/head/blackngoldheaddress
	name = "Чёрно-золотая тиара"
	desc = "Очень странная тиара, которая каким-то образом даже закрывает глаза."
	icon_state = "blackngoldheaddress"
	flags_inv = HIDEEYES
	body_parts_covered = HEAD|EYES
