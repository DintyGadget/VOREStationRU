/datum/event/wormholes
	startWhen	= 0
	endWhen		= 80

/datum/event/wormholes/start()
	wormhole_event()

/datum/event/wormholes/end()
	command_announcement.Announce("На станции больше не обнаружено пространственно-временных аномалий.", "Anomaly Alert")
