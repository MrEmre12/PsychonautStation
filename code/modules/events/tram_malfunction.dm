#define TRAM_MALFUNCTION_TIME_UPPER 210
#define TRAM_MALFUNCTION_TIME_LOWER 120

/datum/round_event_control/tram_malfunction
	name = "Tram Malfunction"
	typepath = /datum/round_event/tram_malfunction
	weight = 40
	max_occurrences = 4
	earliest_start = 15 MINUTES
	category = EVENT_CATEGORY_ENGINEERING
	description = "Tram crossing signals malfunction, tram collision damage is increased."
	min_wizard_trigger_potency = 0
	max_wizard_trigger_potency = 3

//Check if there's a tram we can cause to malfunction.
/datum/round_event_control/tram_malfunction/can_spawn_event(players_amt, allow_magic = FALSE)
	. = ..()
	if (!.)
		return FALSE

	for(var/tram_id in SStransport.transports_by_type)
		var/datum/transport_controller/linear/tram/tram_ref = SStransport.transports_by_type[tram_id][1]
		if(tram_ref.specific_transport_id == TRAMSTATION_LINE_1)
			return .

	return FALSE

/datum/round_event/tram_malfunction
	announce_when = 1
	end_when = TRAM_MALFUNCTION_TIME_LOWER
	/// The ID of the tram we're going to malfunction
	var/specific_transport_id = TRAMSTATION_LINE_1

/datum/round_event/tram_malfunction/setup()
	end_when = rand(TRAM_MALFUNCTION_TIME_LOWER, TRAM_MALFUNCTION_TIME_UPPER)

/datum/round_event/tram_malfunction/announce()
	priority_announce("Otomasyon kontrol sistemimiz tramvayın bilgisayarı ile bağlantısını kaybetmiştir. Mühendisler sorunu teşhis edip çözerken lütfen daha dikkatli olun.", "[command_name()] Mühendislik Departmanı")

/datum/round_event/tram_malfunction/start()
	for(var/datum/transport_controller/linear/tram/malfunctioning_controller as anything in SStransport.transports_by_type[TRANSPORT_TYPE_TRAM])
		if(malfunctioning_controller.specific_transport_id == specific_transport_id)
			malfunctioning_controller.start_malf_event()
			return

/datum/round_event/tram_malfunction/end()
	for(var/datum/transport_controller/linear/tram/malfunctioning_controller as anything in SStransport.transports_by_type[TRANSPORT_TYPE_TRAM])
		if(malfunctioning_controller.specific_transport_id == specific_transport_id && malfunctioning_controller.controller_status & COMM_ERROR)
			malfunctioning_controller.end_malf_event()
			priority_announce("Tramvaydaki yazılım sıfırlandı, normal faaliyetleri şu anda devam ediyor. Verdiğimiz rahatsızlıktan dolayı özür dileriz.", "[command_name()] Mühendislik Departmanı")
			return

#undef TRAM_MALFUNCTION_TIME_UPPER
#undef TRAM_MALFUNCTION_TIME_LOWER
