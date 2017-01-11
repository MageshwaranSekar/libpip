.macro CG_HELPER name, o, nargs
.global \name
\name:
    .rep \nargs
    push	(4*(\nargs))(%esp)
    .endr
    lcall	\o, $0
    ret
.endm

.macro CG_HELPER_INTMASKED name, o, nargs
.global \name
\name:
    /* save flags */
    push	0xfffffffc
    orl	$1, 0xfffffffc
    .rep \nargs
    push	(4*(\nargs+1))(%esp)
    .endr
    lcall	\o, $0
    /* restore flags */
    pop	0xfffffffc
    ret
.endm

    CG_HELPER_INTMASKED	outb, 			$0x30,	2
    CG_HELPER_INTMASKED	inb, 			$0x38,	1
    CG_HELPER_INTMASKED	outw, 			$0x40,	2
    CG_HELPER_INTMASKED	inw, 			$0x48,	1
    CG_HELPER_INTMASKED	outl, 			$0x50,	2
    CG_HELPER_INTMASKED	inl, 			$0x58,	1
    CG_HELPER_INTMASKED mmioRead        $0x60,  3
    CG_HELPER_INTMASKED mmioWrite       $0x68,  4 
    CG_HELPER_INTMASKED mmioSet         $0x70,  4
    CG_HELPER_INTMASKED mmioClear       $0x78,  4
    CG_HELPER_INTMASKED mmioModify      $0x80,  5
    CG_HELPER_INTMASKED	writeMMIO,		$0x88,	2
    CG_HELPER_INTMASKED	outaddrl,		$0x90,	2

    CG_HELPER 		createPartitionInt ,$0x98, 	5
    CG_HELPER 		pageMapCount ,		$0xA0, 	2
    CG_HELPER 		prepare,		    $0xA8, 	4
    CG_HELPER 		mapPage,		    $0xB0, 	6
    CG_HELPER 		dispatchInt,		$0xB8, 	5

    CG_HELPER 		pip_time,		    $0xC0, 	0
    CG_HELPER 		resume,			    $0xC8, 	2
