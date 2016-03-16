set srcBranch=%1
set dstBranch=%2
set isSkipPause=%3

set scriptDir=%~dp0
set reposList=%TEMP%\reposWithBranch.txt

git fetch --prune && git submodule foreach git fetch --prune 

REM Process superrepo
IF EXIST %reposList% del /F %reposList%
call %scriptDir%CheckBranchExists.bat %DEVDIR% %dstBranch% %reposList%
IF EXIST %reposList% call %scriptDir%MergeBranches.bat %DEVDIR% %srcBranch% %dstBranch% %isSkipPause%

REM Process submodules
IF EXIST %reposList% del /F %reposList%

@set srcBranchSubmodule=%srcBranch%
@if NOT "%srcBranch%" == "develop" set srcBranchSubmodule=%srcBranchSubmodule%@MetraNetDev
@set dstBranchSubmodule=%dstBranch%
@if NOT "%dstBranch%" == "develop" set dstBranchSubmodule=%dstBranchSubmodule%@MetraNetDev

pushd %DEVDIR%
call %scriptDir%GetSubmodulesListWithBranch.bat %DEVDIR% %dstBranchSubmodule% %reposList%
IF EXIST %reposList% FOR /F %%P IN (%reposList%) DO call %scriptDir%MergeBranches.bat %%P %srcBranchSubmodule% %dstBranchSubmodule% %isSkipPause%
popd
