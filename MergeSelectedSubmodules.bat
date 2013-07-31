@pushd "C:\Users\Administrator\Documents\Panels\Git"

@call MergeOneSubmodule.bat %1 %2 "C:\dev\MetraNet\RMP\Extensions\Legacy_Internal"
@call MergeOneSubmodule.bat %1 %2 "C:\dev\MetraNet"


@popd
