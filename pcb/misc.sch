EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 30 30
Title "Add'l aux. functions"
Date ""
Rev "2.0"
Comp "RespiraWorks"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1650 2550 0    50   BiDi ~ 0
CC-SDA
Text HLabel 1650 2450 0    50   Input ~ 0
CC-SCL
$Comp
L Timer_RTC:PCF85363ATT U?
U 1 1 6017F9A5
P 3350 2650
F 0 "U?" H 3800 2600 50  0000 L CNN
F 1 "PCF85363ATT" H 3800 2500 50  0000 L CNN
F 2 "Package_SO:TSSOP-8_3x3mm_P0.65mm" H 3350 1800 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/PCF85363A.pdf" H 3350 2450 50  0001 C CNN
	1    3350 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y?
U 1 1 60180690
P 2250 2900
F 0 "Y?" V 2204 3031 50  0000 L CNN
F 1 "32.768 kHz" V 2295 3031 50  0000 L CNN
F 2 "RespiraWorks:Crystal_SMD_Abracon_ABS05" H 2250 2900 50  0001 C CNN
F 3 "~" H 2250 2900 50  0001 C CNN
F 4 "Abracon" V 2250 2900 50  0001 C CNN "Manufacturer"
F 5 "ABS05-32.768KHZ-T" V 2250 2900 50  0001 C CNN "Part Number"
	1    2250 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 2750 2850 2750
Wire Wire Line
	2850 2850 2850 3050
Wire Wire Line
	2850 3050 2250 3050
$Comp
L power:GND #PWR?
U 1 1 60181FAB
P 3350 3050
AR Path="/5FCD4B8E/5FCD4BC5/60181FAB" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4B8E/5FE27F70/60181FAB" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4D85/60181FAB" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/60181FAB" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/600630A6/60181FAB" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/60073FCF/60181FAB" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007AC3B/60181FAB" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007BD34/60181FAB" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007DA64/60181FAB" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007E2BB/60181FAB" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/600CF516/60181FAB" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/60181FAB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3350 2800 50  0001 C CNN
F 1 "GND" H 3355 2877 50  0000 C CNN
F 2 "" H 3350 3050 50  0001 C CNN
F 3 "" H 3350 3050 50  0001 C CNN
	1    3350 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60185478
P 3000 1850
AR Path="/60185478" Ref="C?"  Part="1" 
AR Path="/5E8AFE9D/60185478" Ref="C?"  Part="1" 
AR Path="/5E8FBD97/60185478" Ref="C?"  Part="1" 
AR Path="/5E8E0754/60185478" Ref="C?"  Part="1" 
AR Path="/5E8DFCAD/60185478" Ref="C?"  Part="1" 
AR Path="/5E8DEDC0/60185478" Ref="C?"  Part="1" 
AR Path="/5E8C8865/60185478" Ref="C?"  Part="1" 
AR Path="/5E8E1F08/60185478" Ref="C?"  Part="1" 
AR Path="/5FCD4DF5/60185478" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/60185478" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/60185478" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/60185478" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/60185478" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/60185478" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/60185478" Ref="C?"  Part="1" 
AR Path="/6017BD7E/60185478" Ref="C?"  Part="1" 
F 0 "C?" H 3100 1650 50  0000 C CNN
F 1 "100nF 100V X7R" H 3350 1750 50  0000 C CNN
F 2 "RespiraWorks_Std:C_0603_1608Metric" H 3038 1700 50  0001 C CNN
F 3 "~" H 3000 1850 50  0001 C CNN
F 4 "" H 3000 1850 50  0001 C CNN "Manufacturer"
F 5 "" H 3000 1850 50  0001 C CNN "Part Number"
	1    3000 1850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6018547E
P 3000 2000
AR Path="/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5E8FBD97/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5E8E0754/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5E8DFCAD/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5E8DEDC0/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5E8C8865/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/6018547E" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/6018547E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3000 1750 50  0001 C CNN
F 1 "GND" H 3005 1827 50  0000 C CNN
F 2 "" H 3000 2000 50  0001 C CNN
F 3 "" H 3000 2000 50  0001 C CNN
	1    3000 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 1700 3250 2250
Wire Wire Line
	3000 1700 3250 1700
$Comp
L RespiraWorks:+3.3V_Ctrl #PWR?
U 1 1 60185739
P 3250 1250
F 0 "#PWR?" H 3250 1250 50  0001 C CNN
F 1 "+3.3V_Ctrl" H 3235 1423 50  0000 C CNN
F 2 "" H 3250 1250 50  0001 C CNN
F 3 "" H 3250 1250 50  0001 C CNN
	1    3250 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60187042
P 3700 1850
AR Path="/60187042" Ref="C?"  Part="1" 
AR Path="/5E8AFE9D/60187042" Ref="C?"  Part="1" 
AR Path="/5E8FBD97/60187042" Ref="C?"  Part="1" 
AR Path="/5E8E0754/60187042" Ref="C?"  Part="1" 
AR Path="/5E8DFCAD/60187042" Ref="C?"  Part="1" 
AR Path="/5E8DEDC0/60187042" Ref="C?"  Part="1" 
AR Path="/5E8C8865/60187042" Ref="C?"  Part="1" 
AR Path="/5E8E1F08/60187042" Ref="C?"  Part="1" 
AR Path="/5FCD4DF5/60187042" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/60187042" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/60187042" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/60187042" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/60187042" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/60187042" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/60187042" Ref="C?"  Part="1" 
AR Path="/6017BD7E/60187042" Ref="C?"  Part="1" 
F 0 "C?" H 3800 1650 50  0000 C CNN
F 1 "100nF 100V X7R" H 4050 1750 50  0000 C CNN
F 2 "RespiraWorks_Std:C_0603_1608Metric" H 3738 1700 50  0001 C CNN
F 3 "~" H 3700 1850 50  0001 C CNN
F 4 "" H 3700 1850 50  0001 C CNN "Manufacturer"
F 5 "" H 3700 1850 50  0001 C CNN "Part Number"
	1    3700 1850
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60187048
P 3700 2000
AR Path="/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5E8FBD97/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5E8E0754/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5E8DFCAD/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5E8DEDC0/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5E8C8865/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/60187048" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/60187048" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/60187048" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3700 1750 50  0001 C CNN
F 1 "GND" H 3705 1827 50  0000 C CNN
F 2 "" H 3700 2000 50  0001 C CNN
F 3 "" H 3700 2000 50  0001 C CNN
	1    3700 2000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3700 1700 3600 1700
Wire Wire Line
	3350 1700 3350 2250
$Comp
L Device:Jumper_NC_Small JP?
U 1 1 6018A29B
P 3600 1350
F 0 "JP?" V 3600 1425 50  0000 L CNN
F 1 "Jumper_NC_Small" V 3645 1424 50  0001 L CNN
F 2 "" H 3600 1350 50  0001 C CNN
F 3 "~" H 3600 1350 50  0001 C CNN
	1    3600 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 1450 3600 1500
Connection ~ 3600 1700
Wire Wire Line
	3600 1700 3350 1700
$Comp
L Device:Jumper_NO_Small JP?
U 1 1 6018DDFF
P 3400 1500
F 0 "JP?" H 3400 1593 50  0000 C CNN
F 1 "Jumper_NO_Small" H 3400 1594 50  0001 C CNN
F 2 "" H 3400 1500 50  0001 C CNN
F 3 "~" H 3400 1500 50  0001 C CNN
	1    3400 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1500 3250 1500
Wire Wire Line
	3250 1500 3250 1250
Wire Wire Line
	3250 1500 3250 1700
Connection ~ 3250 1500
Connection ~ 3250 1700
Wire Wire Line
	3500 1500 3600 1500
Connection ~ 3600 1500
Wire Wire Line
	3600 1500 3600 1700
Text Notes 4000 1450 0    50   ~ 0
Break NC jumper and solder NO\njumper to disable RTC battery
NoConn ~ 3850 2550
$Comp
L Device:Battery_Cell BT?
U 1 1 60191BD9
P 5550 1350
F 0 "BT?" H 5668 1446 50  0000 L CNN
F 1 "CR2016" H 5668 1355 50  0000 L CNN
F 2 "" V 5550 1410 50  0001 C CNN
F 3 "~" V 5550 1410 50  0001 C CNN
	1    5550 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1250 3600 1150
Wire Wire Line
	3600 1150 5550 1150
$Comp
L power:GND #PWR?
U 1 1 60192E03
P 5550 1450
AR Path="/5FCD4B8E/5FCD4BC5/60192E03" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4B8E/5FE27F70/60192E03" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4D85/60192E03" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/60192E03" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/600630A6/60192E03" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/60073FCF/60192E03" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007AC3B/60192E03" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007BD34/60192E03" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007DA64/60192E03" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007E2BB/60192E03" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/600CF516/60192E03" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/60192E03" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5550 1200 50  0001 C CNN
F 1 "GND" H 5555 1277 50  0000 C CNN
F 2 "" H 5550 1450 50  0001 C CNN
F 3 "" H 5550 1450 50  0001 C CNN
	1    5550 1450
	1    0    0    -1  
$EndComp
Text Notes 2850 3400 0    50   ~ 0
I2C address: 1010 001
Text HLabel 1950 8950 0    50   Input ~ 0
Blower_Ctrl
$Comp
L Transistor_BJT:MMBT3904 Q?
U 1 1 601A096C
P 3000 8950
AR Path="/5FCD4DF5/601A096C" Ref="Q?"  Part="1" 
AR Path="/5FCD4B8E/601A096C" Ref="Q?"  Part="1" 
AR Path="/6017BD7E/601A096C" Ref="Q?"  Part="1" 
F 0 "Q?" H 3250 8950 50  0000 L CNN
F 1 "MMBT3904" H 3200 8850 50  0000 L CNN
F 2 "Ventilator:SOT-23" H 3200 8875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3000 8950 50  0001 L CNN
F 4 "Diodes Inc." H 3000 8950 50  0001 C CNN "Manufacturer"
F 5 "MMBT3904-7-F" H 3000 8950 50  0001 C CNN "Part Number"
	1    3000 8950
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:MMBT3906 Q?
U 1 1 601A097C
P 3300 8450
AR Path="/5FCD4DF5/601A097C" Ref="Q?"  Part="1" 
AR Path="/5FCD4B8E/601A097C" Ref="Q?"  Part="1" 
AR Path="/6017BD7E/601A097C" Ref="Q?"  Part="1" 
F 0 "Q?" H 3600 8400 50  0000 C CNN
F 1 "MMBT3906" H 3700 8500 50  0000 C CNN
F 2 "Ventilator:SOT-23" H 3500 8375 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3906.pdf" H 3300 8450 50  0001 L CNN
F 4 "Nexperia" H 3300 8450 50  0001 C CNN "Manufacturer"
F 5 "MMBT3906,215" H 3300 8450 50  0001 C CNN "Part Number"
	1    3300 8450
	1    0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 601A0989
P 2500 9100
AR Path="/601A0989" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/601A0989" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/601A0989" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/601A0989" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/601A0989" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/601A0989" Ref="R?"  Part="1" 
AR Path="/6017BD7E/601A0989" Ref="R?"  Part="1" 
F 0 "R?" H 2350 9150 50  0000 C CNN
F 1 "1K 1%" H 2300 9050 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 2430 9100 50  0001 C CNN
F 3 "~" H 2500 9100 50  0001 C CNN
F 4 "" H 2500 9100 50  0001 C CNN "Manufacturer"
F 5 "" H 2500 9100 50  0001 C CNN "Part Number"
	1    2500 9100
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 601A098F
P 3100 9150
AR Path="/601A098F" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/601A098F" Ref="#PWR?"  Part="1" 
AR Path="/5E8A4ABF/601A098F" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/601A098F" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/601A098F" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4B8E/601A098F" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/601A098F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3100 8900 50  0001 C CNN
F 1 "GND" H 3105 8977 50  0000 C CNN
F 2 "" H 3100 9150 50  0001 C CNN
F 3 "" H 3100 9150 50  0001 C CNN
	1    3100 9150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 601A57F6
P 2250 8950
AR Path="/601A57F6" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/601A57F6" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/601A57F6" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/601A57F6" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/601A57F6" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/601A57F6" Ref="R?"  Part="1" 
AR Path="/6017BD7E/601A57F6" Ref="R?"  Part="1" 
F 0 "R?" V 2450 8950 50  0000 C CNN
F 1 "1K 1%" V 2350 8950 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 2180 8950 50  0001 C CNN
F 3 "~" H 2250 8950 50  0001 C CNN
F 4 "" H 2250 8950 50  0001 C CNN "Manufacturer"
F 5 "" H 2250 8950 50  0001 C CNN "Part Number"
	1    2250 8950
	0    1    -1   0   
$EndComp
Wire Wire Line
	2400 8950 2500 8950
Connection ~ 2500 8950
$Comp
L power:GND #PWR?
U 1 1 601A65EC
P 2500 9250
AR Path="/601A65EC" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/601A65EC" Ref="#PWR?"  Part="1" 
AR Path="/5E8A4ABF/601A65EC" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/601A65EC" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/601A65EC" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4B8E/601A65EC" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/601A65EC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2500 9000 50  0001 C CNN
F 1 "GND" H 2505 9077 50  0000 C CNN
F 2 "" H 2500 9250 50  0001 C CNN
F 3 "" H 2500 9250 50  0001 C CNN
	1    2500 9250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 8950 2800 8950
$Comp
L Device:R R?
U 1 1 601A9B8D
P 3100 8300
AR Path="/601A9B8D" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/601A9B8D" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/601A9B8D" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/601A9B8D" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/601A9B8D" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/601A9B8D" Ref="R?"  Part="1" 
AR Path="/6017BD7E/601A9B8D" Ref="R?"  Part="1" 
F 0 "R?" H 2950 8350 50  0000 C CNN
F 1 "1K 1%" H 2900 8250 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 3030 8300 50  0001 C CNN
F 3 "~" H 3100 8300 50  0001 C CNN
F 4 "" H 3100 8300 50  0001 C CNN "Manufacturer"
F 5 "" H 3100 8300 50  0001 C CNN "Part Number"
	1    3100 8300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 601A9F75
P 3100 8600
AR Path="/601A9F75" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/601A9F75" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/601A9F75" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/601A9F75" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/601A9F75" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/601A9F75" Ref="R?"  Part="1" 
AR Path="/6017BD7E/601A9F75" Ref="R?"  Part="1" 
F 0 "R?" H 2950 8650 50  0000 C CNN
F 1 "1K 1%" H 2900 8550 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 3030 8600 50  0001 C CNN
F 3 "~" H 3100 8600 50  0001 C CNN
F 4 "" H 3100 8600 50  0001 C CNN "Manufacturer"
F 5 "" H 3100 8600 50  0001 C CNN "Part Number"
	1    3100 8600
	1    0    0    -1  
$EndComp
Connection ~ 3100 8450
$Comp
L power:+5V #PWR?
U 1 1 601AC55D
P 3100 7800
F 0 "#PWR?" H 3100 7650 50  0001 C CNN
F 1 "+5V" H 3115 7973 50  0000 C CNN
F 2 "" H 3100 7800 50  0001 C CNN
F 3 "" H 3100 7800 50  0001 C CNN
	1    3100 7800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 8650 4000 8650
Wire Wire Line
	1950 8950 2100 8950
$Comp
L Device:R R?
U 1 1 601AE14E
P 4250 8800
AR Path="/601AE14E" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/601AE14E" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/601AE14E" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/601AE14E" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/601AE14E" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/601AE14E" Ref="R?"  Part="1" 
AR Path="/6017BD7E/601AE14E" Ref="R?"  Part="1" 
F 0 "R?" H 4100 8850 50  0000 C CNN
F 1 "1K 1%" H 4050 8750 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 4180 8800 50  0001 C CNN
F 3 "~" H 4250 8800 50  0001 C CNN
F 4 "" H 4250 8800 50  0001 C CNN "Manufacturer"
F 5 "" H 4250 8800 50  0001 C CNN "Part Number"
	1    4250 8800
	-1   0    0    -1  
$EndComp
Connection ~ 4250 8650
$Comp
L power:GND #PWR?
U 1 1 601AE53D
P 4250 8950
AR Path="/601AE53D" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/601AE53D" Ref="#PWR?"  Part="1" 
AR Path="/5E8A4ABF/601AE53D" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/601AE53D" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/601AE53D" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4B8E/601AE53D" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/601AE53D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4250 8700 50  0001 C CNN
F 1 "GND" H 4255 8777 50  0000 C CNN
F 2 "" H 4250 8950 50  0001 C CNN
F 3 "" H 4250 8950 50  0001 C CNN
	1    4250 8950
	1    0    0    -1  
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 601B9B7B
P 3200 9700
AR Path="/5E8FBD97/601B9B7B" Ref="D?"  Part="1" 
AR Path="/5E8DEDC0/601B9B7B" Ref="D?"  Part="1" 
AR Path="/5E8DFCAD/601B9B7B" Ref="D?"  Part="1" 
AR Path="/5E8E0754/601B9B7B" Ref="D?"  Part="1" 
AR Path="/5E8E1F08/601B9B7B" Ref="D?"  Part="1" 
AR Path="/601B9B7B" Ref="D?"  Part="1" 
AR Path="/5FCD4DF5/601B9B7B" Ref="D?"  Part="1" 
AR Path="/5FCD4B8E/601B9B7B" Ref="D?"  Part="1" 
AR Path="/6017BD7E/601B9B7B" Ref="D?"  Part="1" 
F 0 "D?" H 3100 9600 50  0000 L CNN
F 1 "1N4448W" H 3000 9500 50  0000 L CNN
F 2 "RespiraWorks_Std:D_SOD-123" H 3200 9700 50  0001 C CNN
F 3 "~" H 3200 9700 50  0001 C CNN
F 4 "" H 3200 9700 50  0001 C CNN "Manufacturer"
F 5 "" H 3200 9700 50  0001 C CNN "Part Number"
	1    3200 9700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 9700 2100 9700
Wire Wire Line
	2100 9700 2100 8950
Connection ~ 2100 8950
Wire Wire Line
	3350 9700 4000 9700
Wire Wire Line
	4000 9700 4000 8650
Connection ~ 4000 8650
Wire Wire Line
	4000 8650 4250 8650
$Comp
L Connector_Generic:Conn_01x03 J?
U 1 1 601BE689
P 5050 8650
AR Path="/5FCD4EEA/600F5EF3/601BE689" Ref="J?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/601BE689" Ref="J?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/601BE689" Ref="J?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/601BE689" Ref="J?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/601BE689" Ref="J?"  Part="1" 
AR Path="/5FCD4EEA/601BE689" Ref="J?"  Part="1" 
AR Path="/6017BD7E/601BE689" Ref="J?"  Part="1" 
F 0 "J?" H 4968 8967 50  0000 C CNN
F 1 "Molex Micro-Fit" H 4968 8876 50  0000 C CNN
F 2 "RespiraWorks_Std:Molex_Micro-Fit_3.0_43650-0315_1x03_P3.00mm_Vertical" H 5050 8650 50  0001 C CNN
F 3 "~" H 5050 8650 50  0001 C CNN
	1    5050 8650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 8650 4850 8650
$Comp
L power:GND #PWR?
U 1 1 601BEFD4
P 4850 8750
AR Path="/601BEFD4" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/601BEFD4" Ref="#PWR?"  Part="1" 
AR Path="/5E8A4ABF/601BEFD4" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/601BEFD4" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/601BEFD4" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4B8E/601BEFD4" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/601BEFD4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4850 8500 50  0001 C CNN
F 1 "GND" H 4855 8577 50  0000 C CNN
F 2 "" H 4850 8750 50  0001 C CNN
F 3 "" H 4850 8750 50  0001 C CNN
	1    4850 8750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 601BF210
P 4500 8400
F 0 "#PWR?" H 4500 8250 50  0001 C CNN
F 1 "+5V" H 4515 8573 50  0000 C CNN
F 2 "" H 4500 8400 50  0001 C CNN
F 3 "" H 4500 8400 50  0001 C CNN
	1    4500 8400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 8400 4500 8550
Wire Wire Line
	4500 8550 4850 8550
$Comp
L Device:C C?
U 1 1 601C2B44
P 3700 7950
AR Path="/601C2B44" Ref="C?"  Part="1" 
AR Path="/5E8AFE9D/601C2B44" Ref="C?"  Part="1" 
AR Path="/5E8FBD97/601C2B44" Ref="C?"  Part="1" 
AR Path="/5E8E0754/601C2B44" Ref="C?"  Part="1" 
AR Path="/5E8DFCAD/601C2B44" Ref="C?"  Part="1" 
AR Path="/5E8DEDC0/601C2B44" Ref="C?"  Part="1" 
AR Path="/5E8C8865/601C2B44" Ref="C?"  Part="1" 
AR Path="/5E8E1F08/601C2B44" Ref="C?"  Part="1" 
AR Path="/5FCD4DF5/601C2B44" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/601C2B44" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/601C2B44" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/601C2B44" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/601C2B44" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/601C2B44" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/601C2B44" Ref="C?"  Part="1" 
AR Path="/6017BD7E/601C2B44" Ref="C?"  Part="1" 
F 0 "C?" H 3800 7750 50  0000 C CNN
F 1 "100nF 100V X7R" H 4050 7850 50  0000 C CNN
F 2 "RespiraWorks_Std:C_0603_1608Metric" H 3738 7800 50  0001 C CNN
F 3 "~" H 3700 7950 50  0001 C CNN
F 4 "" H 3700 7950 50  0001 C CNN "Manufacturer"
F 5 "" H 3700 7950 50  0001 C CNN "Part Number"
	1    3700 7950
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 601C2B4A
P 3700 8100
AR Path="/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5E8FBD97/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5E8E0754/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5E8DFCAD/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5E8DEDC0/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5E8C8865/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/601C2B4A" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/601C2B4A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3700 7850 50  0001 C CNN
F 1 "GND" H 3705 7927 50  0000 C CNN
F 2 "" H 3700 8100 50  0001 C CNN
F 3 "" H 3700 8100 50  0001 C CNN
	1    3700 8100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3700 7800 3400 7800
Wire Wire Line
	3100 7800 3100 8150
Connection ~ 3400 7800
Wire Wire Line
	3400 7800 3100 7800
Wire Wire Line
	3400 8250 3400 7800
Connection ~ 3100 7800
Text Notes 5150 8650 0    50   ~ 0
Blower control
$Comp
L RespiraWorks:24LC256T-I_MS U?
U 1 1 601D3E25
P 3400 5350
F 0 "U?" H 3550 5800 50  0000 C CNN
F 1 "24LC256T-I_MS" H 3800 5700 50  0000 C CNN
F 2 "RespiraWorks_Std:TSSOP-8_3x3mm_P0.65mm" H 3400 5300 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/24AA256-24LC256-24FC256-Data-Sheet-20001203W.pdf" H 2250 4500 50  0001 C CNN
	1    3400 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 601D48B4
P 3400 5750
AR Path="/5FCD4B8E/5FCD4BC5/601D48B4" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4B8E/5FE27F70/601D48B4" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4D85/601D48B4" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/601D48B4" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/600630A6/601D48B4" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/60073FCF/601D48B4" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007AC3B/601D48B4" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007BD34/601D48B4" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007DA64/601D48B4" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007E2BB/601D48B4" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/600CF516/601D48B4" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/601D48B4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3400 5500 50  0001 C CNN
F 1 "GND" H 3405 5577 50  0000 C CNN
F 2 "" H 3400 5750 50  0001 C CNN
F 3 "" H 3400 5750 50  0001 C CNN
	1    3400 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 601D6F1E
P 3150 4550
AR Path="/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5E8AFE9D/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5E8FBD97/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5E8E0754/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5E8DFCAD/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5E8DEDC0/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5E8C8865/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5E8E1F08/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5FCD4DF5/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/601D6F1E" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/601D6F1E" Ref="C?"  Part="1" 
AR Path="/6017BD7E/601D6F1E" Ref="C?"  Part="1" 
F 0 "C?" H 3250 4350 50  0000 C CNN
F 1 "100nF 100V X7R" H 3500 4450 50  0000 C CNN
F 2 "RespiraWorks_Std:C_0603_1608Metric" H 3188 4400 50  0001 C CNN
F 3 "~" H 3150 4550 50  0001 C CNN
F 4 "" H 3150 4550 50  0001 C CNN "Manufacturer"
F 5 "" H 3150 4550 50  0001 C CNN "Part Number"
	1    3150 4550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 601D6F24
P 3150 4700
AR Path="/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5E8FBD97/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5E8E0754/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5E8DFCAD/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5E8DEDC0/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5E8C8865/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/601D6F24" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/601D6F24" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3150 4450 50  0001 C CNN
F 1 "GND" H 3155 4527 50  0000 C CNN
F 2 "" H 3150 4700 50  0001 C CNN
F 3 "" H 3150 4700 50  0001 C CNN
	1    3150 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4400 3400 4950
Wire Wire Line
	3150 4400 3400 4400
$Comp
L RespiraWorks:+3.3V_Ctrl #PWR?
U 1 1 601D6F2C
P 3400 4350
F 0 "#PWR?" H 3400 4350 50  0001 C CNN
F 1 "+3.3V_Ctrl" H 3385 4523 50  0000 C CNN
F 2 "" H 3400 4350 50  0001 C CNN
F 3 "" H 3400 4350 50  0001 C CNN
	1    3400 4350
	1    0    0    -1  
$EndComp
Connection ~ 3400 4400
Wire Wire Line
	3400 4350 3400 4400
$Comp
L power:GND #PWR?
U 1 1 601D9DBF
P 2650 5150
AR Path="/5FCD4B8E/5FCD4BC5/601D9DBF" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4B8E/5FE27F70/601D9DBF" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4D85/601D9DBF" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/601D9DBF" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/600630A6/601D9DBF" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/60073FCF/601D9DBF" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007AC3B/601D9DBF" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007BD34/601D9DBF" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007DA64/601D9DBF" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/6007E2BB/601D9DBF" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4E9D/600CF516/601D9DBF" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/601D9DBF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2650 4900 50  0001 C CNN
F 1 "GND" H 2655 4977 50  0000 C CNN
F 2 "" H 2650 5150 50  0001 C CNN
F 3 "" H 2650 5150 50  0001 C CNN
	1    2650 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5150 2800 5150
Text Notes 2900 6100 0    50   ~ 0
I2C address: 1010 000
Wire Wire Line
	3000 5300 2800 5300
Wire Wire Line
	2800 5300 2800 5150
Connection ~ 2800 5150
Wire Wire Line
	2800 5150 2650 5150
Wire Wire Line
	3000 5450 1850 5450
Wire Wire Line
	1850 5450 1850 2550
Wire Wire Line
	1650 2550 1850 2550
Connection ~ 1850 2550
Wire Wire Line
	1850 2550 2850 2550
Wire Wire Line
	1650 2450 1750 2450
Wire Wire Line
	3000 5550 1750 5550
Wire Wire Line
	1750 5550 1750 2450
Connection ~ 1750 2450
Wire Wire Line
	1750 2450 2850 2450
$Comp
L RespiraWorks_Std:TCA9544APWR U?
U 1 1 601E8307
P 8800 7250
F 0 "U?" H 8950 8200 50  0000 C CNN
F 1 "TCA9544APWR" H 9150 8100 50  0000 C CNN
F 2 "RespiraWorks_Std:TSSOP-20_4.4x6.5mm_P0.65mm" H 9800 6350 50  0001 C CNN
F 3 "" H 8850 7500 50  0001 C CNN
	1    8800 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 6550 6850 6550
Wire Wire Line
	1750 6550 1750 5550
Connection ~ 1750 5550
Wire Wire Line
	1850 5450 1850 6650
Wire Wire Line
	1850 6650 7150 6650
Connection ~ 1850 5450
$Comp
L Device:C C?
U 1 1 601F3387
P 8550 5950
AR Path="/601F3387" Ref="C?"  Part="1" 
AR Path="/5E8AFE9D/601F3387" Ref="C?"  Part="1" 
AR Path="/5E8FBD97/601F3387" Ref="C?"  Part="1" 
AR Path="/5E8E0754/601F3387" Ref="C?"  Part="1" 
AR Path="/5E8DFCAD/601F3387" Ref="C?"  Part="1" 
AR Path="/5E8DEDC0/601F3387" Ref="C?"  Part="1" 
AR Path="/5E8C8865/601F3387" Ref="C?"  Part="1" 
AR Path="/5E8E1F08/601F3387" Ref="C?"  Part="1" 
AR Path="/5FCD4DF5/601F3387" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/601F3387" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/601F3387" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/601F3387" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/601F3387" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/601F3387" Ref="C?"  Part="1" 
AR Path="/5FCD4EEA/601F3387" Ref="C?"  Part="1" 
AR Path="/6017BD7E/601F3387" Ref="C?"  Part="1" 
F 0 "C?" H 8650 5750 50  0000 C CNN
F 1 "100nF 100V X7R" H 8900 5850 50  0000 C CNN
F 2 "RespiraWorks_Std:C_0603_1608Metric" H 8588 5800 50  0001 C CNN
F 3 "~" H 8550 5950 50  0001 C CNN
F 4 "" H 8550 5950 50  0001 C CNN "Manufacturer"
F 5 "" H 8550 5950 50  0001 C CNN "Part Number"
	1    8550 5950
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 601F338D
P 8550 6100
AR Path="/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5E8FBD97/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5E8E0754/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5E8DFCAD/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5E8DEDC0/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5E8C8865/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/601F338D" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/601F338D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8550 5850 50  0001 C CNN
F 1 "GND" H 8555 5927 50  0000 C CNN
F 2 "" H 8550 6100 50  0001 C CNN
F 3 "" H 8550 6100 50  0001 C CNN
	1    8550 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 5800 8800 6350
Wire Wire Line
	8550 5800 8800 5800
$Comp
L RespiraWorks:+3.3V_Ctrl #PWR?
U 1 1 601F3395
P 8800 5750
F 0 "#PWR?" H 8800 5750 50  0001 C CNN
F 1 "+3.3V_Ctrl" H 8785 5923 50  0000 C CNN
F 2 "" H 8800 5750 50  0001 C CNN
F 3 "" H 8800 5750 50  0001 C CNN
	1    8800 5750
	1    0    0    -1  
$EndComp
Connection ~ 8800 5800
Wire Wire Line
	8800 5750 8800 5800
$Comp
L power:GND #PWR?
U 1 1 601F8551
P 8800 8250
AR Path="/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5E8FBD97/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5E8E0754/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5E8DFCAD/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5E8DEDC0/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5E8C8865/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/601F8551" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/601F8551" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8800 8000 50  0001 C CNN
F 1 "GND" H 8805 8077 50  0000 C CNN
F 2 "" H 8800 8250 50  0001 C CNN
F 3 "" H 8800 8250 50  0001 C CNN
	1    8800 8250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 601FAEF0
P 8400 8050
AR Path="/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5E8FBD97/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5E8E0754/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5E8DFCAD/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5E8DEDC0/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5E8C8865/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/601FAEF0" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/601FAEF0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8400 7800 50  0001 C CNN
F 1 "GND" H 8405 7877 50  0000 C CNN
F 2 "" H 8400 8050 50  0001 C CNN
F 3 "" H 8400 8050 50  0001 C CNN
	1    8400 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 8050 8400 7950
Connection ~ 8400 7850
Wire Wire Line
	8400 7850 8400 7750
Connection ~ 8400 7950
Wire Wire Line
	8400 7950 8400 7850
$Comp
L Device:R R?
U 1 1 601FE129
P 9500 6150
AR Path="/601FE129" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/601FE129" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/601FE129" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/601FE129" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/601FE129" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/601FE129" Ref="R?"  Part="1" 
AR Path="/6017BD7E/601FE129" Ref="R?"  Part="1" 
F 0 "R?" V 9300 6150 50  0000 C CNN
F 1 "4.7K 1%" V 9400 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 9430 6150 50  0001 C CNN
F 3 "~" H 9500 6150 50  0001 C CNN
F 4 "" H 9500 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 9500 6150 50  0001 C CNN "Part Number"
	1    9500 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 602038B8
P 9800 6150
AR Path="/602038B8" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/602038B8" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/602038B8" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/602038B8" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/602038B8" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/602038B8" Ref="R?"  Part="1" 
AR Path="/6017BD7E/602038B8" Ref="R?"  Part="1" 
F 0 "R?" V 9600 6150 50  0000 C CNN
F 1 "4.7K 1%" V 9700 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 9730 6150 50  0001 C CNN
F 3 "~" H 9800 6150 50  0001 C CNN
F 4 "" H 9800 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 9800 6150 50  0001 C CNN "Part Number"
	1    9800 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60203B02
P 10100 6150
AR Path="/60203B02" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/60203B02" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/60203B02" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/60203B02" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/60203B02" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/60203B02" Ref="R?"  Part="1" 
AR Path="/6017BD7E/60203B02" Ref="R?"  Part="1" 
F 0 "R?" V 9900 6150 50  0000 C CNN
F 1 "4.7K 1%" V 10000 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 10030 6150 50  0001 C CNN
F 3 "~" H 10100 6150 50  0001 C CNN
F 4 "" H 10100 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 10100 6150 50  0001 C CNN "Part Number"
	1    10100 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60203D23
P 10400 6150
AR Path="/60203D23" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/60203D23" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/60203D23" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/60203D23" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/60203D23" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/60203D23" Ref="R?"  Part="1" 
AR Path="/6017BD7E/60203D23" Ref="R?"  Part="1" 
F 0 "R?" V 10200 6150 50  0000 C CNN
F 1 "4.7K 1%" V 10300 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 10330 6150 50  0001 C CNN
F 3 "~" H 10400 6150 50  0001 C CNN
F 4 "" H 10400 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 10400 6150 50  0001 C CNN "Part Number"
	1    10400 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60203EB1
P 10700 6150
AR Path="/60203EB1" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/60203EB1" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/60203EB1" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/60203EB1" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/60203EB1" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/60203EB1" Ref="R?"  Part="1" 
AR Path="/6017BD7E/60203EB1" Ref="R?"  Part="1" 
F 0 "R?" V 10500 6150 50  0000 C CNN
F 1 "4.7K 1%" V 10600 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 10630 6150 50  0001 C CNN
F 3 "~" H 10700 6150 50  0001 C CNN
F 4 "" H 10700 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 10700 6150 50  0001 C CNN "Part Number"
	1    10700 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6020404B
P 11000 6150
AR Path="/6020404B" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/6020404B" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/6020404B" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/6020404B" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/6020404B" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/6020404B" Ref="R?"  Part="1" 
AR Path="/6017BD7E/6020404B" Ref="R?"  Part="1" 
F 0 "R?" V 10800 6150 50  0000 C CNN
F 1 "4.7K 1%" V 10900 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 10930 6150 50  0001 C CNN
F 3 "~" H 11000 6150 50  0001 C CNN
F 4 "" H 11000 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 11000 6150 50  0001 C CNN "Part Number"
	1    11000 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60207D8F
P 11300 6150
AR Path="/60207D8F" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/60207D8F" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/60207D8F" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/60207D8F" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/60207D8F" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/60207D8F" Ref="R?"  Part="1" 
AR Path="/6017BD7E/60207D8F" Ref="R?"  Part="1" 
F 0 "R?" V 11100 6150 50  0000 C CNN
F 1 "4.7K 1%" V 11200 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 11230 6150 50  0001 C CNN
F 3 "~" H 11300 6150 50  0001 C CNN
F 4 "" H 11300 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 11300 6150 50  0001 C CNN "Part Number"
	1    11300 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60207D97
P 11600 6150
AR Path="/60207D97" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/60207D97" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/60207D97" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/60207D97" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/60207D97" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/60207D97" Ref="R?"  Part="1" 
AR Path="/6017BD7E/60207D97" Ref="R?"  Part="1" 
F 0 "R?" V 11400 6150 50  0000 C CNN
F 1 "4.7K 1%" V 11500 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 11530 6150 50  0001 C CNN
F 3 "~" H 11600 6150 50  0001 C CNN
F 4 "" H 11600 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 11600 6150 50  0001 C CNN "Part Number"
	1    11600 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60207D9F
P 11900 6150
AR Path="/60207D9F" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/60207D9F" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/60207D9F" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/60207D9F" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/60207D9F" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/60207D9F" Ref="R?"  Part="1" 
AR Path="/6017BD7E/60207D9F" Ref="R?"  Part="1" 
F 0 "R?" V 11700 6150 50  0000 C CNN
F 1 "4.7K 1%" V 11800 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 11830 6150 50  0001 C CNN
F 3 "~" H 11900 6150 50  0001 C CNN
F 4 "" H 11900 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 11900 6150 50  0001 C CNN "Part Number"
	1    11900 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60207DA7
P 12200 6150
AR Path="/60207DA7" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/60207DA7" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/60207DA7" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/60207DA7" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/60207DA7" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/60207DA7" Ref="R?"  Part="1" 
AR Path="/6017BD7E/60207DA7" Ref="R?"  Part="1" 
F 0 "R?" V 12000 6150 50  0000 C CNN
F 1 "4.7K 1%" V 12100 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 12130 6150 50  0001 C CNN
F 3 "~" H 12200 6150 50  0001 C CNN
F 4 "" H 12200 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 12200 6150 50  0001 C CNN "Part Number"
	1    12200 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60207DAF
P 12500 6150
AR Path="/60207DAF" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/60207DAF" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/60207DAF" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/60207DAF" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/60207DAF" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/60207DAF" Ref="R?"  Part="1" 
AR Path="/6017BD7E/60207DAF" Ref="R?"  Part="1" 
F 0 "R?" V 12300 6150 50  0000 C CNN
F 1 "4.7K 1%" V 12400 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 12430 6150 50  0001 C CNN
F 3 "~" H 12500 6150 50  0001 C CNN
F 4 "" H 12500 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 12500 6150 50  0001 C CNN "Part Number"
	1    12500 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60207DB7
P 12800 6150
AR Path="/60207DB7" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/60207DB7" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/60207DB7" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/60207DB7" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/60207DB7" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/60207DB7" Ref="R?"  Part="1" 
AR Path="/6017BD7E/60207DB7" Ref="R?"  Part="1" 
F 0 "R?" V 12600 6150 50  0000 C CNN
F 1 "4.7K 1%" V 12700 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 12730 6150 50  0001 C CNN
F 3 "~" H 12800 6150 50  0001 C CNN
F 4 "" H 12800 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 12800 6150 50  0001 C CNN "Part Number"
	1    12800 6150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J?
U 1 1 6020ACDD
P 14200 6650
F 0 "J?" H 14280 6692 50  0000 L CNN
F 1 "Molex Micro-Fit" H 14280 6601 50  0000 L CNN
F 2 "RespiraWorks_Std:Molex_Micro-Fit_3.0_43650-0515_1x05_P3.00mm_Vertical" H 14200 6650 50  0001 C CNN
F 3 "~" H 14200 6650 50  0001 C CNN
	1    14200 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 6550 9500 6550
$Comp
L power:GND #PWR?
U 1 1 6020FD81
P 14000 6450
AR Path="/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5E8FBD97/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5E8E0754/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5E8DFCAD/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5E8DEDC0/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5E8C8865/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/6020FD81" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/6020FD81" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 14000 6200 50  0001 C CNN
F 1 "GND" H 14005 6277 50  0000 C CNN
F 2 "" H 14000 6450 50  0001 C CNN
F 3 "" H 14000 6450 50  0001 C CNN
	1    14000 6450
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 6650 9800 6650
Wire Wire Line
	14000 6750 10100 6750
$Comp
L RespiraWorks:+3.3V_Ctrl #PWR?
U 1 1 602134DD
P 13250 6850
F 0 "#PWR?" H 13250 6850 50  0001 C CNN
F 1 "+3.3V_Ctrl" V 13235 6978 50  0000 L CNN
F 2 "" H 13250 6850 50  0001 C CNN
F 3 "" H 13250 6850 50  0001 C CNN
	1    13250 6850
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J?
U 1 1 60218CE0
P 14200 7250
F 0 "J?" H 14280 7292 50  0000 L CNN
F 1 "Molex Micro-Fit" H 14280 7201 50  0000 L CNN
F 2 "RespiraWorks_Std:Molex_Micro-Fit_3.0_43650-0515_1x05_P3.00mm_Vertical" H 14200 7250 50  0001 C CNN
F 3 "~" H 14200 7250 50  0001 C CNN
	1    14200 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60218CE7
P 14000 7050
AR Path="/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5E8FBD97/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5E8E0754/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5E8DFCAD/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5E8DEDC0/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5E8C8865/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/60218CE7" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/60218CE7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 14000 6800 50  0001 C CNN
F 1 "GND" H 14005 6877 50  0000 C CNN
F 2 "" H 14000 7050 50  0001 C CNN
F 3 "" H 14000 7050 50  0001 C CNN
	1    14000 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	14000 7350 13100 7350
$Comp
L RespiraWorks:+3.3V_Ctrl #PWR?
U 1 1 60218CEF
P 13250 7450
F 0 "#PWR?" H 13250 7450 50  0001 C CNN
F 1 "+3.3V_Ctrl" V 13235 7578 50  0000 L CNN
F 2 "" H 13250 7450 50  0001 C CNN
F 3 "" H 13250 7450 50  0001 C CNN
	1    13250 7450
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J?
U 1 1 6021A875
P 14200 7850
F 0 "J?" H 14280 7892 50  0000 L CNN
F 1 "Molex Micro-Fit" H 14280 7801 50  0000 L CNN
F 2 "RespiraWorks_Std:Molex_Micro-Fit_3.0_43650-0515_1x05_P3.00mm_Vertical" H 14200 7850 50  0001 C CNN
F 3 "~" H 14200 7850 50  0001 C CNN
	1    14200 7850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6021A87C
P 14000 7650
AR Path="/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5E8FBD97/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5E8E0754/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5E8DFCAD/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5E8DEDC0/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5E8C8865/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/6021A87C" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/6021A87C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 14000 7400 50  0001 C CNN
F 1 "GND" H 14005 7477 50  0000 C CNN
F 2 "" H 14000 7650 50  0001 C CNN
F 3 "" H 14000 7650 50  0001 C CNN
	1    14000 7650
	0    1    1    0   
$EndComp
Wire Wire Line
	14000 7950 11900 7950
$Comp
L RespiraWorks:+3.3V_Ctrl #PWR?
U 1 1 6021A884
P 13250 8050
F 0 "#PWR?" H 13250 8050 50  0001 C CNN
F 1 "+3.3V_Ctrl" V 13235 8178 50  0000 L CNN
F 2 "" H 13250 8050 50  0001 C CNN
F 3 "" H 13250 8050 50  0001 C CNN
	1    13250 8050
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J?
U 1 1 6021D3DF
P 14200 8450
F 0 "J?" H 14280 8492 50  0000 L CNN
F 1 "Molex Micro-Fit" H 14280 8401 50  0000 L CNN
F 2 "RespiraWorks_Std:Molex_Micro-Fit_3.0_43650-0515_1x05_P3.00mm_Vertical" H 14200 8450 50  0001 C CNN
F 3 "~" H 14200 8450 50  0001 C CNN
	1    14200 8450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6021D3E6
P 14000 8250
AR Path="/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5E8AFE9D/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5E8FBD97/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5E8E0754/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5E8DFCAD/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5E8DEDC0/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5E8C8865/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5E8E1F08/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4DF5/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F5EF3/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F7154/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F719E/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F71F1/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/600F723B/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/5FCD4EEA/6021D3E6" Ref="#PWR?"  Part="1" 
AR Path="/6017BD7E/6021D3E6" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 14000 8000 50  0001 C CNN
F 1 "GND" H 14005 8077 50  0000 C CNN
F 2 "" H 14000 8250 50  0001 C CNN
F 3 "" H 14000 8250 50  0001 C CNN
	1    14000 8250
	0    1    1    0   
$EndComp
Wire Wire Line
	14000 8550 12650 8550
$Comp
L RespiraWorks:+3.3V_Ctrl #PWR?
U 1 1 6021D3EE
P 13250 8650
F 0 "#PWR?" H 13250 8650 50  0001 C CNN
F 1 "+3.3V_Ctrl" V 13235 8778 50  0000 L CNN
F 2 "" H 13250 8650 50  0001 C CNN
F 3 "" H 13250 8650 50  0001 C CNN
	1    13250 8650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9300 6950 10400 6950
Wire Wire Line
	13300 6950 13300 7150
Wire Wire Line
	13300 7150 14000 7150
Wire Wire Line
	9300 7050 10700 7050
Wire Wire Line
	13200 7050 13200 7250
Wire Wire Line
	13200 7250 14000 7250
Wire Wire Line
	13100 7350 13100 7150
Wire Wire Line
	13100 7150 11000 7150
Wire Wire Line
	9300 7350 11300 7350
Wire Wire Line
	12100 7350 12100 7750
Wire Wire Line
	12100 7750 14000 7750
Wire Wire Line
	9300 7450 11600 7450
Wire Wire Line
	12000 7450 12000 7850
Wire Wire Line
	12000 7850 14000 7850
Wire Wire Line
	9300 7550 11900 7550
Wire Wire Line
	11900 7550 11900 7950
Wire Wire Line
	9300 7750 11750 7750
Wire Wire Line
	11750 7750 11750 8350
Wire Wire Line
	11750 8350 12200 8350
Wire Wire Line
	9300 7850 11650 7850
Wire Wire Line
	11650 7850 11650 8450
Wire Wire Line
	11650 8450 12500 8450
Wire Wire Line
	9300 7950 11550 7950
Wire Wire Line
	11550 7950 11550 8550
$Comp
L Device:R R?
U 1 1 60238244
P 13400 6850
AR Path="/60238244" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/60238244" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/60238244" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/60238244" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/60238244" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/60238244" Ref="R?"  Part="1" 
AR Path="/6017BD7E/60238244" Ref="R?"  Part="1" 
F 0 "R?" V 13350 7000 50  0000 C CNN
F 1 "0" V 13350 6700 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 13330 6850 50  0001 C CNN
F 3 "~" H 13400 6850 50  0001 C CNN
F 4 "" H 13400 6850 50  0001 C CNN "Manufacturer"
F 5 "" H 13400 6850 50  0001 C CNN "Part Number"
	1    13400 6850
	0    1    1    0   
$EndComp
Wire Wire Line
	13550 6850 14000 6850
$Comp
L Device:R R?
U 1 1 6023C92C
P 13400 7450
AR Path="/6023C92C" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/6023C92C" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/6023C92C" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/6023C92C" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/6023C92C" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/6023C92C" Ref="R?"  Part="1" 
AR Path="/6017BD7E/6023C92C" Ref="R?"  Part="1" 
F 0 "R?" V 13350 7600 50  0000 C CNN
F 1 "0" V 13350 7300 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 13330 7450 50  0001 C CNN
F 3 "~" H 13400 7450 50  0001 C CNN
F 4 "" H 13400 7450 50  0001 C CNN "Manufacturer"
F 5 "" H 13400 7450 50  0001 C CNN "Part Number"
	1    13400 7450
	0    1    1    0   
$EndComp
Wire Wire Line
	13550 7450 14000 7450
$Comp
L Device:R R?
U 1 1 6023F264
P 13400 8050
AR Path="/6023F264" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/6023F264" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/6023F264" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/6023F264" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/6023F264" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/6023F264" Ref="R?"  Part="1" 
AR Path="/6017BD7E/6023F264" Ref="R?"  Part="1" 
F 0 "R?" V 13350 8200 50  0000 C CNN
F 1 "0" V 13350 7900 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 13330 8050 50  0001 C CNN
F 3 "~" H 13400 8050 50  0001 C CNN
F 4 "" H 13400 8050 50  0001 C CNN "Manufacturer"
F 5 "" H 13400 8050 50  0001 C CNN "Part Number"
	1    13400 8050
	0    1    1    0   
$EndComp
Wire Wire Line
	13550 8050 14000 8050
$Comp
L Device:R R?
U 1 1 602414A0
P 13400 8650
AR Path="/602414A0" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/602414A0" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/602414A0" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/602414A0" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/602414A0" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/602414A0" Ref="R?"  Part="1" 
AR Path="/6017BD7E/602414A0" Ref="R?"  Part="1" 
F 0 "R?" V 13350 8800 50  0000 C CNN
F 1 "0" V 13350 8500 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 13330 8650 50  0001 C CNN
F 3 "~" H 13400 8650 50  0001 C CNN
F 4 "" H 13400 8650 50  0001 C CNN "Manufacturer"
F 5 "" H 13400 8650 50  0001 C CNN "Part Number"
	1    13400 8650
	0    1    1    0   
$EndComp
Wire Wire Line
	13550 8650 14000 8650
Text Notes 12900 8800 0    50   ~ 0
Spot for optional fuse
Text Notes 15100 7750 0    50   ~ 0
Add'l I2C peripherals for\nprototyping/testing\n\n1: Gnd\n2: SCL\n3: SDA\n4: ~INT~\n5: +3.3V
Wire Wire Line
	9500 6300 9500 6550
Connection ~ 9500 6550
Wire Wire Line
	9500 6550 14000 6550
Wire Wire Line
	9800 6300 9800 6650
Connection ~ 9800 6650
Wire Wire Line
	9800 6650 14000 6650
Wire Wire Line
	10100 6300 10100 6750
Connection ~ 10100 6750
Wire Wire Line
	10100 6750 9300 6750
Wire Wire Line
	10400 6300 10400 6950
Connection ~ 10400 6950
Wire Wire Line
	10400 6950 13300 6950
Wire Wire Line
	10700 6300 10700 7050
Connection ~ 10700 7050
Wire Wire Line
	10700 7050 13200 7050
Wire Wire Line
	11000 6300 11000 7150
Connection ~ 11000 7150
Wire Wire Line
	11000 7150 9300 7150
Wire Wire Line
	11300 6300 11300 7350
Connection ~ 11300 7350
Wire Wire Line
	11300 7350 12100 7350
Wire Wire Line
	11600 6300 11600 7450
Connection ~ 11600 7450
Wire Wire Line
	11600 7450 12000 7450
Wire Wire Line
	11900 6300 11900 7550
Connection ~ 11900 7550
Wire Wire Line
	12200 6300 12200 8350
Connection ~ 12200 8350
Wire Wire Line
	12200 8350 14000 8350
Wire Wire Line
	12500 6300 12500 8450
Connection ~ 12500 8450
Wire Wire Line
	12500 8450 14000 8450
Wire Wire Line
	12800 6300 12800 6450
Wire Wire Line
	12800 6450 12650 6450
Wire Wire Line
	12650 6450 12650 8550
Connection ~ 12650 8550
Wire Wire Line
	12650 8550 11550 8550
Wire Wire Line
	9500 6000 9500 5900
Wire Wire Line
	9500 5900 9800 5900
Wire Wire Line
	12800 5900 12800 6000
Wire Wire Line
	12500 6000 12500 5900
Connection ~ 12500 5900
Wire Wire Line
	12500 5900 12800 5900
Wire Wire Line
	12200 6000 12200 5900
Connection ~ 12200 5900
Wire Wire Line
	12200 5900 12500 5900
Wire Wire Line
	11900 6000 11900 5900
Connection ~ 11900 5900
Wire Wire Line
	11900 5900 12200 5900
Wire Wire Line
	11600 6000 11600 5900
Connection ~ 11600 5900
Wire Wire Line
	11600 5900 11900 5900
Wire Wire Line
	11300 6000 11300 5900
Connection ~ 11300 5900
Wire Wire Line
	11300 5900 11600 5900
Wire Wire Line
	11000 6000 11000 5900
Connection ~ 11000 5900
Wire Wire Line
	11000 5900 11150 5900
Wire Wire Line
	10700 6000 10700 5900
Connection ~ 10700 5900
Wire Wire Line
	10700 5900 11000 5900
Wire Wire Line
	10400 6000 10400 5900
Connection ~ 10400 5900
Wire Wire Line
	10400 5900 10700 5900
Wire Wire Line
	10100 6000 10100 5900
Connection ~ 10100 5900
Wire Wire Line
	10100 5900 10400 5900
Wire Wire Line
	9800 6000 9800 5900
Connection ~ 9800 5900
Wire Wire Line
	9800 5900 10100 5900
$Comp
L RespiraWorks:+3.3V_Ctrl #PWR?
U 1 1 602C4B67
P 11150 5900
F 0 "#PWR?" H 11150 5900 50  0001 C CNN
F 1 "+3.3V_Ctrl" H 11135 6073 50  0000 C CNN
F 2 "" H 11150 5900 50  0001 C CNN
F 3 "" H 11150 5900 50  0001 C CNN
	1    11150 5900
	1    0    0    -1  
$EndComp
Connection ~ 11150 5900
Wire Wire Line
	11150 5900 11300 5900
Text Notes 8500 5350 0    79   ~ 0
I2C expander
Text HLabel 6500 6750 0    50   Output ~ 0
~Aux_I2C_Int
Wire Wire Line
	6500 6750 7450 6750
$Comp
L Device:R R?
U 1 1 602DF4D1
P 7450 6150
AR Path="/602DF4D1" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/602DF4D1" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/602DF4D1" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/602DF4D1" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/602DF4D1" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/602DF4D1" Ref="R?"  Part="1" 
AR Path="/6017BD7E/602DF4D1" Ref="R?"  Part="1" 
F 0 "R?" V 7250 6150 50  0000 C CNN
F 1 "4.7K 1%" V 7350 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 7380 6150 50  0001 C CNN
F 3 "~" H 7450 6150 50  0001 C CNN
F 4 "" H 7450 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 7450 6150 50  0001 C CNN "Part Number"
	1    7450 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 6300 7450 6750
Connection ~ 7450 6750
Wire Wire Line
	7450 6750 8400 6750
$Comp
L RespiraWorks:+3.3V_Ctrl #PWR?
U 1 1 602E4F93
P 7450 5850
F 0 "#PWR?" H 7450 5850 50  0001 C CNN
F 1 "+3.3V_Ctrl" H 7435 6023 50  0000 C CNN
F 2 "" H 7450 5850 50  0001 C CNN
F 3 "" H 7450 5850 50  0001 C CNN
	1    7450 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 602E7843
P 7150 6150
AR Path="/602E7843" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/602E7843" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/602E7843" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/602E7843" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/602E7843" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/602E7843" Ref="R?"  Part="1" 
AR Path="/6017BD7E/602E7843" Ref="R?"  Part="1" 
F 0 "R?" V 6950 6150 50  0000 C CNN
F 1 "4.7K 1%" V 7050 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 7080 6150 50  0001 C CNN
F 3 "~" H 7150 6150 50  0001 C CNN
F 4 "" H 7150 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 7150 6150 50  0001 C CNN "Part Number"
	1    7150 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 6000 7450 5850
$Comp
L Device:R R?
U 1 1 602F3718
P 6850 6150
AR Path="/602F3718" Ref="R?"  Part="1" 
AR Path="/5E8AFE9D/602F3718" Ref="R?"  Part="1" 
AR Path="/5E8A4ABF/602F3718" Ref="R?"  Part="1" 
AR Path="/5E8E1F08/602F3718" Ref="R?"  Part="1" 
AR Path="/5FCD4DF5/602F3718" Ref="R?"  Part="1" 
AR Path="/5FCD4B8E/602F3718" Ref="R?"  Part="1" 
AR Path="/6017BD7E/602F3718" Ref="R?"  Part="1" 
F 0 "R?" V 6650 6150 50  0000 C CNN
F 1 "4.7K 1%" V 6750 6150 50  0000 C CNN
F 2 "RespiraWorks_Std:R_0603_1608Metric" V 6780 6150 50  0001 C CNN
F 3 "~" H 6850 6150 50  0001 C CNN
F 4 "" H 6850 6150 50  0001 C CNN "Manufacturer"
F 5 "" H 6850 6150 50  0001 C CNN "Part Number"
	1    6850 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 6000 6850 5850
Wire Wire Line
	6850 5850 7150 5850
Connection ~ 7450 5850
Wire Wire Line
	7150 6000 7150 5850
Connection ~ 7150 5850
Wire Wire Line
	7150 5850 7450 5850
Wire Wire Line
	7150 6300 7150 6650
Connection ~ 7150 6650
Wire Wire Line
	7150 6650 8400 6650
Wire Wire Line
	6850 6300 6850 6550
Connection ~ 6850 6550
Wire Wire Line
	6850 6550 1750 6550
Text Notes 6500 5550 0    79   ~ 16
Global I2C pull-ups
Text Notes 2550 7400 0    79   ~ 0
Blower PWM control signal level shifter
Text Notes 2750 950  0    79   ~ 0
Real-Time Clock
Text Notes 3150 4050 0    79   ~ 0
EEPROM
$EndSCHEMATC
