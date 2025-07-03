
#define ENGSEC			(1<<0)

#define CAPTAIN			(1<<0)
#define HOS				(1<<1)
#define WARDEN			(1<<2)
#define DETECTIVE		(1<<3)
#define OFFICER			(1<<4)
#define CHIEF			(1<<5)
#define ENGINEER		(1<<6)
#define ATMOSTECH		(1<<7)
#define ROBOTICIST		(1<<8)
#define AI_JF			(1<<9)
#define CYBORG			(1<<10)


#define MEDSCI			(1<<1)

#define RD_JF			(1<<0)
#define SCIENTIST		(1<<1)
#define CHEMIST			(1<<2)
#define CMO_JF			(1<<3)
#define DOCTOR			(1<<4)
#define GENETICIST		(1<<5)
#define VIROLOGIST		(1<<6)


#define CIVILIAN		(1<<2)

#define HOP				(1<<0)
#define BARTENDER		(1<<1)
#define BOTANIST		(1<<2)
//#define COOK			(1<<3) //This is redefined below, and is a ss13 leftover.
#define JANITOR			(1<<4)
#define CURATOR			(1<<5)
#define QUARTERMASTER	(1<<6)
#define CARGOTECH		(1<<7)
//#define MINER			(1<<8) //This is redefined below, and is a ss13 leftover.
#define LAWYER			(1<<9)
#define CHAPLAIN		(1<<10)
#define CLOWN			(1<<11)
#define MIME			(1<<12)
#define ASSISTANT		(1<<13)

#define JOB_AVAILABLE 0
#define JOB_UNAVAILABLE_GENERIC 1
#define JOB_UNAVAILABLE_BANNED 2
#define JOB_UNAVAILABLE_PLAYTIME 3
#define JOB_UNAVAILABLE_ACCOUNTAGE 4
#define JOB_UNAVAILABLE_PATRON 5
#define JOB_UNAVAILABLE_RACE 6
#define JOB_UNAVAILABLE_SEX 7
#define JOB_UNAVAILABLE_AGE 8
#define JOB_UNAVAILABLE_WTEAM 9
#define JOB_UNAVAILABLE_LASTCLASS 10
#define JOB_UNAVAILABLE_JOB_COOLDOWN 11
#define JOB_UNAVAILABLE_SLOTFULL 12
#define JOB_UNAVAILABLE_VIRTUESVICE 13

#define DEFAULT_RELIGION "Christianity"
#define DEFAULT_DEITY "Space Jesus"

#define JOB_DISPLAY_ORDER_DEFAULT 0

#define JOB_DISPLAY_ORDER_ASSISTANT 1
#define JOB_DISPLAY_ORDER_CAPTAIN 2
#define JOB_DISPLAY_ORDER_HEAD_OF_PERSONNEL 3
#define JOB_DISPLAY_ORDER_QUARTERMASTER 4
#define JOB_DISPLAY_ORDER_CARGO_TECHNICIAN 5
#define JOB_DISPLAY_ORDER_SHAFT_MINER 6
#define JOB_DISPLAY_ORDER_BARTENDER 7
#define JOB_DISPLAY_ORDER_COOK 8
#define JOB_DISPLAY_ORDER_BOTANIST 9
#define JOB_DISPLAY_ORDER_JANITOR 10
#define JOB_DISPLAY_ORDER_CLOWN 11
#define JOB_DISPLAY_ORDER_MIME 12
#define JOB_DISPLAY_ORDER_CURATOR 13
#define JOB_DISPLAY_ORDER_LAWYER 14
#define JOB_DISPLAY_ORDER_CHAPLAIN 15
#define JOB_DISPLAY_ORDER_CHIEF_ENGINEER 16
#define JOB_DISPLAY_ORDER_STATION_ENGINEER 17
#define JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN 18
#define JOB_DISPLAY_ORDER_CHIEF_MEDICAL_OFFICER 19
#define JOB_DISPLAY_ORDER_MEDICAL_DOCTOR 20
#define JOB_DISPLAY_ORDER_CHEMIST 21
#define JOB_DISPLAY_ORDER_GENETICIST 22
#define JOB_DISPLAY_ORDER_VIROLOGIST 23
#define JOB_DISPLAY_ORDER_RESEARCH_DIRECTOR 24
#define JOB_DISPLAY_ORDER_SCIENTIST 25
#define JOB_DISPLAY_ORDER_ROBOTICIST 26
#define JOB_DISPLAY_ORDER_HEAD_OF_SECURITY 27
#define JOB_DISPLAY_ORDER_WARDEN 28
#define JOB_DISPLAY_ORDER_DETECTIVE 29
#define JOB_DISPLAY_ORDER_SECURITY_OFFICER 30
#define JOB_DISPLAY_ORDER_AI 31
#define JOB_DISPLAY_ORDER_CYBORG 32

#define NOBLEMEN		(1<<0)

#define LORD		(1<<0)
#define LADY		(1<<1)
#define HAND		(1<<2)
#define STEWARD		(1<<3)
#define KNIGHT		(1<<4)
#define GUARD_CAPTAIN		(1<<5)
#define HOSTAGE				(1<<6)

#define GARRISON	(1<<1)

#define GUARDSMAN	(1<<0)
#define MANATARMS	(1<<1)
#define GATEMASTER	(1<<2)
#define MASTERATARMS	(1<<3)

#define CHURCHMEN		(1<<2)

#define PRIEST		(1<<0)
#define MONK		(1<<1)
#define GRAVEDIGGER	(1<<2)
#define DRUID		(1<<3)
#define CHAPTERMASTER	(1<<4)
#define TEMPLAR_KNIGHT	(1<<5)
#define TEMPLAR	(1<<6)
#define HOSP_KNIGHT	(1<<7)
#define HOSPITALER	(1<<8)
#define PURITAN			(1<<9)

#define COURTIERS	(1<<3)

#define JESTER		(1<<0)
#define WIZARD		(1<<1)
#define PHYSICIAN 	(1<<2)
#define BUTLER		(1<<3)
#define COUNCILLOR	(1<<4)

#define TOWNER		(1<<4)

#define BARKEEP		(1<<0)
#define ARMORSMITH	(1<<1)
#define WEAPONSMITH (1<<2)
#define BLACKSMITH  (1<<3)
#define LEATHERWORKER	(1<<4)
#define TAILOR		(1<<5)
#define MERCHANT	(1<<6)
#define COOK		(1<<7)
#define APOTHECARY	(1<<8)
#define BUILDER		(1<<9)
#define KNAVEWENCH	(1<<10)
#define APPRENTICE 	(1<<11)

#define CITYWATCH	(1<<5)
#define BAILIFF		(1<<0)
#define WATCHMAN	(1<<1)
#define DUNGEONEER	(1<<2)

#define PEASANTRY	(1<<6)
#define FARMER		(1<<0)
#define SERF		(1<<1)

#define WRETCH		(1<<7)
#define CHURCHLING	(1<<1)
#define SERVANT		(1<<3)
#define ORPHAN		(1<<4)
#define PRINCE		(1<<5)
#define SHOPHAND	(1<<6)

#define MERCENARIES		(1<<8)

#define VETERAN			(1<<1)
#define MERCENARY		(1<<2)
#define DESERT_RIDER	(1<<3)	//Unused
#define GRENZELHOFT		(1<<4)	//Unused


#define RABBLE		(1<<9)

#define NITEMASTER	(1<<0)
#define WENCH		(1<<1)
#define GUTTERFOLK	(1<<2)
#define BANDIT		(1<<3)
#define BEGGAR		(1<<4)
#define ADVENTURER	(1<<5)
#define PILGRIM		(1<<6)
#define MIGRANT		(1<<7)
#define LUNATIC		(1<<8)

#define SLOP (1<<10)

#define TESTER		(1<<0)
#define DEATHKNIGHT (1<<1)
#define SKELETON	(1<<2)
#define GOBLIN		(1<<3)

#define INQUISITION (1<<10)
#define ORTHODOXIST	(1<<1)


#define JCOLOR_NOBLE "#aa83b9"
#define JCOLOR_COURTIER "#81adc8"
#define JCOLOR_CHURCH "#c0ba8d"
#define JCOLOR_SOLDIER "#b18484"
#define JCOLOR_YEOMAN "#819e82"
#define JCOLOR_GUILD "#6e6259"
#define JCOLOR_PEASANT "#b09262"
#define JCOLOR_MERCENARY "#c86e3a"
#define JCOLOR_INQUISITION "#FF0000"

// job display orders //

// Nobles
#define JDO_LORD 1
#define JDO_LADY 1.1
#define JDO_PRINCE 1.2
#define JDO_HAND 1.3

// Courtiers
#define JDO_STEWARD 2
#define JDO_PHYSICIAN 2.1
#define JDO_JESTER 2.2
#define JDO_SERVANT 2.3
#define JDO_COUNCILLOR 2.4

// RETINUE	
#define JDO_KNIGHT 3
#define JDO_MASTERATARMS 3.1
#define JDO_GATEMASTER 3.2
#define JDO_MANATARMS 3.3
#define JDO_TOWNGUARD 3.4

// CHURCH
#define JDO_PRIEST 4
#define JDO_CHAPTERMASTER 4.1
#define JDO_TEMPLAR_KNIGHT 4.2
#define JDO_TEMPLAR 4.3
#define JDO_HOSP_KNIGHT 4.4
#define JDO_HOSPITALER 4.5
#define JDO_MONK 4.6
#define JDO_PURITAN 4.7
#define JDO_CHURCHLING 4.8

// CITYWATCH
#define JDO_BAILIFF 5
#define JDO_WATCHMAN 5.1
#define JDO_DUNGEONEER 5.2

#define JDO_MERCHANT 6
#define JDO_SHOPHAND 6.1
#define JDO_APOTHECARY 6.2
#define JDO_ARMORER 6.3
#define JDO_WEAPONSMITH 6.4
#define JDO_BLACKSMITH 6.5
#define JDO_APPRENTICE 6.6
#define JDO_ARTISAN 6.7
#define JDO_TAILOR 6.8
#define JDO_LEATHERWORKER 6.9
#define JDO_BARKEEP 7
#define JDO_COOK 7.1
#define JDO_NITEMASTER 7.2
#define JDO_BUILDER 7.3

#define JDO_WENCH 7.4

#define JDO_SOILSON 8
#define JDO_VILLAGER 8.1
#define JDO_KNAVEWENCH 8.2
#define JDO_ADVENTURER 8.3
#define JDO_PILGRIM 8.4
#define JDO_MIGRANT 8.5
#define JDO_BANDIT 8.6
#define JDO_WRETCH 8.7
#define JDO_GUTTERFOLK 8.8

#define JDO_MERCENARY 9
#define JDO_GRENZELHOFT 9.1
#define JDO_DESERT_RIDER 9.2
#define JDO_VET 9.3

#define JDO_VAGRANT 10
#define JDO_ORPHAN 10.1

#define JDO_PRISONERR 11
#define JDO_PRISONERB 11.1
#define JDO_HOSTAGE 11.2
#define JDO_LUNATIC 11.3

#define BITFLAG_CHURCH (1<<0)
#define BITFLAG_ROYALTY (1<<1)
#define BITFLAG_CONSTRUCTOR (1<<2)
#define BITFLAG_GARRISON (1<<3)

#define MANOR_ROLES \
	/datum/job/roguetown/jester,\
	/datum/job/roguetown/servant,\
	/datum/job/roguetown/squire,\
	/datum/job/roguetown/physician,

#define NOBLE_ROLES \
	/datum/job/roguetown/prince,\
	/datum/job/roguetown/hand,\
	/datum/job/roguetown/lady,\
	/datum/job/roguetown/lord,\
	/datum/job/roguetown/steward

#define KING_QUEEN_ROLES \
	/datum/job/roguetown/lady,\
	/datum/job/roguetown/lord

#define CHURCH_ROLES \
	/datum/job/roguetown/churchling,\
	/datum/job/roguetown/monk,\
	/datum/job/roguetown/priest,\
	/datum/job/roguetown/chaptermaster,\
	/datum/job/roguetown/puritan,\
	/datum/job/roguetown/templar_knight,\
	/datum/job/roguetown/templar,\
	/datum/job/roguetown/hosp_knight,\
	/datum/job/roguetown/hospitaler,	

#define PEASANT_ROLES \
	/datum/job/roguetown/villager,\
	/datum/job/roguetown/nightmaiden,\
	/datum/job/roguetown/beggar,\
	/datum/job/roguetown/butcher,\
	/datum/job/roguetown/cook,\
	/datum/job/roguetown/knavewench,\
	/datum/job/roguetown/lunatic,\
	/datum/job/roguetown/farmer,\
	/datum/job/roguetown/orphan,\
	/datum/job/roguetown/knavewench,\
	/datum/job/roguetown/shophand,\
	/datum/job/roguetown/bapprentice,\
	/datum/job/roguetown/prisonerb,\
	/datum/job/roguetown/hostage,\
	/datum/job/roguetown/prisonerr




#define TOWNER_ROLES \
	/datum/job/roguetown/niteman,\
	/datum/job/roguetown/barkeep,\
	/datum/job/roguetown/armorsmith,\
	/datum/job/roguetown/weaponsmith,\
	/datum/job/roguetown/blacksmith,\
	/datum/job/roguetown/merchant,\
	/datum/job/roguetown/artisan,\
	/datum/job/roguetown/tailor,\
	/datum/job/roguetown/scribe,\
	/datum/job/roguetown/apothecary,

#define WANDERER_ROLES \
	/datum/job/roguetown/pilgrim,\
	/datum/job/roguetown/adventurer,\
	/datum/job/roguetown/mercenary/desert_rider,\
	/datum/job/roguetown/mercenary/grenzelhoft,\
	/datum/job/roguetown/bandit,\
	/datum/job/roguetown/wretch

#define CITYWATCH_ROLES \
	/datum/job/roguetown/bailiff,\
	/datum/job/roguetown/guardsman,\
	/datum/job/roguetown/dungeoneer

#define GARRISON_ROLES \
	/datum/job/roguetown/knight,\
	/datum/job/roguetown/manatarms,\
	/datum/job/roguetown/masteratarms,\
	/datum/job/roguetown/gatemaster

#define INQUISITION_ROLES \
	/datum/job/roguetown/orthodoxist
