GLOBAL_DATUM(revdata, /datum/getrev)

/datum/getrev
	var/branch
	var/revision
	var/date
	var/showinfo
	var/list/testmerge = list()

/datum/getrev/New()
	if(world.TgsAvailable()) // Try TGS maybe
		testmerge = world.TgsTestMerges()
		var/datum/tgs_revision_information/REV = world.TgsRevision()
		if(REV)
			revision = REV.origin_commit || REV.commit
			branch = "-Using TGS-" // TGS doesn't provide branch info yet
			date = "-Using TGS-" // Or date
	
	if(!revision) // File parse method
		var/list/head_branch = file2list(".git/HEAD", "\n")
		if(head_branch.len)
			branch = copytext_char(head_branch[1], 17)

		var/list/head_log = file2list(".git/logs/HEAD", "\n")
		for(var/line=head_log.len, line>=1, line--)
			if(head_log[line])
				var/list/last_entry = splittext(head_log[line], " ")
				if(last_entry.len < 2)	continue
				revision = last_entry[2]
				// Get date/time
				if(last_entry.len >= 5)
					var/unix_time = text2num(last_entry[5])
					if(unix_time)
						date = unix2date(unix_time)
				break

	to_world_log("-Информация о билде-")
	to_world_log("Ветка: [branch]")
	to_world_log("Дата: [date]")
	to_world_log("Ревизия: [revision]")

/datum/getrev/proc/GetTestMergeInfo(header = TRUE)
	. = list()
	if(!testmerge.len)
		return
	if(header)
		. += "Следующие пулл реквесты в режиме тестового мержа:"
	for(var/line in testmerge)
		var/datum/tgs_revision_information/test_merge/tm = line
		var/cm = tm.pull_request_commit
		var/details = ": '" + html_encode(tm.title) + "' от " + html_encode(tm.author) + " в коммите " + html_encode(copytext_char(cm, 1, 11))
		if(details && findtext(details, "\[s\]") && (!usr || !usr.client.holder))
			continue
		. += "<a href=\"[config.githuburl]/pull/[tm.number]\">#[tm.number][details]</a>"

client/verb/showrevinfo()
	set category = "OOC"
	set name = "Показать Ревизию Сервера"
	set desc = "Проверить ревизию текущего билда."

	if(!GLOB.revdata)
		to_chat(src, "<span class='warning'>Пожалуйста, дождитесь окончания инициализации.</span>")
		return
	
	var/list/msg = list()
	
	if(GLOB.revdata.revision)
		msg += "<b>Ревизия сервера:</b> В:[GLOB.revdata.branch] Д:[GLOB.revdata.date]"
		if(config.githuburl)
			msg += "<b>Коммит:</b> <a href='[config.githuburl]/commit/[GLOB.revdata.revision]'>[GLOB.revdata.revision]</a>"
		else
			msg += "<b>Коммит:</b> GLOB.revdata.revision"
	else
		msg += "<b>Ревизия сервера:</b> Неизвестна"

	if(world.TgsAvailable())
		var/datum/tgs_version/version = world.TgsVersion()
		msg += "<b>TGS version:</b> [version.raw_parameter]"
		var/datum/tgs_version/api_version = world.TgsApiVersion()
		msg += "<b>DMAPI version:</b> [api_version.raw_parameter]"

	if(GLOB.revdata.testmerge.len)
		msg += GLOB.revdata.GetTestMergeInfo()

	to_chat(src, msg.Join("<br>"))
