set repoFolder=%1
set branchName=%2
set reposList=%3

set allSubmodules=%TEMP%\allSubmodules.txt
set scriptDir=%~dp0

pushd %repoFolder%
REM grep reads  .gitmodules file and filter only lines contain 'path'
REM sed with s command removes all text before =
REM the next sed with s command replaces / to \
grep path .gitmodules | sed 's/.*= //' | sed 's/\//\\\/g' >%allSubmodules% 

FOR /F %%P IN (%allSubmodules%) DO call %scriptDir%\CheckBranchExists.bat %%P %branchName% %reposList%

@popd
