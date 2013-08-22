@pushd c:\Dev\MetraNet

@echo %time%

git pull -v --progress  "origin"
git submodule foreach git pull -v --progress  "origin"

@echo %time%

@popd
@pause
