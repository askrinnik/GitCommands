@set isSkipPause=%1
@set isHideProgress=%2

@pushd %DEVDIR%

@SET progress_param=-v --progress
@if "%isHideProgress%"=="hide_progress" SET progress_param=--no-progress

git pull %progress_param% --prune "origin"
@if not %errorlevel%==0 (
  echo git pull error 1>&2
  @if not "%isSkipPause%"=="skip_pause" pause
  exit /b %errorlevel%
)
git submodule foreach git pull %progress_param% --prune "origin"
@if not %errorlevel%==0 (
  echo git submodule foreach git pull error 1>&2
  @if not "%isSkipPause%"=="skip_pause" pause
  exit /b %errorlevel%
)

@popd
@if not "%isSkipPause%"=="skip_pause" pause
