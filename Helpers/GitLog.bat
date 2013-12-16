@pushd %DEVDIR%

@set folder=%1

@REM Replace / to \ for correct folder name
@set folder=%folder:/=\%

@pushd %folder%
@git log --pretty=format:"%1; %%ad; %%an; %%s" --since=%2 --date=short
@popd
@echo.

@popd


