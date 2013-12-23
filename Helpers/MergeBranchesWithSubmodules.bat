@pushd "%GitCmdMNDev%\Helpers"

@call MergeBranchesWithSubmodulesWithoutPush %1 %2

@call PushWithSubmodules.bat %2

@popd

@echo .
@echo successful!
@echo .
@pause
