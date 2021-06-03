@echo off
"AMPS\Includer.exe" ASM68K AMPS AMPS\.Data
"tools/asm68k.exe" /o ae-,op+,os+,ow+,oz+,oaq+,osq+,omq+,w-,p68010,l. /m /c /e safe=0 /q /p main.asm, out.gen, , out.lst>out.log
type out.log
if not exist out.gen pause & exit
"AMPS\Dual PCM Compress.exe" AMPS\.z80 AMPS\.z80.dat out.gen _dlls\saxcmp.exe
error\convsym out.lst out.gen -input asm68k_lst -inopt "/localSign=. /localJoin=. /ignoreMacroDefs+ /ignoreMacroExp- /addMacrosAsOpcodes+ /processLocals+" -a
"tools\romfix.exe" -t "Sonic Selenium" -d -r 00 -s 050104RM -z out.gen
del out.log
pause