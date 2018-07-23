EESchema Schematic File Version 4
LIBS:clock3-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_ST_STM32L1:STM32L152RETx U2
U 1 1 5B3EBB29
P 4350 3850
F 0 "U2" H 4300 5828 50  0000 C CNN
F 1 "STM32L152RETx" H 3600 5700 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 3750 2150 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00098321.pdf" H 4350 3850 50  0001 C CNN
	1    4350 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5B3EDB69
P 4150 5650
F 0 "#PWR07" H 4150 5400 50  0001 C CNN
F 1 "GND" H 4155 5477 50  0000 C CNN
F 2 "" H 4150 5650 50  0001 C CNN
F 3 "" H 4150 5650 50  0001 C CNN
	1    4150 5650
	1    0    0    -1  
$EndComp
Connection ~ 4150 5650
$Comp
L power:VDD #PWR06
U 1 1 5B3EDF0A
P 3900 1800
F 0 "#PWR06" H 3900 1650 50  0001 C CNN
F 1 "VDD" H 3917 1973 50  0000 C CNN
F 2 "" H 3900 1800 50  0001 C CNN
F 3 "" H 3900 1800 50  0001 C CNN
	1    3900 1800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR025
U 1 1 5B3EF1C3
P 10450 5850
F 0 "#PWR025" H 10450 5700 50  0001 C CNN
F 1 "VCC" H 10467 6023 50  0000 C CNN
F 2 "" H 10450 5850 50  0001 C CNN
F 3 "" H 10450 5850 50  0001 C CNN
	1    10450 5850
	1    0    0    -1  
$EndComp
Text Label 4950 4750 0    50   ~ 0
I2C1_SCL
Text Label 4950 4850 0    50   ~ 0
I2C1_SDA
$Comp
L Device:C C10
U 1 1 5B401CD7
P 4950 1650
F 0 "C10" H 5000 1750 50  0000 L CNN
F 1 "100nF" V 5000 1350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4988 1500 50  0001 C CNN
F 3 "~" H 4950 1650 50  0001 C CNN
	1    4950 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5B401D0B
P 5150 1650
F 0 "C11" H 5200 1750 50  0000 L CNN
F 1 "1uF" V 5200 1350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5188 1500 50  0001 C CNN
F 3 "~" H 5150 1650 50  0001 C CNN
	1    5150 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2050 4950 2050
Wire Wire Line
	4950 2050 4950 1800
Wire Wire Line
	4950 2050 5150 2050
Wire Wire Line
	5150 2050 5150 1800
Connection ~ 4950 2050
Wire Wire Line
	3900 1800 4150 1800
Wire Wire Line
	4350 1800 4150 1800
Connection ~ 4150 1800
Wire Wire Line
	4350 1800 4550 1800
Connection ~ 4350 1800
Wire Wire Line
	4550 1800 4750 1800
Connection ~ 4550 1800
Connection ~ 5150 1800
Connection ~ 4750 1800
Wire Wire Line
	4750 1800 4950 1800
Connection ~ 4950 1800
Wire Wire Line
	4950 1800 5150 1800
Wire Wire Line
	4150 2050 4150 1800
Wire Wire Line
	4250 2050 4250 1850
Wire Wire Line
	4250 1850 4350 1850
Wire Wire Line
	4350 1850 4350 1800
Wire Wire Line
	4350 2050 4350 1900
Wire Wire Line
	4350 1900 4550 1900
Wire Wire Line
	4550 1900 4550 1800
Wire Wire Line
	4450 2050 4450 1950
Wire Wire Line
	4450 1950 4750 1950
Wire Wire Line
	4750 1950 4750 1800
$Comp
L Device:C C9
U 1 1 5B406A99
P 4750 1650
F 0 "C9" H 4800 1750 50  0000 L CNN
F 1 "100nF" V 4800 1350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4788 1500 50  0001 C CNN
F 3 "~" H 4750 1650 50  0001 C CNN
	1    4750 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5B406AC9
P 4550 1650
F 0 "C8" H 4600 1750 50  0000 L CNN
F 1 "100nF" V 4600 1350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4588 1500 50  0001 C CNN
F 3 "~" H 4550 1650 50  0001 C CNN
	1    4550 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5B406AFB
P 4350 1650
F 0 "C7" H 4400 1750 50  0000 L CNN
F 1 "100nF" V 4400 1350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4388 1500 50  0001 C CNN
F 3 "~" H 4350 1650 50  0001 C CNN
	1    4350 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5B406B2F
P 4150 1650
F 0 "C6" H 4200 1750 50  0000 L CNN
F 1 "100nF" V 4200 1350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4188 1500 50  0001 C CNN
F 3 "~" H 4150 1650 50  0001 C CNN
	1    4150 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5B406B9F
P 5400 1500
F 0 "#PWR08" H 5400 1250 50  0001 C CNN
F 1 "GND" H 5405 1327 50  0000 C CNN
F 2 "" H 5400 1500 50  0001 C CNN
F 3 "" H 5400 1500 50  0001 C CNN
	1    5400 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1500 5150 1500
Connection ~ 4350 1500
Wire Wire Line
	4350 1500 4150 1500
Connection ~ 4550 1500
Wire Wire Line
	4550 1500 4350 1500
Connection ~ 4750 1500
Wire Wire Line
	4750 1500 4550 1500
Connection ~ 4950 1500
Wire Wire Line
	4950 1500 4750 1500
Connection ~ 5150 1500
Wire Wire Line
	5150 1500 4950 1500
Wire Wire Line
	8500 4550 8850 4550
$Comp
L Device:C C15
U 1 1 5B408EF0
P 8300 4750
F 0 "C15" V 8450 4750 50  0000 C CNN
F 1 "100nF" V 8550 4750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8338 4600 50  0001 C CNN
F 3 "~" H 8300 4750 50  0001 C CNN
	1    8300 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	8100 4550 8100 4750
Wire Wire Line
	8100 4750 8150 4750
Wire Wire Line
	8450 4750 8500 4750
Wire Wire Line
	8500 4750 8500 4550
$Comp
L power:GND #PWR013
U 1 1 5B40AFA6
P 8000 4550
F 0 "#PWR013" H 8000 4300 50  0001 C CNN
F 1 "GND" H 8005 4377 50  0000 C CNN
F 2 "" H 8000 4550 50  0001 C CNN
F 3 "" H 8000 4550 50  0001 C CNN
	1    8000 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 4550 8100 4550
$Comp
L dk_Oscillators:SIT1533AI-H4-DCC-32_768E Y2
U 1 1 5B40C297
P 3400 5850
F 0 "Y2" V 3750 5700 60  0000 L CNN
F 1 "SIT1533AI-H4-DCC-32_768E" V 3750 5950 60  0000 L CNN
F 2 "digikey-footprints:Oscillator_MEMS_SIT1533AI-H4-DCC-32.768E" H 3600 6050 60  0001 L CNN
F 3 "https://www.sitime.com/datasheet/SiT1533" H 3600 6150 60  0001 L CNN
F 4 "1473-1239-1-ND" H 3600 6250 60  0001 L CNN "Digi-Key_PN"
F 5 "SIT1533AI-H4-DCC-32.768E" H 3600 6350 60  0001 L CNN "MPN"
F 6 "Crystals, Oscillators, Resonators" H 3600 6450 60  0001 L CNN "Category"
F 7 "Oscillators" H 3600 6550 60  0001 L CNN "Family"
F 8 "https://www.sitime.com/datasheet/SiT1533" H 3600 6650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/sitime/SIT1533AI-H4-DCC-32.768E/1473-1239-1-ND/4898151" H 3600 6750 60  0001 L CNN "DK_Detail_Page"
F 10 "OSC MEMS 32.768KHZ LVCMOS SMD" H 3600 6850 60  0001 L CNN "Description"
F 11 "SiTIME" H 3600 6950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3600 7050 60  0001 L CNN "Status"
	1    3400 5850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3400 5350 3650 5350
Wire Wire Line
	3800 5850 3800 5650
Wire Wire Line
	3800 5650 4150 5650
$Comp
L power:VDD #PWR05
U 1 1 5B41B096
P 3000 5850
F 0 "#PWR05" H 3000 5700 50  0001 C CNN
F 1 "VDD" H 3017 6023 50  0000 C CNN
F 2 "" H 3000 5850 50  0001 C CNN
F 3 "" H 3000 5850 50  0001 C CNN
	1    3000 5850
	1    0    0    -1  
$EndComp
$Comp
L dk_Slide-Switches:EG1218 BOOT1
U 1 1 5B41BCC5
P 9450 4250
F 0 "BOOT1" H 9700 4200 50  0000 C CNN
F 1 "EG1218" H 9450 4438 50  0000 C CNN
F 2 "digikey-footprints:Switch_Slide_11.6x4mm_EG1218" H 9650 4450 50  0001 L CNN
F 3 "http://spec_sheets.e-switch.com/specs/P040040.pdf" H 9650 4550 60  0001 L CNN
F 4 "EG1903-ND" H 9650 4650 60  0001 L CNN "Digi-Key_PN"
F 5 "EG1218" H 9650 4750 60  0001 L CNN "MPN"
F 6 "Switches" H 9650 4850 60  0001 L CNN "Category"
F 7 "Slide Switches" H 9650 4950 60  0001 L CNN "Family"
F 8 "http://spec_sheets.e-switch.com/specs/P040040.pdf" H 9650 5050 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/e-switch/EG1218/EG1903-ND/101726" H 9650 5150 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH SLIDE SPDT 200MA 30V" H 9650 5250 60  0001 L CNN "Description"
F 11 "E-Switch" H 9650 5350 60  0001 L CNN "Manufacturer"
F 12 "Active" H 9650 5450 60  0001 L CNN "Status"
	1    9450 4250
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5B41BEEC
P 9900 4250
F 0 "R2" V 9693 4250 50  0000 C CNN
F 1 "10k" V 9784 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9830 4250 50  0001 C CNN
F 3 "~" H 9900 4250 50  0001 C CNN
	1    9900 4250
	0    -1   1    0   
$EndComp
Text Label 10050 4250 0    50   ~ 0
BOOT0
Text Label 3650 2450 2    50   ~ 0
BOOT0
Wire Wire Line
	9650 4250 9750 4250
$Comp
L power:VDD #PWR017
U 1 1 5B41FA41
P 9250 4150
F 0 "#PWR017" H 9250 4000 50  0001 C CNN
F 1 "VDD" H 9267 4323 50  0000 C CNN
F 2 "" H 9250 4150 50  0001 C CNN
F 3 "" H 9250 4150 50  0001 C CNN
	1    9250 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5B41FAE4
P 9250 4350
F 0 "#PWR018" H 9250 4100 50  0001 C CNN
F 1 "GND" H 9255 4177 50  0000 C CNN
F 2 "" H 9250 4350 50  0001 C CNN
F 3 "" H 9250 4350 50  0001 C CNN
	1    9250 4350
	1    0    0    -1  
$EndComp
$Comp
L dk_Slide-Switches:EG1218 BOOT2
U 1 1 5B4215B4
P 9450 4900
F 0 "BOOT2" H 9700 4850 50  0000 C CNN
F 1 "EG1218" H 9450 5088 50  0000 C CNN
F 2 "digikey-footprints:Switch_Slide_11.6x4mm_EG1218" H 9650 5100 50  0001 L CNN
F 3 "http://spec_sheets.e-switch.com/specs/P040040.pdf" H 9650 5200 60  0001 L CNN
F 4 "EG1903-ND" H 9650 5300 60  0001 L CNN "Digi-Key_PN"
F 5 "EG1218" H 9650 5400 60  0001 L CNN "MPN"
F 6 "Switches" H 9650 5500 60  0001 L CNN "Category"
F 7 "Slide Switches" H 9650 5600 60  0001 L CNN "Family"
F 8 "http://spec_sheets.e-switch.com/specs/P040040.pdf" H 9650 5700 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/e-switch/EG1218/EG1903-ND/101726" H 9650 5800 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH SLIDE SPDT 200MA 30V" H 9650 5900 60  0001 L CNN "Description"
F 11 "E-Switch" H 9650 6000 60  0001 L CNN "Manufacturer"
F 12 "Active" H 9650 6100 60  0001 L CNN "Status"
	1    9450 4900
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5B4215BA
P 9900 4900
F 0 "R3" V 9693 4900 50  0000 C CNN
F 1 "10k" V 9784 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9830 4900 50  0001 C CNN
F 3 "~" H 9900 4900 50  0001 C CNN
	1    9900 4900
	0    -1   1    0   
$EndComp
Text Label 10050 4900 0    50   ~ 0
BOOT1
Wire Wire Line
	9650 4900 9750 4900
$Comp
L power:VDD #PWR019
U 1 1 5B4215C2
P 9250 4800
F 0 "#PWR019" H 9250 4650 50  0001 C CNN
F 1 "VDD" H 9267 4973 50  0000 C CNN
F 2 "" H 9250 4800 50  0001 C CNN
F 3 "" H 9250 4800 50  0001 C CNN
	1    9250 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5B4215C8
P 9250 5000
F 0 "#PWR020" H 9250 4750 50  0001 C CNN
F 1 "GND" H 9255 4827 50  0000 C CNN
F 2 "" H 9250 5000 50  0001 C CNN
F 3 "" H 9250 5000 50  0001 C CNN
	1    9250 5000
	1    0    0    -1  
$EndComp
Text Label 4950 4150 0    50   ~ 0
BOOT1
Text Label 3650 2250 2    50   ~ 0
~RESET
Text Label 8850 4550 2    50   ~ 0
~RESET
$Comp
L Device:C C12
U 1 1 5B4253CA
P 5600 4850
F 0 "C12" H 5750 4850 50  0000 C CNN
F 1 "100nF" H 5750 4750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5638 4700 50  0001 C CNN
F 3 "~" H 5600 4850 50  0001 C CNN
	1    5600 4850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5800 5050 5600 5050
Wire Wire Line
	5600 5050 5600 5000
Wire Wire Line
	5600 4700 5600 4650
$Comp
L power:GND #PWR09
U 1 1 5B4253D5
P 5800 5150
F 0 "#PWR09" H 5800 4900 50  0001 C CNN
F 1 "GND" H 5800 5000 50  0000 C CNN
F 2 "" H 5800 5150 50  0001 C CNN
F 3 "" H 5800 5150 50  0001 C CNN
	1    5800 5150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5800 5150 5800 5050
Text Label 10450 6050 0    50   ~ 0
I2C1_SCL
Text Label 10450 5950 0    50   ~ 0
I2C1_SDA
Text Label 4950 3550 0    50   ~ 0
SWDIO
Text Label 4950 3650 0    50   ~ 0
SWCLK
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:67996-412HLF J2
U 1 1 5B439003
P 10250 6050
F 0 "J2" H 10250 6350 60  0000 C CNN
F 1 "67996-412HLF" H 10250 5650 60  0000 C CNN
F 2 "digikey-footprints:PinHeader_6x2_P2.54mm_Vertical" H 10450 6250 60  0001 L CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/67996.pdf" H 10450 6350 60  0001 L CNN
F 4 "609-3219-ND" H 10450 6450 60  0001 L CNN "Digi-Key_PN"
F 5 "67996-412HLF" H 10450 6550 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 10450 6650 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 10450 6750 60  0001 L CNN "Family"
F 8 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/67996.pdf" H 10450 6850 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/amphenol-fci/67996-412HLF/609-3219-ND/1878508" H 10450 6950 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER 12POS .100 STR TIN" H 10450 7050 60  0001 L CNN "Description"
F 11 "Amphenol FCI" H 10450 7150 60  0001 L CNN "Manufacturer"
F 12 "Active" H 10450 7250 60  0001 L CNN "Status"
	1    10250 6050
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR024
U 1 1 5B4391FF
P 10050 5850
F 0 "#PWR024" H 10050 5700 50  0001 C CNN
F 1 "VDD" H 10067 6023 50  0000 C CNN
F 2 "" H 10050 5850 50  0001 C CNN
F 3 "" H 10050 5850 50  0001 C CNN
	1    10050 5850
	1    0    0    -1  
$EndComp
Text Label 10050 5950 2    50   ~ 0
SWCLK
$Comp
L power:GND #PWR023
U 1 1 5B4394EA
P 9650 6050
F 0 "#PWR023" H 9650 5800 50  0001 C CNN
F 1 "GND" H 9650 5900 50  0000 C CNN
F 2 "" H 9650 6050 50  0001 C CNN
F 3 "" H 9650 6050 50  0001 C CNN
	1    9650 6050
	1    0    0    -1  
$EndComp
Text Label 10050 6150 2    50   ~ 0
SWDIO
Text Label 10050 6250 2    50   ~ 0
~RESET
Text Label 10050 6350 2    50   ~ 0
SWO
Wire Wire Line
	9650 6050 10050 6050
Text Label 10650 5850 2    50   ~ 0
5VIN
Connection ~ 10450 5850
Text Label 10450 6250 0    50   ~ 0
USART1_RX
Text Label 10450 6350 0    50   ~ 0
USART1_TX
$Comp
L power:GND #PWR038
U 1 1 5B44E009
P 11050 6150
F 0 "#PWR038" H 11050 5900 50  0001 C CNN
F 1 "GND" H 11055 5977 50  0000 C CNN
F 2 "" H 11050 6150 50  0001 C CNN
F 3 "" H 11050 6150 50  0001 C CNN
	1    11050 6150
	1    0    0    -1  
$EndComp
Text Label 4950 3250 0    50   ~ 0
USART1_RX
Text Label 4950 3150 0    50   ~ 0
USART1_TX
Wire Wire Line
	10450 6150 11050 6150
Text Label 4950 3450 0    50   ~ 0
USB_D+
Text Label 4950 3350 0    50   ~ 0
USB_D-
$Comp
L dk_USB-DVI-HDMI-Connectors:10118194-0001LF J1
U 1 1 5B45AAEF
P 8600 6200
F 0 "J1" V 8716 6786 60  0000 L CNN
F 1 "10118194-0001LF" V 8350 5800 60  0000 L CNN
F 2 "digikey-footprints:USB_Micro_B_Female_10118194-0001LF" H 8800 6400 60  0001 L CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/10118194.pdf" H 8800 6500 60  0001 L CNN
F 4 "609-4618-1-ND" H 8800 6600 60  0001 L CNN "Digi-Key_PN"
F 5 "10118194-0001LF" H 8800 6700 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 8800 6800 60  0001 L CNN "Category"
F 7 "USB, DVI, HDMI Connectors" H 8800 6900 60  0001 L CNN "Family"
F 8 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/10118194.pdf" H 8800 7000 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/amphenol-fci/10118194-0001LF/609-4618-1-ND/2785382" H 8800 7100 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN USB MICRO B RECPT SMT R/A" H 8800 7200 60  0001 L CNN "Description"
F 11 "Amphenol FCI" H 8800 7300 60  0001 L CNN "Manufacturer"
F 12 "Active" H 8800 7400 60  0001 L CNN "Status"
	1    8600 6200
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR014
U 1 1 5B45EA63
P 8400 5900
F 0 "#PWR014" H 8400 5750 50  0001 C CNN
F 1 "VCC" V 8400 6100 50  0000 C CNN
F 2 "" H 8400 5900 50  0001 C CNN
F 3 "" H 8400 5900 50  0001 C CNN
	1    8400 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5B45EB21
P 8800 5900
F 0 "#PWR015" H 8800 5650 50  0001 C CNN
F 1 "GND" V 8800 5700 50  0000 C CNN
F 2 "" H 8800 5900 50  0001 C CNN
F 3 "" H 8800 5900 50  0001 C CNN
	1    8800 5900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5B45EC5A
P 9200 6300
F 0 "#PWR016" H 9200 6050 50  0001 C CNN
F 1 "GND" H 9205 6127 50  0000 C CNN
F 2 "" H 9200 6300 50  0001 C CNN
F 3 "" H 9200 6300 50  0001 C CNN
	1    9200 6300
	1    0    0    -1  
$EndComp
Text Label 8500 5900 1    50   ~ 0
USB_D-
Text Label 8600 5900 1    50   ~ 0
USB_D+
Wire Wire Line
	8700 5900 8800 5900
Connection ~ 8800 5900
Wire Wire Line
	5600 4650 5800 4650
$Comp
L Device:C C13
U 1 1 5B48B647
P 6350 4850
F 0 "C13" H 6500 4850 50  0000 C CNN
F 1 "100nF" H 6500 4750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6388 4700 50  0001 C CNN
F 3 "~" H 6350 4850 50  0001 C CNN
	1    6350 4850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6550 5050 6350 5050
Wire Wire Line
	6350 5050 6350 5000
Wire Wire Line
	6350 4700 6350 4650
$Comp
L power:GND #PWR011
U 1 1 5B48B650
P 6550 5150
F 0 "#PWR011" H 6550 4900 50  0001 C CNN
F 1 "GND" H 6550 5000 50  0000 C CNN
F 2 "" H 6550 5150 50  0001 C CNN
F 3 "" H 6550 5150 50  0001 C CNN
	1    6550 5150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6550 5150 6550 5050
Wire Wire Line
	6350 4650 6550 4650
$Comp
L Device:C C14
U 1 1 5B48D05C
P 7100 4850
F 0 "C14" H 7250 4850 50  0000 C CNN
F 1 "100nF" H 7250 4750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7138 4700 50  0001 C CNN
F 3 "~" H 7100 4850 50  0001 C CNN
	1    7100 4850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7300 5050 7100 5050
Wire Wire Line
	7100 5050 7100 5000
Wire Wire Line
	7100 4700 7100 4650
$Comp
L power:GND #PWR012
U 1 1 5B48D065
P 7300 5150
F 0 "#PWR012" H 7300 4900 50  0001 C CNN
F 1 "GND" H 7300 5000 50  0000 C CNN
F 2 "" H 7300 5150 50  0001 C CNN
F 3 "" H 7300 5150 50  0001 C CNN
	1    7300 5150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7300 5150 7300 5050
Wire Wire Line
	7100 4650 7300 4650
Wire Wire Line
	4950 4650 5600 4650
Connection ~ 5600 4650
Wire Wire Line
	4950 4550 6350 4550
Wire Wire Line
	6350 4550 6350 4650
Connection ~ 6350 4650
Wire Wire Line
	4950 4450 7100 4450
Wire Wire Line
	7100 4450 7100 4650
Connection ~ 7100 4650
$Comp
L Device:Crystal Y1
U 1 1 5B4BA15B
P 2700 3400
F 0 "Y1" V 2746 3269 50  0000 R CNN
F 1 "8MHz" V 2655 3269 50  0000 R CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 2700 3400 50  0001 C CNN
F 3 "~" H 2700 3400 50  0001 C CNN
	1    2700 3400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5B4BA309
P 3200 3550
F 0 "R1" V 3200 3550 50  0000 C CNN
F 1 "390" V 3300 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3130 3550 50  0001 C CNN
F 3 "~" H 3200 3550 50  0001 C CNN
	1    3200 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 3550 3650 3550
Wire Wire Line
	2700 3550 3050 3550
$Comp
L Device:C C5
U 1 1 5B4C281D
P 2450 3550
F 0 "C5" V 2500 3650 50  0000 C CNN
F 1 "20pF" V 2600 3550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2488 3400 50  0001 C CNN
F 3 "~" H 2450 3550 50  0001 C CNN
	1    2450 3550
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 5B4C28C2
P 2450 3250
F 0 "C4" V 2500 3350 50  0000 C CNN
F 1 "20pF" V 2600 3250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2488 3100 50  0001 C CNN
F 3 "~" H 2450 3250 50  0001 C CNN
	1    2450 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	2600 3250 2700 3250
Wire Wire Line
	2600 3550 2700 3550
Wire Wire Line
	2700 3250 3200 3250
Wire Wire Line
	3200 3250 3200 3450
Wire Wire Line
	3200 3450 3650 3450
$Comp
L power:GND #PWR04
U 1 1 5B4C9EEF
P 2200 3550
F 0 "#PWR04" H 2200 3300 50  0001 C CNN
F 1 "GND" H 2205 3377 50  0000 C CNN
F 2 "" H 2200 3550 50  0001 C CNN
F 3 "" H 2200 3550 50  0001 C CNN
	1    2200 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3550 2300 3550
Wire Wire Line
	2300 3250 2200 3250
Wire Wire Line
	2200 3250 2200 3550
Connection ~ 2200 3550
Connection ~ 4450 5650
Connection ~ 4350 5650
Connection ~ 4250 5650
Wire Wire Line
	4450 5650 4550 5650
Wire Wire Line
	4350 5650 4450 5650
Wire Wire Line
	4250 5650 4350 5650
Wire Wire Line
	4150 5650 4250 5650
NoConn ~ 3650 2650
NoConn ~ 3650 3750
NoConn ~ 3650 4450
NoConn ~ 3650 4550
NoConn ~ 3650 4650
NoConn ~ 3650 4750
NoConn ~ 3650 4850
NoConn ~ 3650 4950
NoConn ~ 3650 5050
NoConn ~ 3650 5150
NoConn ~ 3650 5250
NoConn ~ 4950 2650
NoConn ~ 4950 2750
NoConn ~ 4950 2850
NoConn ~ 4950 2950
NoConn ~ 4950 3050
NoConn ~ 4950 3950
NoConn ~ 4950 4050
NoConn ~ 4950 4250
NoConn ~ 4950 4350
$Comp
L power:VCC #PWR029
U 1 1 5B54E6BC
P 10850 4200
F 0 "#PWR029" H 10850 4050 50  0001 C CNN
F 1 "VCC" V 10850 4400 50  0000 C CNN
F 2 "" H 10850 4200 50  0001 C CNN
F 3 "" H 10850 4200 50  0001 C CNN
	1    10850 4200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5B54E6C2
P 10850 4100
F 0 "#PWR028" H 10850 3850 50  0001 C CNN
F 1 "GND" V 10850 3900 50  0000 C CNN
F 2 "" H 10850 4100 50  0001 C CNN
F 3 "" H 10850 4100 50  0001 C CNN
	1    10850 4100
	0    1    1    0   
$EndComp
Text Label 10850 3900 2    50   ~ 0
I2C1_SCL
Text Label 10850 4000 2    50   ~ 0
I2C1_SDA
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5B569E4C
P 8150 5900
F 0 "#FLG01" H 8150 5975 50  0001 C CNN
F 1 "PWR_FLAG" H 8150 6074 50  0000 C CNN
F 2 "" H 8150 5900 50  0001 C CNN
F 3 "~" H 8150 5900 50  0001 C CNN
	1    8150 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 5850 10750 5850
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5B56C715
P 9100 5900
F 0 "#FLG02" H 9100 5975 50  0001 C CNN
F 1 "PWR_FLAG" H 9100 6074 50  0000 C CNN
F 2 "" H 9100 5900 50  0001 C CNN
F 3 "~" H 9100 5900 50  0001 C CNN
	1    9100 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5900 8400 5900
Connection ~ 8400 5900
Wire Wire Line
	8800 5900 9100 5900
NoConn ~ 3650 5450
NoConn ~ 10050 6350
$Comp
L Device:LED D1
U 1 1 5B54E19F
P 5400 2250
F 0 "D1" H 5150 2300 50  0000 C CNN
F 1 "LED" H 5391 2375 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 5400 2250 50  0001 C CNN
F 3 "~" H 5400 2250 50  0001 C CNN
	1    5400 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5B552F50
P 5400 2350
F 0 "D2" H 5150 2400 50  0000 C CNN
F 1 "LED" H 5391 2475 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 5400 2350 50  0001 C CNN
F 3 "~" H 5400 2350 50  0001 C CNN
	1    5400 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5B552FB0
P 5400 2450
F 0 "D3" H 5150 2500 50  0000 C CNN
F 1 "LED" H 5391 2575 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 5400 2450 50  0001 C CNN
F 3 "~" H 5400 2450 50  0001 C CNN
	1    5400 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 5B55300A
P 5400 2550
F 0 "D4" H 5150 2600 50  0000 C CNN
F 1 "LED" H 5391 2675 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 5400 2550 50  0001 C CNN
F 3 "~" H 5400 2550 50  0001 C CNN
	1    5400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2250 4950 2250
Wire Wire Line
	4950 2350 5250 2350
Wire Wire Line
	5250 2450 4950 2450
Wire Wire Line
	5250 2550 4950 2550
Text Label 4950 5150 0    50   ~ 0
SPI2_NSS
Text Label 4950 5250 0    50   ~ 0
SPI2_SCK
Text Label 4950 5350 0    50   ~ 0
SPI2_MISO
Text Label 4950 5450 0    50   ~ 0
SPI2_MOSI
Text Label 10100 2150 0    50   ~ 0
SPI2_MOSI
Text Label 10100 2250 0    50   ~ 0
SPI2_MISO
Text Label 10100 2350 0    50   ~ 0
SPI2_SCK
$Comp
L power:GND #PWR022
U 1 1 5B560C78
P 9500 2950
F 0 "#PWR022" H 9500 2700 50  0001 C CNN
F 1 "GND" H 9505 2777 50  0000 C CNN
F 2 "" H 9500 2950 50  0001 C CNN
F 3 "" H 9500 2950 50  0001 C CNN
	1    9500 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 2950 9500 2850
Text Label 10100 2450 0    50   ~ 0
SPI2_NSS
$Comp
L power:VDD #PWR021
U 1 1 5B565FC8
P 9500 950
F 0 "#PWR021" H 9500 800 50  0001 C CNN
F 1 "VDD" H 9517 1123 50  0000 C CNN
F 2 "" H 9500 950 50  0001 C CNN
F 3 "" H 9500 950 50  0001 C CNN
	1    9500 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 5B5689DE
P 9750 1150
F 0 "C16" H 9865 1196 50  0000 L CNN
F 1 "1uF" H 9865 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9788 1000 50  0001 C CNN
F 3 "~" H 9750 1150 50  0001 C CNN
	1    9750 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 1350 9750 1350
Wire Wire Line
	9750 1350 9750 1300
Wire Wire Line
	9500 950  9500 1000
Wire Wire Line
	9750 1000 9500 1000
Connection ~ 9500 1000
Wire Wire Line
	9500 1000 9500 1350
Text Label 4950 4950 0    50   ~ 0
USART3_TX
Text Label 4950 5050 0    50   ~ 0
USART3_RX
Text Label 10100 1650 0    50   ~ 0
USART3_RX
Text Label 10100 1850 0    50   ~ 0
USART3_TX
Text Label 10100 1550 0    50   ~ 0
ESP_GPIO0
Text Label 10100 1750 0    50   ~ 0
ESP_GPIO2
Text Label 3650 3950 2    50   ~ 0
ESP_GPIO0
Text Label 3650 4050 2    50   ~ 0
ESP_GPIO2
Text Label 8900 1750 2    50   ~ 0
ESP_ENABLE
Text Label 8900 1550 2    50   ~ 0
ESP_NRST
Text Label 3650 4150 2    50   ~ 0
ESP_ENABLE
Text Label 3650 4250 2    50   ~ 0
ESP_NRST
$Comp
L RF_Module:ESP-07 U3
U 1 1 5B572667
P 9500 2150
F 0 "U3" H 9500 3128 50  0000 C CNN
F 1 "ESP-07" H 9500 3037 50  0000 C CNN
F 2 "RF_Module:ESP-07" H 9500 2150 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 9150 2250 50  0001 C CNN
	1    9500 2150
	1    0    0    -1  
$EndComp
Connection ~ 9500 1350
NoConn ~ 8900 1950
NoConn ~ 10100 1950
NoConn ~ 10100 2050
Text Label 10100 2550 0    50   ~ 0
ESP_WAKE
Text Label 3650 4350 2    50   ~ 0
ESP_WAKE
$Comp
L dk_PMIC-Voltage-Regulators-Linear:AP2114H-3_3TRG1 U1
U 1 1 5B585257
P 1350 1150
F 0 "U1" H 1300 1437 60  0000 C CNN
F 1 "AP2114H-3_3TRG1" H 1300 1331 60  0000 C CNN
F 2 "digikey-footprints:SOT-223" H 1550 1350 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2114.pdf" H 1550 1450 60  0001 L CNN
F 4 "AP2114H-3.3TRG1DICT-ND" H 1550 1550 60  0001 L CNN "Digi-Key_PN"
F 5 "AP2114H-3.3TRG1" H 1550 1650 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 1550 1750 60  0001 L CNN "Category"
F 7 "PMIC - Voltage Regulators - Linear" H 1550 1850 60  0001 L CNN "Family"
F 8 "https://www.diodes.com/assets/Datasheets/AP2114.pdf" H 1550 1950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/diodes-incorporated/AP2114H-3.3TRG1/AP2114H-3.3TRG1DICT-ND/4505142" H 1550 2050 60  0001 L CNN "DK_Detail_Page"
F 10 "IC REG LINEAR 3.3V 1A SOT223" H 1550 2150 60  0001 L CNN "Description"
F 11 "Diodes Incorporated" H 1550 2250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 1550 2350 60  0001 L CNN "Status"
	1    1350 1150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 5B5858C3
P 750 1050
F 0 "#PWR01" H 750 900 50  0001 C CNN
F 1 "VCC" H 767 1223 50  0000 C CNN
F 2 "" H 750 1050 50  0001 C CNN
F 3 "" H 750 1050 50  0001 C CNN
	1    750  1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  1050 750  1150
Wire Wire Line
	750  1150 850  1150
$Comp
L power:VDD #PWR03
U 1 1 5B58877A
P 1800 1100
F 0 "#PWR03" H 1800 950 50  0001 C CNN
F 1 "VDD" H 1817 1273 50  0000 C CNN
F 2 "" H 1800 1100 50  0001 C CNN
F 3 "" H 1800 1100 50  0001 C CNN
	1    1800 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1150 1800 1150
Wire Wire Line
	1800 1150 1800 1100
Wire Wire Line
	1750 1250 1800 1250
Wire Wire Line
	1800 1250 1800 1150
Connection ~ 1800 1150
$Comp
L power:GND #PWR02
U 1 1 5B595023
P 1250 1650
F 0 "#PWR02" H 1250 1400 50  0001 C CNN
F 1 "GND" H 1255 1477 50  0000 C CNN
F 2 "" H 1250 1650 50  0001 C CNN
F 3 "" H 1250 1650 50  0001 C CNN
	1    1250 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5B59870B
P 1800 1500
F 0 "C2" H 1600 1550 50  0000 L CNN
F 1 "4.7uF" H 1500 1450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1838 1350 50  0001 C CNN
F 3 "~" H 1800 1500 50  0001 C CNN
	1    1800 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5B5987B7
P 750 1500
F 0 "C1" H 865 1546 50  0000 L CNN
F 1 "4.7uF" H 865 1455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 788 1350 50  0001 C CNN
F 3 "~" H 750 1500 50  0001 C CNN
	1    750  1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  1650 1250 1650
Connection ~ 1250 1650
Wire Wire Line
	1800 1650 1250 1650
Wire Wire Line
	1800 1350 1800 1250
Connection ~ 1800 1250
Wire Wire Line
	750  1350 750  1150
Connection ~ 750  1150
$Comp
L Device:CP C3
U 1 1 5B5A68F5
P 2100 1500
F 0 "C3" H 2218 1546 50  0000 L CNN
F 1 "10uF" H 2218 1455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2138 1350 50  0001 C CNN
F 3 "~" H 2100 1500 50  0001 C CNN
	1    2100 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1250 2100 1250
Wire Wire Line
	2100 1250 2100 1350
Wire Wire Line
	2100 1650 1800 1650
Connection ~ 1800 1650
Text Notes 550  750  0    50   ~ 10
POWER\n5V IN\n3.3V @ 1A OUT
Connection ~ 2700 3250
Connection ~ 2700 3550
$Comp
L Connector:Conn_01x06_Male J3
U 1 1 5B5F2524
P 11050 4000
F 0 "J3" H 11023 3926 50  0000 R CNN
F 1 "Conn_01x06_Male" H 11023 3971 50  0001 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-06A_1x06_P2.54mm_Vertical" H 11050 4000 50  0001 C CNN
F 3 "~" H 11050 4000 50  0001 C CNN
	1    11050 4000
	-1   0    0    1   
$EndComp
$Comp
L power:VDD #PWR027
U 1 1 5B5F8C46
P 10850 3800
F 0 "#PWR027" H 10850 3650 50  0001 C CNN
F 1 "VDD" V 10868 3927 50  0000 L CNN
F 2 "" H 10850 3800 50  0001 C CNN
F 3 "" H 10850 3800 50  0001 C CNN
	1    10850 3800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5B5F8D20
P 10850 3700
F 0 "#PWR026" H 10850 3450 50  0001 C CNN
F 1 "GND" V 10850 3500 50  0000 C CNN
F 2 "" H 10850 3700 50  0001 C CNN
F 3 "" H 10850 3700 50  0001 C CNN
	1    10850 3700
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR033
U 1 1 5B5FBF96
P 10850 4850
F 0 "#PWR033" H 10850 4700 50  0001 C CNN
F 1 "VCC" V 10850 5050 50  0000 C CNN
F 2 "" H 10850 4850 50  0001 C CNN
F 3 "" H 10850 4850 50  0001 C CNN
	1    10850 4850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR032
U 1 1 5B5FBF9C
P 10850 4750
F 0 "#PWR032" H 10850 4500 50  0001 C CNN
F 1 "GND" V 10850 4550 50  0000 C CNN
F 2 "" H 10850 4750 50  0001 C CNN
F 3 "" H 10850 4750 50  0001 C CNN
	1    10850 4750
	0    1    1    0   
$EndComp
Text Label 10850 4550 2    50   ~ 0
I2C1_SCL
Text Label 10850 4650 2    50   ~ 0
I2C1_SDA
$Comp
L Connector:Conn_01x06_Male J4
U 1 1 5B5FBFA4
P 11050 4650
F 0 "J4" H 11023 4576 50  0000 R CNN
F 1 "Conn_01x06_Male" H 11023 4621 50  0001 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-06A_1x06_P2.54mm_Vertical" H 11050 4650 50  0001 C CNN
F 3 "~" H 11050 4650 50  0001 C CNN
	1    11050 4650
	-1   0    0    1   
$EndComp
$Comp
L power:VDD #PWR031
U 1 1 5B5FBFAA
P 10850 4450
F 0 "#PWR031" H 10850 4300 50  0001 C CNN
F 1 "VDD" V 10868 4577 50  0000 L CNN
F 2 "" H 10850 4450 50  0001 C CNN
F 3 "" H 10850 4450 50  0001 C CNN
	1    10850 4450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR030
U 1 1 5B5FBFB0
P 10850 4350
F 0 "#PWR030" H 10850 4100 50  0001 C CNN
F 1 "GND" V 10850 4150 50  0000 C CNN
F 2 "" H 10850 4350 50  0001 C CNN
F 3 "" H 10850 4350 50  0001 C CNN
	1    10850 4350
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR037
U 1 1 5B6025F0
P 10850 5500
F 0 "#PWR037" H 10850 5350 50  0001 C CNN
F 1 "VCC" V 10850 5700 50  0000 C CNN
F 2 "" H 10850 5500 50  0001 C CNN
F 3 "" H 10850 5500 50  0001 C CNN
	1    10850 5500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR036
U 1 1 5B6025F6
P 10850 5400
F 0 "#PWR036" H 10850 5150 50  0001 C CNN
F 1 "GND" V 10850 5200 50  0000 C CNN
F 2 "" H 10850 5400 50  0001 C CNN
F 3 "" H 10850 5400 50  0001 C CNN
	1    10850 5400
	0    1    1    0   
$EndComp
Text Label 10850 5200 2    50   ~ 0
I2C1_SCL
Text Label 10850 5300 2    50   ~ 0
I2C1_SDA
$Comp
L Connector:Conn_01x06_Male J5
U 1 1 5B6025FE
P 11050 5300
F 0 "J5" H 11023 5226 50  0000 R CNN
F 1 "Conn_01x06_Male" H 11023 5271 50  0001 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-06A_1x06_P2.54mm_Vertical" H 11050 5300 50  0001 C CNN
F 3 "~" H 11050 5300 50  0001 C CNN
	1    11050 5300
	-1   0    0    1   
$EndComp
$Comp
L power:VDD #PWR035
U 1 1 5B602604
P 10850 5100
F 0 "#PWR035" H 10850 4950 50  0001 C CNN
F 1 "VDD" V 10868 5227 50  0000 L CNN
F 2 "" H 10850 5100 50  0001 C CNN
F 3 "" H 10850 5100 50  0001 C CNN
	1    10850 5100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR034
U 1 1 5B60260A
P 10850 5000
F 0 "#PWR034" H 10850 4750 50  0001 C CNN
F 1 "GND" V 10850 4800 50  0000 C CNN
F 2 "" H 10850 5000 50  0001 C CNN
F 3 "" H 10850 5000 50  0001 C CNN
	1    10850 5000
	0    1    1    0   
$EndComp
NoConn ~ 4950 3750
Text Notes 9400 5700 0    50   ~ 10
DEBUG
Wire Notes Line
	9350 5600 9350 6550
Text Notes 10450 3600 0    50   ~ 10
LED DISPLAYS
Wire Notes Line
	10400 3500 10400 5600
Text Notes 7800 5700 0    50   ~ 10
USB
Wire Notes Line
	7750 5600 11250 5600
Wire Notes Line
	7750 3500 11250 3500
Text Notes 7800 3600 0    50   ~ 10
BUTTONS AND SWITCHES
Wire Notes Line
	7750 450  7750 6550
Text Notes 7800 600  0    50   ~ 10
WIFI
Wire Notes Line
	2450 450  2450 1900
Wire Notes Line
	2450 1900 450  1900
$Comp
L dk_Tactile-Switches:B3U-1000P S1
U 1 1 5B65D55A
P 5800 4850
F 0 "S1" V 5747 4988 60  0000 L CNN
F 1 "B3U-1000P" V 5500 4700 60  0000 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_B3U-1000P" H 6000 5050 60  0001 L CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 6000 5150 60  0001 L CNN
F 4 "SW1020CT-ND" H 6000 5250 60  0001 L CNN "Digi-Key_PN"
F 5 "B3U-1000P" H 6000 5350 60  0001 L CNN "MPN"
F 6 "Switches" H 6000 5450 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6000 5550 60  0001 L CNN "Family"
F 8 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 6000 5650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3U-1000P/SW1020CT-ND/1534357" H 6000 5750 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 12V" H 6000 5850 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 6000 5950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6000 6050 60  0001 L CNN "Status"
	1    5800 4850
	0    1    1    0   
$EndComp
Connection ~ 5800 5050
$Comp
L dk_Tactile-Switches:B3U-1000P S2
U 1 1 5B65D785
P 6550 4850
F 0 "S2" V 6497 4988 60  0000 L CNN
F 1 "B3U-1000P" V 6250 4700 60  0000 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_B3U-1000P" H 6750 5050 60  0001 L CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 6750 5150 60  0001 L CNN
F 4 "SW1020CT-ND" H 6750 5250 60  0001 L CNN "Digi-Key_PN"
F 5 "B3U-1000P" H 6750 5350 60  0001 L CNN "MPN"
F 6 "Switches" H 6750 5450 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 6750 5550 60  0001 L CNN "Family"
F 8 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 6750 5650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3U-1000P/SW1020CT-ND/1534357" H 6750 5750 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 12V" H 6750 5850 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 6750 5950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6750 6050 60  0001 L CNN "Status"
	1    6550 4850
	0    1    1    0   
$EndComp
Connection ~ 6550 5050
$Comp
L dk_Tactile-Switches:B3U-1000P S3
U 1 1 5B65D813
P 7300 4850
F 0 "S3" V 7247 4988 60  0000 L CNN
F 1 "B3U-1000P" V 7000 4700 60  0000 L CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_B3U-1000P" H 7500 5050 60  0001 L CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 7500 5150 60  0001 L CNN
F 4 "SW1020CT-ND" H 7500 5250 60  0001 L CNN "Digi-Key_PN"
F 5 "B3U-1000P" H 7500 5350 60  0001 L CNN "MPN"
F 6 "Switches" H 7500 5450 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 7500 5550 60  0001 L CNN "Family"
F 8 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 7500 5650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3U-1000P/SW1020CT-ND/1534357" H 7500 5750 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 12V" H 7500 5850 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 7500 5950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7500 6050 60  0001 L CNN "Status"
	1    7300 4850
	0    1    1    0   
$EndComp
Connection ~ 7300 5050
$Comp
L Mechanical:Mounting_Hole_PAD MK1
U 1 1 5B65E194
P 800 2250
F 0 "MK1" H 900 2301 50  0000 L CNN
F 1 "Mounting_Hole_PAD" H 900 2210 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965_Pad" H 800 2250 50  0001 C CNN
F 3 "" H 800 2250 50  0001 C CNN
	1    800  2250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Mounting_Hole_PAD MK2
U 1 1 5B65E262
P 1050 2250
F 0 "MK2" H 1150 2301 50  0000 L CNN
F 1 "Mounting_Hole_PAD" H 1150 2210 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965_Pad" H 1050 2250 50  0001 C CNN
F 3 "" H 1050 2250 50  0001 C CNN
	1    1050 2250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Mounting_Hole_PAD MK3
U 1 1 5B65E2D2
P 1300 2250
F 0 "MK3" H 1400 2301 50  0000 L CNN
F 1 "Mounting_Hole_PAD" H 1400 2210 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965_Pad" H 1300 2250 50  0001 C CNN
F 3 "" H 1300 2250 50  0001 C CNN
	1    1300 2250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Mounting_Hole_PAD MK4
U 1 1 5B65E33E
P 1550 2250
F 0 "MK4" H 1650 2301 50  0000 L CNN
F 1 "Mounting_Hole_PAD" H 1650 2210 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965_Pad" H 1550 2250 50  0001 C CNN
F 3 "" H 1550 2250 50  0001 C CNN
	1    1550 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR039
U 1 1 5B65E4B9
P 800 2450
F 0 "#PWR039" H 800 2200 50  0001 C CNN
F 1 "GND" H 805 2277 50  0000 C CNN
F 2 "" H 800 2450 50  0001 C CNN
F 3 "" H 800 2450 50  0001 C CNN
	1    800  2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  2450 800  2350
Wire Wire Line
	800  2350 1050 2350
Connection ~ 800  2350
Wire Wire Line
	1300 2350 1550 2350
$Comp
L dk_Tactile-Switches:B3U-1000P S4
U 1 1 5B669D1C
P 8300 4550
F 0 "S4" H 8300 4847 60  0000 C CNN
F 1 "B3U-1000P" H 8300 4741 60  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_B3U-1000P" H 8500 4750 60  0001 L CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 8500 4850 60  0001 L CNN
F 4 "SW1020CT-ND" H 8500 4950 60  0001 L CNN "Digi-Key_PN"
F 5 "B3U-1000P" H 8500 5050 60  0001 L CNN "MPN"
F 6 "Switches" H 8500 5150 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 8500 5250 60  0001 L CNN "Family"
F 8 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 8500 5350 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3U-1000P/SW1020CT-ND/1534357" H 8500 5450 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 12V" H 8500 5550 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 8500 5650 60  0001 L CNN "Manufacturer"
F 12 "Active" H 8500 5750 60  0001 L CNN "Status"
	1    8300 4550
	1    0    0    -1  
$EndComp
Connection ~ 8100 4550
Connection ~ 8500 4550
$Comp
L power:VDD #PWR0101
U 1 1 5B66B324
P 1550 2500
F 0 "#PWR0101" H 1550 2350 50  0001 C CNN
F 1 "VDD" H 1568 2673 50  0000 C CNN
F 2 "" H 1550 2500 50  0001 C CNN
F 3 "" H 1550 2500 50  0001 C CNN
	1    1550 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	1550 2500 1550 2350
Connection ~ 1550 2350
$Comp
L Device:R R4
U 1 1 5B67003F
P 5700 2250
F 0 "R4" V 5493 2250 50  0000 C CNN
F 1 "R" V 5584 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5630 2250 50  0001 C CNN
F 3 "~" H 5700 2250 50  0001 C CNN
	1    5700 2250
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5B6700EE
P 5700 2350
F 0 "R5" V 5493 2350 50  0000 C CNN
F 1 "R" V 5584 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5630 2350 50  0001 C CNN
F 3 "~" H 5700 2350 50  0001 C CNN
	1    5700 2350
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5B670158
P 5700 2450
F 0 "R6" V 5493 2450 50  0000 C CNN
F 1 "R" V 5584 2450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5630 2450 50  0001 C CNN
F 3 "~" H 5700 2450 50  0001 C CNN
	1    5700 2450
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5B6701C4
P 5700 2550
F 0 "R7" V 5493 2550 50  0000 C CNN
F 1 "R" V 5584 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5630 2550 50  0001 C CNN
F 3 "~" H 5700 2550 50  0001 C CNN
	1    5700 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 2250 6100 2250
Wire Wire Line
	5850 2250 5850 2350
Connection ~ 5850 2250
Connection ~ 5850 2350
Wire Wire Line
	5850 2350 5850 2450
Connection ~ 5850 2450
Wire Wire Line
	5850 2450 5850 2550
$Comp
L power:VDD #PWR0102
U 1 1 5B677313
P 6100 2250
F 0 "#PWR0102" H 6100 2100 50  0001 C CNN
F 1 "VDD" H 6117 2423 50  0000 C CNN
F 2 "" H 6100 2250 50  0001 C CNN
F 3 "" H 6100 2250 50  0001 C CNN
	1    6100 2250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
