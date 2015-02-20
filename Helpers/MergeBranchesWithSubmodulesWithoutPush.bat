@set srcBranch=%1
@set dstBranch=%2
@set isSkipPause=%3
@set isHideProgress=%4
@set currentDir=%~dp0

@pushd %currentDir%

git fetch && git submodule foreach git fetch

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
