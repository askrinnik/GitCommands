@echo .
@echo merge from %1 to %2
@echo .

@pushd %DEVDIR%

@set branchName=%1
@if NOT "%branchName%" == "develop" set branchName=%branchName%@MetraNetDev

git submodule foreach git merge %branchName%
git merge %1

@popd
@pause
