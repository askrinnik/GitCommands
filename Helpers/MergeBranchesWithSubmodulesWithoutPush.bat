@set srcBranch=%1
@set dstBranch=%2
@set isSkipPause=%3
@set isHideProgress=%4
@set currentDir=%~dp0

@pushd %DEVDIR%

@REM update the repository
git fetch --prune && git submodule foreach git fetch --prune 

@popd

@pushd %currentDir%

call ..\GitClean.bat skip_pause
call ..\GitRevert.bat %isSkipPause%

call SwitchToBranchInAllFolders.bat %dstBranch% %isSkipPause%
@if not %errorlevel%==0 exit /b %errorlevel%

@REM call ResetBranchInAllFolders.bat %dstBranch% %isSkipPause%  <- it deletes previous commits.But we need them, because might fix conflicts and run merge again
call ..\PullInAllFolders.bat %isSkipPause% %isHideProgress%
@if not %errorlevel%==0 exit /b %errorlevel%


@echo .
@echo merge from %srcBranch% to %dstBranch%
@echo .
call MergeBranchesWithSubmodulesInternal.bat %srcBranch% %isSkipPause%
@if not %errorlevel%==0 exit /b %errorlevel%

@popd
