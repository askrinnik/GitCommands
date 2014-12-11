@set srcBranch=%1
@set isSkipPause=%2

@pushd %DEVDIR%

@set srcBranchSubmodules=%srcBranch%
@if NOT "%srcBranchSubmodules%" == "develop" set srcBranchSubmodules=%srcBranchSubmodules%@MetraNetDev

git submodule foreach git merge %srcBranchSubmodules%
@if not %errorlevel%==0 (
  echo git submodule foreach git merge error 1>&2
  exit /b %errorlevel%
)

git merge %srcBranch%
@if not %errorlevel%==0 (
  echo git merge error 1>&2
  exit /b %errorlevel%
)

@popd
@if not "%isSkipPause%"=="skip_pause" pause
