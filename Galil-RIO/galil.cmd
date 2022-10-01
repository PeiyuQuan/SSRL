

#Load DMC controller features (eg.  Limit switch type, home switch type, output compare, message consoles)
#dbLoadTemplate("$(TOP)/GalilTestApp/Db/galil_dmc_ctrl.substitutions")

#Load RIO controller features (eg.  Model, IP address, message consoles)
#dbLoadTemplate("$(TOP)/GalilTestApp/Db/galil_rio_ctrl.substitutions")

#Load digital IO databases
#dbLoadTemplate("$(TOP)/GalilTestApp/Db/galil_digital_ports.substitutions")

#Load analog IO databases
dbLoadTemplate("$(GALIL)/GalilTestApp/Db/galil_analog_ports.substitutions")

#Load user defined array support
#dbLoadTemplate("$(TOP)/GalilTestApp/Db/galil_user_array.substitutions")

# GalilCreateController command parameters are:
#
# 1. Const char *portName 	- The name of the asyn port that will be created for this controller
# 2. Const char *address 	- The address of the controller
# 3. double updatePeriod	- The time in ms between datarecords 2ms min, 200ms max.  Async if controller + bus supports it, otherwise is polled/synchronous.
#                       	- Recommend 50ms or less for ethernet
#                       	- Specify negative updatePeriod < 0 to force synchronous tcp poll period.  Otherwise will try async udp mode first


# Create a Galil controller
GalilCreateController("RIO", "192.168.62.74", 2)


# Start the controller
GalilStartController("RIO", "", 1, 0)

