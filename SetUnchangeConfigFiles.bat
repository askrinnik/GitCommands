@pushd %MTRMP%\Extensions

@echo Adding servers.xml and other config files to ingnore list

@pushd %MTRMP%\Extensions\..\config\ServerAccess
git update-index --assume-unchanged servers.xml
git update-index --assume-unchanged protectedpropertylist.xml
@popd

@pushd %MTRMP%\Extensions\AR\config\ServerAccess
git update-index --assume-unchanged servers.xml
@popd

@pushd %MTRMP%\Extensions\PaymentSvr\config\Gateway
git update-index --assume-unchanged WorldPayConfig.xml
@popd

@pushd %MTRMP%\Extensions\PaymentSvrClient\config\ServerAccess
git update-index --assume-unchanged servers.xml
@popd

@pushd %MTRMP%\Extensions\Reporting\Config\ServerAccess
git update-index --assume-unchanged servers.xml
@popd

@pushd %MTRMP%\Extensions\SmokeTest\config\ServerAccess
git update-index --assume-unchanged servers.xml
@popd

@pushd %MTRMP%\Extensions\TaxWare\config\ServerAccess
git update-index --assume-unchanged servers.xml
@popd

@pushd %DEVDIR%\Source\utils\MSIX2SQL
git update-index --assume-unchanged msix2sql.vbp
@popd

@pushd %DEVDIR%\Source\utils\QuickConfig
git update-index --assume-unchanged QuickConfig.vbp
@popd

@echo DONE!

@popd

if NOT "%1%"=="skip_pause" (
pause
)

