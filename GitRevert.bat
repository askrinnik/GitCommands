rem if you need skip pause after executions call "SetUnchangeConfigFiles.bat skip_pause"
@pushd %DEVDIR%
git reset --hard
git submodule foreach git reset --hard
@popd

if NOT "%1%"=="skip_set_unchange_config" (
call SetUnchangeConfigFiles.bat %1%
)