@pushd "C:\Users\Administrator\Documents\Panels\GitCommands"

@call SwitchToBranchInAllFolder.bat %1
@call PullInAllFolder.bat

@echo .
@echo checkout %2 and pull
@echo .
@pause

@call SwitchToBranchInAllFolder.bat %2
@call PullInAllFolder.bat

@echo .
@echo merge from %1 to %2
@echo .
@pause

@popd

@pushd %DEVDIR%

@set branchName=%1
@if NOT "%branchName%" == "develop" set branchName=%branchName%@MetraNet

git submodule foreach git merge %branchName%
git merge %1

@popd
@pause
