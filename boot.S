.globl _start
 
        .org 0x8000
_start:
	mov sp, #0x8000
 
	 
	ldr r3, =kernel_main
	blx r3
	
halt:
	b halt
