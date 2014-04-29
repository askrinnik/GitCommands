@pushd %DEVDIR%\..\CCNet
git.exe checkout %1
git.exe merge master
git.exe push -v --progress  "origin" %1
@popd
@pause
