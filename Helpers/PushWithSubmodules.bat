@set branchName=%1
@set isSkipPause=%2

@set branchNameSubmodule=%branchName%
@if NOT "%branchName%" == "develop" set branchNameSubmodule=%branchNameSubmodule%@MetraNetDev

@echo .
@echo push to %branchName% 
@echo .
@if not "%isSkipPause%"=="skip_pause" pause

@pushd %DEVDIR%

@set command=git submodule foreach git push -v --progress  "origin" %branchNameSubmodule%:%branchNameSubmodule%
%command% 2>&1
@if not %errorlevel%==0 goto error

@set command=git push -v --progress  "origin" %branchName%:%branchName%
%command% 2>&1
@if not %errorlevel%==0 goto error

@goto done

:error
@echo Error in %command% 1>&2

:done
@popd
@if not "%isSkipPause%"=="skip_pause" pause
@exit /b %errorlevel%

