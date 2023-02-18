REM Build script for testbed
@ECHO off
SetLocal EnableDelayedExpansion

REM Get a list of all .c files
FOR /R %%f in (*.c) do  (
    SET cFilenames=!cFilenames! %%f
)

REM echo "Files:" %cFilenames%

SET assembly=testbed
SET compilerFlags=-g
REM -Wall -Werror
SET includeFlags=-Isrc -I../engine/src/ 
SET linkerFlags=-L../bin/ -lengine.lib 
SET defines=-D_DEBUG -DKIMPORT

ECHO "Building %assembly%..."
clang %cFilenames% %compilerFlags% -o ../bin/%assembly%.exe %defines% %includeFlags% %linkerFlags%