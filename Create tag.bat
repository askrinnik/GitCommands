@echo press any key for start Git tagging
pause

@pushd %DEVDIR%

set MNTAG=MetraNet_8.1.0_GA_S006

git tag %MNTAG% && git submodule foreach git tag %MNTAG%

git push --tags && git submodule foreach git push --tags
        

@echo ready
pause