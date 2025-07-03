;var1 is 4
;var2 is 3
;var3 is 5
;result is 3

section .text
  global _start

  _start:
  mov ax, [var1]
  mov bx, 2
  add ax, bx
  mov [temp1], ax

  mov al, [var3]
  mov bl, [var2]
  sub al, bl
  mov [temp2], al

  mov ax, [temp1]
  mov dl, [temp2]
  div dl
  mov [result], al

  mov al, [result] ;convert to ascii before printing it only works when less than 10
  add al, 48
  mov [resultascii], al ; move it to the temporary variable in which it stores the ascii.

  mov eax, 4 ;print out the result
  mov ebx, 1
  mov ecx, resultascii
  mov edx, 1
  int 0x80

  mov eax, 4 ;print new line
  mov ebx, 1
  mov ecx, newline
  mov edx, 1
  int 0x80

  mov eax, 1
  int 0x80

section .data
  var1 dw 4
  var2 db 3
  var3 db 5

  newline db 0xA, 0xD

segment .bss
  temp1 resw 1
  temp2 resb 1

  result resb 1
  resultascii resb 1 ;result in ascii form
