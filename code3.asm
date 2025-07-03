section .text
  global _start

_start:
  mov eax, [inp]
  test eax, 1 ;similar to and but doesnt change anything
  jz even
  mov eax, 4
  mov ebx, 1
  mov ecx, oddtext
  mov edx, lenodd
  int 0x80

  mov eax, 1
  int 0x80

even: ;will only go there when the number is even
  mov eax, 4
  mov ebx, 1
  mov ecx, eventext
  mov edx, lenevn
  int 0x80

  mov eax, 1
  int 0x80


section .data
  inp dd 4 ;where you put the input number

  oddtext db 'odd number'
  lenodd equ $ - oddtext

  eventext db 'even number'
  lenevn equ $ - eventext
