(LOOP)
    // Get keyboard value.
    @KBD
    D=M

    @ON
    D;JGT

    @OFF
    0;JMP

// Set to black
(ON)
    @R0
    M=-1
    // Draw.
    @DRAW
    0;JMP

// Set to white
(OFF)
    @R0
    M=0
    // Draw.
    @DRAW
    0;JMP

// Set the screen to R0 and loop.
(DRAW)
    // Count of pixels
    @8191
    D=A
    @R1
    M=D

    // Set values to the pixel.
    (NEXT)
        // Calculate the position.
        @R1
        D=M
        @pos
        M=D
        @SCREEN
        D=A
        @pos
        M=M+D

        // Update the current postion.
        @R0
        D=M
        @pos
        A=M
        M=D

        // Decrement the counter (R1).
        @R1
        D=M-1
        M=D

        // Next if the counter is still >= 0.
        @NEXT
        D;JGE

    // Loop back.
    @LOOP
    0;JMP