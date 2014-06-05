set BRANCH=%1

if '%BRANCH%' == '' set BRANCH=develop
call %ROOTDIR%\Build\Tools\StopAllServices.bat
if exist "%DEVDIR%" rd /s /q "%DEVDIR%"

git.exe clone -q --recursive "https://github.com/MetraTech/MetraNetDev.git" "%DEVDIR%"
@if %errorlevel% gtr 0 (goto error)

@pushd "%DEVDIR%"

git.exe submodule update --init 
@if %errorlevel% gtr 0 (goto error)

call %ROOTDIR%\Build\Tools\Git\SwitchToBranchInAllFolder.bat %BRANCH% skip_pause
@if %errorlevel% gtr 0 (goto error)

call %ROOTDIR%\Build\Tools\Git\PullInAllFolder.bat skip_pause 
@if %errorlevel% gtr 0 (goto error)

@echo Reclonning succeed
@goto end

:error
@echo Reclonning failed

:end
@pause



