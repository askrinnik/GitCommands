cd /d u:\MetraNet_LegacySmokesTests\
call BuildLegacyUT.bat
cd u:\MetraTech
call BuildUT.bat
xcopy o:\LegacySmokeTests o:\debug\Bin\ /E /C /I /Q /R /Y
xcopy o:\UnitTests o:\debug\Bin /E /C /I /Q /R /Y
cd /d t:\
call Development\_runSmokeTestOnDevEnv.cmd
pause