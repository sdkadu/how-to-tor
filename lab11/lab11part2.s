    .include "matrix.s"

    .equ N_value, 128

zero:
    .double 0.0

    .text
    .global _start
_start:
    BL CONFIG_VIRTUAL_MEMORY

    // REGISTERS
      // R0 - A (base address)
      // R1 - B (base address)
      // R2 - C (base address)
      // R3 - i

      // R4 - j
      // R5 - k
      // R6 - temp
      // R7 - N
      // R8 - zero
      // R9 -
      // R10 -
      // R11 -

      // R12 - scratch register
      // R13 - stack pointer
      // R14 - link register

/********************************* LAB 11 PART 1 *******************************/

  // Step 1-3: configure PMN0 to count cycles
    MOV R0, #0 // Write 0 into R0 then PMSELR
    MCR p15, 0, R0, c9, c12, 5 // Write 0 into PMSELR selects PMN0
    MOV R1, #0x11 // Event 0x11 is CPU cycles
    MCR p15, 0, R1, c9, c13, 1 // Write 0x11 into PMXEVTYPER (PMN0 measure CPU cycles)

    MOV R0, #1
    MCR p15, 0, R0, c9, c12, 5 // Write 1 into PMSELR selects PMN1
    MOV R1, #0x6 // Event 0x6 is Number of Load Instructions Executed
    MCR p15, 0, R1, c9, c13, 1 // Write 0x6 into PMXEVTYPER

    MOV R0, #2
    MCR p15, 0, R0, c9, c12, 5 // Write 2 into PMSELR selects PMN2
    MOV R1, #0x3 // Event 0x3 is Level 1 Data Cache Misses
    MCR p15, 0, R1, c9, c13, 1 // Write 0x3 into PMXEVTYPER

  // Step 4: enable PMN0 *to PMN2
    mov R0, #0b111 // PMN0 is bit 0 of PMCNTENSET
    MCR p15, 0, R0, c9, c12, 1 // Setting bit 0 of PMCNTENSET enables PMN0 *to PMN2

  // Step 5: clear all counters and start counters
    mov r0, #3 // bits 0 (start counters) and 1 (reset counters)
    MCR p15, 0, r0, c9, c12, 0 // Setting PMCR to 3

/******************************** LAB 11 PART 2 ********************************/

  // Step 6: code we wish to profile usisng hardware counters
    LDR R0, =matrix_128          // loads base address of matrix A
    LDR R1, =matrix_128          // loads base address of matrix B
    LDR R2, =matrix_c          // loads base address of matrix C
    LDR R7, =N_value           // loads address of N
    LDR R8, =zero              // loads 0.0
    MOV R3, #0                 // i = 0

LOOP1:
    CMP R3, R7                 // (i < N)
    BGE LOOP1DONE              // if i >= N jump
    MOV R4, #0                 // j = 0

LOOP2:
    CMP R4, R7                 // (j < N)
    BGE LOOP2DONE              // if j >= N jump
    .word 0xED980B00           // D0 (sum) = 0.0
    MOV R5, #0                 // k = 0

LOOP3:
    CMP R5, R7                 // (k < N)
    BGE LOOP3DONE              // if k >= N jump
    MUL R6, R3, R7             // i * N
    ADD R6, R6, R5             // i * N + k
    ADD R6, R0, R6, LSL #3     // A[i][k]
    .word 0xED961B00           // D1 = A[i][k]
    MUL R12, R5, R7            // k * N
    ADD R12, R12, R4           // k * N + j
    ADD R12, R1, R12, LSL #3   // B[k][j]
    .word 0xED9C2B00           // D2 = R1[R4][R5]
    .word 0xEE213B02           // D3 = D2 * D1
    .word 0xEE300B03           // D0 (sum) = D0 (sum) + D3
    ADD R5, R5, #1             // k++
    B LOOP3

LOOP3DONE:
    MUL R12, R3, R7            // i * N
    ADD R12, R12, R4           // i * N + j
    ADD R12, R2, R12, LSL #3   // C[i][j]
    .word 0xED8C0B00           // C[i][j] = sum
    ADD R4, R4, #1             // j++
    B LOOP2

LOOP2DONE:
    ADD R3, R3, #1             // i++
    B LOOP1

LOOP1DONE:
  // Step 7: stop counters
    mov r0, #0
    MCR p15, 0, r0, c9, c12, 0 // Write 0 to PMCR to stop counters

/********************************* LAB 11 PART 1 *******************************/

  // Step 8-10: Select PMN0 and read out result into R3
    mov r0, #0 // PMN0
    MCR p15, 0, R0, c9, c12, 5 // Write 0 to PMSELR
    MRC p15, 0, R3, c9, c13, 2 // Read PMXEVCNTR into R3

    mov r0, #1 // PMN1
    MCR p15, 0, R0, c9, c12, 5 // Write 1 to PMSELR
    MRC p15, 0, R4, c9, c13, 2 // Read PMXEVCNTR into R4 (load instruction counter)

    mov r0, #2 // PMN2
    MCR p15, 0, R0, c9, c12, 5 // Write 2 to PMSELR
    MRC p15, 0, R5, c9, c13, 2 // Read PMXEVCNTR into R5 (cache miss counter)

/*******************************************************************************/
END:
    B END   // wait

matrix_a:
    .double 1.1   // [1][1]
    .double 1.2   // [1][2]
    .double 2.1   // [2][1]
    .double 2.2   // [2][2]

matrix_b:
    .double 3.1
    .double 3.2
    .double 4.1
    .double 4.2

matrix_c:
/*
    .double 0.0
    .double 0.0
    .double 0.0
    .double 0.0
*/
//    .fill 16384,8,0x0EA7A550   // set 100 locations to easily recognize
