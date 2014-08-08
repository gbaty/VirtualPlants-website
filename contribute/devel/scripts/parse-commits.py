
# 1. Generate list of commits
# git log --name-only --pretty=format:commit:%H > ../commits.txt

import sys

#filename = '../commits-oalab.txt'
#filename = '../commits-openalea.txt'

filename = sys.argv[1]


f = open(filename)

files = {}
commit = None

order = []

for l in f:
  if l.startswith('commit:'):
    title, commit = l.strip().split(':')
    continue
  if commit:
    if l.strip():
      if commit not in order:
        order.append(commit)
      files.setdefault(commit, []).append(l.strip())

for k in reversed(order):
  print 'git cherry-pick %s' % k
  #print k
  #for fpath in files[k]:
    #print '  -', fpath
  #print




