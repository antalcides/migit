@ECHO OFF
REM You must define path for pp4.jar and name of the java command
REM Here the settings for the Sun Java Runtime Environment on my machine
set basedir="C:\Archivos de programa\JavaSoft\JRE\1.3.1_01\lib"
set javacommand="C:\Archivos de programa\JavaSoft\JRE\1.3.1_01\bin\java"
%javacommand% -cp %basedir%\pp4.jar de.tu_darmstadt.sp.pp4.PPower4 %1 %2 %3 %4 %5
