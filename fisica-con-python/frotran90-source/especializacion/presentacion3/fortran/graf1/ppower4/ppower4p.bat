@ECHO OFF
REM You must define path for pp4p.jar and name of the java command
REM Here the settings for the Sun Java Runtime Environment on my machine
REM NOTE: This requires Java 1.2.x!
set basedir="C:\Archivos de programa\JavaSoft\JRE\1.3.1_02\lib"
set javacommand="C:\Archivos de programa\JavaSoft\JRE\1.3.1_02\bin\java"
%javacommand% -jar %basedir%\pp4p.jar %1 %2 %3 %4 %5
