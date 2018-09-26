# gcd_test - Tests the Euclidean Algorithm
# Copyright (C) 2018  Digital Systems Group - UFMG
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, see <https://www.gnu.org/licenses/>.
#

gcd_test:
    .data
    # Some values to test
a:      .word    18, 8, 19, 1071
b:      .word    12, 4, 10, 462
size:   .word    4
	
    .text

main:
    la      $s0, a
    la      $s1, b
    la      $t0, size
    lw      $s2, 0($t0)
    li      $s3, 0
loop:
    beq     $s3, $s2, done
    sll     $t1, $s3, 2
    add     $t0, $t1, $s0
    lw      $a0, 0($t0)
    add     $t0, $t1, $s1
    lw      $a1, 0($t0)
    jal     gcd
    move    $a0, $v0
    li      $v0, 1
    syscall
    li      $a0, '\n'
    li      $v0, 11
    syscall
    addi    $s3, $s3, 1
    j       loop
done:
    li      $v0, 10
    syscall
