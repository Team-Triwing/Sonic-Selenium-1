@echo off
"AMPS\Includer.exe" ASM68K AMPS AMPS\.Data
"tools/asm68k.exe" /o ae-,w- /e RecordableDemo=1 /e safe=1 /q /p main.asm, out_demo.gen, , out.lst>out.log
type out.log
if not exist out_demo.gen pause & exit
"AMPS\Dual PCM Compress.exe" AMPS\.z80 AMPS\.z80.dat out_demo.gen _dlls\saxcmp.exe
error\convsym out.lst out_demo.gen -input asm68k_lst -inopt "/localSign=. /localJoin=. /ignoreMacroDefs+ /ignoreMacroExp- /addMacrosAsOpcodes+" -a
"tools\romfix.exe" -t "Sonic Selenium (demo, not for release)" -d -s "DEMO" -r 00 -z out_demo.gen
del out.log
pause