@set srcBranch=%1
@set dstBranch=%2
@set isSkipPause=%3
@set isHideProgress=%4
@set currentDir=%~dp0

@pushd %currentDir%

@call SwitchToBranchInAllFolders.bat %srcBranch% %isSkipPause%
@if not %errorlevel%==0 exit /b %errorlevel%

@call ..\PullInAllFolders.bat %isSkipPause% %isHideProgress%
@if not %errorlevel%==0 exit /b %errorlevel%

@echo .
@echo checkout %dstBranch% and pull
@echo .
@call SwitchToBranchInAllFolders.bat %dstBranch% %isSkipPause%
@if not %errorlevel%==0 exit /b %errorlevel%

@call ..\PullInAllFolders.bat %isSkipPause% %isHideProgress%
@if not %errorlevel%==0 exit /b %errorlevel%

@echo .
@echo merge from %srcBranch% to %dstBranch%
@echo .
@call MergeBranchesWithSubmodulesInternal.bat %srcBranch% %isSkipPause%
@if not %errorlevel%==0 exit /b %errorlevel%

@popd
