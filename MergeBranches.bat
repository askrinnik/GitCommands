@pushd "C:\Users\Administrator\Documents\Panels\GitCommands"

@call MergeBranchesWithoutPush %1 %2

@call PushToAllFolder.bat %2

@popd

@echo .
@echo successful!
@echo .
@pause
