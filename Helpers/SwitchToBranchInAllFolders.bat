@set branchName=%1
@set isSkipPause=%2

@pushd %DEVDIR%

git checkout %branchName% 2>&1
@if not %errorlevel%==0 (
  echo Error in git checkout %branchName% 1>&2
  @if not "%isSkipPause%"=="skip_pause" pause
  exit /b %errorlevel%
)

@if NOT "%branchName%" == "develop" set branchName=%branchName%@MetraNetDev

git submodule foreach git checkout "%branchName%" 2>&1
@if not %errorlevel%==0 (
  echo Error in git submodule foreach git checkout "%branchName%" 1>&2
  @if not "%isSkipPause%"=="skip_pause" pause
  exit /b %errorlevel%
)

@popd
@if not "%isSkipPause%"=="skip_pause" pause
