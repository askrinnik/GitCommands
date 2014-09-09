@pushd %DEVDIR%

git checkout %1
@if not %errorlevel%==0 (
  exit /b %errorlevel%
)

@set branchName=%1
@if NOT "%branchName%" == "develop" set branchName=%branchName%@MetraNetDev

git submodule foreach git checkout "%branchName%"

@if not %errorlevel%==0 (
  exit /b %errorlevel%
)

@popd
@IF NOT "%2%"=="skip_pause" (
@pause
