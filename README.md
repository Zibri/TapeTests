# Tape Tests

## Test A

LOAD"TAP204060.PRG"   on a **real** C64.
Connect a **real** "datasette" (Commodore C2N).
Reset the tape counter to 000.
RUN the program.
Start a capture with your device (Ultimate2+)
Press record & play on the datasette.
After at least 20 steps of the counter,
stop the capture and switch off the C64.
Rewind the tape to 000 (where you started recording),
Dump the tape with U2+.
Save the two files "capture.tap" and "dump1.tap"

## Test B

Connect a **real** "datasette" (Commodore C2N).
Reset the tape counter to 000.
Write the file "tap204060.tap" to tape using the U2+
Rewind the tape to 000 (where you started recording),
Dump the tape with U2+.
Save the file "dump2.tap"

### Analyze results.
