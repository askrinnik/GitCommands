@pushd %DEVDIR%

git.exe checkout -b %1
git.exe submodule foreach git checkout -b %1@MetraNetDev

git.exe push -u origin %1
git.exe submodule foreach git push -u origin %1@MetraNetDev

pause

