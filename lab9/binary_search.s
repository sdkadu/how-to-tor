// Registers Defaults
  // r7   - key
  // r9   - LEDs

  // r0   - numbers
  // r1   - key
  // r2   - startIndex
  // r3   - endIndex
  // r8   - numCalls

  // r13  - stack point
  // r14  - link register

  // r4   - middle index
  // r5   - numbers[middleIndex]
  // r6   - key index

  .globl binary_search
  binary_search:
      /************* save random registers **************/
      push   {r0-r8, lr}
      /**************************************************/
      sub     r12,r3,r2             // compute middleIndex
      add     r4,r2,r12, LSR#1          // r4 = middle index
      ldr     r5,[r0,r4, LSL#2]     // r5 = numbers[middleIndex]
      add     sp,sp, #-20           // create backup space for 3 items
      str     lr, [sp, #0]              // store link register
      str     r5, [sp, #4]              // store r5 (numbers[middleIndex])
      str     r8, [sp, #8]              // store r8 (numCalls)
      str     r0, [sp, #12]             // store r0 (*numbers)
      str     r4, [sp, #16]             // store r4 (middleIndex)
      add     r8,r8, #1             // increment numCalls
      cmp     r2,r3
      ble true
      mov     r0,#-1                // return -1 if startIndex > endIndex
      mov pc, lr

  true: // if startindex <= endIndex
      cmp     r5,r1
      bne notequals
      mov     r10,r4                // keyIndex = middleIndex
      b done    // check this

  notequals: // numbers[middleIndex] != key
      ble else
      add     r12,r4,#-1            // compute new endIndex (middleIndex - 1)
      mov     r3,r12                // set new endIndex
      bl binary_search
      mov     r10, r0               // keyIndex = binary_search
      b done

  else: // numbers[middleIndex] <= key
      add     r12,r4,#1             // compute new startIndex (middleIndex + 1)
      mov     r2,r12                // set new startIndex
      bl binary_search
      mov     r10, r0               // keyIndex = binary_search
      b done

  done:
      ldr     lr, [sp, #0]                // load backup link register
      ldr     r5, [sp, #4]                // load backup r5 (numbers[middleIndex])
      ldr     r8, [sp, #8]                // load backup r8 (numCalls)
      ldr     r0, [sp, #12]               // load backup r0 (*numbers)
      ldr     r4, [sp, #16]               // load backup r4 (middleIndex)
      add     sp,sp, #20              // remove backup space for 3 items
      mvn     r12,r8                  // inverse numCalls into -numCalls
      str     r12,[r0,r4, LSL#2]      // store -numCalls into numbers[middleIndex]
      mov     r0, r10               // return keyIndex
      /************* load random registers **************/
      pop   {r0-r8, lr}
      /**************************************************/
      mov pc, lr              // bye have a great time
