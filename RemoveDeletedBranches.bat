@pushd %DEVDIR%

git.exe fetch -v --progress --prune  "origin"
git submodule foreach git.exe fetch -v --progress --prune  "origin"

@popd
@pause
