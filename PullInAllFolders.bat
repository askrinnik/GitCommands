@set isSkipPause=%1
@set isHideProgress=%2

@pushd %DEVDIR%

@SET progress_param=-v --progress
@if "%isHideProgress%"=="hide_progress" SET progress_param=--no-progress

git pull %progress_param% --prune "origin" 2>&1
@if not %errorlevel%==0 (
  echo Error in git pull %progress_param% --prune "origin" 1>&2
  @if not "%isSkipPause%"=="skip_pause" pause
  exit /b %errorlevel%
)
git submodule foreach git pull %progress_param% --prune "origin" 2>&1
@if not %errorlevel%==0 (
  echo Error in git submodule foreach git pull %progress_param% --prune "origin" 1>&2
  @if not "%isSkipPause%"=="skip_pause" pause
  exit /b %errorlevel%
)

@popd
@if not "%isSkipPause%"=="skip_pause" pause
