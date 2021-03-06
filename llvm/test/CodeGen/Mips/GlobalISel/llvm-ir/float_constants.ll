; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc  -O0 -mtriple=mipsel-linux-gnu -global-isel -verify-machineinstrs %s -o -| FileCheck %s -check-prefixes=MIPS32,FP32
; RUN: llc  -O0 -mtriple=mipsel-linux-gnu -mattr=+fp64,+mips32r2 -global-isel -verify-machineinstrs %s -o -| FileCheck %s -check-prefixes=MIPS32,FP64

define float @e_single_precision() {
; MIPS32-LABEL: e_single_precision:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    lui $1, 16429
; MIPS32-NEXT:    ori $1, $1, 63572
; MIPS32-NEXT:    mtc1 $1, $f0
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  ret float 0x4005BF0A80000000
}

define double @e_double_precision() {
; FP32-LABEL: e_double_precision:
; FP32:       # %bb.0: # %entry
; FP32-NEXT:    lui $1, 16389
; FP32-NEXT:    ori $2, $1, 48906
; FP32-NEXT:    lui $1, 35604
; FP32-NEXT:    ori $1, $1, 22377
; FP32-NEXT:    mtc1 $1, $f0
; FP32-NEXT:    mtc1 $2, $f1
; FP32-NEXT:    jr $ra
; FP32-NEXT:    nop
;
; FP64-LABEL: e_double_precision:
; FP64:       # %bb.0: # %entry
; FP64-NEXT:    lui $1, 16389
; FP64-NEXT:    ori $2, $1, 48906
; FP64-NEXT:    lui $1, 35604
; FP64-NEXT:    ori $1, $1, 22377
; FP64-NEXT:    mtc1 $1, $f0
; FP64-NEXT:    mthc1 $2, $f0
; FP64-NEXT:    jr $ra
; FP64-NEXT:    nop
entry:
  ret double 0x4005BF0A8B145769
}
