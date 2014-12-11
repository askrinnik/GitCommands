@set branchName=%1
@set isSkipPause=%2

@echo .
@echo push to %1 
@echo .
@if not "%isSkipPause%"=="skip_pause" pause

@pushd %DEVDIR%

@set branchNameSubmodules=%branchName%
@if NOT "%branchNameSubmodules%" == "develop" set branchNameSubmodules=%branchNameSubmodules%@MetraNetDev

git submodule foreach git push -v --progress  "origin" %branchNameSubmodules%:%branchNameSubmodules%
@if not %errorlevel%==0 (
  echo git submodule foreach git push error 1>&2
  @if not "%isSkipPause%"=="skip_pause" pause
  exit /b %errorlevel%
)

git push -v --progress  "origin" %branchName%:%branchName%
@if not %errorlevel%==0 (
  echo git push error 1>&2
  @if not "%isSkipPause%"=="skip_pause" pause
  exit /b %errorlevel%
)

@popd

@if not "%isSkipPause%"=="skip_pause" pause
