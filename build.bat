@echo off
"AMPS\Includer.exe" ASM68K AMPS AMPS\.Data
"tools/asm68k.exe" /o ae-,op+,os+,ow+,oz+,oaq+,osq+,omq+,w- /m /c /e safe=0 /e RecordableDemo=0 /q /p main.asm, out.md, , out.lst>out.log
type out.log
if not exist out.md pause & exit
"AMPS\Dual PCM Compress.exe" AMPS\.z80 AMPS\.z80.dat out.md _dlls\saxcmp.exe
error\convsym out.lst out.md -input asm68k_lst -inopt "/localSign=. /localJoin=. /ignoreMacroDefs+ /ignoreMacroExp- /addMacrosAsOpcodes+" -a
"tools\romfix.exe" -t "Das war ja so was von klar" -d -r 00 -s 050104RM -z out.md
del out.log
pause