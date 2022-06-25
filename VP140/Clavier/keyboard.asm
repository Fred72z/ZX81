
; CC5X Version 3.4I, Copyright (c) B Knudsen Data
; C compiler for the PICmicro family
; ************   9. Apr 2022  18:53  *************

	processor  16F876A
	radix  DEC

	__config 0x3F3A

INDF        EQU   0x00
TMR0        EQU   0x01
FSR         EQU   0x04
PORTA       EQU   0x05
TRISA       EQU   0x85
PORTB       EQU   0x06
TRISB       EQU   0x86
Carry       EQU   0
Zero_       EQU   2
RP0         EQU   5
RP1         EQU   6
IRP         EQU   7
T0IF        EQU   2
OPTION_REG  EQU   0x81
PORTC       EQU   0x07
TRISC       EQU   0x87
ADCON1      EQU   0x9F
EEDATA      EQU   0x10C
EEADR       EQU   0x10D
EEDATH      EQU   0x10E
EEADRH      EQU   0x10F
RD          EQU   0
EEPGD       EQU   7
RESET       EQU   4
KB_LATCH    EQU   0
KB_DATA     EQU   1
KB_CLK      EQU   2
VOL_A       EQU   5
VOL_B       EQU   4
VOLUME      EQU   0x43
i           EQU   0x20
bcle        EQU   0x21
a           EQU   0x22
n           EQU   0x23
i_2         EQU   0x24
j           EQU   0x25
i_3         EQU   0x22
a_2         EQU   0x23
i_4         EQU   0x22
a_3         EQU   0x23
b           EQU   0x24
cp          EQU   0x25
n_2         EQU   0x22
i_5         EQU   0x22
r           EQU   0x23
i_6         EQU   0x22
r_2         EQU   0x23
i_7         EQU   0x22
r_3         EQU   0x23
s           EQU   0x24
i_8         EQU   0x22
r_4         EQU   0x23
i_9         EQU   0x22
i_10        EQU   0x26
i_11        EQU   0x22
i_12        EQU   0x2A
k           EQU   0x22
b_2         EQU   0x23
i_13        EQU   0x24
j_2         EQU   0x25
a_4         EQU   0x26
n_3         EQU   0x27
ad          EQU   0x28
n_4         EQU   0x26
d           EQU   0x27
b_3         EQU   0x28
ci          EQU   0x2A
ci_2        EQU   0x2A
ci_3        EQU   0x2A

	GOTO main

  ; FILE keyboard.c
			;// Interface clavier minitel vers ZX81
			;
			;//#include <p16F876.inc>
			;
			;#pragma config=0x3f3a
			;
			;#pragma bit RESET @ PORTA.4
			;#pragma bit KB_LATCH @ PORTC.0
			;#pragma bit KB_DATA @ PORTC.1
			;#pragma bit KB_CLK @ PORTC.2
			;#pragma bit VOL_A @ PORTC.5
			;#pragma bit VOL_B @ PORTC.4
			;
			;
			;// A8,A9,A10,A11,A12,A13,A14,A15 -- KBD4-KBD0
			;const uns8 decod0[64]={
			;// Espace
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
			;// Ctrl
			;0x01,0x00,0x00,0x00,0x00,0x00,0x01,0x00,
			;// Sommaire
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// N
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x08,
			;// '
			;0x01,0x00,0x00,0x00,0x00,0x01,0x00,0x00,
			;// H
			;0x00,0x00,0x00,0x00,0x00,0x00,0x10,0x00,
			;// Y
			;0x00,0x00,0x00,0x00,0x00,0x10,0x00,0x00,
			;// Fleche bas
			;0x01,0x00,0x00,0x00,0x10,0x00,0x00,0x00
			;};
			;
			;const uns8 decod1[64]={
			;// W
			;0x00,0x00,0x02,0x00,0x00,0x00,0x00,0x00,
			;// Q
			;0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,
			;// A
			;0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,
			;// V
			;0x10,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// ,
			;0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x02,
			;// F
			;0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,
			;// R
			;0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,
			;// Annul
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			;};
			;
			;const uns8 decod2[64]={
			;// X
			;0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// S
			;0x00,0x02,0x00,0x00,0x00,0x00,0x00,0x00,
			;// Z
			;0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// C
			;0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// Esc
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
			;// D
			;0x00,0x04,0x00,0x00,0x00,0x00,0x00,0x00,
			;// E
			;0x00,0x00,0x04,0x00,0x00,0x00,0x00,0x00,
			;// Corr
			;0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
			;};
			;
			;const uns8 decod3[64]={
			;// Conn/Fin
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// Fct
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// Guide
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// B
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x10,
			;// .
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x02,
			;// G
			;0x00,0x10,0x00,0x00,0x00,0x00,0x00,0x00,
			;// T
			;0x00,0x00,0x10,0x00,0x00,0x00,0x00,0x00,
			;// Fleche haut
			;0x01,0x00,0x00,0x00,0x08,0x00,0x00,0x00
			;};
			;
			;const uns8 decod4[64]={
			;// 3
			;0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x00,
			;// M
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x04,
			;// P
			;0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,
			;// 2
			;0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x00,
			;// Rep
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// 1
			;0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,
			;// ?
			;0x09,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// Return
			;0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00
			;};
			;
			;const uns8 decod5[64]={
			;// 6
			;0x00,0x00,0x00,0x00,0x10,0x00,0x00,0x00,
			;// L
			;0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x00,
			;// O
			;0x00,0x00,0x00,0x00,0x00,0x02,0x00,0x00,
			;// 5
			;0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x00,
			;// Envoi
			;0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,
			;// 4
			;0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,
			;// :
			;0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// fleche droite
			;0x01,0x00,0x00,0x00,0x04,0x00,0x00,0x00
			;};
			;
			;const uns8 decod6[64]={
			;// 9
			;0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00,
			;// K
			;0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,
			;// I
			;0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,
			;// 8
			;0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,
			;// Retour
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// 7
			;0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00,
			;// -
			;0x01,0x00,0x00,0x00,0x00,0x00,0x08,0x00,
			;// fleche gauche
			;0x01,0x00,0x00,0x10,0x00,0x00,0x00,0x00
			;};
			;
			;const uns8 decod7[64]={
			;// #
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// J
			;0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x00,
			;// U
			;0x00,0x00,0x00,0x00,0x00,0x08,0x00,0x00,
			;// 0
			;0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,
			;// Suite
			;0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// *
			;0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x10,
			;// ;
			;0x05,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
			;// Shift
			;0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			;};
			;
			;const uns8 rep[56]={
			;// RAND
			;0x00,0x00,0x10,0x00,0x00,0x00,0x00,0x00,
			;// (F)
			;0x01,0x00,0x00,0x00,0x00,0x00,0x01,0x00,
			;// USR
			;0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x00,
			;// 8
			;0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,
			;// 8
			;0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,
			;// 0
			;0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,
			;// 0
			;0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00
			;};
			;
			;
			;uns8 MAT[8];
			;uns8 MAT1[8];
			;uns8 KB[8];
			;uns8 VOLUME;
			;
			;
			;void scan();
			;uns8 test_RESET();
			;uns8 test_VOLUME();
			;void tempo_1ms();
			;void tempo_10ms();
			;void tempo_50ms();
			;void tempo_100ms();
			;void conversion();
			;void trf();
			;void raz_KB();
			;void copy_MAT();
			;uns8 compare_MAT();
			;uns8 noKey();
			;void waitnoKey();
			;uns8 test_REP();
			;void send_REP();
			;
			;
			;void main()
			;{
_const1
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF ci
	MOVLW 0
	BSF   0x03,RP1
	MOVWF EEADRH
	BCF   0x03,RP1
	RRF   ci,W
	ANDLW 127
	ADDLW 34
	BSF   0x03,RP1
	MOVWF EEADR
	BTFSC 0x03,Carry
	INCF  EEADRH,1
	BSF   0x03,RP0
	BSF   0x03,RP1
	BSF   0x18C,EEPGD
	BSF   0x18C,RD
	NOP  
	NOP  
	BCF   0x03,RP0
	BCF   0x03,RP1
	BTFSC ci,0
	GOTO  m001
	BSF   0x03,RP1
	MOVF  EEDATA,W
	ANDLW 127
	RETURN
m001	BCF   0x03,RP0
	BSF   0x03,RP1
	RLF   EEDATA,W
	RLF   EEDATH,W
	RETURN
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x80
	DW    0x1
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x400
	DW    0x1
	DW    0x0
	DW    0x80
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x10
	DW    0x0
	DW    0x0
	DW    0x800
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x10
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x8
	DW    0x0
	DW    0x0
	DW    0x400
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x0
	DW    0x800
	DW    0x5
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x10
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x2
	DW    0x0
	DW    0x0
	DW    0x4
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x4
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
_const3
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF ci_2
	MOVLW 0
	BSF   0x03,RP1
	MOVWF EEADRH
	BCF   0x03,RP1
	RRF   ci_2,W
	ANDLW 127
	ADDLW 159
	BSF   0x03,RP1
	MOVWF EEADR
	BTFSC 0x03,Carry
	INCF  EEADRH,1
	BSF   0x03,RP0
	BSF   0x03,RP1
	BSF   0x18C,EEPGD
	BSF   0x18C,RD
	NOP  
	NOP  
	BCF   0x03,RP0
	BCF   0x03,RP1
	BTFSC ci_2,0
	GOTO  m002
	BSF   0x03,RP1
	MOVF  EEDATA,W
	ANDLW 127
	RETURN
m002	BCF   0x03,RP0
	BSF   0x03,RP1
	RLF   EEDATA,W
	RLF   EEDATH,W
	RETURN
	DW    0x0
	DW    0x2
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x0
	DW    0x80
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x10
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x0
	DW    0x100
	DW    0x400
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x8
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x4
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x100
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x2
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x8
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x80
	DW    0x200
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x4
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x800
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x100
	DW    0x800
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x10
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x8
	DW    0x0
	DW    0x0
	DW    0x200
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x200
	DW    0x0
	DW    0x0
	DW    0x80
	DW    0x0
	DW    0x0
	DW    0x100
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x80
	DW    0x0
	DW    0x0
	DW    0x9
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x1
_const7
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF ci_3
	MOVLW 1
	BSF   0x03,RP1
	MOVWF EEADRH
	BCF   0x03,RP1
	RRF   ci_3,W
	ANDLW 127
	ADDLW 64
	BSF   0x03,RP1
	MOVWF EEADR
	BTFSC 0x03,Carry
	INCF  EEADRH,1
	BSF   0x03,RP0
	BSF   0x03,RP1
	BSF   0x18C,EEPGD
	BSF   0x18C,RD
	NOP  
	NOP  
	BCF   0x03,RP0
	BCF   0x03,RP1
	BTFSC ci_3,0
	GOTO  m003
	BSF   0x03,RP1
	MOVF  EEDATA,W
	ANDLW 127
	RETURN
m003	BCF   0x03,RP0
	BSF   0x03,RP1
	RLF   EEDATA,W
	RLF   EEDATH,W
	RETURN
	DW    0x0
	DW    0x0
	DW    0x10
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x2
	DW    0x0
	DW    0x0
	DW    0x100
	DW    0x0
	DW    0x0
	DW    0x800
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x400
	DW    0x0
	DW    0x0
	DW    0x3
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x4
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x2
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x4
	DW    0x0
	DW    0x0
	DW    0x200
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x4
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x0
	DW    0x8
	DW    0x0
	DW    0x1
	DW    0x0
	DW    0x0
	DW    0x8
	DW    0x1
	DW    0x800
	DW    0x0
	DW    0x0
main
			;	uns8 i,bcle;
			;	TRISA=0x00;
	BSF   0x03,RP0
	BCF   0x03,RP1
	CLRF  TRISA
			;	TRISB=0xFF;
	MOVLW 255
	MOVWF TRISB
			;	TRISC=0x00;
	CLRF  TRISC
			;	ADCON1=0;
	CLRF  ADCON1
			;	OPTION=0x02;		// pullups activés sur le portB
	MOVLW 2
	MOVWF OPTION_REG
			;	
			;	PORTC=0;
	BCF   0x03,RP0
	CLRF  PORTC
			;	PORTA=0x10;
	MOVLW 16
	MOVWF PORTA
			;
			;	VOLUME=1;
	MOVLW 1
	MOVWF VOLUME
			;	
			;	for (i=0;i<8;i++)
	CLRF  i
m004	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i,W
	BTFSC 0x03,Carry
	GOTO  m005
			;			{
			;				MAT[i]=0;
	MOVLW 43
	ADDWF i,W
	MOVWF FSR
	BCF   0x03,IRP
	CLRF  INDF
			;				KB[i]=0;
	MOVLW 59
	ADDWF i,W
	MOVWF FSR
	BCF   0x03,IRP
	CLRF  INDF
			;			}
	INCF  i,1
	GOTO  m004
			;	bcle=0;
m005	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  bcle
			;	copy_MAT();
	CALL  copy_MAT
			;
			;while (1)
			;{
			;
			; if (bcle==0) copy_MAT();
m006	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVF  bcle,1
	BTFSC 0x03,Zero_
	CALL  copy_MAT
			; scan();
	CALL  scan
			;
			; if ((compare_MAT()==1) && (bcle<4)) bcle++;
	CALL  compare_MAT
	XORLW 1
	BTFSS 0x03,Zero_
	GOTO  m007
	MOVLW 4
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF bcle,W
	BTFSS 0x03,Carry
	INCF  bcle,1
			; if (compare_MAT()==0) bcle=0;
m007	CALL  compare_MAT
	XORLW 0
	BTFSS 0x03,Zero_
	GOTO  m008
	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  bcle
			;
			;
			; if (test_RESET()==1)
m008	CALL  test_RESET
	XORLW 1
	BTFSS 0x03,Zero_
	GOTO  m009
			;			{
			;			 	RESET=0;
	BCF   0x03,RP0
	BCF   0x03,RP1
	BCF   0x05,RESET
			;				tempo_100ms();
	CALL  tempo_100ms
			;			 	RESET=1;
	BCF   0x03,RP0
	BCF   0x03,RP1
	BSF   0x05,RESET
			;				waitnoKey();
	CALL  waitnoKey
			;			}
			; if ((test_VOLUME()==1) && (VOLUME<3))
m009	CALL  test_VOLUME
	XORLW 1
	BTFSS 0x03,Zero_
	GOTO  m010
	MOVLW 3
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF VOLUME,W
	BTFSC 0x03,Carry
	GOTO  m010
			;			{
			;				 VOLUME++;
	INCF  VOLUME,1
			;				 waitnoKey();
	CALL  waitnoKey
			;			}
			; if ((test_VOLUME()==2) && (VOLUME>0))
m010	CALL  test_VOLUME
	XORLW 2
	BTFSS 0x03,Zero_
	GOTO  m011
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVF  VOLUME,1
	BTFSC 0x03,Zero_
	GOTO  m011
			;			{
			;				 VOLUME--;
	DECF  VOLUME,1
			;				 waitnoKey();
	CALL  waitnoKey
			;			}
			;
			; if (test_REP()==1)
m011	CALL  test_REP
	XORLW 1
	BTFSC 0x03,Zero_
			;			 	 send_REP();
	CALL  send_REP
			;
			;
			; conversion();
	CALL  conversion
			;
			; if (bcle>3) raz_KB();
	MOVLW 4
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF bcle,W
	BTFSC 0x03,Carry
	CALL  raz_KB
			; trf();
	CALL  trf
			; VOL_A=VOLUME.0;
	BCF   0x03,RP0
	BCF   0x03,RP1
	BTFSS VOLUME,0
	BCF   0x07,VOL_A
	BTFSC VOLUME,0
	BSF   0x07,VOL_A
			; VOL_B=VOLUME.1;
	BTFSS VOLUME,1
	BCF   0x07,VOL_B
	BTFSC VOLUME,1
	BSF   0x07,VOL_B
			; tempo_10ms();
	CALL  tempo_10ms
			; if (bcle>3) 
	MOVLW 4
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF bcle,W
	BTFSS 0x03,Carry
	GOTO  m006
			;				{
			;					tempo_100ms();
	CALL  tempo_100ms
			;					bcle=0;
	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  bcle
			;				}
			; }
	GOTO  m006
			;}
			;
			;
			;void send_REP()
			;{
send_REP
			;   uns8 a,n,i,j;
			;	n=0;
	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  n
			;	for (i=0;i<7;i++)
	CLRF  i_2
m012	MOVLW 7
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_2,W
	BTFSC 0x03,Carry
	GOTO  m015
			;		{
			;			raz_KB();
	CALL  raz_KB
			;			trf();
	CALL  trf
			;			tempo_50ms();
	CALL  tempo_50ms
			;			for (j=0;j<8;j++)
	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  j
m013	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF j,W
	BTFSC 0x03,Carry
	GOTO  m014
			;					{
			;						a=rep[n];
	MOVLW 128
	ADDWF n,W
	CALL  _const1
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF a
			;						KB[j]=a;
	MOVLW 59
	ADDWF j,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  a,W
	MOVWF INDF
			;						n++;
	INCF  n,1
			;					}
	INCF  j,1
	GOTO  m013
			;			trf();
m014	CALL  trf
			;			tempo_50ms();
	CALL  tempo_50ms
			;		}
	BCF   0x03,RP0
	BCF   0x03,RP1
	INCF  i_2,1
	GOTO  m012
			;			raz_KB();
m015	CALL  raz_KB
			;			trf();
	CALL  trf
			;			tempo_50ms();
	GOTO  tempo_50ms
			;}
			;
			;void copy_MAT()
			;{
copy_MAT
			; uns8 i,a;
			; for (i=0;i<8;i++)
	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  i_3
m016	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_3,W
	BTFSC 0x03,Carry
	GOTO  m017
			;		{
			;			a=MAT[i];
	MOVLW 43
	ADDWF i_3,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	MOVWF a_2
			;			MAT1[i]=a;
	MOVLW 51
	ADDWF i_3,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  a_2,W
	MOVWF INDF
			;		}
	INCF  i_3,1
	GOTO  m016
			;}
m017	RETURN
			;
			;uns8 compare_MAT()
			;{
compare_MAT
			; uns8 i,a,b,cp;
			; cp=1;
	MOVLW 1
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF cp
			; b=1;
	MOVLW 1
	MOVWF b
			; for (i=0;i<8;i++)
	CLRF  i_4
m018	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_4,W
	BTFSC 0x03,Carry
	GOTO  m019
			;	{
			;		a=MAT1[i];
	MOVLW 51
	ADDWF i_4,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	MOVWF a_3
			;		if (a!=MAT[i]) cp=0;
	MOVLW 43
	ADDWF i_4,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  a_3,W
	XORWF INDF,W
	BTFSS 0x03,Zero_
	CLRF  cp
			;		if (a!=0) b=0;
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVF  a_3,1
	BTFSS 0x03,Zero_
	CLRF  b
			;
			;	}
	BCF   0x03,RP0
	BCF   0x03,RP1
	INCF  i_4,1
	GOTO  m018
			; if (b==1) cp=0;		// si MAT=0 alors differente
m019	BCF   0x03,RP0
	BCF   0x03,RP1
	DECF  b,W
	BTFSC 0x03,Zero_
	CLRF  cp
			; return cp;
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVF  cp,W
	RETURN
			;}
			;
			;
			;
			;
			;// scanne la matrice du clavier et retourne les 8 valeurs dans le tableau MAT
			;void scan()
			;{
scan
			;	uns8 n;
			;
			;	for (n=0;n<8;n++)
	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  n_2
m020	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF n_2,W
	BTFSC 0x03,Carry
	GOTO  m021
			;		{
			;			PORTA=0x10 | n;
	MOVLW 16
	IORWF n_2,W
	MOVWF PORTA
			;			nop();
	NOP  
			;			MAT[n]=255-PORTB;
	MOVLW 43
	ADDWF n_2,W
	MOVWF FSR
	BCF   0x03,IRP
	COMF  PORTB,W
	MOVWF INDF
			;		}
	INCF  n_2,1
	GOTO  m020
			;}
m021	RETURN
			;
			;uns8 noKey()
			;{
noKey
			;	uns8 i,r;
			;	r=1;
	MOVLW 1
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF r
			;	for (i=0;i<8;i++)
	CLRF  i_5
m022	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_5,W
	BTFSC 0x03,Carry
	GOTO  m023
			;			if (MAT[i]!=0) r=0;
	MOVLW 43
	ADDWF i_5,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	BTFSS 0x03,Zero_
	CLRF  r
			;
			;	return r;
	BCF   0x03,RP0
	BCF   0x03,RP1
	INCF  i_5,1
	GOTO  m022
m023	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVF  r,W
	RETURN
			;}
			;
			;void waitnoKey()
			;{
waitnoKey
			;	while (noKey()!=1)
m024	CALL  noKey
	XORLW 1
	BTFSC 0x03,Zero_
	GOTO  m025
			;		{
			;				scan();
	CALL  scan
			;				tempo_10ms();
	CALL  tempo_10ms
			;		}
	GOTO  m024
			;}
m025	RETURN
			;
			;
			;uns8 test_RESET()	// teste si les touches Fnct+Fin sont appuyées
			;{
test_RESET
			;	uns8 i,r;
			;	r=1;
	MOVLW 1
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF r_2
			;	for (i=0;i<8;i++)
	CLRF  i_6
m026	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_6,W
	BTFSC 0x03,Carry
	GOTO  m029
			;	switch(i)
	MOVF  i_6,W
	XORLW 3
	BTFSS 0x03,Zero_
	GOTO  m027
			;		{
			;			case 3  : if (MAT[i]!=0xC0) r=0; break;
	MOVLW 43
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF i_6,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	XORLW 192
	BTFSC 0x03,Zero_
	GOTO  m028
	CLRF  r_2
	GOTO  m028
			;			default : if (MAT[i]!=0x00) r=0;
m027	MOVLW 43
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF i_6,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	BTFSS 0x03,Zero_
	CLRF  r_2
			;		}
m028	BCF   0x03,RP0
	BCF   0x03,RP1
	INCF  i_6,1
	GOTO  m026
			;	return r;
m029	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVF  r_2,W
	RETURN
			;}
			;
			;
			;uns8 test_VOLUME()	// teste si les touches Sommaire ou Guide sont appuyées
			;{
test_VOLUME
			;	uns8 i,r,s;
			;	r=1;
	MOVLW 1
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF r_3
			;	s=0;
	CLRF  s
			;	for (i=0;i<8;i++)
	CLRF  i_7
m030	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_7,W
	BTFSC 0x03,Carry
	GOTO  m033
			;	switch(i)
	MOVF  i_7,W
	BTFSS 0x03,Zero_
	GOTO  m031
			;		{
			;			case 0  : if (MAT[i]!=0x20) r=0; break;
	MOVLW 43
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF i_7,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	XORLW 32
	BTFSC 0x03,Zero_
	GOTO  m032
	CLRF  r_3
	GOTO  m032
			;			default : if (MAT[i]!=0x00) r=0;
m031	MOVLW 43
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF i_7,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	BTFSS 0x03,Zero_
	CLRF  r_3
			;		}
m032	BCF   0x03,RP0
	BCF   0x03,RP1
	INCF  i_7,1
	GOTO  m030
			;
			;	if (r==1) s=2; // Sommaire appuyée
m033	BCF   0x03,RP0
	BCF   0x03,RP1
	DECFSZ r_3,W
	GOTO  m034
	MOVLW 2
	MOVWF s
			;	else
	GOTO  m039
			;	{
			;	r=1;
m034	MOVLW 1
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF r_3
			;	for (i=0;i<8;i++)
	CLRF  i_7
m035	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_7,W
	BTFSC 0x03,Carry
	GOTO  m038
			;	switch(i)
	MOVF  i_7,W
	XORLW 3
	BTFSS 0x03,Zero_
	GOTO  m036
			;		{
			;			case 3  : if (MAT[i]!=0x20) r=0; break;
	MOVLW 43
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF i_7,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	XORLW 32
	BTFSC 0x03,Zero_
	GOTO  m037
	CLRF  r_3
	GOTO  m037
			;			default : if (MAT[i]!=0x00) r=0;
m036	MOVLW 43
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF i_7,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	BTFSS 0x03,Zero_
	CLRF  r_3
			;		}
m037	BCF   0x03,RP0
	BCF   0x03,RP1
	INCF  i_7,1
	GOTO  m035
			;	if (r==1) s=1; // Guide appuyée
m038	BCF   0x03,RP0
	BCF   0x03,RP1
	DECFSZ r_3,W
	GOTO  m039
	MOVLW 1
	MOVWF s
			;	}
			;
			;	return s;
m039	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVF  s,W
	RETURN
			;}
			;
			;
			;
			;
			;uns8 test_REP()	// teste si la touche Repetition est appuyée
			;{
test_REP
			;	uns8 i,r;
			;	r=1;
	MOVLW 1
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF r_4
			;	for (i=0;i<8;i++)
	CLRF  i_8
m040	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_8,W
	BTFSC 0x03,Carry
	GOTO  m043
			;	switch(i)
	MOVF  i_8,W
	XORLW 4
	BTFSS 0x03,Zero_
	GOTO  m041
			;		{
			;			case 4  : if (MAT[i]!=0x08) r=0; break;
	MOVLW 43
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF i_8,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	XORLW 8
	BTFSC 0x03,Zero_
	GOTO  m042
	CLRF  r_4
	GOTO  m042
			;			default : if (MAT[i]!=0x00) r=0;
m041	MOVLW 43
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF i_8,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	BTFSS 0x03,Zero_
	CLRF  r_4
			;		}
m042	BCF   0x03,RP0
	BCF   0x03,RP1
	INCF  i_8,1
	GOTO  m040
			;	return r;
m043	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVF  r_4,W
	RETURN
			;}
			;
			;
			;void tempo_1ms()
			;{
tempo_1ms
			;	TMR0=0;
	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  TMR0
			;	T0IF=0;
	BCF   0x0B,T0IF
			;	while (T0IF!=1);
m044	BTFSS 0x0B,T0IF
	GOTO  m044
			;}
	RETURN
			;
			;void tempo_10ms()
			;{
tempo_10ms
			; 	uns8 i;
			;	for (i=0; i<10;i++)
	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  i_9
m045	MOVLW 10
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_9,W
	BTFSC 0x03,Carry
	GOTO  m046
			;				tempo_1ms();
	CALL  tempo_1ms
	BCF   0x03,RP0
	BCF   0x03,RP1
	INCF  i_9,1
	GOTO  m045
			;}
m046	RETURN
			;
			;void tempo_50ms()
			;{
tempo_50ms
			; 	uns8 i;
			;	for (i=0; i<50;i++)
	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  i_10
m047	MOVLW 50
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_10,W
	BTFSC 0x03,Carry
	GOTO  m048
			;				tempo_1ms();
	CALL  tempo_1ms
	BCF   0x03,RP0
	BCF   0x03,RP1
	INCF  i_10,1
	GOTO  m047
			;}
m048	RETURN
			;
			;void tempo_100ms()
			;{
tempo_100ms
			;	uns8 i;
			;	for (i=0; i<100;i++)
	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  i_11
m049	MOVLW 100
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_11,W
	BTFSC 0x03,Carry
	GOTO  m050
			;				tempo_1ms();
	CALL  tempo_1ms
	BCF   0x03,RP0
	BCF   0x03,RP1
	INCF  i_11,1
	GOTO  m049
			;}
m050	RETURN
			;
			;
			;
			;void raz_KB()
			;{
raz_KB
			;	uns8 i;
			;	for (i=0;i<8;i++) KB[i]=0;	// vide le tableau
	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  i_12
m051	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_12,W
	BTFSC 0x03,Carry
	GOTO  m052
	MOVLW 59
	ADDWF i_12,W
	MOVWF FSR
	BCF   0x03,IRP
	CLRF  INDF
	INCF  i_12,1
	GOTO  m051
			;}
m052	RETURN
			;
			;
			;//traduit les touches Minitel vers ZX
			;// KB[x] contient les touches actives
			;
			;void conversion()
			;{
conversion
			;	uns8 k,b;
			;	uns8 i,j,a,n;
			;	uns16 ad;
			;	
			;	raz_KB();
	CALL  raz_KB
			;	
			;
			;	for (i=0;i<8;i++)
	BCF   0x03,RP0
	BCF   0x03,RP1
	CLRF  i_13
m053	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF i_13,W
	BTFSC 0x03,Carry
	GOTO  m067
			;	{	
			;	ad=0;
	CLRF  ad
	CLRF  ad+1
			;	k=MAT[i];
	MOVLW 43
	ADDWF i_13,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	MOVWF k
			;	for (b=0;b<8;b++)
	CLRF  b_2
m054	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF b_2,W
	BTFSC 0x03,Carry
	GOTO  m066
			;			{
			;				if (k.7!=0) 
	BTFSS k,7
	GOTO  m065
			;					for (j=0;j<8;j++)
	CLRF  j_2
m055	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF j_2,W
	BTFSC 0x03,Carry
	GOTO  m065
			;						{
			;							n=ad+j;
	MOVF  j_2,W
	ADDWF ad,W
	MOVWF n_3
			;							a=0;
	CLRF  a_4
			;							switch (i)
	MOVF  i_13,W
	BTFSC 0x03,Zero_
	GOTO  m056
	XORLW 1
	BTFSC 0x03,Zero_
	GOTO  m057
	XORLW 3
	BTFSC 0x03,Zero_
	GOTO  m058
	XORLW 1
	BTFSC 0x03,Zero_
	GOTO  m059
	XORLW 7
	BTFSC 0x03,Zero_
	GOTO  m060
	XORLW 1
	BTFSC 0x03,Zero_
	GOTO  m061
	XORLW 3
	BTFSC 0x03,Zero_
	GOTO  m062
	XORLW 1
	BTFSC 0x03,Zero_
	GOTO  m063
	GOTO  m064
			;								{
			;									case 0 : a=decod0[n]; break;	
m056	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVF  n_3,W
	CALL  _const1
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF a_4
	GOTO  m064
			;									case 1 : a=decod1[n]; break;	
m057	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVF  n_3,W
	CALL  _const3
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF a_4
	GOTO  m064
			;									case 2 : a=decod2[n]; break;	
m058	MOVLW 64
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF n_3,W
	CALL  _const3
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF a_4
	GOTO  m064
			;									case 3 : a=decod3[n]; break;	
m059	MOVLW 128
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF n_3,W
	CALL  _const3
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF a_4
	GOTO  m064
			;									case 4 : a=decod4[n]; break;	
m060	MOVLW 192
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF n_3,W
	CALL  _const3
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF a_4
	GOTO  m064
			;									case 5 : a=decod5[n]; break;	
m061	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVF  n_3,W
	CALL  _const7
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF a_4
	GOTO  m064
			;									case 6 : a=decod6[n]; break;	
m062	MOVLW 64
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF n_3,W
	CALL  _const7
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF a_4
	GOTO  m064
			;									case 7 : a=decod7[n]; break;	
m063	MOVLW 64
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF n_3,W
	CALL  _const1
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF a_4
			;								}
			;
			;							KB[j]=KB[j] | a;
m064	MOVLW 59
	BCF   0x03,RP0
	BCF   0x03,RP1
	ADDWF j_2,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  a_4,W
	IORWF INDF,1
			;						}
	INCF  j_2,1
	GOTO  m055
			;				k=k*2;
m065	BCF   0x03,Carry
	BCF   0x03,RP0
	BCF   0x03,RP1
	RLF   k,1
			;				ad=ad+8;
	MOVLW 8
	ADDWF ad,1
	BTFSC 0x03,Carry
	INCF  ad+1,1
			;			}
	INCF  b_2,1
	GOTO  m054
			;	}
m066	BCF   0x03,RP0
	BCF   0x03,RP1
	INCF  i_13,1
	GOTO  m053
			;
			;}
m067	RETURN
			;
			;
			;
			;// envoi les données du tableau KB vers les registres du CPLD
			;void trf()
			;{
trf
			;	uns8 n,d,b;
			;	for (n=8;n>0;n--)
	MOVLW 8
	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVWF n_4
m068	BCF   0x03,RP0
	BCF   0x03,RP1
	MOVF  n_4,1
	BTFSC 0x03,Zero_
	GOTO  m071
			;		{
			;			d=KB[n-1];
	MOVLW 58
	ADDWF n_4,W
	MOVWF FSR
	BCF   0x03,IRP
	MOVF  INDF,W
	MOVWF d
			;		//	d=MAT[n];
			;			for (b=0;b<5;b++)
	CLRF  b_3
m069	MOVLW 5
	BCF   0x03,RP0
	BCF   0x03,RP1
	SUBWF b_3,W
	BTFSC 0x03,Carry
	GOTO  m070
			;				{
			;					KB_DATA=d.4;
	BTFSS d,4
	BCF   0x07,KB_DATA
	BTFSC d,4
	BSF   0x07,KB_DATA
			;					KB_CLK=1;
	BSF   0x07,KB_CLK
			;					d=d*2;
	BCF   0x03,Carry
	RLF   d,1
			;					KB_CLK=0;
	BCF   0x07,KB_CLK
			;				}
	INCF  b_3,1
	GOTO  m069
			;			nop();
m070	NOP  
			;			nop();	
	NOP  
			;		}
	BCF   0x03,RP0
	BCF   0x03,RP1
	DECF  n_4,1
	GOTO  m068
			;	KB_LATCH=1;
m071	BCF   0x03,RP0
	BCF   0x03,RP1
	BSF   0x07,KB_LATCH
			;	nop();
	NOP  
			;	nop();
	NOP  
			;	KB_LATCH=0;
	BCF   0x07,KB_LATCH
	RETURN

	END


; *** KEY INFO ***

; 0x0275 P0   22 word(s)  1 % : scan
; 0x02AD P0   44 word(s)  2 % : test_RESET
; 0x02D9 P0   97 word(s)  4 % : test_VOLUME
; 0x0366 P0    7 word(s)  0 % : tempo_1ms
; 0x036D P0   15 word(s)  0 % : tempo_10ms
; 0x037C P0   15 word(s)  0 % : tempo_50ms
; 0x038B P0   15 word(s)  0 % : tempo_100ms
; 0x03AB P0  156 word(s)  7 % : conversion
; 0x0447 P0   45 word(s)  2 % : trf
; 0x039A P0   17 word(s)  0 % : raz_KB
; 0x0230 P0   24 word(s)  1 % : copy_MAT
; 0x0248 P0   45 word(s)  2 % : compare_MAT
; 0x028B P0   26 word(s)  1 % : noKey
; 0x02A5 P0    8 word(s)  0 % : waitnoKey
; 0x033A P0   44 word(s)  2 % : test_REP
; 0x0202 P0   46 word(s)  2 % : send_REP
; 0x0180 P0  130 word(s)  6 % : main
; 0x0001 P0  125 word(s)  6 % : _const1
; 0x007E P0  161 word(s)  7 % : _const3
; 0x011F P0   97 word(s)  4 % : _const7

; RAM usage: 36 bytes (11 local), 332 bytes free
; Maximum call level: 3
;  Codepage 0 has 1140 word(s) :  55 %
;  Codepage 1 has    0 word(s) :   0 %
;  Codepage 2 has    0 word(s) :   0 %
;  Codepage 3 has    0 word(s) :   0 %
; Total of 1140 code words (13 %)
