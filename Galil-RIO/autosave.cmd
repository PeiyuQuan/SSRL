####################################################
## save_restore setup
#save_restoreSet_Debug(0)

# status-PV prefix, so save_restore can find its status PV's.
save_restoreSet_status_prefix("BL00:RIO:")

# specify where save files should be
#set_savefile_path(${TOP}, "autosaveSaves")
set_savefile_path("/autosave", "")


# specify directories in which to to search for included request files
# set_requestfile_path(${TOP}, "autosaveReqs")
set_requestfile_path("${GALIL}/GalilSup/Db", "")

dbLoadRecords("$(AUTOSAVE)/asApp/Db/save_restoreStatus.db","P=BL00:RIO:")

# restore settings in pass 0 so encoder ratio is set correctly for position restore in device support init
set_pass0_restoreFile("GalilTest_settings.sav")

## End of autosave set-up
####################################################
