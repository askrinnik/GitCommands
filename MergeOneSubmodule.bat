@pushd %3

@set branchName1=%1
@set branchName2=%2

if %3 == "C:\dev\MetraNet" goto BeginWork
  
@if NOT "%branchName1%" == "develop" set branchName1=%branchName1%@MetraNet
@if NOT "%branchName2%" == "develop" set branchName2=%branchName2%@MetraNet

:BeginWork
@echo .
@echo checkout "%branchName1%"and pull
@echo .
git checkout "%branchName1%"
git pull -v --progress  "origin"

@echo .
@echo checkout "%branchName2%"and pull
@echo .
@pause
git checkout "%branchName2%"
git pull -v --progress  "origin"

@echo .
@echo merge from "%branchName1%" to "%branchName2%"
@echo .
@pause
git merge "%branchName1%"


@echo .
@echo push to "%branchName2%"
@echo .
@pause
git submodule foreach git push -v --progress  "origin" %branchName2%:%branchName2%


@popd

@echo .
@echo successful!
@echo .
@pause
