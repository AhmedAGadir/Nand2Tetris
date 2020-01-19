// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the SCREEN,
// i.e. writes "black" in every pixel;
// the SCREEN should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the SCREEN, i.e. writes
// "white" in every pixel;
// the SCREEN should remain fully clear as long as no key is pressed.

// @KBD refers to RAM[24576] stores a 16-bit ASCII code when a key has been pressed, and 0 otherwise
// @SCREEN refers to RAM[16384], the SCREEN has 256 rows, each row has 512 pixels (made up of 32 16-bit words => therefore each pixel is a bit)

(LOOP)
// if memory[kbd] > 0 jump to fill, else continue (to CLEAR)
  @KBD
  D=M
  @FILL
  D;JGT

(CLEAR)
// memory[SCREEN + offset] = 0
  @offset
  D=M
  @SCREEN
  A=D+A
  M=0

  @INC_OFFSET
  0;JMP

(FILL)
// memory[SCREEN + offset] = -1
  @offset
  D=M
  @SCREEN
  A=D+A
  M=-1

(INC_OFFSET)
// offset += 1
  @offset
  MD=M+1
// if offset !== 8192 (256 rows x 32 words per row), then repeat the loop
  @8192
  D=D-A
  @LOOP
  D;JNE

(RESET_OFFSET)
// offset = 0, repeat loop
  @offset
  M=0
  @LOOP
  0;JMP