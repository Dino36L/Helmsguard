/mob/living/carbon/human/getarmor(def_zone, type, damage, armor_penetration, blade_dulling, peeldivisor, intdamfactor)
	var/armorval = 0
	var/organnum = 0

	if(def_zone)
		return checkarmor(def_zone, type, damage, armor_penetration, blade_dulling, peeldivisor, intdamfactor)
		//If a specific bodypart is targetted, check how that bodypart is protected and return the value.

	//If you don't specify a bodypart, it checks ALL my bodyparts for protection, and averages out the values
	for(var/X in bodyparts)
		var/obj/item/bodypart/BP = X
		armorval += checkarmor(BP, type, damage, armor_penetration)
		organnum++
	return (armorval/max(organnum, 1))


/mob/living/carbon/human/proc/checkarmor(def_zone, d_type, damage, armor_penetration, blade_dulling, peeldivisor, intdamfactor = 1)
	if(!d_type)
		return 0
	if(isbodypart(def_zone))
		var/obj/item/bodypart/CBP = def_zone
		def_zone = CBP.body_zone
	var/protection = 0
	var/obj/item/clothing/used
	var/list/body_parts = list(skin_armor, head, wear_mask, wear_wrists, gloves, wear_neck, cloak, wear_armor, wear_shirt, shoes, wear_pants, backr, backl, belt, s_store, glasses, ears, wear_ring) //Everything but pockets. Pockets are l_store and r_store. (if pockets were allowed, putting something armored, gloves or hats for example, would double up on the armor)
	for(var/bp in body_parts)
		if(!bp)
			continue
		if(bp && istype(bp , /obj/item/clothing))
			var/obj/item/clothing/C = bp
			if(zone2covered(def_zone, C.body_parts_covered_dynamic))
				if(C.max_integrity)
					if(C.obj_integrity <= 0)
						continue
				var/val = C.armor.getRating(d_type)
				if(val > 0)
					if(val > protection)
						protection = val
						used = C
	if(used)
		if(!blade_dulling)
			blade_dulling = BCLASS_BLUNT
		if(used.blocksound)
			playsound(loc, get_armor_sound(used.blocksound, blade_dulling), 100)
		var/intdamage = damage
		if(intdamfactor != 1)
			intdamage *= intdamfactor
		if(d_type == "blunt")
			if(used.armor?.getRating("blunt") > 0)
				var/bluntrating = used.armor.getRating("blunt")
				intdamage -= intdamage * ((bluntrating / 2) / 100)	//Half of the blunt rating reduces blunt damage taken by %-age.
		used.take_damage(intdamage, damage_flag = d_type, sound_effect = FALSE, armor_penetration = 100)
		if(damage)
			if(blade_dulling == BCLASS_PEEL)
				used.peel_coverage(def_zone, peeldivisor)
	if(physiology)
		protection += physiology.armor.getRating(d_type)
	return protection

/mob/living/carbon/human/proc/checkcritarmor(def_zone, d_type)
	if(!d_type)
		return 0
	if(isbodypart(def_zone))
		var/obj/item/bodypart/CBP = def_zone
		def_zone = CBP.body_zone
	var/list/body_parts = list(head, wear_mask, wear_wrists, wear_shirt, wear_neck, cloak, wear_armor, wear_pants, backr, backl, gloves, shoes, belt, s_store, glasses, ears, wear_ring) //Everything but pockets. Pockets are l_store and r_store. (if pockets were allowed, putting something armored, gloves or hats for example, would double up on the armor)
	for(var/bp in body_parts)
		if(!bp)
			continue
		if(bp && istype(bp , /obj/item/clothing))
			var/obj/item/clothing/C = bp
			if(zone2covered(def_zone, C.body_parts_covered_dynamic))
				if(C.obj_integrity > 1)
					if(d_type in C.prevent_crits)
						return TRUE

//This proc returns obj/item/clothing, the armor that has "soaked" the crit. Using it for dismemberment check
/mob/living/carbon/human/proc/checkcritarmorreference(def_zone, bclass)
	if(!bclass)
		return null
	var/obj/item/clothing/best_armor = null
	if(isbodypart(def_zone))
		var/obj/item/bodypart/CBP = def_zone
		def_zone = CBP.body_zone
	var/list/body_parts = list(head, wear_mask, wear_wrists, wear_shirt, wear_neck, cloak, wear_armor, wear_pants, backr, backl, gloves, shoes, belt, s_store, glasses, ears, wear_ring)
	for(var/bp in body_parts)
		if(!bp)
			continue
		if(bp && istype(bp , /obj/item/clothing))
			var/obj/item/clothing/C = bp
			if(zone2covered(def_zone, C.body_parts_covered_dynamic))
				if(C.obj_integrity > 1)
					if(bclass in C.prevent_crits)
						if(!best_armor)
							best_armor = C
						else if (round(((best_armor.obj_integrity / best_armor.max_integrity) * 100), 1) < round(((C.obj_integrity / C.max_integrity) * 100), 1)) //We want the armor with highest % integrity 
							best_armor = C
	return best_armor
/*
/mob/proc/checkwornweight()
	return 0

/mob/living/carbon/human/checkwornweight()
	var/weight = 0
	var/list/body_parts = list(head, wear_mask, wear_wrists, wear_shirt, wear_neck, wear_armor, wear_pants, back, gloves, shoes, belt, s_store, glasses, ears, wear_ring) //Everything but pockets. Pockets are l_store and r_store. (if pockets were allowed, putting something armored, gloves or hats for example, would double up on the armor)
	for(var/bp in body_parts)
		if(!bp)
			continue
		if(bp && istype(bp , /obj/item/clothing))
			var/obj/item/clothing/C = bp
			if(C.eweight)
				weight +=  C.eweight
	return max(weight, 0)
*/
/mob/living/carbon/human/on_hit(obj/projectile/P)
	if(dna && dna.species)
		dna.species.on_hit(P, src)


/mob/living/carbon/human/bullet_act(obj/projectile/P, def_zone = BODY_ZONE_CHEST)
	if(istype(P, /obj/projectile/bullet))
		if((P.damage_type == BURN) || (P.damage_type == BRUTE))
			if(!P.nodamage && P.damage < src.health && isliving(P.firer))
				retaliate(P.firer)

	if(dna && dna.species)
		var/spec_return = dna.species.bullet_act(P, src, def_zone)
		if(spec_return)
			return spec_return

	//MARTIAL ART STUFF
	if(mind)
		if(mind.martial_art && mind.martial_art.can_use(src)) //Some martial arts users can deflect projectiles!
			var/martial_art_result = mind.martial_art.on_projectile_hit(src, P, def_zone)
			if(!(martial_art_result == BULLET_ACT_HIT))
				return martial_art_result

	if(!(P.original == src && P.firer == src)) //can't block or reflect when shooting yourself
		retaliate(P.firer)
		if(P.reflectable & REFLECT_NORMAL)
			if(check_reflect(def_zone)) // Checks if you've passed a reflection% check
				visible_message(span_danger("The [P.name] gets reflected by [src]!"), \
								span_danger("The [P.name] gets reflected by [src]!"))
				// Find a turf near or on the original location to bounce to
				if(!isturf(loc)) //Open canopy mech (ripley) check. if we're inside something and still got hit
					P.force_hit = TRUE //The thing we're in passed the bullet to us. Pass it back, and tell it to take the damage.
					loc.bullet_act(P)
					return BULLET_ACT_HIT
				if(P.starting)
					var/new_x = P.starting.x + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
					var/new_y = P.starting.y + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
					var/turf/curloc = get_turf(src)

					// redirect the projectile
					P.original = locate(new_x, new_y, P.z)
					P.starting = curloc
					P.firer = src
					P.yo = new_y - curloc.y
					P.xo = new_x - curloc.x
					var/new_angle_s = P.Angle + rand(120,240)
					while(new_angle_s > 180)	// Translate to regular projectile degrees
						new_angle_s -= 360
					P.setAngle(new_angle_s)

				return BULLET_ACT_FORCE_PIERCE // complete projectile permutation

		if(check_shields(P, P.damage, "the [P.name]", PROJECTILE_ATTACK, P.armor_penetration))
			P.on_hit(src, 100, def_zone)
			return BULLET_ACT_HIT
		if(HAS_TRAIT(src, TRAIT_MAGEARMOR))
			if(magearmor == 0)
				magearmor = 1
				apply_status_effect(/datum/status_effect/buff/magearmor)
				to_chat(src, span_boldwarning("My mage armor absorbs the hit and dissipates!"))
				return BULLET_ACT_BLOCK
			else
				return BULLET_ACT_HIT	
	return ..(P, def_zone)

/mob/living/carbon/human/proc/check_reflect(def_zone) //Reflection checks for anything in my l_hand, r_hand, or wear_armor based on the reflection chance of the object
	if(wear_armor)
		if(wear_armor.IsReflect(def_zone) == 1)
			return 1
	for(var/obj/item/I in held_items)
		if(I.IsReflect(def_zone) == 1)
			return 1
	return 0

/mob/living/carbon/human/proc/check_shields(atom/AM, damage, attack_text = "the attack", attack_type = MELEE_ATTACK, armor_penetration = 0)
	var/block_chance_modifier = round(damage / -3)

	for(var/obj/item/I in held_items)
		if(!istype(I, /obj/item/clothing))
			var/final_block_chance = I.block_chance - (CLAMP((armor_penetration-I.armor_penetration)/2,0,100)) + block_chance_modifier //So armour piercing blades can still be parried by other blades, for example
			if(I.hit_reaction(src, AM, attack_text, final_block_chance, damage, attack_type))
				return TRUE
	if(head)
		var/final_block_chance = head.block_chance - (CLAMP((armor_penetration-head.armor_penetration)/2,0,100)) + block_chance_modifier
		if(head.hit_reaction(src, AM, attack_text, final_block_chance, damage, attack_type))
			return TRUE
	if(wear_armor)
		var/final_block_chance = wear_armor.block_chance - (CLAMP((armor_penetration-wear_armor.armor_penetration)/2,0,100)) + block_chance_modifier
		if(wear_armor.hit_reaction(src, AM, attack_text, final_block_chance, damage, attack_type))
			return TRUE
	if(wear_pants)
		var/final_block_chance = wear_pants.block_chance - (CLAMP((armor_penetration-wear_pants.armor_penetration)/2,0,100)) + block_chance_modifier
		if(wear_pants.hit_reaction(src, AM, attack_text, final_block_chance, damage, attack_type))
			return TRUE
	if(wear_neck)
		var/final_block_chance = wear_neck.block_chance - (CLAMP((armor_penetration-wear_neck.armor_penetration)/2,0,100)) + block_chance_modifier
		if(wear_neck.hit_reaction(src, AM, attack_text, final_block_chance, damage, attack_type))
			return TRUE
  return FALSE

/mob/living/carbon/human/proc/check_block()
	if(mind)
		if(mind.martial_art && prob(mind.martial_art.block_chance) && mind.martial_art.can_use(src) && in_throw_mode && !incapacitated(FALSE, TRUE))
			return TRUE
	return FALSE

/mob/living/carbon/human/hitby(atom/movable/AM, skipcatch = FALSE, hitpush = TRUE, blocked = FALSE, datum/thrownthing/throwingdatum, damage_flag = "blunt")
	if(dna && dna.species)
		var/spec_return = dna.species.spec_hitby(AM, src)
		if(spec_return)
			return spec_return
	var/obj/item/I
	var/throwpower = 30
	if(has_status_effect(/datum/status_effect/buff/clash))
		bad_guard(span_warning("The thrown object ruins my focus!"))
	if(istype(AM, /obj/item))
		I = AM
		throwpower = I.throwforce
		if(I.thrownby == src) //No throwing stuff at myself to trigger hit reactions
			return ..()
		else
			if(ismob(I.thrownby))
				retaliate(I.thrownby)
	if(check_shields(AM, throwpower, "\the [AM.name]", THROWN_PROJECTILE_ATTACK))
		hitpush = FALSE
		skipcatch = TRUE
		blocked = TRUE
	else if(I)
		if(((throwingdatum ? throwingdatum.speed : I.throw_speed) >= EMBED_THROWSPEED_THRESHOLD) || I.embedding.embedded_ignore_throwspeed_threshold)
			if(can_embed(I) && prob(I.embedding.embed_chance) && !HAS_TRAIT(src, TRAIT_PIERCEIMMUNE))
				//throw_alert("embeddedobject", /atom/movable/screen/alert/embeddedobject)
				var/obj/item/bodypart/L = pick(bodyparts)
				L.add_embedded_object(I, silent = FALSE, crit_message = TRUE)
				emote("embed")
				L.receive_damage(I.w_class*I.embedding.embedded_impact_pain_multiplier)
//					visible_message("<span class='danger'>[I] embeds itself in [src]'s [L.name]!</span>","<span class='danger'>[I] embeds itself in my [L.name]!</span>")
				SEND_SIGNAL(src, COMSIG_ADD_MOOD_EVENT, "embedded", /datum/mood_event/embedded)
				hitpush = FALSE
				skipcatch = TRUE //can't catch the now embedded item

	return ..()

/mob/living/carbon/human/grippedby(mob/living/user, instant = FALSE)
	if(wear_pants)
		wear_pants.add_fingerprint(user)
	retaliate(user)
	..()


/mob/living/carbon/human/attacked_by(obj/item/I, mob/living/user)
	if(!I || !user)
		return 0
	var/obj/item/bodypart/affecting
	var/useder = user.zone_selected
	if(!lying_attack_check(user,I))
		return 0
	if(user.tempatarget)
		useder = user.tempatarget
		user.tempatarget = null
	affecting = get_bodypart(check_zone(useder)) //precise attacks, on yourself or someone you are grabbing
//	else
//		affecting = get_bodypart_complex(user.used_intent.height2limb(user.aimheight)) //this proc picks a bodypart at random as long as it's in the height list
	if(!affecting) //missing limb
		to_chat(user, span_warning("Unfortunately, there's nothing there."))
		return 0

	SEND_SIGNAL(I, COMSIG_ITEM_ATTACK_ZONE, src, user, affecting)

	SSblackbox.record_feedback("nested tally", "item_used_for_combat", 1, list("[I.force]", "[I.type]"))
	SSblackbox.record_feedback("tally", "zone_targeted", 1, useder)

	if(I.force)
		retaliate(user)

	// the attacked_by code varies among species
	return dna.species.spec_attacked_by(I, user, affecting, used_intent, src, useder)

/mob/living/carbon/human/attack_hand(mob/user)
	if(..())	//to allow surgery to return properly.
		return
	retaliate(user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		dna.species.spec_attack_hand(H, src)

/mob/living/carbon/human/attack_paw(mob/living/carbon/monkey/M)
	var/dam_zone = pick(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_L_HAND, BODY_ZONE_PRECISE_R_HAND, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
	var/obj/item/bodypart/affecting = get_bodypart(ran_zone(dam_zone))
	if(!affecting)
		affecting = get_bodypart(BODY_ZONE_CHEST)
	if(M.used_intent.type == INTENT_HELP)
		..() //shaking
		return 0

	retaliate(M)

	if(M.used_intent.type == INTENT_DISARM) //Always drop item in hand, if no item, get stunned instead.
		var/obj/item/I = get_active_held_item()
		if(I && dropItemToGround(I, silent = FALSE))
			playsound(loc, 'sound/blank.ogg', 25, TRUE, -1)
			visible_message(span_danger("[M] disarmed [src]!"), \
							span_danger("[M] disarmed you!"), span_hear("I hear aggressive shuffling!"), null, M)
			to_chat(M, span_danger("I disarm [src]!"))
		else if(!M.client || prob(5)) // only natural monkeys get to stun reliably, (they only do it occasionaly)
			playsound(loc, 'sound/blank.ogg', 25, TRUE, -1)
			if (src.IsKnockdown() && !src.IsParalyzed())
				Paralyze(40)
				log_combat(M, src, "pinned")
				visible_message(span_danger("[M] pins [src] down!"), \
								span_danger("[M] pins you down!"), span_hear("I hear shuffling and a muffled groan!"), null, M)
				to_chat(M, span_danger("I pin [src] down!"))
			else
				Knockdown(30)
				log_combat(M, src, "tackled")
				visible_message(span_danger("[M] tackles [src] down!"), \
								span_danger("[M] tackles you down!"), span_hear("I hear aggressive shuffling followed by a loud thud!"), null, M)
				to_chat(M, span_danger("I tackle [src] down!"))

	if(M.limb_destroyer)
		dismembering_strike(M, affecting.body_zone)

	if(can_inject(M, 1, affecting))//Thick suits can stop monkey bites.
		if(..()) //successful monkey bite, this handles disease contraction.
			var/damage = rand(1, 3)
			if(check_shields(M, damage, "the [M.name]"))
				return 0
			if(stat != DEAD)
				apply_damage(damage, BRUTE, affecting, run_armor_check(affecting, "slash", damage = damage))
		return 1


/mob/living/carbon/human/attack_animal(mob/living/simple_animal/M)
	. = ..()
	if(.)
		var/damage = rand(M.melee_damage_lower, M.melee_damage_upper)
		if(check_shields(M, damage, "the [M.name]", MELEE_ATTACK, M.armor_penetration))
			return FALSE
		var/zones = M.zone_selected
		if(!M.ckey)
			zones = pick(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_PRECISE_NECK, BODY_ZONE_PRECISE_L_HAND, BODY_ZONE_PRECISE_R_HAND, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
		var/dam_zone = dismembering_strike(M, zones)
		if(!dam_zone) //Dismemberment successful
			return TRUE

		var/obj/item/bodypart/affecting = get_bodypart(ran_zone(dam_zone))
		if(!affecting)
			affecting = get_bodypart(BODY_ZONE_CHEST)
		var/ap = (M.d_type == "blunt") ? BLUNT_DEFAULT_PENFACTOR : M.armor_penetration
		var/armor = run_armor_check(affecting, M.d_type, armor_penetration = ap, damage = damage)
		next_attack_msg.Cut()

		var/nodmg = FALSE
		if(!apply_damage(damage, M.melee_damage_type, affecting, armor))
			nodmg = TRUE
			next_attack_msg += " <span class='warning'>Armor stops the damage.</span>"
		else
			SEND_SIGNAL(M, COMSIG_MOB_AFTERATTACK_SUCCESS, src)
			affecting.bodypart_attacked_by(M.a_intent.blade_class, damage - armor, M, dam_zone, crit_message = TRUE)
		visible_message(span_danger("\The [M] [pick(M.a_intent.attack_verb)] [src]![next_attack_msg.Join()]"), \
					span_danger("\The [M] [pick(M.a_intent.attack_verb)] me![next_attack_msg.Join()]"), null, COMBAT_MESSAGE_RANGE)
		next_attack_msg.Cut()
		if(nodmg)
			return FALSE
		else
			retaliate(M)

/mob/living/carbon/human/ex_act(severity, target, epicenter, devastation_range, heavy_impact_range, light_impact_range, flame_range)
	..()
	if (!severity)
		return
	var/ddist = devastation_range
	var/hdist = heavy_impact_range
	var/ldist = light_impact_range
	var/fdist = flame_range
	var/fodist = get_dist(src, epicenter)
	var/brute_loss = 0
	var/burn_loss = 0
	var/dmgmod = round(rand(0.5, 1.5), 0.1)
	var/bomb_armor = 0

	if(fdist)
		var/stacks = ((fdist - fodist) * 2)
		fire_act(stacks)

	switch(severity)
		if(EXPLODE_DEVASTATE)
			brute_loss = ((120 * ddist) - (120 * fodist) * dmgmod)
			burn_loss = ((60 * ddist) - (60 * fodist) * dmgmod)
			if(bomb_armor)
				brute_loss = ((100 * (2 - round(bomb_armor*0.01, 0.05)) * ddist) - ((100 * (2 - round(bomb_armor*0.01, 0.05))) * fodist) * dmgmod)
				burn_loss = brute_loss
			damage_clothes(max(brute_loss - bomb_armor, 0), BRUTE, "blunt")
//				if (!istype(ears, /obj/item/clothing/ears/earmuffs))
//					adjustEarDamage(30, 120)
			Unconscious((50 * ddist) - (15 * fodist))
			Knockdown(((30 * ddist) - (30 * fodist)) - (bomb_armor * 1.6))

		if(EXPLODE_HEAVY)
			brute_loss = ((40 * hdist) - (40 * fodist) * dmgmod)
			burn_loss = ((20 * hdist) - (20 * fodist) * dmgmod)
			if(bomb_armor)
				brute_loss = ((30 * (2 - round(bomb_armor*0.01, 0.05)) * hdist) - ((30 * (2 - round(bomb_armor*0.01, 0.05))) * fodist) * dmgmod)
				burn_loss = brute_loss
			damage_clothes(max(brute_loss - bomb_armor, 0), BRUTE, "blunt")
//				if (!istype(ears, /obj/item/clothing/ears/earmuffs))
//					adjustEarDamage(30, 120)
			Unconscious((10 * hdist) - (5 * fodist))
			Knockdown(((30 * hdist) - (30 * fodist)) - (bomb_armor * 1.6))

		if(EXPLODE_LIGHT)
			brute_loss = ((10 * ldist) - (10 * fodist) * dmgmod)
			if(bomb_armor)
				brute_loss = (10 * (2 - round(bomb_armor*0.01, 0.05)) * ldist) - ((10 * (2 - round(bomb_armor*0.01, 0.05))) * fodist)
				damage_clothes(max(brute_loss - bomb_armor, 0), BRUTE, "blunt")
//				if (!istype(ears, /obj/item/clothing/ears/earmuffs))
//					adjustEarDamage(15,60)

	take_overall_damage(brute_loss,burn_loss)

	//attempt to dismember bodyparts
	if(severity <= 2)
		var/max_limb_loss = rand(0, floor(3/severity))
		for(var/X in bodyparts)
			var/obj/item/bodypart/BP = X
			if(prob(25/severity) && !prob(15) && BP.body_zone != BODY_ZONE_HEAD && BP.body_zone != BODY_ZONE_CHEST)
				BP.brute_dam = BP.max_damage
				BP.dismember()
				max_limb_loss--
				if(!max_limb_loss)
					break

///Calculates the siemens coeff based on clothing and species, can also restart hearts.
/mob/living/carbon/human/electrocute_act(shock_damage, source, siemens_coeff = 1, flags = NONE)
	//Calculates the siemens coeff based on clothing. Completely ignores the arguments
	if(flags & SHOCK_TESLA) //I hate this entire block. This gets the siemens_coeff for tesla shocks
		if(gloves && gloves.siemens_coefficient <= 0)
			siemens_coeff -= 0.5
		if(wear_armor)
			if(wear_armor.siemens_coefficient == -1)
				siemens_coeff -= 1
			else if(wear_armor.siemens_coefficient <= 0)
				siemens_coeff -= 0.95
		siemens_coeff = max(siemens_coeff, 0)
	else if(!(flags & SHOCK_NOGLOVES)) //This gets the siemens_coeff for all non tesla shocks
		if(gloves)
			siemens_coeff *= gloves.siemens_coefficient
	siemens_coeff *= physiology.siemens_coeff
	siemens_coeff *= dna.species.siemens_coeff
	. = ..()
	//Don't go further if the shock was blocked/too weak.
	if(!.)
		return
	//Note we both check that the user is in cardiac arrest and can actually heartattack
	//If they can't, they're missing their heart and this would runtime
///	if(undergoing_cardiac_arrest() && can_heartattack() && !(flags & SHOCK_ILLUSION))
//		if(shock_damage * siemens_coeff >= 1 && prob(25))
//			var/obj/item/organ/heart/heart = getorganslot(ORGAN_SLOT_HEART)
//			if(heart.Restart() && stat == CONSCIOUS)
//				to_chat(src, span_notice("I feel my heart beating again!"))
	electrocution_animation(40)

/mob/living/carbon/human/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_CONTENTS)
		return
	var/informed = FALSE
	for(var/obj/item/bodypart/L in src.bodyparts)
		if(L.status == BODYPART_ROBOTIC)
			if(!informed)
				to_chat(src, span_danger("I feel a sharp pain as my robotic limbs overload."))
				informed = TRUE
			switch(severity)
				if(1)
					L.receive_damage(0,10)
					Paralyze(200)
				if(2)
					L.receive_damage(0,5)
					Paralyze(100)

/mob/living/carbon/human/acid_act(acidpwr, acid_volume, bodyzone_hit) //todo: update this to utilize check_obscured_slots() //and make sure it's check_obscured_slots(TRUE) to stop aciding through visors etc
	var/list/damaged = list()
	var/list/inventory_items_to_kill = list()
	var/acidity = acidpwr * min(acid_volume*0.005, 0.1)
	//HEAD//
	if(!bodyzone_hit || bodyzone_hit == BODY_ZONE_HEAD) //only if we didn't specify a zone or if that zone is the head.
		var/obj/item/clothing/head_clothes = null
		if(glasses)
			head_clothes = glasses
		if(wear_mask)
			head_clothes = wear_mask
		if(wear_neck)
			head_clothes = wear_neck
		if(head)
			head_clothes = head
		if(head_clothes)
			if(!(head_clothes.resistance_flags & UNACIDABLE))
				head_clothes.acid_act(acidpwr, acid_volume)
				update_inv_glasses()
				update_inv_wear_mask()
				update_inv_neck()
				update_inv_head()
			else
				to_chat(src, span_notice("My [head_clothes.name] protects my head and face from the acid!"))
		else
			. = get_bodypart(BODY_ZONE_HEAD)
			if(.)
				damaged += .
			if(ears)
				inventory_items_to_kill += ears

	//CHEST//
	if(!bodyzone_hit || bodyzone_hit == BODY_ZONE_CHEST)
		var/obj/item/clothing/chest_clothes = null
		if(wear_pants)
			chest_clothes = wear_pants
		if(wear_armor)
			chest_clothes = wear_armor
		if(chest_clothes)
			if(!(chest_clothes.resistance_flags & UNACIDABLE))
				chest_clothes.acid_act(acidpwr, acid_volume)
				update_inv_w_uniform()
				update_inv_wear_suit()
			else
				to_chat(src, span_notice("My [chest_clothes.name] protects my body from the acid!"))
		else
			. = get_bodypart(BODY_ZONE_CHEST)
			if(.)
				damaged += .
			if(wear_ring)
				inventory_items_to_kill += wear_ring
			if(r_store)
				inventory_items_to_kill += r_store
			if(l_store)
				inventory_items_to_kill += l_store
			if(s_store)
				inventory_items_to_kill += s_store


	//ARMS & HANDS//
	if(!bodyzone_hit || bodyzone_hit == BODY_ZONE_L_ARM || bodyzone_hit == BODY_ZONE_R_ARM)
		var/obj/item/clothing/arm_clothes = null
		if(gloves)
			arm_clothes = gloves
		if(wear_pants && ((wear_pants.body_parts_covered_dynamic & HANDS) || (wear_pants.body_parts_covered_dynamic & ARMS)))
			arm_clothes = wear_pants
		if(wear_armor && ((wear_armor.body_parts_covered_dynamic & HANDS) || (wear_armor.body_parts_covered_dynamic & ARMS)))
			arm_clothes = wear_armor

		if(arm_clothes)
			if(!(arm_clothes.resistance_flags & UNACIDABLE))
				arm_clothes.acid_act(acidpwr, acid_volume)
				update_inv_gloves()
				update_inv_w_uniform()
				update_inv_wear_suit()
			else
				to_chat(src, span_notice("My [arm_clothes.name] protects my arms and hands from the acid!"))
		else
			. = get_bodypart(BODY_ZONE_R_ARM)
			if(.)
				damaged += .
			. = get_bodypart(BODY_ZONE_L_ARM)
			if(.)
				damaged += .


	//LEGS & FEET//
	if(!bodyzone_hit || bodyzone_hit == BODY_ZONE_L_LEG || bodyzone_hit == BODY_ZONE_R_LEG || bodyzone_hit == "feet")
		var/obj/item/clothing/leg_clothes = null
		if(shoes)
			leg_clothes = shoes
		if(wear_pants && ((wear_pants.body_parts_covered & FEET) || (bodyzone_hit != "feet" && (wear_pants.body_parts_covered & LEGS))))
			leg_clothes = wear_pants
		if(wear_armor && ((wear_armor.body_parts_covered & FEET) || (bodyzone_hit != "feet" && (wear_armor.body_parts_covered & LEGS))))
			leg_clothes = wear_armor
		if(leg_clothes)
			if(!(leg_clothes.resistance_flags & UNACIDABLE))
				leg_clothes.acid_act(acidpwr, acid_volume)
				update_inv_shoes()
				update_inv_w_uniform()
				update_inv_wear_suit()
			else
				to_chat(src, span_notice("My [leg_clothes.name] protects my legs and feet from the acid!"))
		else
			. = get_bodypart(BODY_ZONE_R_LEG)
			if(.)
				damaged += .
			. = get_bodypart(BODY_ZONE_L_LEG)
			if(.)
				damaged += .


	//DAMAGE//
	for(var/obj/item/bodypart/affecting in damaged)
		affecting.receive_damage(acidity, 2*acidity)

		if(affecting.name == BODY_ZONE_HEAD)
			if(prob(min(acidpwr*acid_volume/10, 90))) //Applies disfigurement
				affecting.receive_damage(acidity, 2*acidity)
				emote("scream")
				facial_hairstyle = "Shaved"
				hairstyle = "Bald"
				update_hair()
				ADD_TRAIT(src, TRAIT_DISFIGURED, TRAIT_GENERIC)

		update_damage_overlays()

	//MELTING INVENTORY ITEMS//
	//these items are all outside of armour visually, so melt regardless.
	if(!bodyzone_hit)
		if(back)
			inventory_items_to_kill += back
		if(belt)
			inventory_items_to_kill += belt

		inventory_items_to_kill += held_items

	for(var/obj/item/I in inventory_items_to_kill)
		I.acid_act(acidpwr, acid_volume)
	return 1

/mob/living/carbon/human/help_shake_act(mob/living/carbon/M)
	if(!istype(M))
		return

	if(src == M)
		if(has_status_effect(STATUS_EFFECT_CHOKINGSTRAND))
			to_chat(src, span_notice("I attempt to remove the durathread strand from around my neck."))
			if(do_after(src, 35, null, src))
				to_chat(src, span_notice("I succesfuly remove the durathread strand."))
				remove_status_effect(STATUS_EFFECT_CHOKINGSTRAND)
			return
		check_for_injuries(M)
		return

	if(wear_armor)
		wear_armor.add_fingerprint(M)
	else if(wear_pants)
		wear_pants.add_fingerprint(M)

	return ..()

/mob/living/carbon/human/proc/check_for_injuries(mob/user = src, advanced = FALSE, silent = FALSE)
	var/list/examination = list("<span class='info'>ø ------------ ø")
	var/m1
	var/deep_examination = advanced
	if(user == src)
		m1 = "I am"
		if(!deep_examination)
			deep_examination = HAS_TRAIT(src, TRAIT_SELF_AWARE)
		examination += span_notice("Let's see how I am doing.")
		if(!stat && !silent)
			user.visible_message(span_notice("[src] examines [p_them()]self."), \
				span_notice("I check myself for injuries."))
	else if(user)
		m1 = "[p_they(TRUE)] [p_are()]"
		if(!deep_examination)
			deep_examination = HAS_TRAIT(user, TRAIT_EMPATH)
		examination += span_notice("Let's see how [src] is doing.")
		if(!user.stat && !silent)
			user.visible_message(span_notice("[user] examines [src]."), \
				span_notice("I check [src] for injuries."))

	if(stat < DEAD)
		examination += "[m1] still alive."
		if(stat >= UNCONSCIOUS)
			examination += "[m1] [IsSleeping() ? "asleep" : "unconscious"]."
	else
		examination += span_dead("[m1] dead.")

	switch(blood_volume)
		if(-INFINITY to BLOOD_VOLUME_SURVIVE)
			examination += span_artery("<B>[m1] extremely anemic.</B>")
		if(BLOOD_VOLUME_SURVIVE to BLOOD_VOLUME_BAD)
			examination += span_artery("<B>[m1] very anemic.</B>")
		if(BLOOD_VOLUME_BAD to BLOOD_VOLUME_OKAY)
			examination += span_artery("[m1] anemic.")
		if(BLOOD_VOLUME_OKAY to BLOOD_VOLUME_SAFE)
			examination += span_artery("[m1] a little anemic.")

	if(HAS_TRAIT(src, TRAIT_PARALYSIS))
		if(HAS_TRAIT(src, TRAIT_NO_BITE))
			examination += span_danger("[m1] PARALYZED!")
		else
			examination += span_danger("[m1] TETRAPLEGIC!")
	else if(HAS_TRAIT(src, TRAIT_PARALYSIS_R_LEG) && HAS_TRAIT(src, TRAIT_PARALYSIS_L_LEG))
		examination += span_warning("[m1] PARAPLEGIC!")

	var/static/list/body_zones = list(
		BODY_ZONE_HEAD,
		BODY_ZONE_CHEST,
		BODY_ZONE_L_ARM,
		BODY_ZONE_R_ARM,
		BODY_ZONE_L_LEG,
		BODY_ZONE_R_LEG,
	)
	for(var/body_zone in body_zones)
		var/obj/item/bodypart/bodypart = get_bodypart(body_zone)
		if(!bodypart)
			examination += span_info("☼ [capitalize(parse_zone(body_zone))]: <span class='deadsay'><b>MISSING</b></span>")
			continue
		examination += bodypart.check_for_injuries(user, deep_examination)

	examination += "ø ------------ ø</span>"
	if(!silent)
		to_chat(user, examination.Join("\n"))
	return examination

/mob/living/carbon/human/proc/check_limb_for_injuries(mob/user = src, choice = BODY_ZONE_CHEST, advanced = FALSE, silent = FALSE)
	choice = check_zone(choice)
	var/list/examination = list("<span class='info'>ø ------------ ø")
	var/deep_examination = advanced
	if(user == src)
		if(!deep_examination)
			deep_examination = HAS_TRAIT(src, TRAIT_SELF_AWARE)
		examination += span_notice("Let's see how my [parse_zone(choice)] is doing.")
		if(!stat && !silent)
			visible_message(span_notice("[src] examines [p_their()] [parse_zone(choice)]."))
	else if(user)
		if(!deep_examination)
			deep_examination = HAS_TRAIT(user, TRAIT_EMPATH)
		examination += span_notice("Let's see how [src]'s [parse_zone(choice)] is doing.")
		if(!user.stat && !silent)
			visible_message(span_notice("[user] examines [src]'s [parse_zone(choice)]."))

	var/obj/item/bodypart/examined_part = get_bodypart(choice)
	if(examined_part)
		examination += examined_part.check_for_injuries(user, advanced)
	else
		examination += span_info("☼ [capitalize(parse_zone(choice))]: <span class='deadsay'><B>MISSING</B></span>")
	examination += "ø ------------ ø</span>"
	if(!silent)
		to_chat(user, examination.Join("\n"))
	return examination

/mob/living/carbon/human/damage_clothes(damage_amount, damage_type = BRUTE, damage_flag = 0, def_zone)
	if(damage_type != BRUTE && damage_type != BURN)
		return
	damage_amount *= 0.5 //0.5 multiplier for balance reason, we don't want clothes to be too easily destroyed
	var/list/torn_items = list()

	//HEAD//
	if(!def_zone || def_zone == BODY_ZONE_HEAD)
		var/obj/item/clothing/head_clothes = null
		if(glasses)
			head_clothes = glasses
		if(wear_mask)
			head_clothes = wear_mask
		if(wear_neck)
			head_clothes = wear_neck
		if(head)
			head_clothes = head
		if(head_clothes)
			torn_items += head_clothes
		else if(ears)
			torn_items += ears

	//CHEST//
	if(!def_zone || def_zone == BODY_ZONE_CHEST)
		var/obj/item/clothing/chest_clothes = null
		if(wear_pants)
			chest_clothes = wear_pants
		if(wear_armor)
			chest_clothes = wear_armor
		if(chest_clothes)
			torn_items += chest_clothes

	//ARMS & HANDS//
	if(!def_zone || def_zone == BODY_ZONE_L_ARM || def_zone == BODY_ZONE_R_ARM)
		var/obj/item/clothing/arm_clothes = null
		if(gloves)
			arm_clothes = gloves
		if(wear_pants && ((wear_pants.body_parts_covered & HANDS) || (wear_pants.body_parts_covered & ARMS)))
			arm_clothes = wear_pants
		if(wear_armor && ((wear_armor.body_parts_covered & HANDS) || (wear_armor.body_parts_covered & ARMS)))
			arm_clothes = wear_armor
		if(arm_clothes)
			torn_items |= arm_clothes

	//LEGS & FEET//
	if(!def_zone || def_zone == BODY_ZONE_L_LEG || def_zone == BODY_ZONE_R_LEG)
		var/obj/item/clothing/leg_clothes = null
		if(shoes)
			leg_clothes = shoes
		if(wear_pants && ((wear_pants.body_parts_covered & FEET) || (wear_pants.body_parts_covered & LEGS)))
			leg_clothes = wear_pants
		if(wear_armor && ((wear_armor.body_parts_covered & FEET) || (wear_armor.body_parts_covered & LEGS)))
			leg_clothes = wear_armor
		if(leg_clothes)
			torn_items |= leg_clothes

	for(var/obj/item/I in torn_items)
		I.take_damage(damage_amount, damage_type, damage_flag, 0)
