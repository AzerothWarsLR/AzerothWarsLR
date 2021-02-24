@ECHO off
ECHO Starting build...
md temp
SET rootdir=%cd%
SET tempdir=temp
SET toolsdir=buildTools
SET sourcedir=sourceMaps
SET destdir=compiledMaps
SET sourcemap=%1
SET templatemap=%2
SET newmap=%3

ECHO Copying base map to temp directory...
copy %sourcedir%\\%sourcemap% %tempdir%

ECHO Copying terrain map to map temp directory...
copy %sourcedir%\\%templatemap% %tempdir%

ECHO MPQEditor: Extracting war3map.j from source map...
%toolsdir%\\MPQEditor\\MPQEditor.exe extract %sourcedir%\\%sourcemap% war3map.j %tempdir%

ECHO Merging project .j files into war3map.j...
pushd jass\Main
for /r %%a in (*.j) do (
  TYPE "%%a" >> "%rootdir%\\%tempdir%\\war3map.j"
  ECHO. >> "%rootdir%\\%tempdir%\\war3map.j"
)
popd

ECHO MPQEditor: adding merged war3map.j into template map...
%toolsdir%\\MPQEditor\\MPQEditor.exe add %tempdir%\\%templatemap% %tempdir%\\war3map.j

ECHO JassHelper: Processing war3map.j...
COPY NUL %tempdir%\\compiled.j
%toolsdir%\\JassHelper\\jasshelper.exe %toolsdir%\\common.j %toolsdir%\\Blizzard.j %tempdir%\\war3map.j %tempdir%\\compiled.j

ECHO WC3MapOptimizer: Optimizing and protecting map...
%toolsdir%\\WC3Optimizer\\VXJWTSOPT.exe %tempdir%\\%templatemap% --do %tempdir%\\%newmap% --checkmapstuff --checkcrash --exit

ECHO Copying finished map from temp directory to output directory...
COPY %tempdir%\\%newmap% %destdir%\\%newmap%

ECHO Cleaning up temp directory...
rd /s /q %tempdir%