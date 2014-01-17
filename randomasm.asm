;***********************************************************
;*
;*    Enter Name of file here
;*
;*    Enter the description of the program here
;*
;*    This is the skeleton file Lab 2 of ECE 375
;*
;***********************************************************
;*
;*     Author: Enter your name
;*   	Date: Enter Date
;*
;***********************************************************

.include "m128def.inc"   		 ; Include definition file

;***********************************************************
;*    Internal Register Definitions and Constants
;***********************************************************
.def    mpr = r16   			 ; Multipurpose register required for LCD Driver


;***********************************************************
;*    Start of Code Segment
;***********************************************************
.cseg   						 ; Beginning of code segment

;-----------------------------------------------------------
; Interrupt Vectors
;-----------------------------------------------------------
.org    $0000   				 ; Beginning of IVs
   	 rjmp INIT   			 ; Reset interrupt

.org    $0046   				 ; End of Interrupt Vectors

;-----------------------------------------------------------
; Program Initialization
;-----------------------------------------------------------
INIT:   						 ; The initialization routine
   	 ; Initialize Stack Pointer
   	 LDI mpr, LOW(RAMEND)    ; Init the 2 stack pointer registers
   	 OUT SPL, mpr
   	 LDI mpr, HIGH(RAMEND)
   	 OUT SPH, mpr

   	 ; Initialize LCD Display
   	 rcall LCDInit   		 ; An RCALL statement

   	 LDI ZL, LOW(STRING_BEG<<1)
   	 LDI ZH, HIGH(STRING_BEG<<1)
   	 LDI YL, LOW(LCDLn1Addr)
   	 LDI YH, HIGH(LCDLn1Addr)    

   	 ; Move strings from Program Memory to Data Memory
   	 loop1:   				 ; A while loop will go here
   		 lpm mpr, Z+
   		 st Y+, mpr

   		 CPI ZL, LOW(STRING_END<<1)
   		 brne loop1
   		 CPI ZH, HIGH(STRING_END<<1)
   		 brne loop1
   		 ;rcall LCDWrLn1
   	 
   	 ;LDI ZL, LOW(STRING_BEG2<<1)
   	 ;LDI ZH, HIGH(STRING_BEG2<<1)
   	 ;LDI XL, LOW(LCDLn2Addr)
   	 ;LDI XH, HIGH(LCDLn2Addr)    

   	 ;loop2:   				 ; A while loop will go here
   		 ;lpm mpr, Z+
   		 ;st X+, mpr
   		 ;brne loop2
   				 
   		 ;rcall LCDWrLn2

   	 ; NOTE that there is no RET or RJMP from INIT, this is
   	 ; because the next instruction executed is the first for
   	 ; the main program

;-----------------------------------------------------------
; Main Program
;-----------------------------------------------------------
MAIN:   						 ; The Main program
   	 ; Display the strings on the LCD Display
   	 ;rcall LCDClr
   	 ;rcall LCDWrLn1    	; An RCALL statement
   	 ;rcall Write
   	 rcall LCDWrite

   	 ;ldi mpr, 'D'
   	 ;ldi line, 2
   	 ;ldi count, 7
   	 ;rcall LCDWriteByte

   	 rjmp    MAIN    
   			 ; jump back to main and create an infinite
   							 ; while loop.  Generally, every main program is an
   							 ; infinite while loop, never let the main program
   							 ; just run off

;***********************************************************
;*    Functions and Subroutines
;***********************************************************

;-----------------------------------------------------------
; Func: Template function header
; Desc: Cut and paste this and fill in the info at the
;   	 beginning of your functions
;-----------------------------------------------------------
Write:    
   	 ;push mpr
   	 ;rcall LCDWrite
   	 ;pop mpr   			 ; Begin a function with a label

   	 ; Save variable by pushing them to the stack

   	 ; Execute the function here
   	 
   	 ; Restore variable by popping them from the stack in reverse order\
   	 ret   					 ; End a function with RET


;***********************************************************
;*    Stored Program Data
;***********************************************************

;----------------------------------------------------------
; An example of storing a string, note the preceeding and
; appending labels, these help to access the data
;----------------------------------------------------------
STRING_BEG1:
.DB   	 "  Test line 1 "
STRING_BEG2:
.DB   	 "  Test line 2 "
STRING_BEG:
.DB   	 "Justin    	"   	 ; Storing the string in Program Memory
STRING_END:

;***********************************************************
;*    Additional Program Includes
;***********************************************************
.include "LCDDriver.asm"   	 ; Include the LCD Driver


