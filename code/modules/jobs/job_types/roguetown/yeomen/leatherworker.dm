/datum/job/roguetown/leatherworker
	title = "Leatherworker"
	flag = LEATHERWORKER
	department_flag = TOWNER
	faction = "Station"
	tutorial = "You are a master when it comes to working with hides and leather. Armed only with a needle, you are able to craft bags, light armors and even luxurious accessories on any available tanning racks."
	total_positions = 1
	spawn_positions = 1
	display_order = 6
	min_pq = 0
	selection_color = JCOLOR_YEOMAN
	allowed_races = list(\
	/datum/species/human/northern,\
	/datum/species/human/halfelf,\
	/datum/species/elf/wood,\
	/datum/species/dwarf/mountain,\
	/datum/species/demihuman,\
	/datum/species/tieberian,\
	)
	display_order = JDO_LEATHERWORKER
	outfit = /datum/outfit/job/roguetown/leatherworker
	give_bank_account = 16
	min_pq = 0
	max_pq = null
	round_contrib_points = 2

/datum/outfit/job/roguetown/leatherworker/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/tanning, 5, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	head = /obj/item/clothing/head/roguetown/hatfur
	pants = /obj/item/clothing/under/roguetown/tights
	belt = /obj/item/storage/belt/rogue/leather/cloth
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltl = /obj/item/storage/keyring/sund/sund_tailor
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/needle = 1, /obj/item/natural/hide/cured = 2, /obj/item/rogueweapon/huntingknife/scissors/steel = 1)
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress
	else if(H.gender == MALE)
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/random
	H.change_stat("intelligence", 2)
	H.change_stat("perception", 1)
	H.change_stat("speed", 1)
	H.change_stat("strength", -1)
