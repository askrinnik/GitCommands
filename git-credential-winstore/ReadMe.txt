Программа используется для того чтобы не вводить много раз логин и пароль при пользовании Git с протоколом https

Качаем прогу, запускаем, она задает вопрос.. Отвечаем Да
После это в файле C:\Users\Administrator\.gitconfig появляется строчка
[credential]
	helper = !'C:\\Users\\Administrator\\AppData\\Roaming\\GitCredStore\\git-credential-winstore.exe'

При первом же вводе логина и пароля они записываются в кеш креденшиалов и потом подставляются автоматом.
Посмотреть на этот кеш можно здесь Control Panel\User Accounts\Credential Manager
Там же можно и почистить