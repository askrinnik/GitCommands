@pushd %DEVDIR%

call %ROOTDIR%\Build\Tools\StopAllServices.bat

git clean -df -xf
git submodule foreach git clean -df -xf

@echo Create output folder...
if not exist %MTOUTDIR% (
mkdir %MTOUTDIR%
)
if not exist %MTOUTDIR%\debug (
mkdir %MTOUTDIR%\debug
)
if not exist %MTOUTDIR%\Release (
mkdir %MTOUTDIR%\Release	
)

@popd

IF NOT "%1%"=="skip_pause" (
@pause
)
