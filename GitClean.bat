@pushd %DEVDIR%

git clean -df -xf
git submodule foreach git clean -df -xf

@popd
@pause
