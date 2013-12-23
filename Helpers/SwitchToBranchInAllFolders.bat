@pushd %DEVDIR%

git checkout %1

@set branchName=%1
@if NOT "%branchName%" == "develop" set branchName=%branchName%@MetraNetDev

git submodule foreach git checkout "%branchName%"

@popd
@pause
