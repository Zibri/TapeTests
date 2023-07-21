; This program creates pulses
; of $10 $20 $40 $60 $40 $20  repeated...
; "TAP" values.

; By Zibri


                * =  $801
                .BYTE $B, 8, $E7, $07 , $9E, $32, $30, $36, $31, 0, 0, 0

START

JSR $E5A0         ; VIC reset (only for testing)
SEI



    JSR $F838         ; press record & play on tape

    LDA #$05                            ; Start tape motor
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
    LDX #$D
    LDA #$5

LOOP

; $10

    STX $1
    CMP $0
    NOP
    JSR WAIT ; 4 tap
    JSR WAIT+8 ; 3 tap
    STA $1
    NOP
    JSR WAIT ; 4 tap
    JSR WAIT+8 ; 3 tap
    CMP $0

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
    CMP $0

; $20

    STX $1
    CMP $0
    NOP
    JSR w16tap
    STA $1
    JSR w16tap
    NOP
    CMP $0

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
