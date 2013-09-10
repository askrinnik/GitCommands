@pushd c:\Dev\MetraNet

@echo %time%
@set BeginTime=%time%

git pull -v --progress  "origin"
git submodule foreach git pull -v --progress  "origin"

@echo From %BeginTime% to %time%

@popd
@pause
