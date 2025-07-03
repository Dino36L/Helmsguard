/datum/job/roguetown/templar_knight
	title = "Knight Templar"
	f_title = "Dame Templar"
	flag = TEMPLAR_KNIGHT
	department_flag = CHURCHMEN
	faction = "Station"
	tutorial = "The knight templars are knights who have sworn an oath to the church. They are the sword and shield of the church,\
	 and they are tasked with protecting the faithful from the dangers of the world. They are trained to excel in a certain weapon type and combat style,\
	and are very formidabel in combat. They are also trained to ride steeds."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = ALL_CLERIC_PATRONS
	outfit = /datum/outfit/job/roguetown/templar_knight
	min_pq = 1
	max_pq = null
	total_positions = 3
	spawn_positions = 3
	round_contrib_points = 3
	display_order = JDO_TEMPLAR_KNIGHT
	give_bank_account = TRUE
	cmode_music = 'sound/music/combat_holy.ogg'
	advclass_cat_rolls = list(CTAG_KNIGHTTEMPLAR = 20)

/datum/job/roguetown/templar_knight/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(istype(H.cloak, /obj/item/clothing/cloak/tabard/crusader))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "crusader's tabard ([index])"
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Sir"
		if(should_wear_femme_clothes(H))
			honorary = "Dame"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"

		for(var/X in peopleknowme)
			for(var/datum/mind/MF in get_minds(X))
				if(MF.known_people)
					MF.known_people -= prev_real_name
					H.mind.person_knows_me(MF)

/datum/outfit/job/roguetown/templar_knight
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/tabard/crusader
	gloves = /obj/item/clothing/gloves/roguetown/chain
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	belt = /obj/item/storage/belt/rogue/leather/black
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(/obj/item/clothing/neck/roguetown/psicross/astrata = 1)

/datum/outfit/job/roguetown/templar_knight/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.change_stat("strength", 5)
		H.change_stat("perception", 2)
		H.change_stat("constitution", 3)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)




/// SCHOOL OF THE LANCE


/datum/advclass/templar/lance
	name = "School of the Lance"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with polearms, along with some familiarity in swords, shields and riding."
	outfit = /datum/outfit/job/roguetown/templar/lance

	category_tags = list(CTAG_KNIGHTTEMPLAR)

/datum/outfit/job/roguetown/templar/lance/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE) //Polearms are pretty much explicitly a two-handed weapon, so I gave them a polearm option.
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)	
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)

	H.adjust_blindness(-3)
	var/weapons = list("Halberd","Bardische","Eaglebeak")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Halberd")
			r_hand = /obj/item/rogueweapon/halberd
			backl = /obj/item/gwstrap
		if("Bardische")
			r_hand =  /obj/item/rogueweapon/halberd/bardiche
			backl = /obj/item/gwstrap
		if("Eaglebeak")
			r_hand = /obj/item/rogueweapon/eaglebeak
			backl = /obj/item/gwstrap

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/klappvisier,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	if(H.gender == MALE)
		backpack_contents += list(
		/obj/item/storage/keyring/sund/sund_kchapterm = 1, //Templar Knight Chapter Keyring
		)

	else
		backpack_contents += list(
		/obj/item/storage/keyring/sund/sund_kchapterf = 1, //Templar Knight Chapter Keyring
		)

/// SCHOOL OF THE SWORD


/datum/advclass/templar/sword
	name = "School of the Sword"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with swords of all sizes, shields and riding."
	outfit = /datum/outfit/job/roguetown/templar/sword

	category_tags = list(CTAG_KNIGHTTEMPLAR)

/datum/outfit/job/roguetown/templar/sword/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) 
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)	
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)

	H.adjust_blindness(-3)
	var/weapons = list("Zweihander","Bastard Sword","Steel Greatsword")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Zweihander")
			r_hand = /obj/item/rogueweapon/greatsword/zwei
			backl = /obj/item/gwstrap
		if("Bastard Sword")
			r_hand =  /obj/item/rogueweapon/sword/long
			backl = /obj/item/rogueweapon/shield/heater
		if("Steel Greatsword")
			r_hand = /obj/item/rogueweapon/greatsword
			backl = /obj/item/gwstrap
	
	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/klappvisier,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	if(H.gender == MALE)
		backpack_contents += list(
		/obj/item/storage/keyring/sund/sund_kchapterm = 1, //Templar Knight Chapter Keyring
		)

	else
		backpack_contents += list(
		/obj/item/storage/keyring/sund/sund_kchapterf = 1, //Templar Knight Chapter Keyring
		)

/// SCHOOL OF THE AXE


/datum/advclass/templar/axe
	name = "School of the Axe"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with axes of all sizes, shields and riding."
	outfit = /datum/outfit/job/roguetown/templar/axe

	category_tags = list(CTAG_KNIGHTTEMPLAR)

/datum/outfit/job/roguetown/templar/axe/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) 
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)	
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)

	H.adjust_blindness(-3)
	var/weapons = list("Battle Axe","Steel Great Axe","Great Double-Headed Axe")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Battle Axe")
			r_hand = /obj/item/rogueweapon/stoneaxe/battle
			backl = /obj/item/gwstrap
		if("Steel Great Axe")
			r_hand = /obj/item/rogueweapon/greataxe/steel
			backl = /obj/item/gwstrap
		if("Great Double-Headed Axe")
			r_hand = /obj/item/rogueweapon/greataxe/steel/doublehead
			backl = /obj/item/gwstrap

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/klappvisier,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	if(H.gender == MALE)
		backpack_contents += list(
		/obj/item/storage/keyring/sund/sund_kchapterm = 1, //Templar Knight Chapter Keyring
		)

	else
		backpack_contents += list(
		/obj/item/storage/keyring/sund/sund_kchapterf = 1, //Templar Knight Chapter Keyring
		)
/// SCHOOL OF THE MACE


/datum/advclass/templar/mace
	name = "School of the Mace"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with mace, flail hammers, shields and riding."
	outfit = /datum/outfit/job/roguetown/templar/mace

	category_tags = list(CTAG_KNIGHTTEMPLAR)

/datum/outfit/job/roguetown/templar/mace/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) 
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)	
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)
	H.adjust_blindness(-3)
	var/weapons = list("Goden Mace","Steel Warhammer","Flail")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Goden Mace")
			r_hand = /obj/item/rogueweapon/mace/goden
			backl = /obj/item/gwstrap
		if("Steel Warhammer")
			r_hand = /obj/item/rogueweapon/mace/warhammer/steel
			backl = /obj/item/gwstrap
		if("Flail")
			r_hand = /obj/item/rogueweapon/flail
			backl = /obj/item/gwstrap

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/klappvisier,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	if(H.gender == MALE)
		backpack_contents += list(
		/obj/item/storage/keyring/sund/sund_kchapterm = 1, //Templar Knight Chapter Keyring
		)

	else
		backpack_contents += list(
		/obj/item/storage/keyring/sund/sund_kchapterf = 1, //Templar Knight Chapter Keyring
		)

