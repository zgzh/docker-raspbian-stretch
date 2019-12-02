#!/bin/sh

cd $( dirname $( readlink -f $0  ) ) || exit 1

_commit=$(git log | egrep ^commit | head -n10 | tail -n1 | awk '{print $2}')

git checkout --orphan temp ${_commit}
git commit -m "Truncate history"
git rebase --onto temp ${_commit} master
