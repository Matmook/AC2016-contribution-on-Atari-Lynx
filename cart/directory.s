; The Atari Lynx directory structure
; Written for the cc65 compiler by
; Karri Kaksonen, 2004
;
	.include "lynx.inc"
	.import __STARTOFDIRECTORY__
	.import __RAM_START__
	.import __CODE_SIZE__,__DATA_SIZE__,__RODATA_SIZE__
	.import __STARTUP_SIZE__,__INIT_SIZE__
	.import __BLOCKSIZE__

	.import __STARTUP_LOAD__
	.import __STARTUP_SIZE__
	.import __TITLE_CODE_LOAD__
	.import __TITLE_CODE_SIZE__
	.import __TITLE_DATA_SIZE__
	.import __TITLE_RODATA_SIZE__
	.import __INGAME_CODE_LOAD__
	.import __INGAME_CODE_SIZE__
	.import __INGAME_DATA_SIZE__
  .import __INGAME_RODATA_SIZE__

.segment	"DIRECTORY"
__DIRECTORY_START__:
; Entry 0 - Resident executable (RAM)
off0=__STARTOFDIRECTORY__+(__DIRECTORY_END__-__DIRECTORY_START__)
blocka=off0/__BLOCKSIZE__
len0=__STARTUP_SIZE__+__INIT_SIZE__+__CODE_SIZE__+__DATA_SIZE__+__RODATA_SIZE__
	.byte	<blocka
	.word	off0 & (__BLOCKSIZE__ - 1)
	.byte	$88
	.word	__RAM_START__
	.word	len0

.macro entry old_off, old_len, new_off, new_block, new_len, new_size, new_addr
new_off=old_off+old_len
new_block=new_off/__BLOCKSIZE__
new_len=new_size
	.byte	<new_block
	.word	(new_off & (__BLOCKSIZE__ - 1))
	.byte	$88
	.word	new_addr
	.word	new_len
.endmacro

entry off0, len0, off1, block1, len1, __TITLE_RODATA_SIZE__ + __TITLE_CODE_SIZE__ + __TITLE_DATA_SIZE__, __TITLE_CODE_LOAD__
entry off1, len1, off2, block2, len2, __INGAME_RODATA_SIZE__ + __INGAME_CODE_SIZE__ + __INGAME_DATA_SIZE__, __INGAME_CODE_LOAD__

__DIRECTORY_END__:
