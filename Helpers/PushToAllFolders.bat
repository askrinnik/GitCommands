@echo .
@echo push to %1 
@echo .
@pause

@pushd %DEVDIR%

@set branchName=%1
@if NOT "%branchName%" == "develop" set branchName=%branchName%@MetraNetDev

git submodule foreach git push -v --progress  "origin" %branchName%:%branchName%
git push -v --progress  "origin" %1:%1

@popd

@pause
