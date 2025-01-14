var/datum/antagonist/revolutionary/revs

/datum/antagonist/revolutionary
	id = MODE_REVOLUTIONARY
	role_text = "Head Revolutionary"
	role_text_plural = "Revolutionaries"
	feedback_tag = "rev_objective"
	antag_indicator = "hudheadrevolutionary"
	welcome_text = "Down with the nobles! Down with the Bourgeoise!"
	victory_text = "The nobles were overthrown! The revolutionaries win!"
	loss_text = "The nobles managed to stop the revolution!"
	victory_feedback_tag = "win - heads killed"
	loss_feedback_tag = "loss - rev heads killed"
	flags = ANTAG_SUSPICIOUS | ANTAG_VOTABLE
	antaghud_indicator = "hudrevolutionary"

	hard_cap = 2
	hard_cap_round = 4
	initial_spawn_req = 2
	initial_spawn_target = 4

	//Inround revs.
	faction_role_text = "Revolutionary"
	faction_descriptor = "Revolution"
	faction_verb = /mob/living/proc/convert_to_rev
	faction_welcome = "Help the cause overturn the ruling class. Do not harm your fellow freedom fighters."
	faction_indicator = "hudrevolutionary"
	faction_invisible = 1
	faction = "revolutionary"

	blacklisted_jobs = list(/datum/job/ai, /datum/job/cyborg)
	restricted_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/inquisitor, /datum/job/acolyte)
	protected_jobs = list(null)


/datum/antagonist/revolutionary/New()
	..()
	revs = src

/datum/antagonist/revolutionary/create_global_objectives()
	if(!..())
		return
	global_objectives = list()
	for(var/mob/living/carbon/human/player in SSmobs.mob_list)
		if(!player.mind || player.stat==DEAD || !(player.mind.assigned_role in GLOB.nobles))
			continue
		var/datum/objective/rev/rev_obj = new
		rev_obj.target = player.mind
		rev_obj.explanation_text = "Assassinate, capture or convert [player.real_name], the [player.mind.assigned_role]."
		global_objectives += rev_obj
