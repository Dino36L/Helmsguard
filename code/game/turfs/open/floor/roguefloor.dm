/turf/open/floor/rogue
	desc = ""
	canSmoothWith = null
	smooth = SMOOTH_FALSE
	var/smooth_icon = null
	var/prettifyturf = FALSE
	icon = 'icons/turf/roguefloor.dmi'
	baseturfs = list(/turf/open/transparent/openspace)
	neighborlay = ""

/turf/open/floor/rogue/break_tile()
	return //unbreakable

/turf/open/floor/rogue/burn_tile()
	return //unburnable

/turf/open/floor/rogue/Initialize()
	if(smooth_icon)
		icon = smooth_icon
	. = ..()

/turf/open/floor/rogue/ruinedwood
	icon_state = "wooden_floor"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/woodland.wav'
//	smooth = SMOOTH_MORE
//	canSmoothWith = list(/turf/closed/mineral/rogue, /turf/closed/mineral, /turf/closed/wall/mineral/rogue/stonebrick, /turf/closed/wall/mineral/rogue/wood, /turf/closed/wall/mineral/rogue/wooddark, /turf/closed/wall/mineral/rogue/decowood, /turf/closed/wall/mineral/rogue/decostone, /turf/closed/wall/mineral/rogue/stone, /turf/closed/wall/mineral/rogue/stone/moss, /turf/open/floor/rogue/cobble, /turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass)
	neighborlay = "dirtedge"

/turf/open/floor/rogue/ruinedwood/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/floor/rogue/ruinedwood/turned
	icon_state = "wooden_floort"

/turf/open/floor/rogue/ruinedwood/spiral
	icon_state = "weird1"
/turf/open/floor/rogue/ruinedwood/chevron
	icon_state = "weird2"

/turf/open/floor/rogue/ruinedwood/platform
	name = "platform"
	desc = "A destructible platform."
	damage_deflection = 8
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')

/turf/open/floor/rogue/ruinedwood/platform/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/hay
	icon_state = "hay"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	slowdown = 0

/turf/open/floor/rogue/twig
	icon_state = "twig"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	slowdown = 0

/turf/open/floor/rogue/twig/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/floor/rogue/twig/platform
	name = "platform"
	desc = "A destructible platform."
	damage_deflection = 6
	max_integrity = 200
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')

/turf/open/floor/rogue/twig/platform/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/wood
	smooth_icon = 'icons/turf/floors/wood.dmi'
	icon_state = "wooden_floor2"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	smooth = SMOOTH_MORE
	landsound = 'sound/foley/jumpland/woodland.wav'
	canSmoothWith = list(/turf/open/floor/rogue/wood,/turf/open/floor/carpet)

/turf/open/floor/rogue/woodturned
	smooth_icon = 'icons/turf/floors/wood_turned.dmi'
	icon_state = "wooden_floor2t"
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/open/floor/rogue/woodturned,/turf/open/floor/carpet)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/rogue/rooftop
	name = "roof"
	icon_state = "roof-arw"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/rogue/rooftop/Initialize()
	. = ..()
	icon_state = "roof"

/turf/open/floor/rogue/rooftop/green
	icon_state = "roofg-arw"

/turf/open/floor/rogue/rooftop/green/Initialize()
	. = ..()
	icon_state = "roofg"

/turf/open/floor/rogue/rooftop/green/corner1
	icon_state = "roofgc1-arw"

/turf/open/floor/rogue/rooftop/green/corner1/Initialize()
	. = ..()
	icon_state = "roofgc1"

/turf/open/floor/rogue/snow
	name = "snow"
	desc = "A gentle blanket of snow."
	icon_state = "snow"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	slowdown = 0
	smooth = SMOOTH_TRUE
	neighborlay = "snowedge"

/turf/open/floor/rogue/snow/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/floor/rogue/snow/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/snowrough
	name = "rough snow"
	desc = "A rugged blanket of snow."
	icon_state = "snowrough"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	slowdown = 0
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/snowrough,)
	neighborlay = "snowroughedge"

/turf/open/floor/rogue/snowrough/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/floor/rogue/snowrough/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/snowpatchy
	name = "patchy snow"
	desc = "Half-melted snow revealing the hardy grass underneath."
	icon_state = "snowpatchy_grass"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	slowdown = 0
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)
	neighborlay = "snowpatchy_grassedge"

/turf/open/floor/rogue/snowpatchy/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/grasscold
	name = "tundra grass"
	desc = "Grass, frigid and touched by winter."
	icon_state = "grass_cold"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	slowdown = 0
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)
	neighborlay = "grass_coldedge"

/turf/open/floor/rogue/grasscold/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/floor/rogue/grasscold/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/grassred
	name = "red grass"
	desc = "Grass, ripe with Dendor's blood."
	icon_state = "grass_red"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	slowdown = 0
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)
	neighborlay = "grass_rededge"

/turf/open/floor/rogue/grassred/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/floor/rogue/grassred/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/grassyel
	name = "yellow grass"
	desc = "Grass, blessed by Astrata's light."
	icon_state = "grass_yel"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	slowdown = 0
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)
	neighborlay = "grass_yeledge"

/turf/open/floor/rogue/grassyel/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/floor/rogue/grassyel/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/grass
	name = "grass"
	desc = "Grass, sodden with mud and bogwater."
	icon_state = "grass"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	slowdown = 0
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)
	neighborlay = "grassedge"

/turf/open/floor/rogue/grass/Initialize()
	dir = pick(GLOB.cardinals)
//	GLOB.dirt_list += src
	. = ..()

/turf/open/floor/rogue/grass/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/dirt/ambush
	name = "dirt"
	desc = "The dirt is pocked with the scars of countless wars."
	icon_state = "dirt"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	slowdown = 2
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)
	neighborlay = "dirtedge"
	muddy = FALSE
	bloodiness = 20
	dirt_amt = 3

/turf/open/floor/rogue/dirt/snow
	name = "dirt-s"
	desc = "The dirt is pocked with the scars of countless wars."
	icon_state = "dirt-s"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	slowdown = 2
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/grass)
	neighborlay = "dirtedge"

/turf/open/floor/rogue/dirt
	name = "dirt"
	desc = "The dirt is pocked with the scars of countless wars."
	icon_state = "dirt"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	slowdown = 2
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)
	neighborlay = "dirtedge"
	var/muddy = FALSE
	var/bloodiness = 20
	var/obj/structure/closet/dirthole/holie
	var/dirt_amt = 3

/turf/open/floor/rogue/dirt/get_slowdown(mob/user)
	var/returned = slowdown
	var/negate_slowdown = FALSE
	for(var/obj/item/I in user.held_items)
		if(I.walking_stick)
			if(!I.wielded)
				var/mob/living/L = user
				if(!L.cmode)
					negate_slowdown = TRUE

	if(HAS_TRAIT(user, TRAIT_LONGSTRIDER))
		negate_slowdown = TRUE
	if(negate_slowdown)
		returned = max(returned-2, 0)

	return returned


/turf/open/floor/rogue/dirt/attack_right(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(L.stat != CONSCIOUS)
			return
		var/obj/item/I = new /obj/item/natural/dirtclod(src)
		if(L.put_in_active_hand(I))
			L.visible_message(span_warning("[L] picks up some dirt."))
			dirt_amt--
			if(dirt_amt <= 0)
				src.ChangeTurf(/turf/open/floor/rogue/dirt/road, flags = CHANGETURF_INHERIT_AIR)
		else
			qdel(I)
	.=..()

/turf/open/floor/rogue/dirt/Destroy()
	if(holie)
		QDEL_NULL(holie)
	return ..()


/turf/open/floor/rogue/dirt/Crossed(atom/movable/O)
	..()
	if(ishuman(O))
		var/mob/living/carbon/human/H = O
		if(H.shoes && !HAS_TRAIT(H, TRAIT_LIGHT_STEP))
			var/obj/item/clothing/shoes/S = H.shoes
			if(!S.can_be_bloody)
				return
			var/add_blood = 0
			if(bloodiness >= BLOOD_GAIN_PER_STEP)
				add_blood = BLOOD_GAIN_PER_STEP
			else
				add_blood = bloodiness
			S.bloody_shoes[BLOOD_STATE_MUD] = min(MAX_SHOE_BLOODINESS,S.bloody_shoes[BLOOD_STATE_MUD]+add_blood)
			S.blood_state = BLOOD_STATE_MUD
			update_icon()
			H.update_inv_shoes()
		if(water_level)
			START_PROCESSING(SSwaterlevel, src)

/turf/open/floor/rogue/dirt/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/dirt/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()
	update_water()

/turf/open/floor/rogue/dirt/update_water()
	water_level = max(water_level-10,0)
	if(water_level > 10) //this would be a switch on normal tiles
		color = "#95776a"
	else
		color = null
	return TRUE

/turf/open/floor/rogue/dirt/road/update_water()
	water_level = max(water_level-10,0)
	for(var/D in GLOB.cardinals)
		var/turf/TU = get_step(src, D)
		if(istype(TU, /turf/open/water))
			if(!muddy)
				become_muddy()
			return TRUE //stop processing
	if(water_level > 10) //this would be a switch on normal tiles
		if(!muddy)
			become_muddy()
//flood process goes here to spread to other turfs etc
//	if(water_level > 250)
//		return FALSE
	if(muddy)
		if(water_level <= 0)
			water_level = 0
			muddy = FALSE
			slowdown = initial(slowdown)
			icon_state = initial(icon_state)
			name = initial(name)
			footstep = initial(footstep)
			barefootstep = initial(barefootstep)
			clawfootstep = initial(clawfootstep)
			heavyfootstep = initial(heavyfootstep)
			track_prob = initial(track_prob) //Hearthstone port.
	return TRUE

/turf/open/floor/rogue/dirt/proc/become_muddy()
	if(!muddy)
		water_level = max(water_level-100,0)
		muddy = TRUE
		icon_state = "mud[rand (1,3)]"
		name = "mud"
		slowdown = 2
		footstep = FOOTSTEP_MUD
		barefootstep = FOOTSTEP_MUD
		heavyfootstep = FOOTSTEP_MUD
		track_prob = 20 //Hearthstone port.
		bloodiness = 20

/turf/open/floor/rogue/dirt/road
	name = "dirt"
	desc = "The dirt is pocked with the scars of countless steps."
	icon_state = "road"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/dirt,
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)
	neighborlay = "roadedge"
	slowdown = 0

/turf/open/floor/rogue/dirt/road/attack_right(mob/user)
	return

/turf/open/floor/rogue/dirt/road/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/sand
	name = "sand"
	icon = 'icons/turf/sand.dmi'
	icon_state = "sand"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_SAND
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	baseturfs = /turf/open/floor/rogue/sand
	slowdown = 0

/turf/open/floor/rogue/sand/Initialize(mapload)
	. = ..()
	if(prob(15))
		icon_state = "sand[rand(1,4)]"

/turf/open/floor/rogue/hay
	name = "hay"
	desc = "For horses and cows like you."
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "hay"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/dirtland.wav'
	slowdown = 0

/turf/proc/roguesmooth(adjacencies)
	var/list/New
	var/holder

	for(var/A in neighborlay_list)
		cut_overlay("[A]")
		neighborlay_list -= A
	var/usedturf
	if(adjacencies & N_NORTH)
		usedturf = get_step(src, NORTH)
		if(isturf(usedturf))
			var/turf/T = usedturf
			if(neighborlay_override)
				holder = "[neighborlay_override]-n"
				LAZYADD(New, holder)
				neighborlay_list += holder
			else if(T.neighborlay)
				holder = "[T.neighborlay]-n"
				LAZYADD(New, holder)
				neighborlay_list += holder
	if(adjacencies & N_SOUTH)
		usedturf = get_step(src, SOUTH)
		if(isturf(usedturf))
			var/turf/T = usedturf
			if(neighborlay_override)
				holder = "[neighborlay_override]-s"
				LAZYADD(New, holder)
				neighborlay_list += holder
			else if(T.neighborlay)
				holder = "[T.neighborlay]-s"
				LAZYADD(New, holder)
				neighborlay_list += holder
	if(adjacencies & N_WEST)
		usedturf = get_step(src, WEST)
		if(isturf(usedturf))
			var/turf/T = usedturf
			if(neighborlay_override)
				holder = "[neighborlay_override]-w"
				LAZYADD(New, holder)
				neighborlay_list += holder
			else if(T.neighborlay)
				holder = "[T.neighborlay]-w"
				LAZYADD(New, holder)
				neighborlay_list += holder
	if(adjacencies & N_EAST)
		usedturf = get_step(src, EAST)
		if(isturf(usedturf))
			var/turf/T = usedturf
			if(neighborlay_override)
				holder = "[neighborlay_override]-e"
				LAZYADD(New, holder)
				neighborlay_list += holder
			else if(T.neighborlay)
				holder = "[T.neighborlay]-e"
				LAZYADD(New, holder)
				neighborlay_list += holder

	if(New)
		add_overlay(New)
	return New

/turf/open/floor/rogue/underworld/space
	name = "void"
	desc = ""
	icon_state = "undervoid"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	smooth = SMOOTH_FALSE
	slowdown = 50

/turf/open/floor/rogue/underworld/space/sparkle_quiet
	name = "void"
	desc = ""
	icon_state = "undervoid2"

/turf/open/floor/rogue/underworld/space/quiet
	name = "void"
	desc = ""
	icon_state = "undervoid3"

/turf/open/floor/rogue/underworld/road
	name = "ash"
	desc = "Smells like burnt wood."
	icon_state = "ash"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue, /turf/closed/mineral, /turf/closed/wall/mineral)
	slowdown = 0

/turf/open/floor/rogue/underworld/road/Initialize()
	. = ..()
	dir = rand(0,8)

/turf/open/floor/rogue/volcanic
	name = "dirt"
	desc = "The dirt is pocked with the scars of countless steps."
	icon_state = "lavafloor"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/dirt/road,/turf/open/floor/rogue/dirt)
	neighborlay = "lavedge"

/turf/open/floor/rogue/volcanic/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()


/turf/open/floor/rogue/blocks
	icon_state = "blocks"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, 
						/turf/closed/mineral, 
						/turf/closed/wall/mineral/rogue/stonebrick, 
						/turf/closed/wall/mineral/rogue/wood, 
						/turf/closed/wall/mineral/rogue/wooddark, 
						/turf/closed/wall/mineral/rogue/stone, 
						/turf/closed/wall/mineral/rogue/stone/moss, 
						/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/blocks/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/blocks/stonered
	icon_state = "stoneredlarge"
/turf/open/floor/rogue/blocks/stonered/tiny
	icon_state = "stoneredtiny"
/turf/open/floor/rogue/blocks/green
	icon_state = "greenblocks"
/turf/open/floor/rogue/blocks/bluestone
	icon_state = "bluestone2"
/turf/open/floor/rogue/blocks/newstone
	icon_state = "newstone2"
/turf/open/floor/rogue/blocks/newstone/alt
	icon_state = "bluestone"

/turf/open/floor/rogue/blocks/paving
	icon_state = "paving"
/turf/open/floor/rogue/blocks/paving/vert
	icon_state = "paving-t"

/turf/open/floor/rogue/blocks/platform
	name = "platform"
	desc = "A destructible platform."
	damage_deflection = 10
	max_integrity = 800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')

/turf/open/floor/rogue/blocks/platform/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/greenstone
	icon_state = "greenstone"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	icon = 'icons/turf/greenstone.dmi'

/turf/open/floor/rogue/greenstone/runed
	icon_state = "greenstoneruned"

/turf/open/floor/rogue/hexstone
	icon_state = "hexstone"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, 
						/turf/open/floor/rogue/herringbone, 
						/turf/closed/mineral, 
						/turf/closed/wall/mineral/rogue/stonebrick, 
						/turf/closed/wall/mineral/rogue/wood, 
						/turf/closed/wall/mineral/rogue/wooddark, 
						/turf/closed/wall/mineral/rogue/stone, 
						/turf/closed/wall/mineral/rogue/stone/moss, 
						/turf/open/floor/rogue/cobble, 
						/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/hexstone/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/hexstone/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

//Church floors

/turf/open/floor/rogue/churchmarble
	icon_state = "church_marble"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, 
						/turf/open/floor/rogue/herringbone, 
						/turf/closed/mineral, 
						/turf/closed/wall/mineral/rogue/stonebrick, 
						/turf/closed/wall/mineral/rogue/wood, 
						/turf/closed/wall/mineral/rogue/wooddark, 
						/turf/closed/wall/mineral/rogue/stone, 
						/turf/closed/wall/mineral/rogue/stone/moss, 
						/turf/open/floor/rogue/cobble, 
						/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/churchmarble/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/churchmarble/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/church
	icon_state = "church"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, 
						/turf/open/floor/rogue/herringbone, 
						/turf/closed/mineral, 
						/turf/closed/wall/mineral/rogue/stonebrick, 
						/turf/closed/wall/mineral/rogue/wood, 
						/turf/closed/wall/mineral/rogue/wooddark, 
						/turf/closed/wall/mineral/rogue/stone, 
						/turf/closed/wall/mineral/rogue/stone/moss, 
						/turf/open/floor/rogue/cobble, 
						/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/church/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/church/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/churchbrick
	icon_state = "church_brick"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, 
						/turf/open/floor/rogue/herringbone, 
						/turf/closed/mineral, 
						/turf/closed/wall/mineral/rogue/stonebrick, 
						/turf/closed/wall/mineral/rogue/wood, 
						/turf/closed/wall/mineral/rogue/wooddark, 
						/turf/closed/wall/mineral/rogue/stone, 
						/turf/closed/wall/mineral/rogue/stone/moss, 
						/turf/open/floor/rogue/cobble, 
						/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/churchbrick/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/churchbrick/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/churchrough
	icon_state = "church_rough"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, 
						/turf/open/floor/rogue/herringbone, 
						/turf/closed/mineral, 
						/turf/closed/wall/mineral/rogue/stonebrick, 
						/turf/closed/wall/mineral/rogue/wood, 
						/turf/closed/wall/mineral/rogue/wooddark, 
						/turf/closed/wall/mineral/rogue/stone, 
						/turf/closed/wall/mineral/rogue/stone/moss, 
						/turf/open/floor/rogue/cobble, 
						/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/churchrough/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/churchrough/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)
//
/turf/open/floor/rogue/herringbone
	icon_state = "herringbone"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	neighborlay = "herringedge"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/herringbone, 
						/turf/open/floor/rogue/blocks, 
						/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/herringbone/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/herringbone/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/obj/effect/decal/herringbone
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "herringedge"
	mouse_opacity = 0

/obj/effect/decal/wood/herringbone
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "herringbonewoodedge"
	mouse_opacity = 0

/obj/effect/decal/wood/herringbone2
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "herringbonewood2edge"
	mouse_opacity = 0

/turf/open/floor/rogue/ruinedwood/herringbone
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/woodland.wav'
	icon_state = "herringbonewood"

/turf/open/floor/rogue/wood/herringbone
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/woodland.wav'
	icon_state = "herringbonewood2"

/turf/open/floor/rogue/cobble
	icon_state = "cobblestone1"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	neighborlay = "cobbleedge"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/cobble/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/cobble/Initialize()
	. = ..()
	icon_state = "cobblestone[rand(1,3)]"
///turf/open/floor/rogue/cobble/Initialize()
//	. = ..()
//	icon_state = "cobblestone[rand(1,3)]"

/turf/open/floor/rogue/cobble/mossy
	icon_state = "mossystone1"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	neighborlay = "cobbleedge"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/cobble/mossy/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/cobble/mossy/Initialize()
	. = ..()
	icon_state = "mossystone[rand(1,3)]"

/turf/open/floor/rogue/cobblerock
	icon_state = "cobblerock"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	neighborlay = "cobblerock"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass, /turf/open/floor/rogue/dirt/road)

/turf/open/floor/rogue/cobblerock/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/obj/effect/decal/cobbleedge
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "cobblestone_edges"
	mouse_opacity = 0

///Add my stuff here, remove note when done
/// Decal section

/obj/effect/decal/stone/blockedge
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "blocks_edges"
	mouse_opacity = 0

/obj/effect/decal/stone/blockedge/blockedgeinvert
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "blocks_edgesinv"
	mouse_opacity = 0

/obj/effect/decal/stone/mossy
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "mossyedge"
	mouse_opacity = 0

/obj/effect/decal/stone/mossy/big
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "mossystone_edges"
	mouse_opacity = 0

/obj/effect/decal/stone/chess
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "chessedge"
	mouse_opacity = 0

/obj/effect/decal/stone/chess/inv
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "chessedgeinv"
	mouse_opacity = 0

/obj/effect/decal/stone/hex
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "hexstoneedge"
	mouse_opacity = 0

/obj/effect/decal/herringbone
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "herringedge"
	mouse_opacity = 0


/obj/effect/decal/dirt
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "dirtedge"
	mouse_opacity = 0

/obj/effect/decal/dirt/road
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "roadedge"
	mouse_opacity = 0

/obj/effect/decal/dirt/grass
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "grassedge"
	mouse_opacity = 0

/obj/effect/decal/dirt/grass/hell
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "hellgrassedge"
	mouse_opacity = 0

/obj/effect/decal/wood/herringbone
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "herringbonewoodedge"
	mouse_opacity = 0

/obj/effect/decal/wood/herringbone2
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "herringbonewood2edge"
	mouse_opacity = 0

/obj/effect/decal/wood/
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "wooden_floor2edge"
	mouse_opacity = 0

/obj/effect/decal/wood/turnd
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "wooden_floor2tedge"
	mouse_opacity = 0

/obj/effect/decal/wood/ruinedwood
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "wooden_flooredge"
	mouse_opacity = 0

/obj/effect/decal/wood/ruinedwood/turned
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "wooden_floortedge"
	mouse_opacity = 0

/obj/effect/decal/border
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "woodenborder"
	mouse_opacity = 0

/obj/effect/decal/border/ruinedwood
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "woodenborder"
	mouse_opacity = 0

/obj/effect/decal/border/ruinedwood/inverted
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "woodenborderinv"
	mouse_opacity = 0

/obj/effect/decal/border/wood
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "woodenborder2"
	mouse_opacity = 0

/obj/effect/decal/border/wood/inverted
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "woodenborder2inv"
	mouse_opacity = 0

/obj/effect/decal/border/stone
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "stoneborder"
	mouse_opacity = 0

/obj/effect/decal/border/stone/inverted
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "stoneborderinv"
	mouse_opacity = 0

/obj/effect/decal/border/stone/stonepattern1
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "stone1edge"
	mouse_opacity = 0

/obj/effect/decal/border/stone/stonepattern2
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "stone2edge"
	mouse_opacity = 0

//floors

/turf/open/floor/rogue/ruinedwood/herringbone
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/woodland.wav'
	icon_state = "herringbonewood"

/turf/open/floor/rogue/wood/herringbone
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/woodland.wav'
	icon_state = "herringbonewood2"

/turf/open/floor/rogue/grass/hell
	icon_state = "hellgrass"

/turf/open/floor/rogue/blocks/stone
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "stone1"
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/tileland.wav'
	footstepstealth = TRUE

/turf/open/floor/rogue/blocks/stone/stonepattern2
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "stone2"

/turf/open/floor/rogue/blocks/stone/stonepattern3
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "stone3"

/// End of my adds

/turf/open/floor/rogue/tile
	icon_state = "chess"
	landsound = 'sound/foley/jumpland/tileland.wav'
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	footstepstealth = TRUE
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, 
						/turf/closed/mineral, 
						/turf/closed/wall/mineral/rogue/stonebrick, 
						/turf/closed/wall/mineral/rogue/wood, 
						/turf/closed/wall/mineral/rogue/wooddark, 
						/turf/closed/wall/mineral/rogue/stone, 
						/turf/closed/wall/mineral/rogue/stone/moss, 
						/turf/open/floor/rogue/cobble, 
						/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/tile/masonic
	icon_state = "masonic"
/turf/open/floor/rogue/tile/masonic/single
	icon_state = "masonicsingle"
/turf/open/floor/rogue/tile/masonic/inverted
	icon_state = "masonicsingleinvert"
/turf/open/floor/rogue/tile/masonic/spiral
	icon_state = "masonicspiral"

/turf/open/floor/rogue/tile/bath
	icon_state = "bathtile"
/turf/open/floor/rogue/tile/bfloorz
	icon_state = "bfloorz"
/turf/open/floor/rogue/tile/tilerg
	icon_state = "tilerg"
/turf/open/floor/rogue/tile/checker
	icon_state = "linoleum"
/turf/open/floor/rogue/tile/checkeralt
	icon_state = "tile"

/turf/open/floor/rogue/concrete
	icon_state = "concretefloor1"
	landsound = 'sound/foley/jumpland/stoneland.wav'
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, 
						/turf/closed/mineral, 
						/turf/closed/wall/mineral/rogue/stonebrick, 
						/turf/closed/wall/mineral/rogue/wood, 
						/turf/closed/wall/mineral/rogue/wooddark, 
						/turf/closed/wall/mineral/rogue/stone, 
						/turf/closed/wall/mineral/rogue/stone/moss, 
						/turf/open/floor/rogue/cobble, 
						/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/concrete/Initialize()
	. = ..()
	icon_state = "concretefloor[rand(1,2)]"
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/metal
	icon_state = "plating1"
	landsound = 'sound/foley/jumpland/metalland.wav'
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	footstepstealth = TRUE
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, 
						/turf/closed/mineral, 
						/turf/closed/wall/mineral/rogue/stonebrick, 
						/turf/closed/wall/mineral/rogue/wood, 
						/turf/closed/wall/mineral/rogue/wooddark, 
						/turf/closed/wall/mineral/rogue/stone, 
						/turf/closed/wall/mineral/rogue/stone/moss, 
						/turf/open/floor/rogue/cobble, 
						/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/metal/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/metal/barograte
	icon_state = "barograte"
/turf/open/floor/rogue/metal/barograte/open
	icon_state = "barograteopen"

/turf/open/floor/rogue/carpet
	icon_state = "carpet"
	landsound = 'sound/foley/jumpland/carpetland.wav'
	footstep = FOOTSTEP_CARPET
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	clawfootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, 
						/turf/closed/mineral, 
						/turf/closed/wall/mineral/rogue/stonebrick, 
						/turf/closed/wall/mineral/rogue/wood, 
						/turf/closed/wall/mineral/rogue/wooddark, 
						/turf/closed/wall/mineral/rogue/stone, 
						/turf/closed/wall/mineral/rogue/stone/moss, 
						/turf/open/floor/rogue/cobble, 
						/turf/open/floor/rogue/dirt, 
						/turf/open/floor/rogue/grass,
						/turf/open/floor/rogue/grassred, 
						/turf/open/floor/rogue/grassyel, 
						/turf/open/floor/rogue/grasscold,
						/turf/open/floor/rogue/snowpatchy,
						/turf/open/floor/rogue/snow,
						/turf/open/floor/rogue/snowrough,)

/turf/open/floor/rogue/carpet/lord
	icon_state = ""

/turf/open/floor/rogue/carpet/lord/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	GLOB.lordcolor += src

/turf/open/floor/rogue/carpet/lord/Destroy()
	GLOB.lordcolor -= src
	return ..()

/turf/open/floor/rogue/carpet/lord/lordcolor(primary,secondary)
	if(!primary || !secondary)
		return
	var/mutable_appearance/M = mutable_appearance(icon, "[icon_state]_primary", -(layer+0.1))
	M.color = primary
	add_overlay(M)

/turf/open/floor/rogue/carpet/lord/center
	icon_state = "carpet_c"

/turf/open/floor/rogue/carpet/lord/center/Initialize()
	dir = pick(GLOB.cardinals)
	..()

/turf/open/floor/rogue/carpet/lord/left
	icon_state = "carpet_l"

/turf/open/floor/rogue/carpet/lord/right
	icon_state = "carpet_r"

/turf/open/floor/rogue/shroud
	name = "treetop"
	icon_state = "treetop1"
	landsound = 'sound/foley/jumpland/dirtland.wav'
	footstep = null
	barefootstep = null
	clawfootstep = null
	heavyfootstep = null
	slowdown = 4

/turf/open/floor/rogue/shroud/Entered(atom/movable/AM, atom/oldLoc)
	..()
	if(isliving(AM))
		if(istype(oldLoc, type))
			playsound(AM, "plantcross", 100, TRUE)

/turf/open/floor/rogue/shroud/Initialize()
	. = ..()
	icon_state = "treetop[rand(1,2)]"
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/naturalstone
	icon_state = "digstone"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/grassland.wav'
