/datum/config_entry/flag/fullscreen


/client/verb/toggle_fullscreen_pref()
	set name = "Toggle Fullscreen"
	set category = "Preferences"
	set desc = "Enable / disable fullscreen mode"
	prefs.toggles ^= FULLSCREEN
	prefs.save_preferences()
	to_chat(usr, "Fullscreen mode [(usr.client.prefs.toggles & FULLSCREEN) ? "Enabled" : "Disabled"]")
	SSblackbox.record_feedback("nested tally", "preferences_verb", 1, list("Toggle Fullscreen", "[prefs.toggles & FULLSCREEN ? "Enabled" : "Disabled"]"))
	check_fullscreen()

/client/proc/check_fullscreen()
	if(prefs.toggles & FULLSCREEN)
		winset(src, "mainwindow", "is-maximized=false;can-resize=false;titlebar=false;menu=")
		winset(src, "mainwindow", "is-maximized=true")
	else
		winset(src, "mainwindow", "is-maximized=false;can-resize=true;titlebar=true;menu=menu")