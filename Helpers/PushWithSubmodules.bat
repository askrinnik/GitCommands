@set branchName=%1
@set isSkipPause=%2

@echo .
@echo push to %branchName% 
@echo .
@if not "%isSkipPause%"=="skip_pause" pause

@pushd %DEVDIR%

@set branchNameSubmodules=%branchName%
@if NOT "%branchNameSubmodules%" == "develop" set branchNameSubmodules=%branchNameSubmodules%@MetraNetDev

git submodule foreach git push -v --progress  "origin" %branchNameSubmodules%:%branchNameSubmodules% 2>&1
@if not %errorlevel%==0 (
  echo Error in git submodule foreach git push -v --progress  "origin" 1>&2
  @if not "%isSkipPause%"=="skip_pause" pause
  exit /b %errorlevel%
)

git push -v --progress  "origin" %branchName%:%branchName% 2>&1
@if not %errorlevel%==0 (
  echo Error in git push -v --progress  "origin" %branchName%:%branchName% 1>&2
  @if not "%isSkipPause%"=="skip_pause" pause
  exit /b %errorlevel%
)

@popd

@if not "%isSkipPause%"=="skip_pause" pause
