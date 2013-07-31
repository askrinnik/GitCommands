@pushd "C:\Users\Administrator\Documents\Panels\Git"

@call MergeBranchesWithoutPush %1 %2

@call PushToAllFolder.bat %2

@popd

@echo .
@echo successful!
@echo .
@pause
