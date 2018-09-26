# Bubble - Bubble sort algorithm example using MIPS assembly language
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

Bubble_example:
	.data
arr: 	.word	5, 3, 1, 4, 2
size:	.word	5
	
	.text
main:
	la	$a0, arr	# veja como é montado
	la	$t1, size	# veja como é montado
	lw	$a1, 0($t1)	
	jal	bubble
	j 	end

swap: # int *a, int *b
	lw	$t1, 0($a0)
	lw	$t2, 0($a1)
	sw	$t1, 0($a1)
	sw	$t2, 0($a0)
	jr	$ra
	
bubble:	# a1 <- array     a2 <- size
	addi	$sp, $sp, -20
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)			#$s0 --> i
	sw	$s1, 8($sp)			#$s1 --> n - 1
	sw	$s2, 12($sp)			#$s2 --> j
	sw	$s3, 16($sp)			#$s3 --> arr
	move	$s3, $a0
	addi	$s1, $a1, -1			# n - 1
	li	$s0, 0				# i = 0
outer:
	beq	$s0, $s1, done_outer 		# i == n - 1
	li	$s2, 0				# j = 0
inner:
	sub	$t0, $s1, $s0			# n - 1 - i
	beq	$s2, $t0, done_inner		# j == n - 1 - i
	sll	$t1, $s2, 2			
	add	$t1, $t1, $s3			# addr1 = arr[j]
	lw	$t2, 0($t1)			# t2 = arr[j]
	lw	$t3, 4($t1)			# t3 = arr[j+1]
	slt	$t4, $t3, $t2			# t3 < t2
	beq	$t4, $0, inc_inner		# se t3 >= t2
	move	$a0, $t1			
	addi	$a1, $t1, 4
	jal 	swap				# swap arr[j], arr[j+1]
inc_inner:
	addi	$s2, $s2, 1			# j++
	j 	inner
done_inner:
inc_outer:
	addi	$s0, $s0, 1			# i++
	j 	outer
done_outer:
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	lw	$s1, 8($sp)
	lw	$s2, 12($sp)
	lw	$s3, 16($sp)
	addi	$sp, $sp, 20
	jr	$ra

end:
