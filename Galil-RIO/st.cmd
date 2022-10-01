#!../../bin/linux-x86_64/GalilTest

< envPaths

#cd ${TOP}

## Register all support components
dbLoadDatabase("../../dbd/iocxxxLinux.dbd",0,0)
iocxxxLinux_registerRecordDeviceDriver(pdbbase)

cd ${TOP}/iocBoot/${IOC}

### Scan-support software
# crate-resident scan.  This executes 1D, 2D, 3D, and 4D scans, and caches
# 1D data, but it doesn't store anything to disk.  (See 'saveData' below for that.)
dbLoadRecords("$(SSCAN)/sscanApp/Db/standardScans.db","P=BL00:RIO:,MAXPTS1=8000,MAXPTS2=1000,MAXPTS3=10,MAXPTS4=10,MAXPTSH=8000")
dbLoadRecords("$(SSCAN)/sscanApp/Db/saveData.db","P=BL00:RIO:")

# Configure an example controller
< galil.cmd

< autosave.cmd

# Start the IOC
iocInit()

# Initialize saveData for step scans
saveData_Init("saveData.req", "P=BL00:RIO:")


# Save motor settings every 30 seconds
create_monitor_set("GalilTest_settings.req", 30,"IOC=IOC01:,P=BL00:RIO:")


# end

