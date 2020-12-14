; rm -rf helloworldx86.o helloworldx86 && nasm -felf32 -o helloworldx86.o helloworldx86.asm && ld -m elf_i386 helloworldx86.o -o helloworldx86

; MIT License - Copyright 2020
; David Reguera Garcia aka Dreg - dreg@fr33project.org
; -
; http://github.com/David-Reguera-Garcia-Dreg/ - http://www.fr33project.org/
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
; The above copyright notice and this permission notice shall be included in
; all copies or substantial portions of the Software.
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
; IN THE SOFTWARE.

section   .data
    msg: db "Hello D R E G!",10,10,0
    msg_size: equ $-msg

section .text
    global _start

_start:
    ; warning:
    mov byte eax, [ecx]
    ; error:
    mov ECXXXAA, eax

    ; good code:
    mov ecx, msg
    mov edx, msg_size
    mov eax, 4 ; sys_write
    mov ebx, 1 ; stdout
    int 0x80

    mov eax, 1 ; exit
    mov ebx, 0 ; success
    int 0x80

