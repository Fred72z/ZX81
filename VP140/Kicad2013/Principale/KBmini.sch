EESchema Schematic File Version 2
LIBS:power
LIBS:74xx
LIBS:conn
LIBS:device
LIBS:intel
LIBS:interface
LIBS:memory
LIBS:microchip
LIBS:motorola
LIBS:zilog
LIBS:audio
LIBS:cmos_ieee
LIBS:cmos4000
LIBS:Minitel-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title "Interface clavier Minitel-ZX81"
Date "7 jan 2023"
Rev "1.3"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_17 P7
U 1 1 6190B405
P 8550 2350
F 0 "P7" V 8510 2350 60  0000 C CNN
F 1 "Clavier Minitel" V 8630 2350 60  0000 C CNN
F 2 "~" H 8550 2350 60  0000 C CNN
F 3 "~" H 8550 2350 60  0000 C CNN
	1    8550 2350
	1    0    0    -1  
$EndComp
$Comp
L 74LS156 U13
U 1 1 6190B414
P 6150 4450
F 0 "U13" H 6100 4600 60  0000 C CNN
F 1 "74LS156" H 6150 4350 60  0000 C CNN
F 2 "~" H 6150 4450 60  0000 C CNN
F 3 "~" H 6150 4450 60  0000 C CNN
	1    6150 4450
	1    0    0    -1  
$EndComp
$Comp
L 16F876A U12
U 1 1 6190B423
P 3600 2550
F 0 "U12" H 3800 1650 60  0000 C CNN
F 1 "16F876A" H 3950 3750 60  0000 C CNN
F 2 "~" H 3600 2550 60  0000 C CNN
F 3 "~" H 3600 2550 60  0000 C CNN
	1    3600 2550
	-1   0    0    -1  
$EndComp
$Comp
L VCC #PWR060
U 1 1 6192B348
P 2550 1650
F 0 "#PWR060" H 2550 1750 30  0001 C CNN
F 1 "VCC" H 2550 1750 30  0000 C CNN
F 2 "~" H 2550 1650 60  0000 C CNN
F 3 "~" H 2550 1650 60  0000 C CNN
	1    2550 1650
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR061
U 1 1 6192B355
P 3600 1150
F 0 "#PWR061" H 3600 1250 30  0001 C CNN
F 1 "VCC" H 3600 1250 30  0000 C CNN
F 2 "~" H 3600 1150 60  0000 C CNN
F 3 "~" H 3600 1150 60  0000 C CNN
	1    3600 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR062
U 1 1 6192B35D
P 3500 3700
F 0 "#PWR062" H 3500 3700 30  0001 C CNN
F 1 "GND" H 3500 3630 30  0001 C CNN
F 2 "~" H 3500 3700 60  0000 C CNN
F 3 "~" H 3500 3700 60  0000 C CNN
	1    3500 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR063
U 1 1 6192B36A
P 3700 3700
F 0 "#PWR063" H 3700 3700 30  0001 C CNN
F 1 "GND" H 3700 3630 30  0001 C CNN
F 2 "~" H 3700 3700 60  0000 C CNN
F 3 "~" H 3700 3700 60  0000 C CNN
	1    3700 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR064
U 1 1 6192B370
P 8100 3250
F 0 "#PWR064" H 8100 3250 30  0001 C CNN
F 1 "GND" H 8100 3180 30  0001 C CNN
F 2 "~" H 8100 3250 60  0000 C CNN
F 3 "~" H 8100 3250 60  0000 C CNN
	1    8100 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 4850 5400 4850
Wire Wire Line
	5150 4850 5150 4050
Wire Wire Line
	5150 4050 5400 4050
Wire Wire Line
	5400 4150 5250 4150
Wire Wire Line
	5250 4150 5250 5000
Wire Wire Line
	5250 4750 5400 4750
Connection ~ 5250 4750
$Comp
L GND #PWR065
U 1 1 6192B384
P 5250 5000
F 0 "#PWR065" H 5250 5000 30  0001 C CNN
F 1 "GND" H 5250 4930 30  0001 C CNN
F 2 "~" H 5250 5000 60  0000 C CNN
F 3 "~" H 5250 5000 60  0000 C CNN
	1    5250 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2850 2550 2850
Wire Wire Line
	2550 2950 2200 2950
Wire Wire Line
	2200 3050 2550 3050
Wire Wire Line
	2550 2300 2150 2300
Wire Wire Line
	5400 4400 1200 4400
Wire Wire Line
	1200 4400 1200 1900
Wire Wire Line
	1200 1900 2550 1900
Wire Wire Line
	5400 4500 1300 4500
Wire Wire Line
	1300 4500 1300 2000
Wire Wire Line
	1300 2000 2550 2000
Wire Wire Line
	2550 2100 1400 2100
Wire Wire Line
	1400 2100 1400 4850
Connection ~ 5150 4850
Wire Wire Line
	8200 1650 7050 1650
Wire Wire Line
	7050 1650 7050 4050
Wire Wire Line
	7050 4050 6900 4050
Wire Wire Line
	6900 4150 7150 4150
Wire Wire Line
	7150 4150 7150 1750
Wire Wire Line
	7150 1750 8200 1750
Wire Wire Line
	8200 1850 7250 1850
Wire Wire Line
	7250 1850 7250 4250
Wire Wire Line
	7250 4250 6900 4250
Wire Wire Line
	6900 4350 7350 4350
Wire Wire Line
	7350 4350 7350 1950
Wire Wire Line
	7350 1950 8200 1950
Wire Wire Line
	8200 3150 8100 3150
Wire Wire Line
	8100 3150 8100 3250
Wire Wire Line
	8200 2950 7750 2950
Wire Wire Line
	7750 2950 7750 4850
Wire Wire Line
	7750 4850 6900 4850
Wire Wire Line
	6900 4750 7650 4750
Wire Wire Line
	7650 4750 7650 2850
Wire Wire Line
	7650 2850 8200 2850
Wire Wire Line
	8200 2750 7550 2750
Wire Wire Line
	7550 2750 7550 4650
Wire Wire Line
	7550 4650 6900 4650
Wire Wire Line
	6900 4550 7450 4550
Wire Wire Line
	7450 4550 7450 2650
Wire Wire Line
	7450 2650 8200 2650
Wire Wire Line
	8200 3050 7900 3050
Wire Wire Line
	7900 2550 8200 2550
Wire Wire Line
	7900 2450 8200 2450
Wire Wire Line
	7900 2350 8200 2350
Wire Wire Line
	7900 2250 8200 2250
Wire Wire Line
	7900 2150 8200 2150
Wire Wire Line
	7900 2050 8200 2050
Wire Wire Line
	8200 1550 7900 1550
Text Label 7900 3050 0    60   ~ 0
KB0
Text Label 7900 2550 0    60   ~ 0
KB1
Text Label 7900 2450 0    60   ~ 0
KB2
Text Label 7900 2350 0    60   ~ 0
KB3
Text Label 7900 2250 0    60   ~ 0
KB4
Text Label 7900 2150 0    60   ~ 0
KB5
Text Label 7900 2050 0    60   ~ 0
KB6
Text Label 7900 1550 0    60   ~ 0
KB7
Wire Wire Line
	4850 2500 4550 2500
Wire Wire Line
	4850 2400 4550 2400
Wire Wire Line
	4850 2300 4550 2300
Wire Wire Line
	4850 2200 4550 2200
Wire Wire Line
	4850 2100 4550 2100
Wire Wire Line
	4850 2000 4550 2000
Text Label 4850 2500 2    60   ~ 0
KB1
Text Label 4850 2400 2    60   ~ 0
KB2
Text Label 4850 2300 2    60   ~ 0
KB3
Text Label 4850 2200 2    60   ~ 0
KB4
Text Label 4850 2100 2    60   ~ 0
KB5
Text Label 4850 2000 2    60   ~ 0
KB6
Text Label 4850 2600 2    60   ~ 0
KB0
Text Label 4850 1900 2    60   ~ 0
KB7
Wire Wire Line
	4550 1900 4850 1900
Wire Wire Line
	4850 2600 4550 2600
Wire Wire Line
	2050 2600 2550 2600
NoConn ~ 2550 2700
NoConn ~ 2550 2400
NoConn ~ 2550 2200
NoConn ~ 2550 3150
Text HLabel 2150 2300 0    60   Output ~ 0
~RESET
Text HLabel 2050 2600 0    60   Input ~ 0
CLK_BAUD
Text HLabel 2200 2850 0    60   Output ~ 0
KB_LATCH
Text HLabel 2200 2950 0    60   Output ~ 0
KB_DATA
Text HLabel 2200 3050 0    60   Output ~ 0
KB_CLK
Text HLabel 4750 3050 2    60   Output ~ 0
VOL_A
Text HLabel 4750 3150 2    60   Output ~ 0
VOL_B
Wire Wire Line
	4550 3050 4750 3050
Wire Wire Line
	4550 3150 4750 3150
$Comp
L CONN_3 K2
U 1 1 63AA11CA
P 6550 2200
F 0 "K2" V 6500 2200 50  0000 C CNN
F 1 "LED_KB" V 6600 2200 40  0000 C CNN
F 2 "~" H 6550 2200 60  0000 C CNN
F 3 "~" H 6550 2200 60  0000 C CNN
	1    6550 2200
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 63AA11D9
P 5750 2200
F 0 "R11" V 5830 2200 50  0000 C CNN
F 1 "2.2k" V 5750 2200 50  0000 C CNN
F 2 "~" H 5750 2200 60  0000 C CNN
F 3 "~" H 5750 2200 60  0000 C CNN
	1    5750 2200
	0    -1   -1   0   
$EndComp
$Comp
L R R12
U 1 1 63AA11EB
P 5750 2400
F 0 "R12" V 5830 2400 50  0000 C CNN
F 1 "2.2k" V 5750 2400 50  0000 C CNN
F 2 "~" H 5750 2400 60  0000 C CNN
F 3 "~" H 5750 2400 60  0000 C CNN
	1    5750 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 2200 5050 2200
Wire Wire Line
	5050 2200 5050 2850
Wire Wire Line
	5050 2850 4550 2850
Wire Wire Line
	4550 2950 5250 2950
Wire Wire Line
	5150 2950 5150 2400
Wire Wire Line
	5150 2400 5500 2400
Wire Wire Line
	6000 2200 6200 2200
Wire Wire Line
	6200 2300 6100 2300
Wire Wire Line
	6100 2300 6100 2400
Wire Wire Line
	6100 2400 6000 2400
$Comp
L GND #PWR066
U 1 1 63AA130C
P 6150 2100
F 0 "#PWR066" H 6150 2100 30  0001 C CNN
F 1 "GND" H 6150 2030 30  0001 C CNN
F 2 "~" H 6150 2100 60  0000 C CNN
F 3 "~" H 6150 2100 60  0000 C CNN
	1    6150 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	6200 2100 6150 2100
$Comp
L CONN_1 P11
U 1 1 63B986BE
P 5400 2950
F 0 "P11" H 5480 2950 40  0000 L CNN
F 1 "A13_ROM" H 5400 3005 30  0001 C CNN
F 2 "~" H 5400 2950 60  0000 C CNN
F 3 "~" H 5400 2950 60  0000 C CNN
	1    5400 2950
	1    0    0    -1  
$EndComp
Connection ~ 5150 2950
Text Notes 5650 3000 0    60   ~ 0
(A13 ROM ZX)
$EndSCHEMATC
