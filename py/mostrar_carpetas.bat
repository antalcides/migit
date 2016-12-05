@echo off 

:demevo 
TITLE ANTI-HIDE-4-AMVO - by Allowski 


echo Por ejemplo: D:, E:, F:, etc. 
set/p serie=Que Unidad deseas desinfectar ?: 
if %serie%==A: Goto isA 
if %serie%==B: Goto isB 
if %serie%==C: Goto isC 
if %serie%==D: Goto isD 
if %serie%==E: Goto isE 
if %serie%==F: Goto isF 
if %serie%==G: Goto isG 
if %serie%==H: Goto isH 
if %serie%==I: Goto isI 
if %serie%==J: Goto isJ 
if %serie%==K: Goto isK 
if %serie%==L: Goto isL 
if %serie%==M: Goto isM 
if %serie%==N: Goto isN 
if %serie%==O: Goto isO 
if %serie%==P: Goto isP 


:isA 
A: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 

:isB 
B: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 

:isC 
C: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 

:isD 
D: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 

:isE 
E: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 
:isF 
F: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 
:isG 
G: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 

:isH 
H: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 

:isI 
I: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 

:isJ 
J: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 

:isK 
K: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
goto salir 
Pause 

:isL 
L: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 

:isM 
M: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 

:isN 
N: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 

:isO 
O: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 

:isP 
P: 
attrib -h -r -s *.* /s /d 
Del /q /s /f *.lnk 
Del /q /s /f autorun.inf 
Msg * Su dispositivo %serie% fue reparado correctamente! 
Pause 


:salir 
Echo Deseas Salir, ahora? 
set/p siono=s(salir), n(no salir, quiero reparar otro pen) 
if %siono% == s goto sii 
if %siono% == n goto noo 
if %siono% == m goto menu 

:sii 
EXIT 

:noo 
Cls 
goto demevo 