
drvAsynIPPortConfigure("pmnc", "192.168.15.30:23 TCP", 0, 0, 0)

dbLoadTemplate("PMNC87xx.substitutions")

# New Focus Picomotor Network Controller (model 8750/2) (setup parameters:  
#     (1) maximum number of controllers in system 
#     (2) maximum number of drivers per controller (1 - 3)  
#     (3) motor task polling rate (min=1Hz,max=60Hz)  
PMNC87xxSetup(1, 3, 5) 
 
# New Focuc Picomotor Network Controller (model 8750/2) configuration parameters:  
#     (1) controller# being configured, 
#     (2) asyn port name (string)
PMNC87xxConfig(0, "pmnc")
#!drvPMNC87xxdebug=4
