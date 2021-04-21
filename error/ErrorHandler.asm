
; ===============================================================
; ---------------------------------------------------------------
; Error handling and debugging modules
; 2016-2017, Vladikcomper
; ---------------------------------------------------------------
; Error handler functions and calls
; ---------------------------------------------------------------

; ---------------------------------------------------------------
; Error handler control flags
; ---------------------------------------------------------------

; Screen appearence flags
_eh_address_error	equ	$01		; use for address and bus errors only (tells error handler to display additional "Address" field)
_eh_show_sr_usp		equ	$02		; displays SR and USP registers content on error screen

; Advanced execution flags
; WARNING! For experts only, DO NOT USE them unless you know what you're doing
_eh_return			equ	$20
_eh_enter_console	equ	$40
_eh_align_offset	equ	$80

; ---------------------------------------------------------------
; Errors vector table
; ---------------------------------------------------------------

; Default screen configuration
_eh_default			equ	0 ;_eh_show_sr_usp

; ---------------------------------------------------------------
BusErr:
BusError:
	__ErrorMessage "BUS ERROR", _eh_default|_eh_address_error

AddressErr:
AddressError:
	__ErrorMessage "ADDRESS ERROR", _eh_default|_eh_address_error

IllegalInstr:
	__ErrorMessage "ILLEGAL INSTRUCTION", _eh_default

ZeroDiv:
ZeroDivide:
	__ErrorMessage "ZERO DIVIDE", _eh_default

ChkInstr:
	__ErrorMessage "CHK INSTRUCTION", _eh_default

TrapvInstr:
	__ErrorMessage "TRAPV INSTRUCTION", _eh_default

PrivilegeViol:
	__ErrorMessage "PRIVILEGE VIOLATION", _eh_default

Trace:
	__ErrorMessage "TRACE", _eh_default

LineAEmu:
Line1010Emu:
	__ErrorMessage "LINE 1010 EMULATOR", _eh_default

LineFEmu:
Line1111Emu:
	__ErrorMessage "LINE 1111 EMULATOR", _eh_default

ErrorException:
ErrorExcept:
	__ErrorMessage "ERROR EXCEPTION", _eh_default

ErrorTrap:
	__ErrorMessage "ERROR TRAP", _eh_default



; ---------------------------------------------------------------
; Import error handler global functions
; ---------------------------------------------------------------

ErrorHandler.__global__error_initconsole equ Error_InitConsole
ErrorHandler.__global__errorhandler_setupvdp equ ErrorHandler_SetupVDP
ErrorHandler.__global__console_loadpalette equ Console_LoadPalette
ErrorHandler.__global__console_setposasxy_stack equ Console_SetPosAsXY_Stack
ErrorHandler.__global__console_setposasxy equ Console_SetPosAsXY
ErrorHandler.__global__console_getposasxy equ Console_GetPosAsXY
ErrorHandler.__global__console_startnewline equ Console_StartNewLine
ErrorHandler.__global__console_setbasepattern equ Console_SetBasePattern
ErrorHandler.__global__console_setwidth equ Console_SetWidth
ErrorHandler.__global__console_writeline_withpattern equ Console_WriteLine_WithPattern
ErrorHandler.__global__console_writeline equ Console_WriteLine
ErrorHandler.__global__console_write equ Console_Write
ErrorHandler.__global__console_writeline_formatted equ Console_WriteLine_Formatted
ErrorHandler.__global__console_write_formatted equ Console_Write_Formatted


; ---------------------------------------------------------------
; Error handler external functions (compiled only when used)
; ---------------------------------------------------------------


	if ref(ErrorHandler.__extern_scrollconsole)
ErrorHandler.__extern__scrollconsole:

	endc

	if ref(ErrorHandler.__extern__console_only)
ErrorHandler.__extern__console_only:
	dc.l	$46FC2700, $4FEFFFF2, $48E7FFFE, $47EF003C
	jsr		ErrorHandler.__global__errorhandler_setupvdp(pc)
	jsr		ErrorHandler.__global__error_initconsole(pc)
	dc.l	$4CDF7FFF, $487A0008, $2F2F0012, $4E7560FE
	endc

	if ref(ErrorHandler.__extern__vsync)
ErrorHandler.__extern__vsync:
	dc.l	$41F900C0, $000444D0, $6BFC44D0, $6AFC4E75
	endc

; ---------------------------------------------------------------
; Include error handler module
; ---------------------------------------------------------------

	include	"error/ErrorHandler.internal.asm"

; ---------------------------------------------------------------
; WARNING!
;	DO NOT put any data from now on! DO NOT use ROM padding!
;	Symbol data should be appended here after ROM is compiled
;	by ConvSym utility, otherwise debugger modules won't be able
;	to resolve symbol names.
; ---------------------------------------------------------------
