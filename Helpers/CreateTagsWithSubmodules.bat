@pushd %DEVDIR%

git.exe tag %1
git.exe submodule foreach git tag %1

git.exe push --tags
git.exe submodule foreach git push --tags

pause

