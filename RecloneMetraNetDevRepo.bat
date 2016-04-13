set BranchName=%1
set CurrentFolder=%~dp0

if '%BranchName%' == '' set BranchName=develop
if exist "%ROOTDIR%\Build\Tools\StopAllServices.bat" call %ROOTDIR%\Build\Tools\StopAllServices.bat
if exist "%DEVDIR%" rd /s /q "%DEVDIR%"

git.exe clone -q --recursive "https://github.com/MetraTech/MetraNetDev.git" "%DEVDIR%" -b %BranchName% 2>&1
@if not %errorlevel%==0 (
  echo Error in git clone 1>&2
  exit /b %errorlevel%
)

@pushd "%DEVDIR%"

git.exe submodule update --init 
@if not %errorlevel%==0 (goto error)

call %CurrentFolder%SwitchToBranchInAllFolders.bat %BranchName% skip_pause
@if not %errorlevel%==0 (goto error)

call %CurrentFolder%PullInAllFolders.bat skip_pause hide_progress
@if not %errorlevel%==0 (goto error)

@echo Reclonning succeed
@goto end

:error
@echo Reclonning failed 1>&2
@exit /b 1

:end



