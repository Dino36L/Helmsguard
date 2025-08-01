
/mob/living/carbon/human/species/orc/npc
	name = "orc"
	skin_tone = SKIN_COLOR_GROONN
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	var/orc_outfit = /datum/outfit/job/roguetown/orc/npc

	race = /datum/species/orc
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	faction = list("orcs")
	ambushable = FALSE

	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	a_intent = INTENT_HELP
	possible_mmb_intents = list(INTENT_STEAL, INTENT_JUMP, INTENT_KICK, INTENT_BITE)
	possible_rmb_intents = list(/datum/rmb_intent/feint, /datum/rmb_intent/aimed, /datum/rmb_intent/strong, /datum/rmb_intent/weak, /datum/rmb_intent/swift, /datum/rmb_intent/riposte)
	possible_rmb_intents = list()
	aggressive = 1
	mode = AI_IDLE
	wander = FALSE
	cmode_music = FALSE

/// ROT STUFF
	rot_type = /datum/component/rot/corpse
	rot_time = 5 MINUTES
	skeletonize_time = 8 MINUTES
	dust_time = 10 MINUTES  // From rot to dust in the span of 10 minutes.

/datum/outfit/job/roguetown/orc/npc/pre_equip(mob/living/carbon/human/H) //gives some default skills and equipment for player controlled orcs
	..()
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	head = /obj/item/clothing/head/roguetown/helmet/leather
	shoes = /obj/item/clothing/shoes/roguetown/gladiator
	r_hand = /obj/item/rogueweapon/stoneaxe/boneaxe
	l_hand = /obj/item/rogueweapon/shield/wood

	H.STASTR = 16
	H.STASPD = 6
	H.STACON = 15
	H.STAEND = 15
	H.STAINT = 8

	//light labor skills for armor repairs and such, equipment is so-so, with good stats
	H.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/craft/masonry, 1, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)

	H.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)

	H.set_patron(/datum/patron/inhumen/graggar)
	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_INFINITE_ENERGY, TRAIT_GENERIC)

	H.possible_rmb_intents = list(/datum/rmb_intent/feint,\
	/datum/rmb_intent/aimed,\
	/datum/rmb_intent/strong,\
	/datum/rmb_intent/swift,\
	/datum/rmb_intent/riposte,\
	/datum/rmb_intent/weak)
	H.swap_rmb_intent(num=1)

