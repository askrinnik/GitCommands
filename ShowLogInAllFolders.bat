set filename=c:\1.csv
set period=5.days
:set period="2014/01/16"


@set tmpFile=c:\Pathes.txt
@REM Get list of folders with submodules to %tmpFile%
@pushd %DEVDIR%
@git submodule foreach "\echo $path >>%tmpFile%"
@popd

call %GitCmdMNDev%\Helpers\GitLog.bat %DEVDIR% %period% >%filename%
@FOR /F %%G IN (%tmpFile%) DO ( call %GitCmdMNDev%\Helpers\GitLog.bat %%G %period% >>%filename% )
@del %tmpFile%"

@Echo The list of changes was saved to %filename%
@pause
