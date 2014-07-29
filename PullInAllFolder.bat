@pushd %DEVDIR%

@SET progress_param=-v --progress
@IF "%2%"=="hide_progress" (
  SET progress_param=--no-progress
)

git pull %progress_param% --prune "origin"
@if not %errorlevel%==0 (
  exit /b %errorlevel%
)
git submodule foreach git pull %progress_param% --prune "origin"
@if not %errorlevel%==0 (
  exit /b %errorlevel%
)

@popd
@IF NOT "%1%"=="skip_pause" (
@pause
)
