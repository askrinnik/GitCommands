d:
cd \Metanga

"C:\Program Files (x86)\Git\bin\git.exe" checkout CoreInfrastructure
"C:\Program Files (x86)\Git\bin\git.exe" pull -v --progress  "origin"

@echo .
@echo checkout master and pull
@echo .
@pause

"C:\Program Files (x86)\Git\bin\git.exe" checkout master
"C:\Program Files (x86)\Git\bin\git.exe" pull -v --progress  "origin"

@echo .
@echo open log
@echo .
@pause

"C:\Program Files\TortoiseGit\bin\TortoiseProc.exe" /command:log /path:"D:\Metanga"

@echo .
@echo push to master 
@echo .
@pause

"C:\Program Files (x86)\Git\bin\git.exe" push -v --progress  "origin" %2:%2

@echo .
@echo successful!
@echo Goto CoreInfrastructure
@echo .
@pause

"C:\Program Files (x86)\Git\bin\git.exe" checkout CoreInfrastructure
@pause
