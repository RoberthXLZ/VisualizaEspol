.machine	"any"
.text

.globl	bn_mul_mont_fpu64
.type	bn_mul_mont_fpu64,@function
.align	5
bn_mul_mont_fpu64:
	cmpwi	8,6
	mr	9,3
	li	3,0
	.long	0x4dc00020
	andi.	0,8,3
	.long	0x4cc20020

	slwi	8,8,2
	li	12,-4096
	slwi	10,8,2
	add	10,10,8
	addi	10,10,488
	subf	10,10,1
	and	10,10,12
	subf	10,1,10
	mr	12,1
	stwux	1,1,10

	stw	19,-148(12)
	stw	20,-144(12)
	stw	21,-140(12)
	stw	22,-136(12)
	stw	23,-132(12)
	stw	24,-128(12)
	stw	25,-124(12)
	stw	26,-120(12)
	stw	27,-116(12)
	stw	28,-112(12)
	stw	29,-108(12)
	stw	30,-104(12)
	stw	31,-100(12)
	stfd	20,-96(12)
	stfd	21,-88(12)
	stfd	22,-80(12)
	stfd	23,-72(12)
	stfd	24,-64(12)
	stfd	25,-56(12)
	stfd	26,-48(12)
	stfd	27,-40(12)
	stfd	28,-32(12)
	stfd	29,-24(12)
	stfd	30,-16(12)
	stfd	31,-8(12)

	addi	10,1,264
	li	12,-64
	add	22,10,8
	and	22,22,12

	addi	22,22,-8
	srwi	11,8,4
	addi	11,11,-1
	addi	10,1,184
	li	0,0
	mtctr	11
	lwz	23,0(4)
	mr	20,7
	lwz	21,4(4)
	li	19,0
	lwz	25,0(5)
	lwz	27,4(5)
	lwz	7,0(20)
	lwz	20,4(20)

	mullw	28,23,25
	mulhwu	29,23,25
	mullw	30,21,25
	mullw	31,23,27
	add	29,29,30
	add	29,29,31

	extrwi	24,25,16,16
	extrwi	25,25,16,0
	extrwi	26,27,16,16
	extrwi	27,27,16,0
	std	24,64(1)
	std	25,72(1)
	std	26,80(1)
	std	27,88(1)

	mullw	24,28,7
	mulhwu	25,28,7
	mullw	26,29,7
	mullw	27,28,20
	add	25,25,26
	add	25,25,27

	extrwi	28,24,16,16
	extrwi	29,24,16,0
	extrwi	30,25,16,16
	extrwi	31,25,16,0
	std	28,96(1)
	std	29,104(1)
	std	30,112(1)
	std	31,120(1)

	mr	24,23
	mr	25,21
	lwz	26,8(4)
	lwz	27,12(4)
	lwz	28,0(6)
	lwz	29,4(6)
	lwz	30,8(6)
	lwz	31,12(6)
	lfd	0,64(1)
	lfd	1,72(1)
	lfd	2,80(1)
	lfd	3,88(1)
	lfd	4,96(1)
	lfd	5,104(1)
	lfd	6,112(1)
	lfd	7,120(1)
	std	24,128(1)
	std	25,136(1)
	std	26,144(1)
	std	27,152(1)
	std	28,160(1)
	std	29,168(1)
	std	30,176(1)
	std	31,184(1)
	fcfid	0,0
	fcfid	1,1
	fcfid	2,2
	fcfid	3,3
	fcfid	4,4
	fcfid	5,5
	fcfid	6,6
	fcfid	7,7

	lfd	10,128(1)
	lfd	11,136(1)
	lfd	12,144(1)
	lfd	13,152(1)
	lfd	20,160(1)
	lfd	21,168(1)
	lfd	22,176(1)
	lfd	23,184(1)
	fcfid	10,10
	fcfid	11,11
	fcfid	12,12
	fcfid	13,13
	fcfid	20,20
	fcfid	21,21
	fcfid	22,22
	fcfid	23,23
	addi	4,4,16
	addi	6,6,16

	fmul	26,11,0
	fmul	27,11,1
	stfd	10,8(22)
	stfd	11,16(22)
	fmul	28,12,0
	fmul	29,12,1
	stfd	12,24(22)
	stfd	13,32(22)
	fmul	30,13,0
	fmul	31,13,1
	stfd	20,40(22)
	stfd	21,48(22)
	fmul	24,10,0
	fmul	25,10,1
	stfd	22,56(22)
	stfdu	23,64(22)

	fmadd	26,10,2,26
	fmadd	27,10,3,27
	fmadd	28,11,2,28
	fmadd	29,11,3,29
	fmadd	30,12,2,30
	fmadd	31,12,3,31
	fmul	8,13,2
	fmul	9,13,3

	fmadd	26,21,4,26
	fmadd	27,21,5,27
	fmadd	28,22,4,28
	fmadd	29,22,5,29
	fmadd	30,23,4,30
	fmadd	31,23,5,31
	fmadd	24,20,4,24
	fmadd	25,20,5,25

	fmadd	26,20,6,26
	fmadd	27,20,7,27
	fmadd	28,21,6,28
	fmadd	29,21,7,29
	fmadd	30,22,6,30
	fmadd	31,22,7,31
	fmadd	8,23,6,8
	fmadd	9,23,7,9

	fctid	24,24
	fctid	25,25
	fctid	26,26
	fctid	27,27
	fctid	28,28
	fctid	29,29
	fctid	30,30
	fctid	31,31

	stfd	24,64(1)
	stfd	25,72(1)
	stfd	26,80(1)
	stfd	27,88(1)
	stfd	28,96(1)
	stfd	29,104(1)
	stfd	30,112(1)
	stfd	31,120(1)

.align	5
.L1st:
	lwz	24,0(4)
	lwz	25,4(4)
	lwz	26,8(4)
	lwz	27,12(4)
	lwz	28,0(6)
	lwz	29,4(6)
	lwz	30,8(6)
	lwz	31,12(6)
	std	24,128(1)
	std	25,136(1)
	std	26,144(1)
	std	27,152(1)
	std	28,160(1)
	std	29,168(1)
	std	30,176(1)
	std	31,184(1)
	lwz	25,64(1)
	lwz	24,68(1)
	lwz	27,72(1)
	lwz	26,76(1)
	lwz	29,80(1)
	lwz	28,84(1)
	lwz	31,88(1)
	lwz	30,92(1)
	lfd	10,128(1)
	lfd	11,136(1)
	lfd	12,144(1)
	lfd	13,152(1)
	lfd	20,160(1)
	lfd	21,168(1)
	lfd	22,176(1)
	lfd	23,184(1)
	fcfid	10,10
	fcfid	11,11
	fcfid	12,12
	fcfid	13,13
	fcfid	20,20
	fcfid	21,21
	fcfid	22,22
	fcfid	23,23
	addi	4,4,16
	addi	6,6,16

	fmul	26,11,0
	fmul	27,11,1
	fmul	28,12,0
	fmul	29,12,1
	stfd	10,8(22)
	stfd	11,16(22)
	fmul	30,13,0
	fmul	31,13,1
	fmadd	24,10,0,8
	fmadd	25,10,1,9
	stfd	12,24(22)
	stfd	13,32(22)
	fmadd	26,10,2,26
	fmadd	27,10,3,27
	addc	24,24,0
	adde	25,25,19
	srwi	0,24,16
	fmadd	28,11,2,28
	fmadd	29,11,3,29
	stfd	20,40(22)
	stfd	21,48(22)
	srwi	19,25,16
	insrwi	0,25,16,0
	fmadd	30,12,2,30
	fmadd	31,12,3,31
	addc	26,26,0
	adde	27,27,19
	srwi	0,26,16
	fmul	8,13,2
	fmul	9,13,3
	stfd	22,56(22)
	stfdu	23,64(22)
	insrwi	24,26,16,0
	srwi	19,27,16
	insrwi	0,27,16,0

	fmadd	26,21,4,26
	fmadd	27,21,5,27
	lwz	27,96(1)
	lwz	26,100(1)
	addc	28,28,0
	adde	29,29,19
	srwi	0,28,16
	fmadd	28,22,4,28
	fmadd	29,22,5,29
	srwi	19,29,16
	insrwi	0,29,16,0
	fmadd	30,23,4,30
	fmadd	31,23,5,31
	addc	30,30,0
	adde	31,31,19
	srwi	0,30,16
	fmadd	24,20,4,24
	fmadd	25,20,5,25
	insrwi	28,30,16,0
	srwi	19,31,16
	insrwi	0,31,16,0

	fmadd	26,20,6,26
	fmadd	27,20,7,27
	lwz	31,104(1)
	lwz	30,108(1)
	addc	26,26,0
	adde	27,27,19
	srwi	0,26,16
	fmadd	28,21,6,28
	fmadd	29,21,7,29
	stw	24,12(10)
	stw	28,8(10)
	srwi	19,27,16
	insrwi	0,27,16,0
	fmadd	30,22,6,30
	fmadd	31,22,7,31
	lwz	25,112(1)
	lwz	24,116(1)
	addc	30,30,0
	adde	31,31,19
	srwi	0,30,16
	fmadd	8,23,6,8
	fmadd	9,23,7,9
	insrwi	26,30,16,0
	srwi	19,31,16
	insrwi	0,31,16,0

	fctid	24,24
	fctid	25,25
	lwz	29,120(1)
	lwz	28,124(1)
	addc	24,24,0
	adde	25,25,19
	srwi	0,24,16
	fctid	26,26
	fctid	27,27
	srwi	19,25,16
	insrwi	0,25,16,0
	fctid	28,28
	fctid	29,29
	addc	28,28,0
	adde	29,29,19
	srwi	0,28,16
	fctid	30,30
	fctid	31,31
	insrwi	24,28,16,0
	srwi	19,29,16
	insrwi	0,29,16,0

	stfd	24,64(1)
	stfd	25,72(1)
	stfd	26,80(1)
	stfd	27,88(1)
	stfd	28,96(1)
	stfd	29,104(1)
	stfd	30,112(1)
	stfd	31,120(1)
	stw	26,20(10)
	stwu	24,16(10)
	bdnz	.L1st

	fctid	8,8
	fctid	9,9
	lwz	25,64(1)
	lwz	24,68(1)
	lwz	27,72(1)
	lwz	26,76(1)
	lwz	29,80(1)
	lwz	28,84(1)
	lwz	31,88(1)
	lwz	30,92(1)
	stfd	8,128(1)
	stfd	9,136(1)

	addc	24,24,0
	adde	25,25,19
	srwi	0,24,16
	insrwi	0,25,16,0
	srwi	19,25,16
	addc	26,26,0
	adde	27,27,19
	srwi	0,26,16
	insrwi	24,26,16,0
	insrwi	0,27,16,0
	srwi	19,27,16
	addc	28,28,0
	adde	29,29,19
	srwi	0,28,16
	insrwi	0,29,16,0
	srwi	19,29,16
	addc	30,30,0
	adde	31,31,19
	srwi	0,30,16
	insrwi	28,30,16,0
	insrwi	0,31,16,0
	srwi	19,31,16
	stw	24,12(10)
	stw	28,8(10)

	lwz	27,96(1)
	lwz	26,100(1)
	lwz	31,104(1)
	lwz	30,108(1)
	lwz	25,112(1)
	lwz	24,116(1)
	lwz	29,120(1)
	lwz	28,124(1)

	addc	26,26,0
	adde	27,27,19
	srwi	0,26,16
	insrwi	0,27,16,0
	srwi	19,27,16
	addc	30,30,0
	adde	31,31,19
	srwi	0,30,16
	insrwi	26,30,16,0
	insrwi	0,31,16,0
	srwi	19,31,16
	addc	24,24,0
	adde	25,25,19
	srwi	0,24,16
	insrwi	0,25,16,0
	srwi	19,25,16
	addc	28,28,0
	adde	29,29,19
	srwi	0,28,16
	insrwi	24,28,16,0
	insrwi	0,29,16,0
	srwi	19,29,16
	stw	26,20(10)
	stwu	24,16(10)

	lwz	31,128(1)
	lwz	30,132(1)
	lwz	29,136(1)
	lwz	28,140(1)

	addc	30,30,0
	adde	31,31,19
	srwi	0,30,16
	insrwi	0,31,16,0
	srwi	19,31,16
	addc	28,28,0
	adde	29,29,19

	insrwi	30,28,16,0
	srwi	28,28,16
	insrwi	28,29,16,0
	srwi	3,29,16
	stw	30,12(10)
	stw	28,8(10)
	slwi	31,8,2
	subf	22,31,22

	li	12,8
.align	5
.Louter:
	addi	10,1,192
	li	0,0
	mtctr	11
	add	24,5,12
	li	19,0
	lwz	25,0(24)
	lwz	27,4(24)

	mullw	28,23,25
	lwz	24,204(1)
	mulhwu	29,23,25
	lwz	26,200(1)
	mullw	30,21,25
	mullw	31,23,27
	add	29,29,30
	add	29,29,31
	addc	28,28,24
	adde	29,29,26

	extrwi	24,25,16,16
	extrwi	25,25,16,0
	extrwi	26,27,16,16
	extrwi	27,27,16,0
	std	24,64(1)
	std	25,72(1)
	std	26,80(1)
	std	27,88(1)

	mullw	24,28,7
	mulhwu	25,28,7
	mullw	26,29,7
	mullw	27,28,20
	add	25,25,26
	add	25,25,27

	extrwi	28,24,16,16
	extrwi	29,24,16,0
	extrwi	30,25,16,16
	extrwi	31,25,16,0
	std	28,96(1)
	std	29,104(1)
	std	30,112(1)
	std	31,120(1)
	lfd	10,8(22)
	lfd	11,16(22)
	lfd	12,24(22)
	lfd	13,32(22)
	lfd	20,40(22)
	lfd	21,48(22)
	lfd	22,56(22)
	lfdu	23,64(22)

	lfd	0,64(1)
	lfd	1,72(1)
	lfd	2,80(1)
	lfd	3,88(1)
	lfd	4,96(1)
	lfd	5,104(1)
	lfd	6,112(1)
	lfd	7,120(1)

	fcfid	0,0
	fcfid	1,1
	fcfid	2,2
	fcfid	3,3
	fcfid	4,4
	fcfid	5,5
	fcfid	6,6
	fcfid	7,7

	fmul	26,11,0
	fmul	27,11,1
	fmul	28,12,0
	fmul	29,12,1
	fmul	30,13,0
	fmul	31,13,1
	fmul	24,10,0
	fmul	25,10,1

	fmadd	26,10,2,26
	fmadd	27,10,3,27
	fmadd	28,11,2,28
	fmadd	29,11,3,29
	fmadd	30,12,2,30
	fmadd	31,12,3,31
	fmul	8,13,2
	fmul	9,13,3

	fmadd	26,21,4,26
	fmadd	27,21,5,27
	lfd	10,8(22)
	lfd	11,16(22)
	fmadd	28,22,4,28
	fmadd	29,22,5,29
	lfd	12,24(22)
	lfd	13,32(22)
	fmadd	30,23,4,30
	fmadd	31,23,5,31
	fmadd	24,20,4,24
	fmadd	25,20,5,25

	fmadd	26,20,6,26
	fmadd	27,20,7,27
	fmadd	28,21,6,28
	fmadd	29,21,7,29
	fmadd	30,22,6,30
	fmadd	31,22,7,31
	fmadd	8,23,6,8
	fmadd	9,23,7,9

	fctid	24,24
	fctid	25,25
	fctid	26,26
	fctid	27,27
	fctid	28,28
	fctid	29,29
	fctid	30,30
	fctid	31,31

	stfd	24,64(1)
	stfd	25,72(1)
	stfd	26,80(1)
	stfd	27,88(1)
	stfd	28,96(1)
	stfd	29,104(1)
	stfd	30,112(1)
	stfd	31,120(1)

.align	5
.Linner:
	fmul	26,11,0
	fmul	27,11,1
	fmul	28,12,0
	fmul	29,12,1
	lfd	20,40(22)
	lfd	21,48(22)
	fmul	30,13,0
	fmul	31,13,1
	fmadd	24,10,0,8
	fmadd	25,10,1,9
	lfd	22,56(22)
	lfdu	23,64(22)

	fmadd	26,10,2,26
	fmadd	27,10,3,27
	fmadd	28,11,2,28
	fmadd	29,11,3,29
	lfd	10,8(22)
	lfd	11,16(22)
	fmadd	30,12,2,30
	fmadd	31,12,3,31
	fmul	8,13,2
	fmul	9,13,3
	lfd	12,24(22)
	lfd	13,32(22)
	fmadd	26,21,4,26
	fmadd	27,21,5,27
	lwz	25,64(1)
	lwz	24,68(1)
	fmadd	28,22,4,28
	fmadd	29,22,5,29
	lwz	27,72(1)
	lwz	26,76(1)
	fmadd	30,23,4,30
	fmadd	31,23,5,31
	lwz	29,80(1)
	lwz	28,84(1)
	addc	24,24,0
	adde	25,25,19
	srwi	0,24,16
	fmadd	24,20,4,24
	fmadd	25,20,5,25
	lwz	31,88(1)
	lwz	30,92(1)
	srwi	19,25,16
	insrwi	0,25,16,0

	fmadd	26,20,6,26
	fmadd	27,20,7,27
	addc	26,26,0
	adde	27,27,19
	srwi	0,26,16
	fmadd	28,21,6,28
	fmadd	29,21,7,29
	insrwi	24,26,16,0
	srwi	19,27,16
	insrwi	0,27,16,0
	fmadd	30,22,6,30
	fmadd	31,22,7,31
	lwz	26,12(10)
	lwz	27,8(10)
	addc	28,28,0
	adde	29,29,19
	srwi	0,28,16
	fmadd	8,23,6,8
	fmadd	9,23,7,9
	srwi	19,29,16
	insrwi	0,29,16,0

	fctid	24,24
	addc	30,30,0
	adde	31,31,19
	srwi	0,30,16
	fctid	25,25
	insrwi	28,30,16,0
	srwi	19,31,16
	insrwi	0,31,16,0
	fctid	26,26
	addc	24,24,26
	adde	28,28,27
	lwz	27,96(1)
	lwz	26,100(1)
	fctid	27,27
	addze	0,0
	addze	19,19
	stw	24,4(10)
	stw	28,0(10)
	fctid	28,28
	addc	26,26,0
	adde	27,27,19
	srwi	0,26,16
	lwz	31,104(1)
	lwz	30,108(1)
	fctid	29,29
	srwi	19,27,16
	insrwi	0,27,16,0
	lwz	25,112(1)
	lwz	24,116(1)
	fctid	30,30
	addc	30,30,0
	adde	31,31,19
	srwi	0,30,16
	lwz	29,120(1)
	lwz	28,124(1)
	fctid	31,31

	insrwi	26,30,16,0
	insrwi	0,31,16,0
	srwi	19,31,16
	lwz	30,20(10)
	lwzu	31,16(10)
	addc	24,24,0
	stfd	24,64(1)
	adde	25,25,19
	srwi	0,24,16
	stfd	25,72(1)
	insrwi	0,25,16,0
	srwi	19,25,16
	addc	28,28,0
	stfd	26,80(1)
	adde	29,29,19
	srwi	0,28,16
	insrwi	24,28,16,0
	stfd	27,88(1)
	insrwi	0,29,16,0
	srwi	19,29,16

	addc	26,26,30
	stfd	28,96(1)
	adde	24,24,31
	stfd	29,104(1)
	addze	0,0
	stfd	30,112(1)
	addze	19,19
	stfd	31,120(1)
	stw	26,-4(10)
	stw	24,-8(10)
	bdnz	.Linner

	fctid	8,8
	fctid	9,9
	lwz	25,64(1)
	lwz	24,68(1)
	lwz	27,72(1)
	lwz	26,76(1)
	lwz	29,80(1)
	lwz	28,84(1)
	lwz	31,88(1)
	lwz	30,92(1)
	stfd	8,128(1)
	stfd	9,136(1)

	addc	24,24,0
	adde	25,25,19
	srwi	0,24,16
	insrwi	0,25,16,0
	srwi	19,25,16
	addc	26,26,0
	adde	27,27,19
	srwi	0,26,16
	insrwi	24,26,16,0
	lwz	26,12(10)
	insrwi	0,27,16,0
	srwi	19,27,16
	lwz	27,8(10)
	addc	28,28,0
	adde	29,29,19
	srwi	0,28,16
	insrwi	0,29,16,0
	srwi	19,29,16
	addc	30,30,0
	adde	31,31,19
	srwi	0,30,16
	insrwi	28,30,16,0
	insrwi	0,31,16,0
	srwi	19,31,16

	addc	24,24,26
	adde	28,28,27
	addze	0,0
	addze	19,19
	stw	24,4(10)
	stw	28,0(10)

	lwz	27,96(1)
	lwz	26,100(1)
	lwz	31,104(1)
	lwz	30,108(1)
	lwz	25,112(1)
	lwz	24,116(1)
	lwz	29,120(1)
	lwz	28,124(1)

	addc	26,26,0
	adde	27,27,19
	srwi	0,26,16
	insrwi	0,27,16,0
	srwi	19,27,16
	addc	30,30,0
	adde	31,31,19
	srwi	0,30,16
	insrwi	26,30,16,0
	lwz	30,20(10)
	insrwi	0,31,16,0
	srwi	19,31,16
	lwzu	31,16(10)
	addc	24,24,0
	adde	25,25,19
	srwi	0,24,16
	insrwi	0,25,16,0
	srwi	19,25,16
	addc	28,28,0
	adde	29,29,19
	srwi	0,28,16
	insrwi	24,28,16,0
	insrwi	0,29,16,0
	srwi	19,29,16

	addc	26,26,30
	adde	24,24,31
	lwz	31,128(1)
	lwz	30,132(1)
	addze	0,0
	addze	19,19
	lwz	29,136(1)
	lwz	28,140(1)

	addc	30,30,0
	adde	31,31,19
	stw	26,-4(10)
	stw	24,-8(10)
	addc	30,30,3
	addze	31,31
	srwi	0,30,16
	insrwi	0,31,16,0
	srwi	19,31,16
	addc	28,28,0
	adde	29,29,19

	insrwi	30,28,16,0
	srwi	28,28,16
	insrwi	28,29,16,0
	srwi	3,29,16
	stw	30,4(10)
	stw	28,0(10)
	slwi	31,8,2
	addi	12,12,8
	subf	22,31,22
	cmpw	12,8
	blt-	.Louter
	subf	6,8,6
	addi	11,11,1
	subfc	12,12,12
	addi	10,1,192
	addi	6,6,-4
	addi	9,9,-4
	addi	4,1,196
	mtctr	11

.align	4
.Lsub:	lwz	24,12(10)
	lwz	25,8(10)
	lwz	26,20(10)
	lwzu	27,16(10)
	lwz	28,4(6)
	lwz	29,8(6)
	lwz	30,12(6)
	lwzu	31,16(6)
	subfe	28,28,24
	stw	24,4(4)
	subfe	29,29,25
	stw	25,8(4)
	subfe	30,30,26
	stw	26,12(4)
	subfe	31,31,27
	stwu	27,16(4)
	stw	28,4(9)
	stw	29,8(9)
	stw	30,12(9)
	stwu	31,16(9)
	bdnz	.Lsub

	li	12,0
	subfe	3,12,3
	addi	4,1,196
	subf	9,8,9
	addi	10,1,192
	mtctr	11

.align	4
.Lcopy:
	lwz	24,4(4)
	lwz	25,8(4)
	lwz	26,12(4)
	lwzu	27,16(4)
	lwz	28,4(9)
	lwz	29,8(9)
	lwz	30,12(9)
	lwz	31,16(9)
	std	12,8(22)
	std	12,16(22)
	std	12,24(22)
	std	12,32(22)
	std	12,40(22)
	std	12,48(22)
	std	12,56(22)
	stdu	12,64(22)
	and	24,24,3
	and	25,25,3
	and	26,26,3
	and	27,27,3
	andc	28,28,3
	andc	29,29,3
	andc	30,30,3
	andc	31,31,3
	or	24,24,28
	or	25,25,29
	or	26,26,30
	or	27,27,31
	stw	24,4(9)
	stw	25,8(9)
	stw	26,12(9)
	stwu	27,16(9)
	std	12,8(10)
	stdu	12,16(10)
	bdnz	.Lcopy
	lwz	12,0(1)
	li	3,1
	lwz	19,-148(12)
	lwz	20,-144(12)
	lwz	21,-140(12)
	lwz	22,-136(12)
	lwz	23,-132(12)
	lwz	24,-128(12)
	lwz	25,-124(12)
	lwz	26,-120(12)
	lwz	27,-116(12)
	lwz	28,-112(12)
	lwz	29,-108(12)
	lwz	30,-104(12)
	lwz	31,-100(12)
	lfd	20,-96(12)
	lfd	21,-88(12)
	lfd	22,-80(12)
	lfd	23,-72(12)
	lfd	24,-64(12)
	lfd	25,-56(12)
	lfd	26,-48(12)
	lfd	27,-40(12)
	lfd	28,-32(12)
	lfd	29,-24(12)
	lfd	30,-16(12)
	lfd	31,-8(12)
	mr	1,12
	blr	
.long	0
.byte	0,12,4,0,0x8c,13,6,0
.long	0
.size	bn_mul_mont_fpu64,.-bn_mul_mont_fpu64

.byte	77,111,110,116,103,111,109,101,114,121,32,77,117,108,116,105,112,108,105,99,97,116,105,111,110,32,102,111,114,32,80,80,67,54,52,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
.align	2
