#include<p18F4550.inc>

loop_cnt1  	set 0x00
loop_cnt2   set 0x01
loop_cnt3	set	0x02

    org 0x00
    goto start
    org 0x08
    retfie
    org 0x18
    retfie

dup_nop		macro	kk
			variable i
i=0	
			while i < kk
			nop
i+=1		
			endw
			endm


start


delay50ms	movlw		D'16'	
			movwf		loop_cnt3,A
again0		movlw		D'250'
			movwf		loop_cnt2
again1		movlw		D'250'
			movwf		loop_cnt1,A
again2		dup_nop		D'247'
			decfsz		loop_cnt1,F,A
			bra			again2
			decfsz		loop_cnt2,F,A
			bra			again1
			decfsz		loop_cnt3,F,A
			bra			again0
		
			return
			end
			