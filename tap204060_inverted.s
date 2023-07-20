; This program creates pulses
; of $20 $40 and $60
; "TAP" values.
; Inverting the pulse <<<<
; By Zibri


                * =  $801
                .BYTE $B, 8, $E7, $07 , $9E, $32, $30, $36, $31, 0, 0, 0

START

JSR $E5A0         ; VIC reset (only for testing)
SEI



    JSR $F838         ; press record & play on tape

    LDA #$0D                            ; Start tape motor
    STA $01
    LDA #$7F
    STA $DC0D
    STA $DD0D
    LDA $DC0D
    LDA $DD0D

    LDA #$0B
    STA $D011
    STA $D020
    
    LDY #$3E          ; wait a little more than 2 seconds.
    LDX #$00
-    
    JSR w16tap
    DEX
    BNE -
    DEY
    BNE -
    LDX #$5
    LDA #$D

LOOP

; $20

    STX $1
    CMP $0
    NOP
    JSR w16tap
    STA $1
    JSR w16tap
    NOP
    CMP $0

; $40

    STX $1
    CMP $0
    NOP
    JSR w16tap
    JSR w16tap
    NOP
    NOP
    NOP
    NOP
    STA $1
    JSR w16tap
    JSR w16tap
    NOP
    NOP
    NOP
    NOP
    NOP
    CMP $0

; $60

    STX $1
    CMP $0
    NOP
    JSR w16tap
    JSR w16tap
    JSR w16tap
    JSR R-3
    STA $1
    JSR w16tap
    JSR w16tap
    JSR w16tap
    JSR R-3
    NOP
    CMP $0

; $40

    STX $1
    CMP $0
    NOP
    JSR w16tap
    JSR w16tap
    NOP
    NOP
    NOP
    NOP
    STA $1
    JSR w16tap
    JSR w16tap
    NOP
    NOP
    NOP
    NOP
    NOP

    JMP LOOP    


w16tap ; 16 x 8 cicli = 120

   JSR WAIT
   JSR WAIT
   JSR WAIT
   JSR R
   RTS
WAIT ; 32 ccyles 4 tap
    
.byte $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c5, $ea

R
   RTS
