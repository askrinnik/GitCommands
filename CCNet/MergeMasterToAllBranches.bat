@pushd %DEVDIR%\..\CCNet
git.exe checkout master
@popd
pause

call MergeMasterToBranch.bat feature/DevX
call MergeMasterToBranch.bat feature/CMI
call MergeMasterToBranch.bat feature/Billing
call MergeMasterToBranch.bat feature/TeamTA
call MergeMasterToBranch.bat feature/Sust2
call MergeMasterToBranch.bat feature/Engines
call MergeMasterToBranch.bat feature/Reporting
call MergeMasterToBranch.bat feature/devops
call MergeMasterToBranch.bat develop
call MergeMasterToBranch.bat package/8.2
call MergeMasterToBranch.bat release/8.2

@pushd %DEVDIR%\..\CCNet
git.exe checkout feature/DevX
@popd


