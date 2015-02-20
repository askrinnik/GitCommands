@set branchName=%1
@set isSkipPause=%2

@set branchNameSubmodule=%branchName%
@if NOT "%branchName%" == "develop" set branchNameSubmodule=%branchNameSubmodule%@MetraNetDev

@pushd %DEVDIR%

@set command=git submodule foreach git merge origin/%branchNameSubmodule%
%command% 2>&1
@if not %errorlevel%==0 goto error

@set command=git merge origin/%branchName%
%command% 2>&1
@if not %errorlevel%==0 goto error

@goto done

:error
@echo Error in %command% 1>&2

:done
@popd
@if not "%isSkipPause%"=="skip_pause" pause
@exit /b %errorlevel%
