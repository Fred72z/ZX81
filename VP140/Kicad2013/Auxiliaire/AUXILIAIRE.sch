EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:AUXILIAIRE-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Platine auxiliaire VP140"
Date "2 dec 2021"
Rev "1.2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L GND #PWR01
U 1 1 61A1380A
P 2850 4500
F 0 "#PWR01" H 2850 4500 30  0001 C CNN
F 1 "GND" H 2850 4430 30  0001 C CNN
F 2 "~" H 2850 4500 60  0000 C CNN
F 3 "~" H 2850 4500 60  0000 C CNN
	1    2850 4500
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 61A13817
P 3650 4500
F 0 "#PWR02" H 3650 4500 30  0001 C CNN
F 1 "GND" H 3650 4430 30  0001 C CNN
F 2 "~" H 3650 4500 60  0000 C CNN
F 3 "~" H 3650 4500 60  0000 C CNN
	1    3650 4500
	-1   0    0    -1  
$EndComp
$Comp
L VCC #PWR03
U 1 1 61A1381F
P 3850 2550
F 0 "#PWR03" H 3850 2650 30  0001 C CNN
F 1 "VCC" H 3850 2650 30  0000 C CNN
F 2 "~" H 3850 2550 60  0000 C CNN
F 3 "~" H 3850 2550 60  0000 C CNN
	1    3850 2550
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR04
U 1 1 61A1382C
P 2600 2550
F 0 "#PWR04" H 2600 2650 30  0001 C CNN
F 1 "VCC" H 2600 2650 30  0000 C CNN
F 2 "~" H 2600 2550 60  0000 C CNN
F 3 "~" H 2600 2550 60  0000 C CNN
	1    2600 2550
	0    -1   -1   0   
$EndComp
Text Label 4000 2650 2    60   ~ 0
D0
Text Label 4000 2750 2    60   ~ 0
D1
Text Label 4000 2850 2    60   ~ 0
D2
Text Label 4000 2950 2    60   ~ 0
D3
Text Label 4000 3050 2    60   ~ 0
D4
Text Label 4000 3150 2    60   ~ 0
D5
Text Label 4000 3250 2    60   ~ 0
D6
Text Label 4000 3350 2    60   ~ 0
D7
Text Label 2500 2650 0    60   ~ 0
A4
Text Label 2500 2750 0    60   ~ 0
A5
Text Label 2500 2850 0    60   ~ 0
A6
Text Label 2500 2950 0    60   ~ 0
A7
Text Label 2500 3050 0    60   ~ 0
A8
Text Label 2500 3150 0    60   ~ 0
A9
Text Label 2500 3250 0    60   ~ 0
A10
Text Label 2500 3350 0    60   ~ 0
A11
Text Label 2500 3450 0    60   ~ 0
A12
Text Label 2500 3550 0    60   ~ 0
A3
Text Label 2500 3650 0    60   ~ 0
A2
Text Label 2500 3750 0    60   ~ 0
A1
Text Label 2500 3850 0    60   ~ 0
A0
Text Label 4000 3850 2    60   ~ 0
RA13
Text Label 4000 3750 2    60   ~ 0
RA14
Text Label 4000 3650 2    60   ~ 0
RA15
Text Label 4000 3550 2    60   ~ 0
RA16
Text Label 4000 3450 2    60   ~ 0
RA17
Text Label 4000 3950 2    60   ~ 0
~CSROM
Wire Wire Line
	3650 2650 4000 2650
Wire Wire Line
	3650 2750 4000 2750
Wire Wire Line
	3650 2850 4000 2850
Wire Wire Line
	3650 2950 4000 2950
Wire Wire Line
	3650 3050 4000 3050
Wire Wire Line
	3650 3150 4000 3150
Wire Wire Line
	3650 3250 4000 3250
Wire Wire Line
	3650 3350 4000 3350
Wire Wire Line
	3650 3450 4000 3450
Wire Wire Line
	3650 3550 4000 3550
Wire Wire Line
	3650 3650 4000 3650
Wire Wire Line
	3650 3750 4000 3750
Wire Wire Line
	3650 3850 4000 3850
Wire Wire Line
	3650 3950 4000 3950
Wire Wire Line
	2500 2650 2850 2650
Wire Wire Line
	2500 2750 2850 2750
Wire Wire Line
	2500 2850 2850 2850
Wire Wire Line
	2500 2950 2850 2950
Wire Wire Line
	2500 3050 2850 3050
Wire Wire Line
	2500 3150 2850 3150
Wire Wire Line
	2500 3250 2850 3250
Wire Wire Line
	2500 3350 2850 3350
Wire Wire Line
	2500 3450 2850 3450
Wire Wire Line
	2500 3550 2850 3550
Wire Wire Line
	2500 3650 2850 3650
Wire Wire Line
	2500 3750 2850 3750
Wire Wire Line
	2500 3850 2850 3850
Wire Wire Line
	2850 4250 2850 4500
Wire Wire Line
	3650 4500 3650 4250
Wire Wire Line
	3650 2550 3850 2550
Wire Wire Line
	2850 2550 2600 2550
$Comp
L CONN_18X2 P2
U 1 1 61A13937
P 5750 3300
F 0 "P2" H 5750 4200 60  0000 C CNN
F 1 "CARTOUCHE" V 5750 3300 50  0000 C CNN
F 2 "~" H 5750 3150 60  0000 C CNN
F 3 "~" H 5750 3150 60  0000 C CNN
	1    5750 3300
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR05
U 1 1 61A13949
P 5350 2350
F 0 "#PWR05" H 5350 2450 30  0001 C CNN
F 1 "VCC" H 5350 2450 30  0000 C CNN
F 2 "~" H 5350 2350 60  0000 C CNN
F 3 "~" H 5350 2350 60  0000 C CNN
	1    5350 2350
	1    0    0    -1  
$EndComp
Text Label 5000 2800 0    60   ~ 0
RA15
Text Label 5000 2700 0    60   ~ 0
RA16
Wire Wire Line
	5350 2700 5000 2700
Wire Wire Line
	5350 2800 5000 2800
Text Label 6500 2700 2    60   ~ 0
RA17
Wire Wire Line
	6150 2700 6500 2700
Text Label 6500 2900 2    60   ~ 0
RA13
Text Label 6500 2800 2    60   ~ 0
RA14
Wire Wire Line
	6150 2800 6500 2800
Wire Wire Line
	6150 2900 6500 2900
Text Label 6500 3000 2    60   ~ 0
A8
Text Label 6500 3100 2    60   ~ 0
A9
Wire Wire Line
	6500 3000 6150 3000
Wire Wire Line
	6500 3100 6150 3100
Text Label 6500 3200 2    60   ~ 0
A11
Wire Wire Line
	6500 3200 6150 3200
Text Label 6500 3400 2    60   ~ 0
A10
Wire Wire Line
	6500 3400 6150 3400
Text Label 6500 3500 2    60   ~ 0
~CSROM
Wire Wire Line
	6150 3500 6500 3500
Text Label 6500 4000 2    60   ~ 0
D3
Text Label 6500 3900 2    60   ~ 0
D4
Text Label 6500 3800 2    60   ~ 0
D5
Text Label 6500 3700 2    60   ~ 0
D6
Text Label 6500 3600 2    60   ~ 0
D7
Wire Wire Line
	6150 4000 6500 4000
Wire Wire Line
	6150 3900 6500 3900
Wire Wire Line
	6150 3800 6500 3800
Wire Wire Line
	6150 3700 6500 3700
Wire Wire Line
	6150 3600 6500 3600
Text Label 5000 3800 0    60   ~ 0
D0
Text Label 5000 3900 0    60   ~ 0
D1
Text Label 5000 4000 0    60   ~ 0
D2
Wire Wire Line
	5350 3800 5000 3800
Wire Wire Line
	5350 3900 5000 3900
Wire Wire Line
	5350 4000 5000 4000
Text Label 5000 3400 0    60   ~ 0
A3
Text Label 5000 3500 0    60   ~ 0
A2
Text Label 5000 3600 0    60   ~ 0
A1
Text Label 5000 3700 0    60   ~ 0
A0
Wire Wire Line
	5000 3400 5350 3400
Wire Wire Line
	5000 3500 5350 3500
Wire Wire Line
	5000 3600 5350 3600
Wire Wire Line
	5000 3700 5350 3700
Text Label 5000 3300 0    60   ~ 0
A4
Text Label 5000 3200 0    60   ~ 0
A5
Text Label 5000 3100 0    60   ~ 0
A6
Text Label 5000 3000 0    60   ~ 0
A7
Wire Wire Line
	5000 3300 5350 3300
Wire Wire Line
	5000 3200 5350 3200
Wire Wire Line
	5000 3100 5350 3100
Wire Wire Line
	5000 3000 5350 3000
Text Label 5000 2900 0    60   ~ 0
A12
Wire Wire Line
	5000 2900 5350 2900
Wire Wire Line
	5350 2350 5350 2500
$Comp
L GND #PWR06
U 1 1 61A139C0
P 5350 4400
F 0 "#PWR06" H 5350 4400 30  0001 C CNN
F 1 "GND" H 5350 4330 30  0001 C CNN
F 2 "~" H 5350 4400 60  0000 C CNN
F 3 "~" H 5350 4400 60  0000 C CNN
	1    5350 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4200 5350 4400
NoConn ~ 6150 2500
NoConn ~ 6150 2600
NoConn ~ 6150 4100
NoConn ~ 6150 4200
NoConn ~ 6150 3300
NoConn ~ 5350 4100
NoConn ~ 5350 2600
$Comp
L CONN_18X2 P1
U 1 1 61A3B8AB
P 3250 3350
F 0 "P1" H 3250 4250 60  0000 C CNN
F 1 "EXPANSION" V 3250 3350 50  0000 C CNN
F 2 "~" H 3250 3200 60  0000 C CNN
F 3 "~" H 3250 3200 60  0000 C CNN
	1    3250 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 4150 4000 4150
Wire Wire Line
	2850 4050 2350 4050
Wire Wire Line
	2850 4150 2350 4150
Text Label 4000 4150 2    60   ~ 0
SPK
Text Label 2350 4150 0    60   ~ 0
RX_RS232
Text Label 2350 4050 0    60   ~ 0
TX_RS232
NoConn ~ 3650 4050
NoConn ~ 2850 3950
$Comp
L CONN_3 K1
U 1 1 61A3BA1A
P 3100 5900
F 0 "K1" V 3050 5900 50  0000 C CNN
F 1 "RS232" V 3150 5900 40  0000 C CNN
F 2 "~" H 3100 5900 60  0000 C CNN
F 3 "~" H 3100 5900 60  0000 C CNN
	1    3100 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 61A3BA27
P 2750 5800
F 0 "#PWR07" H 2750 5800 30  0001 C CNN
F 1 "GND" H 2750 5730 30  0001 C CNN
F 2 "~" H 2750 5800 60  0000 C CNN
F 3 "~" H 2750 5800 60  0000 C CNN
	1    2750 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 5900 2250 5900
Wire Wire Line
	2750 6000 2250 6000
Text Label 2250 6000 0    60   ~ 0
RX_RS232
Text Label 2250 5900 0    60   ~ 0
TX_RS232
$Comp
L CONN_2 P3
U 1 1 61A3BA33
P 4350 5900
F 0 "P3" V 4300 5900 40  0000 C CNN
F 1 "SPEAKER" V 4400 5900 40  0000 C CNN
F 2 "~" H 4350 5900 60  0000 C CNN
F 3 "~" H 4350 5900 60  0000 C CNN
	1    4350 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 61A3BA40
P 4000 5800
F 0 "#PWR08" H 4000 5800 30  0001 C CNN
F 1 "GND" H 4000 5730 30  0001 C CNN
F 2 "~" H 4000 5800 60  0000 C CNN
F 3 "~" H 4000 5800 60  0000 C CNN
	1    4000 5800
	0    1    1    0   
$EndComp
Text Label 3800 6000 0    60   ~ 0
SPK
Wire Wire Line
	3800 6000 4000 6000
$EndSCHEMATC
