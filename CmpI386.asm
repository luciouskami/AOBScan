;
;
; Copyright (c) 2015-2017 by blindtiger ( blindtiger@foxmail.com )
;
; The contents of this file are subject to the Mozilla Public License Version
; 2.0 (the "License"); you may not use this file except in compliance with
; the License. You may obtain a copy of the License at
; http://www.mozilla.org/MPL/
;
; Software distributed under the License is distributed on an "AS IS" basis,
; WITHOUT WARRANTY OF ANY KIND, either express or implied. SEe the License
; for the specific language governing rights and limitations under the
; License.
;
; The Initial Developer of the Original e is blindtiger.
;
;

.686
.XMM

    .XLIST
INCLUDE DEFS.INC
INCLUDE KS386.INC
INCLUDE CALLCONV.INC
    .LIST

OPTION CASEMAP:NONE

_DATA$00 SEGMENT PAGE 'DATA'

_DATA$00 ENDS

_TEXT$00 SEGMENT PAGE 'CODE'

_CmpByte@8 :

    mov cl, [esp + 4]
    mov dl, [esp + 8]
    cmp cl, dl
    setnz al
    ret 8

PUBLIC _CmpByte@8

align 20h

_CmpShort@8 :

    mov cx, [esp + 4]
    mov dx, [esp + 8]
    cmp cx, dx
    setnz al
    ret 8

PUBLIC _CmpShort@8

align 20h

_CmpLong@8 :

    mov ecx, [esp + 4]
    mov edx, [esp + 8]
    cmp ecx, edx
    setnz al
    ret 8

PUBLIC _CmpLong@8

align 20h

_CmpLongLong@16 :

    mov ecx, [esp + 4]
    mov edx, [esp + 0ch]
    cmp ecx, edx

    jnz @f
    
    mov ecx, [esp + 8h]
    mov edx, [esp + 10h]
    cmp ecx, edx

@@ :
    setnz al
    ret 10h

PUBLIC _CmpLongLong@16

align 20h

_TEXT$00 ENDS

END
