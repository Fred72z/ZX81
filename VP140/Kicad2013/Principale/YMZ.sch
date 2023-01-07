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
Sheet 2 4
Title "VP140 Synthétiseur sonore et amplificateur"
Date "7 jan 2023"
Rev "1.3"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L YMZ284 U10
U 1 1 6192FEF8
P 3000 2600
F 0 "U10" H 3200 2100 60  0000 C CNN
F 1 "YMZ284" H 3200 3500 60  0000 C CNN
F 2 "~" H 3000 2600 60  0000 C CNN
F 3 "~" H 3000 2600 60  0000 C CNN
	1    3000 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2650 2300 2650
Wire Wire Line
	2400 2850 2150 2850
$Comp
L GND #PWR030
U 1 1 6192FF4A
P 3000 3300
F 0 "#PWR030" H 3000 3300 30  0001 C CNN
F 1 "GND" H 3000 3230 30  0001 C CNN
F 2 "~" H 3000 3300 60  0000 C CNN
F 3 "~" H 3000 3300 60  0000 C CNN
	1    3000 3300
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 6192FF59
P 3850 2200
F 0 "R13" V 3930 2200 50  0000 C CNN
F 1 "1k" V 3850 2200 50  0000 C CNN
F 2 "~" H 3850 2200 60  0000 C CNN
F 3 "~" H 3850 2200 60  0000 C CNN
	1    3850 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR031
U 1 1 6192FF6B
P 3850 2450
F 0 "#PWR031" H 3850 2450 30  0001 C CNN
F 1 "GND" H 3850 2380 30  0001 C CNN
F 2 "~" H 3850 2450 60  0000 C CNN
F 3 "~" H 3850 2450 60  0000 C CNN
	1    3850 2450
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR032
U 1 1 6192FF73
P 3000 1550
F 0 "#PWR032" H 3000 1650 30  0001 C CNN
F 1 "VCC" H 3000 1650 30  0000 C CNN
F 2 "~" H 3000 1550 60  0000 C CNN
F 3 "~" H 3000 1550 60  0000 C CNN
	1    3000 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1900 5150 1900
Wire Wire Line
	3850 1900 3850 1950
Wire Wire Line
	3600 2800 4050 2800
$Comp
L LM386 U11
U 1 1 61930655
P 8900 2800
F 0 "U11" H 9050 3000 60  0000 C CNN
F 1 "LM386" H 9050 3100 60  0000 C CNN
F 2 "~" H 8900 2800 60  0000 C CNN
F 3 "~" H 8900 2800 60  0000 C CNN
	1    8900 2800
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C18
U 1 1 61930664
P 9850 2800
F 0 "C18" H 9900 2900 50  0000 L CNN
F 1 "220µF" H 9900 2700 50  0000 L CNN
F 2 "~" H 9850 2800 60  0000 C CNN
F 3 "~" H 9850 2800 60  0000 C CNN
	1    9850 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9400 2800 9650 2800
Wire Wire Line
	10050 2800 10350 2800
$Comp
L GND #PWR033
U 1 1 619306B9
P 8800 3250
F 0 "#PWR033" H 8800 3250 30  0001 C CNN
F 1 "GND" H 8800 3180 30  0001 C CNN
F 2 "~" H 8800 3250 60  0000 C CNN
F 3 "~" H 8800 3250 60  0000 C CNN
	1    8800 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 3200 8800 3250
Wire Wire Line
	8800 2400 8800 2300
$Comp
L R R14
U 1 1 61930707
P 9550 3050
F 0 "R14" V 9630 3050 50  0000 C CNN
F 1 "10" V 9550 3050 50  0000 C CNN
F 2 "~" H 9550 3050 60  0000 C CNN
F 3 "~" H 9550 3050 60  0000 C CNN
	1    9550 3050
	1    0    0    -1  
$EndComp
$Comp
L C C19
U 1 1 61930716
P 9550 3500
F 0 "C19" H 9600 3600 50  0000 L CNN
F 1 "47nF" H 9600 3400 50  0000 L CNN
F 2 "~" H 9550 3500 60  0000 C CNN
F 3 "~" H 9550 3500 60  0000 C CNN
	1    9550 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 61930723
P 9550 3700
F 0 "#PWR034" H 9550 3700 30  0001 C CNN
F 1 "GND" H 9550 3630 30  0001 C CNN
F 2 "~" H 9550 3700 60  0000 C CNN
F 3 "~" H 9550 3700 60  0000 C CNN
	1    9550 3700
	1    0    0    -1  
$EndComp
Connection ~ 3850 1900
$Comp
L GND #PWR035
U 1 1 61930758
P 5150 4400
F 0 "#PWR035" H 5150 4400 30  0001 C CNN
F 1 "GND" H 5150 4330 30  0001 C CNN
F 2 "~" H 5150 4400 60  0000 C CNN
F 3 "~" H 5150 4400 60  0000 C CNN
	1    5150 4400
	1    0    0    -1  
$EndComp
Text Notes 1950 3350 0    60   ~ 0
REG  : $CF $DF\nDATA : $0F $1F
Wire Notes Line
	1900 3200 2750 3200
Wire Notes Line
	2750 3200 2750 3500
Wire Notes Line
	2750 3500 1900 3500
Wire Notes Line
	1900 3500 1900 3200
NoConn ~ 8900 3200
NoConn ~ 9000 3200
$Comp
L GND #PWR036
U 1 1 6192DA34
P 8400 3250
F 0 "#PWR036" H 8400 3250 30  0001 C CNN
F 1 "GND" H 8400 3180 30  0001 C CNN
F 2 "~" H 8400 3250 60  0000 C CNN
F 3 "~" H 8400 3250 60  0000 C CNN
	1    8400 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2900 8400 3250
Wire Wire Line
	7850 2700 8400 2700
$Comp
L +12V #PWR037
U 1 1 6192DA75
P 8800 2300
F 0 "#PWR037" H 8800 2250 20  0001 C CNN
F 1 "+12V" H 8800 2400 30  0000 C CNN
F 2 "~" H 8800 2300 60  0000 C CNN
F 3 "~" H 8800 2300 60  0000 C CNN
	1    8800 2300
	1    0    0    -1  
$EndComp
Text HLabel 4050 2800 2    60   Input ~ 0
CLK_YMZ
Text GLabel 1900 1800 0    60   BiDi ~ 0
D0
Text GLabel 1900 1900 0    60   BiDi ~ 0
D1
Text GLabel 1900 2000 0    60   BiDi ~ 0
D2
Text GLabel 1900 2100 0    60   BiDi ~ 0
D3
Text GLabel 1900 2200 0    60   BiDi ~ 0
D4
Text GLabel 1900 2300 0    60   BiDi ~ 0
D5
Text GLabel 1900 2400 0    60   BiDi ~ 0
D6
Text GLabel 1900 2500 0    60   BiDi ~ 0
D7
Wire Wire Line
	1900 1800 2400 1800
Wire Wire Line
	1900 1900 2400 1900
Wire Wire Line
	1900 2000 2400 2000
Wire Wire Line
	1900 2100 2400 2100
Wire Wire Line
	1900 2200 2400 2200
Wire Wire Line
	1900 2300 2400 2300
Wire Wire Line
	1900 2400 2400 2400
Wire Wire Line
	1900 2500 2400 2500
Text GLabel 1900 2750 0    60   Input ~ 0
~WR
Text GLabel 1900 2950 0    60   Input ~ 0
~RESET
Text HLabel 2300 2650 0    60   Input ~ 0
~CS_YMZ
Text HLabel 2150 2850 0    60   Input ~ 0
~A7
Wire Wire Line
	1900 2750 2400 2750
Wire Wire Line
	2400 2950 1900 2950
Text HLabel 10350 2800 2    60   Output ~ 0
SPK1
Connection ~ 9550 2800
$Comp
L 4051 U14
U 1 1 61BAE74E
P 6850 3000
F 0 "U14" H 7200 3700 60  0000 C CNN
F 1 "4051" H 7100 2300 60  0000 C CNN
F 2 "" H 6850 3000 60  0000 C CNN
F 3 "" H 6850 3000 60  0000 C CNN
	1    6850 3000
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 61BAE773
P 5150 2150
F 0 "R1" V 5230 2150 50  0000 C CNN
F 1 "4.7k" V 5150 2150 50  0000 C CNN
F 2 "~" H 5150 2150 60  0000 C CNN
F 3 "~" H 5150 2150 60  0000 C CNN
	1    5150 2150
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 61BAE780
P 5150 2650
F 0 "R6" V 5230 2650 50  0000 C CNN
F 1 "120" V 5150 2650 50  0000 C CNN
F 2 "~" H 5150 2650 60  0000 C CNN
F 3 "~" H 5150 2650 60  0000 C CNN
	1    5150 2650
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 61BAE790
P 5150 3150
F 0 "R7" V 5230 3150 50  0000 C CNN
F 1 "120" V 5150 3150 50  0000 C CNN
F 2 "~" H 5150 3150 60  0000 C CNN
F 3 "~" H 5150 3150 60  0000 C CNN
	1    5150 3150
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 61BAE796
P 5150 3650
F 0 "R8" V 5230 3650 50  0000 C CNN
F 1 "120" V 5150 3650 50  0000 C CNN
F 2 "~" H 5150 3650 60  0000 C CNN
F 3 "~" H 5150 3650 60  0000 C CNN
	1    5150 3650
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 61BAE7BA
P 5150 4150
F 0 "R9" V 5230 4150 50  0000 C CNN
F 1 "120" V 5150 4150 50  0000 C CNN
F 2 "~" H 5150 4150 60  0000 C CNN
F 3 "~" H 5150 4150 60  0000 C CNN
	1    5150 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2400 6250 2400
Wire Wire Line
	5150 2900 5300 2900
Wire Wire Line
	5300 2900 5300 2500
Wire Wire Line
	5300 2500 6250 2500
Wire Wire Line
	5150 3400 5400 3400
Wire Wire Line
	5400 3400 5400 2600
Wire Wire Line
	5400 2600 6250 2600
Wire Wire Line
	5150 3900 5500 3900
Wire Wire Line
	5500 3900 5500 2700
Wire Wire Line
	5500 2700 6250 2700
NoConn ~ 6250 2800
NoConn ~ 6250 2900
NoConn ~ 6250 3000
NoConn ~ 6250 3100
$Comp
L GND #PWR038
U 1 1 61BAE849
P 6250 3700
F 0 "#PWR038" H 6250 3700 30  0001 C CNN
F 1 "GND" H 6250 3630 30  0001 C CNN
F 2 "~" H 6250 3700 60  0000 C CNN
F 3 "~" H 6250 3700 60  0000 C CNN
	1    6250 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3600 6250 3700
Wire Wire Line
	6250 3300 6150 3300
Wire Wire Line
	6150 3300 6150 3600
Wire Wire Line
	6150 3600 6250 3600
Wire Wire Line
	6250 3400 5600 3400
Wire Wire Line
	5600 3400 5600 4700
Wire Wire Line
	5600 4700 4850 4700
Wire Wire Line
	6250 3500 5650 3500
Wire Wire Line
	5650 3500 5650 4900
Wire Wire Line
	5650 4900 4850 4900
Connection ~ 5150 2400
Connection ~ 5150 2900
Connection ~ 5150 3400
Connection ~ 5150 3900
Connection ~ 6250 3600
Text HLabel 4850 4900 0    60   Input ~ 0
VOL_B
Text HLabel 4850 4700 0    60   Input ~ 0
VOL_A
$Comp
L CAPAPOL C15
U 1 1 61BAE931
P 7650 2700
F 0 "C15" H 7700 2800 50  0000 L CNN
F 1 "2.2µF" H 7700 2600 50  0000 L CNN
F 2 "~" H 7650 2700 60  0000 C CNN
F 3 "~" H 7650 2700 60  0000 C CNN
	1    7650 2700
	0    -1   -1   0   
$EndComp
$Comp
L C C14
U 1 1 61BAE937
P 4850 2600
F 0 "C14" H 4900 2700 50  0000 L CNN
F 1 "10nF" H 4900 2500 50  0000 L CNN
F 2 "~" H 4850 2600 60  0000 C CNN
F 3 "~" H 4850 2600 60  0000 C CNN
	1    4850 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR039
U 1 1 61BAE93F
P 4850 2800
F 0 "#PWR039" H 4850 2800 30  0001 C CNN
F 1 "GND" H 4850 2730 30  0001 C CNN
F 2 "~" H 4850 2800 60  0000 C CNN
F 3 "~" H 4850 2800 60  0000 C CNN
	1    4850 2800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR040
U 1 1 61BB46B6
P 8250 4450
F 0 "#PWR040" H 8250 4450 30  0001 C CNN
F 1 "GND" H 8250 4380 30  0001 C CNN
F 2 "~" H 8250 4450 60  0000 C CNN
F 3 "~" H 8250 4450 60  0000 C CNN
	1    8250 4450
	1    0    0    -1  
$EndComp
$Comp
L VEE #PWR38
U 1 1 61BB46BE
P 8250 4250
F 0 "#PWR38" H 8250 4450 40  0001 C CNN
F 1 "VEE" H 8250 4400 40  0000 C CNN
F 2 "~" H 8250 4250 60  0000 C CNN
F 3 "~" H 8250 4250 60  0000 C CNN
	1    8250 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 4250 8250 4450
$Comp
L VDD #PWR041
U 1 1 61BB5B01
P 3150 1550
F 0 "#PWR041" H 3150 1650 30  0001 C CNN
F 1 "VDD" H 3150 1660 30  0000 C CNN
F 2 "~" H 3150 1550 60  0000 C CNN
F 3 "~" H 3150 1550 60  0000 C CNN
	1    3150 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1550 3150 1550
Connection ~ 3000 1550
$Comp
L VSS #PWR042
U 1 1 61BB5B46
P 3200 3300
F 0 "#PWR042" H 3200 3300 30  0001 C CNN
F 1 "VSS" H 3200 3230 30  0000 C CNN
F 2 "~" H 3200 3300 60  0000 C CNN
F 3 "~" H 3200 3300 60  0000 C CNN
	1    3200 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3300 3200 3250
Wire Wire Line
	3200 3250 3000 3250
Wire Wire Line
	3000 3250 3000 3300
Connection ~ 3000 3250
$EndSCHEMATC
