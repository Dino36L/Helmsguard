/datum/round_event_control/antagonist/solo/bandits
	name = "Bandits"
	tags = list(
		TAG_COMBAT,
		TAG_VILLIAN,
		TAG_LOOT
	)
	roundstart = TRUE
	antag_flag = ROLE_BANDIT
	shared_occurence_type = SHARED_MINOR_THREAT

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

	base_antags = 4
	maximum_antags = 6

	earliest_start = 0 SECONDS

	weight = 16

	typepath = /datum/round_event/antagonist/solo/bandits
	antag_datum = /datum/antagonist/bandit

/datum/round_event/antagonist/solo/bandits
	var/leader = FALSE

/datum/round_event/antagonist/solo/bandits/start()
	var/datum/job/bandit_job = SSjob.GetJob("Bandit")
	bandit_job.total_positions = length(setup_minds)
	bandit_job.spawn_positions = length(setup_minds)
	SSmapping.retainer.bandit_goal = rand(200,400) + (length(setup_minds) * rand(200,400))
	for(var/datum/mind/antag_mind as anything in setup_minds)
		var/datum/job/J = SSjob.GetJob(antag_mind.current?.job)
		J?.current_positions = max(J?.current_positions-1, 0)
		antag_mind.current.unequip_everything()
		SSjob.AssignRole(antag_mind.current, "Bandit")
		SSmapping.retainer.bandits |= antag_mind.current
		antag_mind.add_antag_datum(/datum/antagonist/bandit)

		SSrole_class_handler.setup_class_handler(antag_mind.current, list(CTAG_BANDIT = 20))
		antag_mind.current:advsetup = TRUE
		antag_mind.current.hud_used?.set_advclass()

	SSrole_class_handler.bandits_in_round = TRUE
