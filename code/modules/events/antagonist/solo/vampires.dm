/datum/round_event_control/antagonist/solo/vampires
	name = "Vampires"
	tags = list(
		TAG_COMBAT,
		TAG_HAUNTED,
		TAG_VILLIAN,
	)
	roundstart = TRUE
	antag_flag = ROLE_NBEAST
	shared_occurence_type = SHARED_HIGH_THREAT

	weight = 0		//Disabled cus vampires too strong
	max_occurrences = 0

	denominator = 80

	base_antags = 1
	maximum_antags = 2

	earliest_start = 0 SECONDS

	typepath = /datum/round_event/antagonist/solo/vampire
	antag_datum = /datum/antagonist/vampirelord

	restricted_roles = list(
		"Grand Duke",
		"Grand Duchess",
		"Lord Consort",
		"Lady Consort",
		"Dungeoneer",
		"Sergeant",
		"Master-at-arms",
		"Gatemaster",
		"Man-at-arms",
		"Woman-at-arms",
		"Marshal",
		"Merchant",
		"Priest",
		"Acolyte",
		"Vestal",
		"Inquisitor",
		"Chapter Master",
		"Knight Templar",
		"Dame Templar",
		"Templar Sergeant",
		"Templar Maident",
		"Knight Hospitaler",
		"Dame Hospitaler",
		"Hospitaler Sergeant",
		"Hospitaler Maiden",
		"Councillor",
		"Lord Heir",
		"Lady Heir",
		"Hand",
		"Steward",
		"Stewardess",
		"Court Physician",
		"Town Elder",
		"Captain",
		"Archivist",
		"Knight",
		"Court Magician",
		"Inquisitor",
		"Orthodoxist",
		"Warden",
		"Squire",
		"Veteran",
		"Apothecary",
		"Marshall",
		"Watchman",
		"Watchwoman",
	)

/datum/round_event/antagonist/solo/vampire
	var/leader = FALSE

/datum/round_event/antagonist/solo/vampire/add_datum_to_mind(datum/mind/antag_mind)
	if(!leader)
		var/datum/job/J = SSjob.GetJob(antag_mind.current?.job)
		J?.current_positions = max(J?.current_positions-1, 0)
		antag_mind.current.unequip_everything()
		antag_mind.add_antag_datum(antag_datum)
		leader = TRUE
		return
	else
		if(!antag_mind.has_antag_datum(antag_datum))
			var/datum/job/J = SSjob.GetJob(antag_mind.current?.job)
			J?.current_positions = max(J?.current_positions-1, 0)
			antag_mind.current.unequip_everything()
			antag_mind.add_antag_datum(/datum/antagonist/vampirelord/lesser)
			return
