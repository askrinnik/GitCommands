@call %GitCmdMNDev%\Helpers\MergeBranchesWithoutPush %1 %2

@echo .
@echo push to %2 
@echo .
@pause

@pushd %DEVDIR%
git push -v --progress  "origin" %2:%2
@popd

@echo .
@echo successful!
@echo .
@pause
