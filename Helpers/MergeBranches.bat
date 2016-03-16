set repoFolder=%1
set srcBranch=%2
set dstBranch=%3
set isSkipPause=%4

set currentDir=%~dp0

pushd %repoFolder%

echo -------- Merge the %srcBranch% branch into the %dstBranch% branch for %repoFolder% folder
git clean -df -xf
git reset --hard

@set command=git checkout %dstBranch%
%command% 2>&1
@if not %errorlevel%==0 goto error

@set command=git pull "origin"
%command% 2>&1
@if not %errorlevel%==0 goto error

@set command=git merge origin/%srcBranch%
%command% 2>&1
@if not %errorlevel%==0 goto error

@set command=git push -v --progress  "origin" %dstBranch%:%dstBranch%
%command% 2>&1
@if not %errorlevel%==0 goto error

@goto done

:error
@echo Error in %command% 1>&2

:done
@popd

@if not "%isSkipPause%"=="skip_pause" pause
@exit /b %errorlevel%
