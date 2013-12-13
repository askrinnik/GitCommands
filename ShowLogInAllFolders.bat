set filename=c:\1.csv
set period=5.days

@set tmpFile=c:\Pathes.txt
@REM Get list of folders with submodules to %tmpFile%
@pushd %DEVDIR%
@git submodule foreach "\echo $path >>%tmpFile%"
@popd

call GitLog.bat %DEVDIR% %period% >%filename%
@FOR /F %%G IN (%tmpFile%) DO ( call GitLog.bat %%G %period% >>%filename% )
@del %tmpFile%"

@Echo The list of changes was saved to %filename%
@pause
