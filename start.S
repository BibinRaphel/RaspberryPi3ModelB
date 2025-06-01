.section .text
.globl _start
_start:
    ldr sp, =stack_top
    bl main
hang:
    b hang
.section .bss
.bss_start:
    .space 4096
stack_top:
