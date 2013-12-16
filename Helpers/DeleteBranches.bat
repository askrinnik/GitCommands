@pushd %GitCmdMNDev%\Helpers

@set branchName=%1
@if NOT "%branchName%" == "develop" set branchName=%branchName%@MetraNet


@call DeleteBranch %DEVDIR% %1


@call DeleteBranch %DEVDIR%\RMP\Extensions\MvmAmp %branchName%
@call DeleteBranch %DEVDIR%\RMP\Extensions\MvmCore %branchName%
@call DeleteBranch %DEVDIR%\CoreQA %branchName%
@call DeleteBranch %DEVDIR%\MvmCore %branchName%
@call DeleteBranch %DEVDIR%\TestsDatabase %branchName%
@call DeleteBranch %DEVDIR%\ICE %branchName%
@call DeleteBranch %DEVDIR%\Source\Thirdparty %branchName%


@popd

@pause
