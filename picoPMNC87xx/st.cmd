#!../../bin/linux-x86_64/newFocus

< envPaths

#cd "${TOP}"

## Register all support components
dbLoadDatabase "../../dbd/iocxxxLinux.dbd"
iocxxxLinux_registerRecordDeviceDriver pdbbase

cd "${TOP}/iocBoot/${IOC}"

## motorUtil (allstop & alldone)
dbLoadRecords("$(MOTOR)/db/motorUtil.db", "P=BL00:PICOD1:")

##
< PMNC87xx.cmd

iocInit

## motorUtil (allstop & alldone)
motorUtilInit("BL00:PICOD1:")

# Boot complete
