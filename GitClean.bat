@pushd %DEVDIR%

git clean -d -f
git submodule foreach git clean -d -f
@popd
@pause
