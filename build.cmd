@echo off
"AMPS\Includer.exe" ASM68K AMPS AMPS\.Data
"tools/asm68k.exe" /o ae-,op+,os+,ow+,oz+,oaq+,osq+,omq+,w-,l. /m /c /e safe=0 /q /p main.asm, Sonic_Selenium_1.gen, , out.lst>out.log
type out.log
if not exist Sonic_Selenium_1.gen pause & exit
"AMPS\Dual PCM Compress.exe" AMPS\.z80 AMPS\.z80.dat Sonic_Selenium_1.gen _dlls\kosplus.exe
error\convsym out.lst Sonic_Selenium_1.gen -input asm68k_lst -inopt "/localSign=. /localJoin=. /ignoreMacroDefs+ /ignoreMacroExp- /addMacrosAsOpcodes+ /processLocals+" -a
"tools\romfix.exe" -t "Sonic Selenium" -d -r 00 -s 050104RM -z Sonic_Selenium_1.gen
del out.log
pause
