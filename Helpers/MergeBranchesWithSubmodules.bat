@set srcBranch=%1
@set dstBranch=%2
@set isSkipPause=%3
@set isHideProgress=%4
@set currentDir=%~dp0

@pushd "%currentDir%"

@call MergeBranchesWithSubmodulesWithoutPush %srcBranch% %dstBranch% %isSkipPause% %isHideProgress%
@if not %errorlevel%==0 (
  @if not "%isSkipPause%"=="skip_pause" pause
  exit /b %errorlevel%
)

@call PushWithSubmodules.bat %dstBranch% %isSkipPause% 
@if not %errorlevel%==0 (
  @if not "%isSkipPause%"=="skip_pause" pause
  exit /b %errorlevel%
)

@popd

@echo .
@echo successful!
@echo .
@if not "%isSkipPause%"=="skip_pause" pause
