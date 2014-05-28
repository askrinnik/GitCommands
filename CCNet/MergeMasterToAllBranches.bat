@pushd %DEVDIR%\..\CCNet
git.exe checkout master
@popd
pause

call MergeMasterToBranch.bat feature/DevX
call MergeMasterToBranch.bat feature/CMI
call MergeMasterToBranch.bat feature/Billing
call MergeMasterToBranch.bat feature/TeamTA
call MergeMasterToBranch.bat feature/UiUx
call MergeMasterToBranch.bat feature/Sust
call MergeMasterToBranch.bat develop

@pushd %DEVDIR%\..\CCNet
git.exe checkout feature/DevX
@popd


