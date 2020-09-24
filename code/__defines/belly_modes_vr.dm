// Normal digestion modes
#define DM_HOLD									"Удержание"
#define DM_DIGEST								"Переваривание"
#define DM_ABSORB								"Поглощение"
#define DM_UNABSORB								"Не поглощать"
#define DM_DRAIN								"Слив"
#define DM_SHRINK								"Сокращение"
#define DM_GROW									"Рост"
#define DM_SIZE_STEAL							"Украсть размер "
#define DM_HEAL									"Регенерация"
#define DM_EGG 									"Заключить в яйцо"
#define DM_TRANSFORM							"Трансформация"

//#define DM_ITEMWEAK							"Digest (Item Friendly)"
//#define DM_STRIPDIGEST						"Strip Digest (Items Only)"
//#define DM_DIGEST_NUMB						"Digest (Numbing)"

//TF modes
#define DM_TRANSFORM_HAIR_AND_EYES					"Трансформация (Hair and eyes)"
#define DM_TRANSFORM_MALE							"Трансформация (Male)"
#define DM_TRANSFORM_FEMALE							"Трансформация (Female)"
#define DM_TRANSFORM_KEEP_GENDER					"Трансформация (Keep Gender)"
#define DM_TRANSFORM_REPLICA						"Трансформация (Replica Of Self)"
#define DM_TRANSFORM_CHANGE_SPECIES_AND_TAUR		"Трансформация (Change Species and Taur)"
#define DM_TRANSFORM_CHANGE_SPECIES_AND_TAUR_EGG	"Трансформация (Change Species and Taur) (EGG)"
#define DM_TRANSFORM_REPLICA_EGG					"Трансформация (Replica Of Self) (EGG)"
#define DM_TRANSFORM_KEEP_GENDER_EGG				"Трансформация (Keep Gender) (EGG)"
#define DM_TRANSFORM_MALE_EGG						"Трансформация (Male) (EGG)"
#define DM_TRANSFORM_FEMALE_EGG						"Трансформация (Female) (EGG)"

//Addon mode flags
#define DM_FLAG_NUMBING			0x1
#define DM_FLAG_STRIPPING		0x2
#define DM_FLAG_LEAVEREMAINS	0x4
#define DM_FLAG_THICKBELLY		0x8

//Item related modes
#define IM_HOLD									"Удержание"
#define IM_DIGEST_FOOD							"Переваривание (Food Only)"
#define IM_DIGEST								"Переваривание"

//Stance for hostile mobs to be in while devouring someone.
#define HOSTILE_STANCE_EATING	99

// Defines for weight system
#define MIN_MOB_WEIGHT			70
#define MAX_MOB_WEIGHT			500
#define MIN_NUTRITION_TO_GAIN	450	// Above this amount you will gain weight
#define MAX_NUTRITION_TO_LOSE	50	// Below this amount you will lose weight
// #define WEIGHT_PER_NUTRITION	0.0285 // Tuned so 1050 (nutrition for average mob) = 30 lbs
