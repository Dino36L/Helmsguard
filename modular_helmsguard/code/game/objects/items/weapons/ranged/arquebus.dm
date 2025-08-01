
/obj/item/gun/ballistic/arquebus
	name = "arquebus rifle"
	desc = "A gunpowder weapon that shoots an armor piercing metal ball."
	icon = 'modular_helmsguard/icons/weapons/arquebus.dmi'
	icon_state = "arquebus"
	item_state = "arquebus"
	force = 10
	force_wielded = 15
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/shoot/arquebus, /datum/intent/arc/arquebus, INTENT_GENERIC)
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/arquebus
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_LONG
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 1
	spread = 0

	can_parry = TRUE
	minstr = 6
	walking_stick = TRUE
	experimental_onback = TRUE
	cartridge_wording = "musketball"
	load_sound = 'modular_helmsguard/sound/arquebus/musketload.ogg'
	fire_sound = "modular_helmsguard/sound/arquebus/arquefire.ogg"
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/steel
	bolt_type = BOLT_TYPE_NO_BOLT
	casing_ejector = FALSE
	pickup_sound = 'modular_helmsguard/sound/sheath_sounds/draw_from_holster.ogg'
	holster_sound = 'modular_helmsguard/sound/sheath_sounds/put_back_to_holster.ogg'
	var/spread_num = 10
	var/damfactor = 2
	var/reloaded = FALSE
	var/load_time = 50
	var/gunpowder = FALSE
	var/obj/item/ramrod/myrod = null
	var/gunchannel

/obj/item/gun/ballistic/arquebus/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 6,"nx" = 7,"ny" = 6,"wx" = -2,"wy" = 3,"ex" = 1,"ey" = 3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -43,"sturn" = 43,"wturn" = 30,"eturn" = -30, "nflip" = 0, "sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -2,"nx" = -5,"ny" = -1,"wx" = -8,"wy" = 2,"ex" = 8,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 1,"nturn" = -45,"sturn" = 45,"wturn" = 0,"eturn" = 0,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)

/obj/item/gun/ballistic/arquebus/Initialize()
	. = ..()
	myrod = new /obj/item/ramrod(src)


/obj/item/gun/ballistic/arquebus/shoot_live_shot(mob/living/user as mob|obj, pointblank = 0, mob/pbtarget = null, message = 1)
	fire_sound = pick("modular_helmsguard/sound/arquebus/arquefire.ogg", "modular_helmsguard/sound/arquebus/arquefire2.ogg", "modular_helmsguard/sound/arquebus/arquefire3.ogg",
				"modular_helmsguard/sound/arquebus/arquefire4.ogg", "modular_helmsguard/sound/arquebus/arquefire5.ogg")
	. = ..()

/obj/item/gun/ballistic/arquebus/attack_right(mob/user)
	if(user.get_active_held_item())
		return
	else
		if(myrod)
			playsound(src, "sound/items/sharpen_short1.ogg",  100)
			to_chat(user, "<span class='warning'>I draw the ramrod from the [src]!</span>")
			var/obj/item/ramrod/AM
			for(AM in src)
				user.put_in_hands(AM)
				myrod = null
		else
			to_chat(user, "<span class='warning'>There is no rod stowed in the [src]!</span>")


/datum/intent/shoot/arquebus
	chargedrain = 0

/datum/intent/shoot/arquebus/can_charge()
	if(mastermob && masteritem.wielded)
		if(!masteritem.wielded)
			return FALSE
		return TRUE

/datum/intent/shoot/arquebus/prewarning()
	if(mastermob)
		mastermob.visible_message(span_warning("[mastermob] prepares [masteritem] to fire!"))
		playsound(mastermob, pick('modular_helmsguard/sound/arquebus/musketcock.ogg'), 100, FALSE)


/datum/intent/shoot/arquebus/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
		//skill block
		newtime = newtime + 120
		newtime = newtime - (mastermob.get_skill_level(/datum/skill/combat/firearms) * 25)
		//per block
		newtime = newtime + 20
		newtime = newtime - ((mastermob.STAPER)*2)
		if(newtime > 0)
			return newtime
		else
			return 1
	return chargetime

/datum/intent/arc/arquebus
	chargetime = 1
	chargedrain = 0

/datum/intent/arc/arquebus/prewarning()
	if(mastermob)
		mastermob.visible_message(span_warning("[mastermob] prepares [masteritem] to fire!"))
		playsound(mastermob, pick('modular_helmsguard/sound/arquebus/musketcock.ogg'), 100, FALSE)

/datum/intent/arc/arquebus/can_charge()
	if(mastermob && masteritem.wielded)
		if(!masteritem.wielded)
			return FALSE
/*		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
		if(mastermob.get_inactive_held_item())
			return FALSE*/
		return TRUE

/datum/intent/arc/arquebus/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
		//skill block
		newtime = newtime + 120
		newtime = newtime - (mastermob.get_skill_level(/datum/skill/combat/firearms) * 25)
		//per block
		newtime = newtime + 20
		newtime = newtime - ((mastermob.STAPER)*2)
		if(newtime > 0)
			return newtime
		else
			return 1
	return chargetime

/obj/item/gun/ballistic/arquebus/shoot_with_empty_chamber()
	playsound(src.loc, 'modular_helmsguard/sound/arquebus/musketcock.ogg', 100, FALSE)
	update_icon()

/obj/item/gun/ballistic/arquebus/attack_self(mob/living/user)
	if(twohands_required)
		return
	if(altgripped || wielded) //Trying to unwield it
		ungrip(user)
		return
	if(alt_intents)
		altgrip(user)
	if(gripped_intents)
		wield(user)
	update_icon()

/obj/item/gun/ballistic/arquebus/attackby(obj/item/A, mob/user, params)
	user.stop_sound_channel(gunchannel)
	var/firearm_skill = (user?.mind ? user.get_skill_level(/datum/skill/combat/firearms) : 1)
	var/load_time_skill = load_time - (firearm_skill*2)
	gunchannel = SSsounds.random_available_channel()

	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(chambered)
			to_chat(user, "<span class='warning'>There is already a [chambered] in the [src]!</span>")
			return
		if(!gunpowder)
			to_chat(user, "<span class='warning'>You must fill the [src] with gunpowder first!</span>")
			return
		if((loc == user) && (user.get_inactive_held_item() != src))
			return
		playsound(src, "modular_helmsguard/sound/arquebus/insert.ogg",  100)
		user.visible_message("<span class='notice'>[user] forces a [A] down the barrel of the [src].</span>")
		..()

	if(istype(A, /obj/item/powderflask))
		if(gunpowder)
			user.visible_message("<span class='notice'>The [src] is already filled with gunpowder!</span>")
			return
		else
			playsound(src, "modular_helmsguard/sound/arquebus/pour_powder.ogg",  100)
			if(do_after(user, load_time_skill, src))
				user.visible_message("<span class='notice'>[user] fills the [src] with gunpowder.</span>")
				gunpowder = TRUE
			return
	if(istype(A, /obj/item/ramrod))
		var/obj/item/ramrod/R=A
		if(!reloaded)
			if(chambered)
				user.visible_message("<span class='notice'>[user] begins ramming the [R.name] down the barrel of the [src] .</span>")
				playsound(src, "modular_helmsguard/sound/arquebus/ramrod.ogg",  100)
				if(do_after(user, load_time_skill, src))
					user.visible_message("<span class='notice'>[user] has finished reloading the [src].</span>")
					reloaded = TRUE
				return
		if(reloaded && !myrod)
			user.transferItemToLoc(R, src)
			myrod = R
			playsound(src, "sound/foley/musketload.ogg",  100)
			user.visible_message("<span class='notice'>[user] stows the [R.name] under the barrel of the [src].</span>")
		if(!chambered && !myrod)
			user.transferItemToLoc(R, src)
			myrod = R
			playsound(src, "sound/foley/musketload.ogg",  100)
			user.visible_message("<span class='notice'>[user] stows the [R.name] under the barrel of the [src] without chambering it.</span>")
		if(!myrod == null)
			to_chat(user, span_warning("There's already a [R.name] inside of the [name]."))
			return
		user.stop_sound_channel(gunchannel)

/obj/item/gun/ballistic/arquebus/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)

	var/firearm_skill = (user?.mind ? user.get_skill_level(/datum/skill/combat/firearms) : 1)
	spread = (spread_num - firearm_skill)
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 0
			adjust_experience(user, /datum/skill/combat/firearms, user.STAINT * 4)
		else
			spread = 150 - (150 * (user.client.chargedprog / 100))
	else
		spread = 0
	for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
		var/obj/projectile/BB = CB.BB
		BB.damage = BB.damage * damfactor
	gunpowder = FALSE
	reloaded = FALSE
	user.adjust_experience(/datum/skill/combat/firearms, (user.STAINT*5))
	..()
	new /obj/effect/particle_effect/sparks/muzzle(get_ranged_target_turf(user, user.dir, 1))
	spawn (5)
		new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 1))
	spawn (10)
		new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 2))
	spawn (16)
		new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 1))
	for(var/mob/M in range(5, user))
		if(!M.stat)
			shake_camera(M, 3, 1)


/obj/item/gun/ballistic/arquebus/afterattack(atom/target, mob/living/user, flag, params)
	. = ..()
/*	if(!reloaded)
		to_chat(user, span_warning("The [src] is not properly loaded yet!"))
		return*/

/obj/item/gun/ballistic/arquebus/can_shoot()
	if (!reloaded)
		return FALSE
	return ..()

/obj/item/ammo_box/magazine/internal/arquebus
	name = "arquebus internal magazine"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet
	caliber = "musketball"
	max_ammo = 1
	start_empty = TRUE



/// PISTOLS
/obj/item/gun/ballistic/arquebus_pistol
	name = "arquebus pistol"
	desc = "A gunpowder weapon that shoots an armor piercing metal ball."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "pistol"
	item_state = "pistol"
	force = 10
	possible_item_intents = list(/datum/intent/shoot/arquebus_pistol, /datum/intent/arc/arquebus_pistol, /datum/intent/mace/strike/wood)
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/arquebus
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	randomspread = 1
	spread = 0
	can_parry = TRUE
	minstr = 6
	walking_stick = FALSE
	cartridge_wording = "musketball"
	load_sound = 'modular_helmsguard/sound/arquebus/musketload.ogg'
	fire_sound = "modular_helmsguard/sound/arquebus/arquefire.ogg"
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/steel
	bolt_type = BOLT_TYPE_NO_BOLT
	casing_ejector = FALSE
	pickup_sound = 'modular_helmsguard/sound/sheath_sounds/draw_from_holster.ogg'
	holster_sound = 'modular_helmsguard/sound/sheath_sounds/put_back_to_holster.ogg'
	slot_flags = ITEM_SLOT_HIP
	var/damfactor = 2
	var/reloaded = FALSE
	var/load_time = 50
	var/gunpowder = FALSE
	var/obj/item/ramrod/myrod = null
	var/spread_num = 10
	var/can_spin = TRUE
	var/last_spunned
	var/spin_cooldown = 3 SECONDS

/obj/item/gun/ballistic/arquebus_pistol/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = -10,"sy" = -8,"nx" = 13,"ny" = -8,"wx" = -8,"wy" = -7,"ex" = 7,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 30,"sturn" = -30,"wturn" = -30,"eturn" = 30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/datum/intent/shoot/arquebus_pistol
	chargedrain = 0


/datum/intent/shoot/arquebus_pistol/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
    	//skill block
		newtime = newtime + 50
		newtime = newtime - (mastermob.get_skill_level(/datum/skill/combat/firearms) * 10)
    	//per block
		newtime = newtime + 8
		newtime = newtime - ((mastermob.STAPER)*1)
		if(newtime > 0)
			return newtime
		else
			return 1
	return chargetime

/datum/intent/shoot/arquebus_pistol/can_charge()
	if(mastermob)
		return TRUE

/datum/intent/arc/arquebus_pistol
	chargedrain = 0


/datum/intent/arc/arquebus_pistol/arquebus_pistol/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
    	//skill block
		newtime = newtime + 50
		newtime = newtime - (mastermob.get_skill_level(/datum/skill/combat/firearms) * 10)
    	//per block
		newtime = newtime + 8
		newtime = newtime - ((mastermob.STAPER)*1)
		if(newtime > 0)
			return newtime
		else
			return 1
	return chargetime


/datum/intent/arc/arquebus_pistol/can_charge()
	if(mastermob)
		return TRUE

/obj/item/gun/ballistic/arquebus_pistol/Initialize()
	. = ..()
	myrod = new /obj/item/ramrod(src)

/datum/intent/shoot/arquebus_pistol/prewarning()
	if(mastermob)
		mastermob.visible_message(span_warning("[mastermob] prepares [masteritem] to fire!"))
		playsound(mastermob, pick('modular_helmsguard/sound/arquebus/musketcock.ogg'), 100, FALSE)

/datum/intent/arc/arquebus_pistol/prewarning()
	if(mastermob)
		mastermob.visible_message(span_warning("[mastermob] prepares [masteritem] to fire!"))
		playsound(mastermob, pick('modular_helmsguard/sound/arquebus/musketcock.ogg'), 100, FALSE)

/obj/item/gun/ballistic/arquebus_pistol/shoot_live_shot(mob/living/user as mob|obj, pointblank = 0, mob/pbtarget = null, message = 1)
	fire_sound = pick("modular_helmsguard/sound/arquebus/arquefire.ogg", "modular_helmsguard/sound/arquebus/arquefire2.ogg", "modular_helmsguard/sound/arquebus/arquefire3.ogg",
				"modular_helmsguard/sound/arquebus/arquefire4.ogg", "modular_helmsguard/sound/arquebus/arquefire5.ogg")
	. = ..()

/obj/item/gun/ballistic/arquebus_pistol/attack_right(mob/user)
	if(user.get_active_held_item())
		return
	else
		if(myrod)
			playsound(src, "sound/items/sharpen_short1.ogg",  100)
			to_chat(user, "<span class='warning'>I draw the ramrod from the [src]!</span>")
			var/obj/item/ramrod/AM
			for(AM in src)
				user.put_in_hands(AM)
				myrod = null
		else
			to_chat(user, "<span class='warning'>There is no rod stowed in the [src]!</span>")



/obj/item/gun/ballistic/arquebus_pistol/shoot_with_empty_chamber()
	playsound(src.loc, 'modular_helmsguard/sound/arquebus/musketcock.ogg', 100, FALSE)
	update_icon()

/obj/item/gun/ballistic/arquebus_pistol/attackby(obj/item/A, mob/user, params)

	var/firearm_skill = (user?.mind ? user.get_skill_level(/datum/skill/combat/firearms) : 1)
	var/load_time_skill = load_time - (firearm_skill*2)
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(chambered)
			to_chat(user, "<span class='warning'>There is already a [chambered] in the [src]!</span>")
			return
		if(!gunpowder)
			to_chat(user, "<span class='warning'>You must fill the [src] with gunpowder first!</span>")
			return
		if((loc == user) && (user.get_inactive_held_item() != src))
			return
		playsound(src, "modular_helmsguard/sound/arquebus/insert.ogg",  100)
		user.visible_message("<span class='notice'>[user] forces a [A] down the barrel of the [src].</span>")
		..()

	if(istype(A, /obj/item/powderflask))
		if(gunpowder)
			user.visible_message("<span class='notice'>The [src] is already filled with gunpowder!</span>")
			return
		else
			playsound(src, "modular_helmsguard/sound/arquebus/pour_powder.ogg",  100)
			if(do_after(user, load_time_skill, src))
				user.visible_message("<span class='notice'>[user] fills the [src] with gunpowder.</span>")
				gunpowder = TRUE
			return
	if(istype(A, /obj/item/ramrod))
		var/obj/item/ramrod/R=A
		if(!reloaded)
			if(chambered)
				user.visible_message("<span class='notice'>[user] begins ramming the [R.name] down the barrel of the [src] .</span>")
				playsound(src, "modular_helmsguard/sound/arquebus/ramrod.ogg",  100)
				if(do_after(user, load_time_skill, src))
					user.visible_message("<span class='notice'>[user] has finished reloading the [src].</span>")
					reloaded = TRUE
				return
		if(reloaded && !myrod)
			user.transferItemToLoc(R, src)
			myrod = R
			playsound(src, "sound/foley/musketload.ogg",  100)
			user.visible_message("<span class='notice'>[user] stows the [R.name] under the barrel of the [src].</span>")
		if(!chambered && !myrod)
			user.transferItemToLoc(R, src)
			myrod = R
			playsound(src, "sound/foley/musketload.ogg",  100)
			user.visible_message("<span class='notice'>[user] stows the [R.name] under the barrel of the [src] without chambering it.</span>")
		if(!myrod == null)
			to_chat(user, span_warning("There's already a [R.name] inside of the [name]."))
			return


/obj/item/gun/ballistic/arquebus_pistol/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)

	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 0
			adjust_experience(user, /datum/skill/combat/firearms, user.STAINT * 4)
		else
			spread = 150 - (150 * (user.client.chargedprog / 100))
	else
		spread = 0
	for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
		var/obj/projectile/BB = CB.BB
		BB.damage = BB.damage * damfactor
	gunpowder = FALSE
	reloaded = FALSE
	spark_act()
	user.adjust_experience(/datum/skill/combat/firearms, (user.STAINT*5))
	..()
	new /obj/effect/particle_effect/sparks/muzzle(get_ranged_target_turf(user, user.dir, 1))
	spawn (5)
		new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 1))
	spawn (10)
		new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 2))
	spawn (16)
		new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 1))
	for(var/mob/M in range(5, user))
		if(!M.stat)
			shake_camera(M, 3, 1)

/obj/item/gun/ballistic/arquebus_pistol/attack_self(mob/living/user)
	var/string = "smoothly"
	var/list/strings_noob = list("unsurely", "nervously", "anxiously", "timidly", "shakily", "clumsily", "fumblingly", "awkwardly")
	var/list/strings_moderate = list("smoothly", "confidently", "determinately", "calmly", "skillfully", "decisively")
	var/list/strings_pro = list("masterfully", "expertly", "flawlessly", "elegantly", "artfully", "impeccably")
	var/firearm_skill = (user?.mind ? user.get_skill_level(/datum/skill/combat/firearms) : 1)
	var/noob_spin_sound = 'sound/combat/weaponr1.ogg'
	var/pro_spin_sound = 'modular_helmsguard/sound/arquebus/gunspin.ogg'
	var/spin_sound
	if(firearm_skill <= 2)
		string = pick(strings_noob)
		spin_sound = noob_spin_sound
	if((firearm_skill > 2) && (firearm_skill <= 4))
		string = pick(strings_moderate)
		spin_sound = pro_spin_sound
	if((firearm_skill > 4) && (firearm_skill <= 6))
		string = pick(strings_pro)
		spin_sound = pro_spin_sound
	if(world.time > last_spunned + spin_cooldown)
		can_spin = TRUE
	if(can_spin)
		user.play_overhead_indicator('icons/effects/effects.dmi', "emote", 10, OBJ_LAYER)
		user.visible_message("<span class='emote'>[user] spins the [src] around their fingers [string]!</span>")
		playsound(src, spin_sound, 100, FALSE, ignore_walls = FALSE)
		last_spunned = world.time
		if(firearm_skill <= 2)
			if(prob(35))
				shoot_live_shot(message = 0)
				user.visible_message("<span class='danger'>[user] accidentally discharged the [src]!</span>")
		if(firearm_skill <= 3)
			if(prob(50))
				user.visible_message("<span class='danger'>[user] accidentally dropped the [src]!</span>")
				user.dropItemToGround(src)
		can_spin = FALSE


/obj/item/gun/ballistic/arquebus_pistol/afterattack(atom/target, mob/living/user, flag, params)
	. = ..()

/obj/item/gun/ballistic/arquebus_pistol/can_shoot()
	if (!reloaded)
		return FALSE
	return ..()

/obj/item/ammo_box/magazine/internal/arquebus
	name = "arquebus internal magazine"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet
	caliber = "musketball"
	max_ammo = 1
	start_empty = TRUE



/// ITEMS



/obj/item/ramrod
	name = "ramrod"
	icon = 'modular_helmsguard/icons/obj/items/arquebus_items.dmi'
	desc = "A ramrod used for reloading a firearm."
	icon_state = "ramrod"
	item_state = "ramrod"
	slot_flags = SLOT_BELT_L | SLOT_BELT_R | ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_SMALL


/obj/item/powderflask
	name = "powderflask"
	icon = 'modular_helmsguard/icons/obj/items/arquebus_items.dmi'
	desc = "A flask of gunpowder used for reloading a firearm."
	icon_state = "powderflask"
	item_state = "powderflask"
	slot_flags = SLOT_BELT_L | SLOT_BELT_R | ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_TINY

/// MUZZLE

/obj/effect/particle_effect/sparks/muzzle
	name = "sparks"
	icon = 'icons/effects/64x64.dmi'
	icon_state = "sparks"
	anchored = TRUE
	light_system = MOVABLE_LIGHT
	light_power = 1.5
	light_color = LIGHT_COLOR_FIRE
	pixel_x = -16
	pixel_y = -16
	layer = ABOVE_LIGHTING_LAYER
	plane = ABOVE_LIGHTING_PLANE
