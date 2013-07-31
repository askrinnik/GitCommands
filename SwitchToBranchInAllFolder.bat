@pushd c:\Dev\MetraNet

git checkout %1

@set submoduleName=%1
@if NOT "%submoduleName%" == "develop" set submoduleName=%submoduleName%@MetraNet

git submodule foreach git checkout "%submoduleName%"

@popd
@pause
