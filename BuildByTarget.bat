@echo %time%
@set StartTime=%time%
msbuild %ROOTDIR%\Build\MSBuild\MetraNetBuild.proj /m /ds /t:%1 /p:config=%VERSION%;MyTargets=Build /fl /flp:ShowTimestamp;Verbosity=DIAG;Summary;LogFile=%temp%\msbuild.log /clp:Verbosity=M;Summary
@echo From %StartTime% to %time%
pause