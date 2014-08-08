# Change author details in all old commits.
# WARNING: Will change all your commit SHA1s.
#!/bin/sh
git filter-branch -f --env-filter '
an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"
if [ "$GIT_COMMITTER_EMAIL" = "guillaume.baty@inria.fr" ]
then
cn="${GIT_AUTHOR_NAME}"
cm="${GIT_AUTHOR_EMAIL}"

export GIT_COMMITTER_NAME="${cn}"
export GIT_COMMITTER_EMAIL="${cm}"

fi
'
 
# after this, push the repository
# git push origin master --force
 
# if something goes wrong, remove the last commit
# git push -f origin HEAD^:master