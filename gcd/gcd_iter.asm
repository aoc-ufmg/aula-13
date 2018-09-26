# gcd_iter - Iterative Euclidean Algorithm using MIPS assembly language
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
    .text

# Defines gcd as a global symbol, so it can be accessed from main
    .globl gcd
    
gcd: # a --> $a0   b --> $a1
loop:
    beq     $a1, $0, done
    move    $t0, $a1
    div     $a0, $a1
    mfhi    $a1
    move    $a0, $t0
    j       loop
done:
    move    $v0, $a0
    jr      $ra
