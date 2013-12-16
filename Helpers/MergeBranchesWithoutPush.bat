@pushd %DEVDIR%

@echo .
@echo checkout %1 and pull
@echo .
git checkout %1
git pull -v --progress  "origin"

@echo .
@echo checkout %2 and pull
@echo .
@pause

git checkout %2
git pull -v --progress  "origin"

@echo .
@echo merge from %1 to %2
@echo .
@pause

git merge %1

@popd
@pause
