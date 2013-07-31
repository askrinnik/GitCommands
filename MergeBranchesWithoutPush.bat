d:
cd \Metanga

"C:\Program Files (x86)\Git\bin\git.exe" checkout %1
"C:\Program Files (x86)\Git\bin\git.exe" pull -v --progress  "origin"

@echo .
@echo checkout %2 and pull
@echo .
@pause

"C:\Program Files (x86)\Git\bin\git.exe" checkout %2
"C:\Program Files (x86)\Git\bin\git.exe" pull -v --progress  "origin"

@echo .
@echo merge from %1 to %2
@echo .
@pause

"C:\Program Files (x86)\Git\bin\git.exe"  merge %1

@echo .
@echo successful!
@echo .
@pause
