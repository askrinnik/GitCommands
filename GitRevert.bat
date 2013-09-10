@pushd c:\Dev\MetraNet

git reset --hard
git submodule foreach git reset --hard

:@echo Adding servers.xml file to ingnore list

:@pushd RMP\config\ServerAccess
:git update-index --assume-unchanged servers.xml
:git update-index --assume-unchanged protectedpropertylist.xml
:@popd

:@pushd RMP\extensions\PaymentSvr\config\Gateway
:git update-index --assume-unchanged WorldPayConfig.xml
:@popd

:@pushd RMP\extensions\PaymentSvrClient\config\ServerAccess
:git update-index --assume-unchanged servers.xml
:@popd

:@pushd RMP\extensions\Reporting\Config\ServerAccess
:git update-index --assume-unchanged servers.xml
:@popd

:@pushd RMP\extensions\SmokeTest\config\ServerAccess
:git update-index --assume-unchanged servers.xml
:@popd

:@pushd RMP\extensions\TaxWare\config\ServerAccess
:git update-index --assume-unchanged servers.xml
:@popd

@popd
@pause
