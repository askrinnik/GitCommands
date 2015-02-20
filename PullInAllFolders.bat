@set isSkipPause=%1
@set isHideProgress=%2

@SET progress_param=-v --progress
@if "%isHideProgress%"=="hide_progress" SET progress_param=--no-progress

@pushd %DEVDIR%

@set command=git pull %progress_param% --prune "origin"
%command% 2>&1
@if not %errorlevel%==0 goto error

@set command=git submodule foreach git pull %progress_param% --prune "origin"
%command% 2>&1
@if not %errorlevel%==0 goto error

@goto done

:error
@echo Error in %command% 1>&2

:done
@popd
@if not "%isSkipPause%"=="skip_pause" pause
@exit /b %errorlevel%

