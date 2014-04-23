call MergeMasterToBranch.bat feature/DevX
call MergeMasterToBranch.bat feature/CMI
call MergeMasterToBranch.bat feature/UiUx
call MergeMasterToBranch.bat feature/Team3-710
call MergeMasterToBranch.bat feature/TeamTA

@pushd %DEVDIR%\..\CCNet
git.exe checkout feature/DevX
@popd


