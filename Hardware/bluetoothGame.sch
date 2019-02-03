EESchema Schematic File Version 4
LIBS:bluetoothGame-cache
EELAYER 26 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "Motion Game"
Date ""
Rev ""
Comp "Bud"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Battery_Management:MCP73831-2-OT U3
U 1 1 5C1E88E8
P 14950 2350
F 0 "U3" H 14650 2750 50  0000 C CNN
F 1 "MCP73831-2-OT" H 14500 2650 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 15000 2100 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf" H 14800 2300 50  0001 C CNN
	1    14950 2350
	1    0    0    -1  
$EndComp
Text Notes 14200 1200 0    50   ~ 0
charge current should be 0.2c and cuttoff at 4.2v
$Comp
L Connector:USB_B_Micro J1
U 1 1 5C1E8BB8
P 15550 5050
F 0 "J1" H 15605 5517 50  0000 C CNN
F 1 "USB_B_Micro" H 15605 5426 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Molex_47346-0001" H 15700 5000 50  0001 C CNN
F 3 "~" H 15700 5000 50  0001 C CNN
	1    15550 5050
	-1   0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR07
U 1 1 5C22F2AD
P 13300 7200
F 0 "#PWR07" H 13300 7050 50  0001 C CNN
F 1 "+BATT" H 13315 7373 50  0000 C CNN
F 2 "" H 13300 7200 50  0001 C CNN
F 3 "" H 13300 7200 50  0001 C CNN
	1    13300 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5C22F2E2
P 15550 5500
F 0 "#PWR011" H 15550 5250 50  0001 C CNN
F 1 "GND" H 15555 5327 50  0000 C CNN
F 2 "" H 15550 5500 50  0001 C CNN
F 3 "" H 15550 5500 50  0001 C CNN
	1    15550 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5C22F71D
P 14950 2650
F 0 "#PWR015" H 14950 2400 50  0001 C CNN
F 1 "GND" H 14955 2477 50  0000 C CNN
F 2 "" H 14950 2650 50  0001 C CNN
F 3 "" H 14950 2650 50  0001 C CNN
	1    14950 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 5C22F7AC
P 15050 4700
F 0 "#PWR013" H 15050 4550 50  0001 C CNN
F 1 "+5V" H 15065 4873 50  0000 C CNN
F 2 "" H 15050 4700 50  0001 C CNN
F 3 "" H 15050 4700 50  0001 C CNN
	1    15050 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 5C22F7DA
P 14950 2000
F 0 "#PWR014" H 14950 1850 50  0001 C CNN
F 1 "+5V" H 14965 2173 50  0000 C CNN
F 2 "" H 14950 2000 50  0001 C CNN
F 3 "" H 14950 2000 50  0001 C CNN
	1    14950 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	14950 2000 14950 2050
$Comp
L power:+BATT #PWR016
U 1 1 5C22F85C
P 15400 2100
F 0 "#PWR016" H 15400 1950 50  0001 C CNN
F 1 "+BATT" H 15415 2273 50  0000 C CNN
F 2 "" H 15400 2100 50  0001 C CNN
F 3 "" H 15400 2100 50  0001 C CNN
	1    15400 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	15350 2250 15400 2250
$Comp
L bluetoothGame-rescue:LIS3DH-BudKiCadComponent U1
U 1 1 5C27AAD6
P 3700 8550
F 0 "U1" H 4000 9050 60  0000 C CNN
F 1 "LIS3DH" H 3200 9050 60  0000 C CNN
F 2 "BudLib:LGA-16_3x3mm_Pitch0.5mm" H 3700 8550 60  0001 C CNN
F 3 "" H 3700 8550 60  0001 C CNN
	1    3700 8550
	1    0    0    -1  
$EndComp
$Comp
L Device:Buzzer BZ1
U 1 1 5C27B41B
P 11300 7350
F 0 "BZ1" H 11453 7379 50  0000 L CNN
F 1 "TP094003-1" H 11453 7288 50  0000 L CNN
F 2 "Buzzer_Beeper:Buzzer_Murata_PKMCS0909E4000-R1" V 11275 7450 50  0001 C CNN
F 3 "~" V 11275 7450 50  0001 C CNN
	1    11300 7350
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5C27FBB7
P 14450 2650
F 0 "R2" H 14520 2696 50  0000 L CNN
F 1 "10k" H 14520 2605 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 14380 2650 50  0001 C CNN
F 3 "~" H 14450 2650 50  0001 C CNN
	1    14450 2650
	1    0    0    -1  
$EndComp
$Comp
L bluetoothGame-rescue:BT840-Fanstel-modules U2
U 1 1 5C2807C6
P 10850 5650
F 0 "U2" H 10900 7654 45  0000 C CNN
F 1 "BT840" H 10900 7570 45  0000 C CNN
F 2 "BudLib:BT840-BT840" H 10680 5800 20  0001 C CNN
F 3 "" H 10650 5650 60  0001 C CNN
	1    10850 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5C28118B
P 8300 4600
F 0 "#PWR01" H 8300 4350 50  0001 C CNN
F 1 "GND" H 8305 4427 50  0000 C CNN
F 2 "" H 8300 4600 50  0001 C CNN
F 3 "" H 8300 4600 50  0001 C CNN
	1    8300 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4600 8300 4500
Wire Wire Line
	8300 4050 8400 4050
Wire Wire Line
	8400 4200 8300 4200
Connection ~ 8300 4200
Wire Wire Line
	8300 4200 8300 4050
Wire Wire Line
	8400 4350 8300 4350
Connection ~ 8300 4350
Wire Wire Line
	8300 4350 8300 4200
Wire Wire Line
	8400 4500 8300 4500
Connection ~ 8300 4500
Wire Wire Line
	8300 4500 8300 4350
$Comp
L power:GND #PWR09
U 1 1 5C281836
P 13600 6000
F 0 "#PWR09" H 13600 5750 50  0001 C CNN
F 1 "GND" H 13605 5827 50  0000 C CNN
F 2 "" H 13600 6000 50  0001 C CNN
F 3 "" H 13600 6000 50  0001 C CNN
	1    13600 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5C2821EA
P 12900 7450
F 0 "C1" H 13015 7496 50  0000 L CNN
F 1 "4.7uf" H 13015 7405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 12938 7300 50  0001 C CNN
F 3 "~" H 12900 7450 50  0001 C CNN
	1    12900 7450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5C2823D9
P 12900 7650
F 0 "#PWR06" H 12900 7400 50  0001 C CNN
F 1 "GND" H 12905 7477 50  0000 C CNN
F 2 "" H 12900 7650 50  0001 C CNN
F 3 "" H 12900 7650 50  0001 C CNN
	1    12900 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	13400 5950 13600 5950
$Comp
L Device:C C2
U 1 1 5C28311C
P 13500 6550
F 0 "C2" H 13615 6596 50  0000 L CNN
F 1 "4.7uf" H 13615 6505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 13538 6400 50  0001 C CNN
F 3 "~" H 13500 6550 50  0001 C CNN
	1    13500 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5C283123
P 13500 6750
F 0 "#PWR08" H 13500 6500 50  0001 C CNN
F 1 "GND" H 13505 6577 50  0000 C CNN
F 2 "" H 13500 6750 50  0001 C CNN
F 3 "" H 13500 6750 50  0001 C CNN
	1    13500 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	13500 6750 13500 6700
Wire Wire Line
	13500 6400 13500 6350
Wire Wire Line
	13500 6100 13400 6100
$Comp
L power:+1V8 #PWR010
U 1 1 5C284190
P 13900 6250
F 0 "#PWR010" H 13900 6100 50  0001 C CNN
F 1 "+1V8" H 13915 6423 50  0000 C CNN
F 2 "" H 13900 6250 50  0001 C CNN
F 3 "" H 13900 6250 50  0001 C CNN
	1    13900 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	13900 6250 13900 6350
Wire Wire Line
	13900 6350 13500 6350
Connection ~ 13500 6350
Wire Wire Line
	13500 6350 13500 6100
Wire Wire Line
	13600 6000 13600 5950
$Comp
L power:GND #PWR04
U 1 1 5C286AE8
P 10800 6950
F 0 "#PWR04" H 10800 6700 50  0001 C CNN
F 1 "GND" H 10805 6777 50  0000 C CNN
F 2 "" H 10800 6950 50  0001 C CNN
F 3 "" H 10800 6950 50  0001 C CNN
	1    10800 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5C286B11
P 11500 6950
F 0 "#PWR05" H 11500 6700 50  0001 C CNN
F 1 "GND" H 11505 6777 50  0000 C CNN
F 2 "" H 11500 6950 50  0001 C CNN
F 3 "" H 11500 6950 50  0001 C CNN
	1    11500 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5C286B3A
P 10100 6950
F 0 "#PWR03" H 10100 6700 50  0001 C CNN
F 1 "GND" H 10105 6777 50  0000 C CNN
F 2 "" H 10100 6950 50  0001 C CNN
F 3 "" H 10100 6950 50  0001 C CNN
	1    10100 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5C286B63
P 9400 6950
F 0 "#PWR02" H 9400 6700 50  0001 C CNN
F 1 "GND" H 9405 6777 50  0000 C CNN
F 2 "" H 9400 6950 50  0001 C CNN
F 3 "" H 9400 6950 50  0001 C CNN
	1    9400 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 6950 9400 6900
Wire Wire Line
	10100 6950 10100 6900
Wire Wire Line
	10800 6950 10800 6900
Wire Wire Line
	11500 6950 11500 6900
$Comp
L power:GND #PWR0101
U 1 1 5C28B9E9
P 13100 6950
F 0 "#PWR0101" H 13100 6700 50  0001 C CNN
F 1 "GND" H 13105 6777 50  0000 C CNN
F 2 "" H 13100 6950 50  0001 C CNN
F 3 "" H 13100 6950 50  0001 C CNN
	1    13100 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	12900 6900 12900 7200
Wire Wire Line
	12900 7600 12900 7650
Wire Wire Line
	13100 6900 13100 6950
Wire Wire Line
	13300 7200 12900 7200
Connection ~ 12900 7200
Wire Wire Line
	12900 7200 12900 7300
$Comp
L power:GND #PWR0102
U 1 1 5C28FB62
P 14450 2850
F 0 "#PWR0102" H 14450 2600 50  0001 C CNN
F 1 "GND" H 14455 2677 50  0000 C CNN
F 2 "" H 14450 2850 50  0001 C CNN
F 3 "" H 14450 2850 50  0001 C CNN
	1    14450 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	14550 2450 14450 2450
Wire Wire Line
	14450 2450 14450 2500
Wire Wire Line
	14450 2850 14450 2800
$Comp
L Device:LED_ALT D10
U 1 1 5C290EA3
P 15550 2400
F 0 "D10" V 15588 2282 50  0000 R CNN
F 1 "LED_ALT" V 15497 2282 50  0000 R CNN
F 2 "LED_SMD:LED_0402_1005Metric" H 15550 2400 50  0001 C CNN
F 3 "~" H 15550 2400 50  0001 C CNN
	1    15550 2400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R14
U 1 1 5C290FB0
P 15550 2750
F 0 "R14" H 15620 2796 50  0000 L CNN
F 1 "1k" H 15620 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 15480 2750 50  0001 C CNN
F 3 "~" H 15550 2750 50  0001 C CNN
	1    15550 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	15400 2100 15400 2250
Wire Wire Line
	15550 2250 15400 2250
Connection ~ 15400 2250
Wire Wire Line
	15550 2550 15550 2600
Wire Wire Line
	15550 2900 15550 2950
Wire Wire Line
	15550 2950 15350 2950
Wire Wire Line
	15350 2950 15350 2450
$Comp
L Device:R R13
U 1 1 5C295B26
P 13050 1300
F 0 "R13" V 12843 1300 50  0000 C CNN
F 1 "0 DNI" V 12934 1300 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 12980 1300 50  0001 C CNN
F 3 "~" H 13050 1300 50  0001 C CNN
	1    13050 1300
	0    1    1    0   
$EndComp
$Comp
L power:+BATT #PWR0103
U 1 1 5C29668B
P 13300 1250
F 0 "#PWR0103" H 13300 1100 50  0001 C CNN
F 1 "+BATT" H 13315 1423 50  0000 C CNN
F 2 "" H 13300 1250 50  0001 C CNN
F 3 "" H 13300 1250 50  0001 C CNN
	1    13300 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5C2966BA
P 12800 1250
F 0 "#PWR0104" H 12800 1100 50  0001 C CNN
F 1 "+5V" H 12815 1423 50  0000 C CNN
F 2 "" H 12800 1250 50  0001 C CNN
F 3 "" H 12800 1250 50  0001 C CNN
	1    12800 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	12800 1250 12800 1300
Wire Wire Line
	12800 1300 12900 1300
Wire Wire Line
	13200 1300 13300 1300
Wire Wire Line
	13300 1250 13300 1300
$Comp
L bluetoothGame-rescue:D_TVS_DF5A6.8LJE-BudKiCadComponent D9
U 1 1 5C29D423
P 14700 5750
F 0 "D9" H 14700 6000 50  0000 C CNN
F 1 "D_TVS_DF5A6.8LJE" H 15100 5550 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-553" H 14550 5750 50  0001 C CNN
F 3 "~" H 14550 5750 50  0001 C CNN
	1    14700 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	14350 4850 14350 5600
Wire Wire Line
	14350 4850 15050 4850
Wire Wire Line
	14350 5750 14300 5750
Wire Wire Line
	14300 5750 14300 5050
Wire Wire Line
	14300 5050 15250 5050
Wire Wire Line
	15050 5600 15050 5200
Wire Wire Line
	15050 5150 15250 5150
Wire Wire Line
	15650 5750 15650 5450
Wire Wire Line
	15550 5450 15550 5500
$Comp
L power:GND #PWR0105
U 1 1 5C2A1828
P 14700 6000
F 0 "#PWR0105" H 14700 5750 50  0001 C CNN
F 1 "GND" H 14705 5827 50  0000 C CNN
F 2 "" H 14700 6000 50  0001 C CNN
F 3 "" H 14700 6000 50  0001 C CNN
	1    14700 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	14700 6000 14700 5900
Wire Wire Line
	13400 5050 14300 5050
Connection ~ 14300 5050
Wire Wire Line
	13400 5200 15050 5200
Connection ~ 15050 5200
Wire Wire Line
	15050 5200 15050 5150
Wire Wire Line
	15050 5750 15150 5750
Wire Wire Line
	15150 5350 15150 5750
Wire Wire Line
	13400 5350 14000 5350
Connection ~ 15150 5750
Wire Wire Line
	15150 5750 15650 5750
Wire Wire Line
	15050 4700 15050 4850
Connection ~ 15050 4850
Wire Wire Line
	15050 4850 15250 4850
$Comp
L bluetoothGame-rescue:LED_Cree-PLCC4-BudKiCadComponent D2
U 1 1 5C2AC05D
P 2150 2550
F 0 "D2" V 2188 2433 50  0000 R CNN
F 1 "CLM2D-CCC-CZ0C03123 (blue)" V 2097 2432 50  0001 R CNN
F 2 "BudLib:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 2650 2650 50  0001 R CNN
F 3 "~" H 2150 2550 50  0001 C CNN
	1    2150 2550
	0    -1   -1   0   
$EndComp
$Comp
L bluetoothGame-rescue:LED_Cree-PLCC4-BudKiCadComponent D1
U 1 1 5C2AC11D
P 2000 5450
F 0 "D1" V 2050 5300 50  0000 C CNN
F 1 "CLM2D-RCC-CZ0B0BB3 (Red)" H 2000 5550 50  0001 C CNN
F 2 "BudLib:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 2000 5450 50  0001 C CNN
F 3 "~" H 2000 5450 50  0001 C CNN
	1    2000 5450
	0    -1   -1   0   
$EndComp
$Comp
L power:+1V8 #PWR0106
U 1 1 5C2AC597
P 3550 7400
F 0 "#PWR0106" H 3550 7250 50  0001 C CNN
F 1 "+1V8" H 3565 7573 50  0000 C CNN
F 2 "" H 3550 7400 50  0001 C CNN
F 3 "" H 3550 7400 50  0001 C CNN
	1    3550 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5C2ACFB0
P 3800 7650
F 0 "C6" H 3915 7696 50  0000 L CNN
F 1 ".1uf" H 3915 7605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3838 7500 50  0001 C CNN
F 3 "~" H 3800 7650 50  0001 C CNN
	1    3800 7650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5C2AD6D5
P 3800 7850
F 0 "#PWR0107" H 3800 7600 50  0001 C CNN
F 1 "GND" H 3805 7677 50  0000 C CNN
F 2 "" H 3800 7850 50  0001 C CNN
F 3 "" H 3800 7850 50  0001 C CNN
	1    3800 7850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 7850 3800 7800
Wire Wire Line
	3800 7500 3550 7500
Wire Wire Line
	3550 7500 3550 7400
Wire Wire Line
	3550 7950 3550 7900
Connection ~ 3550 7500
Wire Wire Line
	3650 7950 3650 7900
Wire Wire Line
	3650 7900 3550 7900
Connection ~ 3550 7900
Wire Wire Line
	3550 7900 3550 7500
$Comp
L power:GND #PWR0108
U 1 1 5C2B19DA
P 3650 9350
F 0 "#PWR0108" H 3650 9100 50  0001 C CNN
F 1 "GND" H 3655 9177 50  0000 C CNN
F 2 "" H 3650 9350 50  0001 C CNN
F 3 "" H 3650 9350 50  0001 C CNN
	1    3650 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 9250 3600 9300
Wire Wire Line
	3600 9300 3650 9300
Wire Wire Line
	3700 9300 3700 9250
Wire Wire Line
	3650 9350 3650 9300
Connection ~ 3650 9300
Wire Wire Line
	3650 9300 3700 9300
$Comp
L bluetoothGame-rescue:LED_Cree-PLCC4-BudKiCadComponent D4
U 1 1 5C2B8818
P 2700 2550
F 0 "D4" V 2738 2433 50  0000 R CNN
F 1 "CLM2D-CCC-CZ0C03123 (blue)" V 2647 2432 50  0001 R CNN
F 2 "BudLib:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 3200 2650 50  0001 R CNN
F 3 "~" H 2700 2550 50  0001 C CNN
	1    2700 2550
	0    -1   -1   0   
$EndComp
$Comp
L bluetoothGame-rescue:LED_Cree-PLCC4-BudKiCadComponent D3
U 1 1 5C2B881E
P 2550 5450
F 0 "D3" V 2600 5300 50  0000 C CNN
F 1 "CLM2D-RCC-CZ0B0BB3 (Red)" H 2550 5550 50  0001 C CNN
F 2 "BudLib:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 2550 5450 50  0001 C CNN
F 3 "~" H 2550 5450 50  0001 C CNN
	1    2550 5450
	0    -1   -1   0   
$EndComp
$Comp
L bluetoothGame-rescue:LED_Cree-PLCC4-BudKiCadComponent D6
U 1 1 5C2BA129
P 3250 2550
F 0 "D6" V 3288 2433 50  0000 R CNN
F 1 "CLM2D-CCC-CZ0C03123 (blue)" V 3197 2432 50  0001 R CNN
F 2 "BudLib:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 3750 2650 50  0001 R CNN
F 3 "~" H 3250 2550 50  0001 C CNN
	1    3250 2550
	0    -1   -1   0   
$EndComp
$Comp
L bluetoothGame-rescue:LED_Cree-PLCC4-BudKiCadComponent D5
U 1 1 5C2BA12F
P 3100 5450
F 0 "D5" V 3150 5300 50  0000 C CNN
F 1 "CLM2D-RCC-CZ0B0BB3 (Red)" H 3100 5550 50  0001 C CNN
F 2 "BudLib:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 3100 5450 50  0001 C CNN
F 3 "~" H 3100 5450 50  0001 C CNN
	1    3100 5450
	0    -1   -1   0   
$EndComp
$Comp
L bluetoothGame-rescue:LED_Cree-PLCC4-BudKiCadComponent D8
U 1 1 5C2BA135
P 3800 2550
F 0 "D8" V 3838 2433 50  0000 R CNN
F 1 "CLM2D-CCC-CZ0C03123 (blue)" V 3747 2432 50  0001 R CNN
F 2 "BudLib:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 4300 2650 50  0001 R CNN
F 3 "~" H 3800 2550 50  0001 C CNN
	1    3800 2550
	0    -1   -1   0   
$EndComp
$Comp
L bluetoothGame-rescue:LED_Cree-PLCC4-BudKiCadComponent D7
U 1 1 5C2BA13B
P 3650 5450
F 0 "D7" V 3700 5300 50  0000 C CNN
F 1 "CLM2D-RCC-CZ0B0BB3 (Red)" H 3650 5550 50  0001 C CNN
F 2 "BudLib:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 3650 5450 50  0001 C CNN
F 3 "~" H 3650 5450 50  0001 C CNN
	1    3650 5450
	0    -1   -1   0   
$EndComp
Text Notes 1600 2300 0    50   ~ 0
Blue Leds
Text Notes 1500 5450 0    50   ~ 0
Red Leds
$Comp
L power:+BATT #PWR0109
U 1 1 5C2BDF84
P 3000 1850
F 0 "#PWR0109" H 3000 1700 50  0001 C CNN
F 1 "+BATT" H 3015 2023 50  0000 C CNN
F 2 "" H 3000 1850 50  0001 C CNN
F 3 "" H 3000 1850 50  0001 C CNN
	1    3000 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5C2BDFC5
P 3000 3700
F 0 "#PWR0110" H 3000 3450 50  0001 C CNN
F 1 "GND" H 3005 3527 50  0000 C CNN
F 2 "" H 3000 3700 50  0001 C CNN
F 3 "" H 3000 3700 50  0001 C CNN
	1    3000 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5C2C7456
P 2150 2200
F 0 "R4" H 2220 2246 50  0000 L CNN
F 1 "56" H 2220 2155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2080 2200 50  0001 C CNN
F 3 "~" H 2150 2200 50  0001 C CNN
	1    2150 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5C2C7647
P 2700 2200
F 0 "R6" H 2770 2246 50  0000 L CNN
F 1 "56" H 2770 2155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2630 2200 50  0001 C CNN
F 3 "~" H 2700 2200 50  0001 C CNN
	1    2700 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5C2C76A9
P 3250 2200
F 0 "R8" H 3320 2246 50  0000 L CNN
F 1 "56" H 3320 2155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3180 2200 50  0001 C CNN
F 3 "~" H 3250 2200 50  0001 C CNN
	1    3250 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5C2C770F
P 3800 2200
F 0 "R10" H 3870 2246 50  0000 L CNN
F 1 "56" H 3870 2155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3730 2200 50  0001 C CNN
F 3 "~" H 3800 2200 50  0001 C CNN
	1    3800 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5C2C7816
P 2000 5100
F 0 "R3" H 2070 5146 50  0000 L CNN
F 1 "120" H 2070 5055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1930 5100 50  0001 C CNN
F 3 "~" H 2000 5100 50  0001 C CNN
	1    2000 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0111
U 1 1 5C2CCAAD
P 2850 4800
F 0 "#PWR0111" H 2850 4650 50  0001 C CNN
F 1 "+BATT" H 2865 4973 50  0000 C CNN
F 2 "" H 2850 4800 50  0001 C CNN
F 3 "" H 2850 4800 50  0001 C CNN
	1    2850 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5C2CD164
P 2550 5100
F 0 "R5" H 2620 5146 50  0000 L CNN
F 1 "120" H 2620 5055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2480 5100 50  0001 C CNN
F 3 "~" H 2550 5100 50  0001 C CNN
	1    2550 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5C2CD1C8
P 3100 5100
F 0 "R7" H 3170 5146 50  0000 L CNN
F 1 "120" H 3170 5055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3030 5100 50  0001 C CNN
F 3 "~" H 3100 5100 50  0001 C CNN
	1    3100 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5C2CD232
P 3650 5100
F 0 "R9" H 3720 5146 50  0000 L CNN
F 1 "120" H 3720 5055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3580 5100 50  0001 C CNN
F 3 "~" H 3650 5100 50  0001 C CNN
	1    3650 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 5600 2000 5700
Wire Wire Line
	2000 5700 2550 5700
Wire Wire Line
	3650 5700 3650 5600
Wire Wire Line
	3100 5600 3100 5700
Connection ~ 3100 5700
Wire Wire Line
	3100 5700 3650 5700
Wire Wire Line
	2550 5600 2550 5700
Connection ~ 2550 5700
Wire Wire Line
	2550 5700 2850 5700
Wire Wire Line
	2850 5750 2850 5700
Connection ~ 2850 5700
Wire Wire Line
	2850 5700 3100 5700
$Comp
L power:GND #PWR0112
U 1 1 5C2D5C2A
P 2850 6600
F 0 "#PWR0112" H 2850 6350 50  0001 C CNN
F 1 "GND" H 2855 6427 50  0000 C CNN
F 2 "" H 2850 6600 50  0001 C CNN
F 3 "" H 2850 6600 50  0001 C CNN
	1    2850 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 6550 2850 6600
Wire Wire Line
	2000 5250 2000 5300
Wire Wire Line
	2550 5250 2550 5300
Wire Wire Line
	3100 5250 3100 5300
Wire Wire Line
	3650 5250 3650 5300
Wire Wire Line
	3650 4950 3650 4900
Wire Wire Line
	3650 4900 3100 4900
Wire Wire Line
	2000 4900 2000 4950
Wire Wire Line
	2550 4950 2550 4900
Connection ~ 2550 4900
Wire Wire Line
	2550 4900 2000 4900
Wire Wire Line
	3100 4950 3100 4900
Connection ~ 3100 4900
Wire Wire Line
	3100 4900 2850 4900
Wire Wire Line
	2850 4900 2850 4800
Connection ~ 2850 4900
Wire Wire Line
	2850 4900 2550 4900
Wire Wire Line
	2150 2700 2150 2750
Wire Wire Line
	2150 2750 2700 2750
Wire Wire Line
	3800 2750 3800 2700
Wire Wire Line
	3250 2700 3250 2750
Connection ~ 3250 2750
Wire Wire Line
	3250 2750 3800 2750
Wire Wire Line
	2700 2700 2700 2750
Connection ~ 2700 2750
Wire Wire Line
	2700 2750 3000 2750
Wire Wire Line
	2150 2350 2150 2400
Wire Wire Line
	2700 2350 2700 2400
Wire Wire Line
	3250 2350 3250 2400
Wire Wire Line
	3800 2350 3800 2400
Wire Wire Line
	3800 2050 3800 2000
Wire Wire Line
	3800 2000 3250 2000
Wire Wire Line
	2150 2000 2150 2050
Wire Wire Line
	2700 2050 2700 2000
Connection ~ 2700 2000
Wire Wire Line
	2700 2000 2150 2000
Wire Wire Line
	3250 2050 3250 2000
Connection ~ 3250 2000
Wire Wire Line
	3250 2000 3000 2000
Wire Wire Line
	3000 1850 3000 2000
Connection ~ 3000 2000
Wire Wire Line
	3000 2000 2700 2000
Wire Wire Line
	3000 2750 3000 2850
Connection ~ 3000 2750
Wire Wire Line
	3000 2750 3250 2750
Wire Wire Line
	3000 3650 3000 3700
$Comp
L Device:R R11
U 1 1 5C31E4F8
P 4500 8350
F 0 "R11" H 4570 8396 50  0000 L CNN
F 1 "1k" H 4570 8305 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 4430 8350 50  0001 C CNN
F 3 "~" H 4500 8350 50  0001 C CNN
	1    4500 8350
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR0113
U 1 1 5C31EAB0
P 4600 8100
F 0 "#PWR0113" H 4600 7950 50  0001 C CNN
F 1 "+1V8" H 4615 8273 50  0000 C CNN
F 2 "" H 4600 8100 50  0001 C CNN
F 3 "" H 4600 8100 50  0001 C CNN
	1    4600 8100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5C31EB4B
P 4750 8350
F 0 "R12" H 4820 8396 50  0000 L CNN
F 1 "1k" H 4820 8305 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 4680 8350 50  0001 C CNN
F 3 "~" H 4750 8350 50  0001 C CNN
	1    4750 8350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 8200 4500 8150
Wire Wire Line
	4750 8200 4750 8150
Wire Wire Line
	4750 8150 4600 8150
Wire Wire Line
	4600 8150 4600 8100
Connection ~ 4600 8150
Wire Wire Line
	4600 8150 4500 8150
Wire Wire Line
	4750 8650 4750 8500
Wire Wire Line
	4250 8650 4750 8650
Wire Wire Line
	4500 8500 4500 8550
Wire Wire Line
	4500 8550 4250 8550
Wire Wire Line
	4400 8150 4500 8150
Connection ~ 4500 8150
Wire Wire Line
	4250 8850 4400 8850
Wire Wire Line
	4400 8150 4400 8750
Wire Wire Line
	4250 8750 4400 8750
Connection ~ 4400 8750
Wire Wire Line
	4400 8750 4400 8850
$Comp
L power:GND #PWR0114
U 1 1 5C3517D6
P 2950 8900
F 0 "#PWR0114" H 2950 8650 50  0001 C CNN
F 1 "GND" H 2955 8727 50  0000 C CNN
F 2 "" H 2950 8900 50  0001 C CNN
F 3 "" H 2950 8900 50  0001 C CNN
	1    2950 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 8900 2950 8850
Wire Wire Line
	2950 8850 3000 8850
Wire Wire Line
	4250 8350 4250 7600
Wire Wire Line
	4250 8450 4350 8450
Wire Wire Line
	4350 8450 4350 7750
Text Label 4500 7600 0    50   ~ 0
INT1
Text Label 4500 7750 0    50   ~ 0
INT2
Wire Wire Line
	4500 8550 5200 8550
Connection ~ 4500 8550
Wire Wire Line
	4750 8650 5200 8650
Connection ~ 4750 8650
Text Label 4950 8550 0    50   ~ 0
SCL
Text Label 4950 8650 0    50   ~ 0
SDA
Text Label 8200 5050 0    50   ~ 0
SDA
Text Label 8200 5200 0    50   ~ 0
SCL
$Comp
L Device:Crystal_GND23 Y1
U 1 1 5C37D963
P 7250 5400
F 0 "Y1" V 7300 5200 50  0000 R CNN
F 1 "32.768khz" V 7100 5800 50  0000 R CNN
F 2 "BudLib:Crystal_SMD_SeikoEpson_MC146-4Pin_6.7x1.5mm" H 7250 5400 50  0001 C CNN
F 3 "~" H 7250 5400 50  0001 C CNN
	1    7250 5400
	0    1    1    0   
$EndComp
$Comp
L Device:C C8
U 1 1 5C38AB53
P 7050 5700
F 0 "C8" V 6900 5800 50  0000 C CNN
F 1 "12.5pf" V 6900 5550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7088 5550 50  0001 C CNN
F 3 "~" H 7050 5700 50  0001 C CNN
	1    7050 5700
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C7
U 1 1 5C391765
P 7050 5100
F 0 "C7" V 7150 5250 50  0000 C CNN
F 1 "12.5pf" V 6900 5150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7088 4950 50  0001 C CNN
F 3 "~" H 7050 5100 50  0001 C CNN
	1    7050 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7250 5100 7200 5100
Wire Wire Line
	7250 5250 7250 5100
Wire Wire Line
	7200 5700 7250 5700
Wire Wire Line
	7250 5550 7250 5700
$Comp
L power:GND #PWR0115
U 1 1 5C3AB6AF
P 7500 5450
F 0 "#PWR0115" H 7500 5200 50  0001 C CNN
F 1 "GND" H 7505 5277 50  0000 C CNN
F 2 "" H 7500 5450 50  0001 C CNN
F 3 "" H 7500 5450 50  0001 C CNN
	1    7500 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 5450 7500 5400
Wire Wire Line
	7500 5400 7450 5400
Wire Wire Line
	7050 5400 6850 5400
Wire Wire Line
	6850 5400 6850 5100
Wire Wire Line
	6850 5100 6900 5100
Wire Wire Line
	6850 5400 6850 5600
Wire Wire Line
	6850 5700 6900 5700
Connection ~ 6850 5400
$Comp
L power:GND #PWR0116
U 1 1 5C3C03ED
P 6750 5700
F 0 "#PWR0116" H 6750 5450 50  0001 C CNN
F 1 "GND" H 6755 5527 50  0000 C CNN
F 2 "" H 6750 5700 50  0001 C CNN
F 3 "" H 6750 5700 50  0001 C CNN
	1    6750 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 5700 6750 5600
Wire Wire Line
	6750 5600 6850 5600
Connection ~ 6850 5600
Wire Wire Line
	6850 5600 6850 5700
Wire Wire Line
	7250 5100 7800 5100
Wire Wire Line
	7800 5100 7800 5350
Wire Wire Line
	7800 5350 8400 5350
Connection ~ 7250 5100
Wire Wire Line
	7250 5700 7800 5700
Wire Wire Line
	7800 5700 7800 5500
Wire Wire Line
	7800 5500 8400 5500
Connection ~ 7250 5700
Text Label 8100 5650 0    50   ~ 0
INT1
Text Label 8100 5800 0    50   ~ 0
INT2
Wire Wire Line
	8400 5650 8100 5650
Wire Wire Line
	8400 5800 8100 5800
Wire Wire Line
	4500 7600 4250 7600
Wire Wire Line
	4350 7750 4500 7750
Text Label 2300 3450 0    50   ~ 0
Blue
Text Label 2200 6350 0    50   ~ 0
Red
Wire Wire Line
	2400 6350 2350 6350
Wire Wire Line
	2550 3450 2500 3450
Wire Wire Line
	8200 5050 8400 5050
Wire Wire Line
	8200 5200 8400 5200
$Comp
L power:GND #PWR0117
U 1 1 5C45735A
P 13150 2950
F 0 "#PWR0117" H 13150 2700 50  0001 C CNN
F 1 "GND" H 13155 2777 50  0000 C CNN
F 2 "" H 13150 2950 50  0001 C CNN
F 3 "" H 13150 2950 50  0001 C CNN
	1    13150 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0118
U 1 1 5C457403
P 12650 2950
F 0 "#PWR0118" H 12650 2800 50  0001 C CNN
F 1 "+BATT" H 12665 3123 50  0000 C CNN
F 2 "" H 12650 2950 50  0001 C CNN
F 3 "" H 12650 2950 50  0001 C CNN
	1    12650 2950
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint_2Pole TP1
U 1 1 5C469007
P 12900 2900
F 0 "TP1" H 12900 3095 50  0000 C CNN
F 1 "TestPoint_2Pole" H 12900 3004 50  0000 C CNN
F 2 "TestPoint:TestPoint_2Pads_Pitch2.54mm_Drill0.8mm" H 12900 2900 50  0001 C CNN
F 3 "~" H 12900 2900 50  0001 C CNN
	1    12900 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	12650 2950 12700 2950
Wire Wire Line
	12700 2950 12700 2900
Wire Wire Line
	13150 2950 13150 2900
Wire Wire Line
	13150 2900 13100 2900
Text Label 11300 7150 1    50   ~ 0
Buz1
Text Label 11400 7150 1    50   ~ 0
Buz2
Text Label 7950 5500 0    50   ~ 0
XL2
Text Label 8000 5350 0    50   ~ 0
XL1
Text Label 13650 5050 0    50   ~ 0
SWDIO
Text Label 13650 5200 0    50   ~ 0
SWCLK
Text Label 13650 5350 0    50   ~ 0
nReset
$Comp
L Device:R R1
U 1 1 5C2951AA
P 14000 4800
F 0 "R1" H 14070 4846 50  0000 L CNN
F 1 "10k" H 14070 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 13930 4800 50  0001 C CNN
F 3 "~" H 14000 4800 50  0001 C CNN
	1    14000 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR0119
U 1 1 5C29526C
P 14000 4600
F 0 "#PWR0119" H 14000 4450 50  0001 C CNN
F 1 "+1V8" H 14015 4773 50  0000 C CNN
F 2 "" H 14000 4600 50  0001 C CNN
F 3 "" H 14000 4600 50  0001 C CNN
	1    14000 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	14000 4600 14000 4650
Wire Wire Line
	14000 4950 14000 5350
Connection ~ 14000 5350
Wire Wire Line
	14000 5350 15150 5350
Text Label 3300 5700 0    50   ~ 0
Red_Fet
Text Label 3450 2750 0    50   ~ 0
Blue_Fet
Wire Wire Line
	11400 7250 11400 6900
Wire Wire Line
	11300 6900 11300 7250
Wire Wire Line
	11300 7250 11200 7250
Text Label 12800 7100 1    50   ~ 0
Red
Text Label 12100 7100 1    50   ~ 0
Blue
Wire Wire Line
	12100 7100 12100 6900
Wire Wire Line
	12800 7100 12800 6900
$Comp
L bluetoothGame-rescue:UM6K33NTN-BudKiCadComponent Q1
U 2 1 5C29AC1A
P 2950 3300
F 0 "Q1" H 3177 3403 60  0000 L CNN
F 1 "UM6K33NTN" H 3177 3297 60  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 2500 3600 60  0001 C CNN
F 3 "" H 2500 3600 60  0001 C CNN
	2    2950 3300
	1    0    0    -1  
$EndComp
$Comp
L bluetoothGame-rescue:UM6K33NTN-BudKiCadComponent Q1
U 1 1 5C29ACE0
P 2800 6200
F 0 "Q1" H 3027 6303 60  0000 L CNN
F 1 "UM6K33NTN" H 3027 6197 60  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 2350 6500 60  0001 C CNN
F 3 "" H 2350 6500 60  0001 C CNN
	1    2800 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 5C29E8CE
P 2500 3650
F 0 "R16" H 2570 3696 50  0000 L CNN
F 1 "10k" H 2570 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2430 3650 50  0001 C CNN
F 3 "~" H 2500 3650 50  0001 C CNN
	1    2500 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5C29ED49
P 2350 6550
F 0 "R15" H 2420 6596 50  0000 L CNN
F 1 "10k" H 2420 6505 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2280 6550 50  0001 C CNN
F 3 "~" H 2350 6550 50  0001 C CNN
	1    2350 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5C29EE0B
P 2350 6750
F 0 "#PWR0120" H 2350 6500 50  0001 C CNN
F 1 "GND" H 2355 6577 50  0000 C CNN
F 2 "" H 2350 6750 50  0001 C CNN
F 3 "" H 2350 6750 50  0001 C CNN
	1    2350 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5C29EE66
P 2500 3850
F 0 "#PWR0121" H 2500 3600 50  0001 C CNN
F 1 "GND" H 2505 3677 50  0000 C CNN
F 2 "" H 2500 3850 50  0001 C CNN
F 3 "" H 2500 3850 50  0001 C CNN
	1    2500 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3500 2500 3450
Connection ~ 2500 3450
Wire Wire Line
	2500 3450 2300 3450
Wire Wire Line
	2500 3850 2500 3800
Wire Wire Line
	2350 6400 2350 6350
Connection ~ 2350 6350
Wire Wire Line
	2350 6350 2200 6350
Wire Wire Line
	2350 6750 2350 6700
$EndSCHEMATC
