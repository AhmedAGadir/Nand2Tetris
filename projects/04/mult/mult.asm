// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// let i = r0;
// let answer = 0;
// while (i !== 0) {
//    answer = answer + r1
//    i = i - 1;
// }
// return answer
// ======

// set memory[i] = memory[R0]
@R0
D=M
@i
M=D
// set memory[R2] = 0;
@R2
M=0
(LOOP)
// if (memory[i] === 0) exit loop
@i
D=M
@END
D;JEQ
// set memory[R2] = memory[r2] + memory[r1]
@R1
D=M
@R2
M=M+D
// set memory[i] = memory[i] - 1
@i
M=M-1
@LOOP
0;JMP
// finish
(END)
@END
0;JMP
