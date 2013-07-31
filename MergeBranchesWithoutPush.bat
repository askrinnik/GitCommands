@pushd "C:\Users\Administrator\Documents\Panels\Git"

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

@pushd c:\Dev\MetraNet

@set submoduleName=%1
@if NOT "%submoduleName%" == "develop" set submoduleName=%submoduleName%@MetraNet

git submodule foreach git merge %submoduleName%
git merge %1

@popd
@pause
