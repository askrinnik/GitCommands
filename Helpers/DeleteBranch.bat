@pushd %1

@git branch --delete %2
@git push origin :%2

@popd
