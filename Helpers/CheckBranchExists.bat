set repoFolder=%1
set branchName=%2
set outputFile=%3

pushd %repoFolder%

REM find remote branch and output submodule folder if the branch exists
git ls-remote --heads --exit-code origin %branchName%>nul
if %errorlevel%==0 (
  echo -------- The branch was found in %repoFolder%
  echo %repoFolder% >>%outputFile%
)

popd
