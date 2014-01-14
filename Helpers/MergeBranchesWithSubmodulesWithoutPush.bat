@pushd %GitCmdMNDev%\Helpers

@call SwitchToBranchInAllFolders.bat %1
@call ..\PullInAllFolder.bat

@echo .
@echo checkout %2 and pull
@echo .
@pause

@call SwitchToBranchInAllFolders.bat %2
@call ..\PullInAllFolder.bat

@call MergeBranchesWithSubmodulesInternal.bat %1 %2

@popd
