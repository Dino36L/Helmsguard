/datum/job/roguetown/tailor
	title = "Tailor"
	flag = TAILOR
	department_flag = TOWNER
	faction = "Station"
	tutorial = "You have worked sleepless nights on honing your craft. From sacks, to tapestry and luxurious clothing, there is little you cannot sew into existence. Use your storefront to turn even the ugliest peasant into a proper gentleman; who knows, even the nobility may pay you a visit."
	total_positions = 1
	spawn_positions = 1
	display_order = 6
	min_pq = 0
	selection_color = JCOLOR_YEOMAN
	allowed_races = RACES_ALL_KINDS
	display_order = JDO_TAILOR
	outfit = /datum/outfit/job/roguetown/tailor
	give_bank_account = 16
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/cmode/towner/combat_towner3.ogg'

/datum/outfit/job/roguetown/tailor/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/tanning, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	pants = /obj/item/clothing/under/roguetown/tights
	belt = /obj/item/storage/belt/rogue/leather/cloth
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/storage/keyring/tailor
	beltl = /obj/item/rogueweapon/huntingknife/scissors/steel
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/needle)
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress
		head = /obj/item/clothing/head/roguetown/shawl
	else if(H.gender == MALE)
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/random
	H.change_stat("intelligence", 2)
	H.change_stat("perception", 1)
	H.change_stat("speed", 1)
	H.change_stat("strength", -1)
