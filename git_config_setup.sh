# ALIAS
git config --global alias.st 'status'
git config --global alias.lg 'log  --max-count=20 --graph --decorate'
git config --global alias.co 'checkout'
git config --global alias.br 'branch'
git config --global alias.ci 'commit'
git config --global alias.ph 'push origin HEAD'
git config --global alias.cia 'commit --amend'
git config --global alias.cian 'commit --amend --no-edit'
git config --global alias.ap 'add -p'
git config --global alias.lgo '!git --no-pager log --decorate --oneline --graph master..HEAD'
git config --global alias.lgof 'log --decorate --oneline --graph'
git config --global alias.cp 'cherry-pick'
git config --global alias.rbi 'rebase -i'
git config --global alias.rbc 'rebase --continue'
git config --global alias.lgv 'log --decorate --reverse'
git config --global alias.H 'HEAD'
git config --global alias.rh 'reset HEAD~1'
git config --global alias.cpc 'cherry-pick --continue'
git config --global alias.cif 'commit --fixup'
git config --global alias.rbia 'rebase -i --autosquash'
git config --global alias.ss 'show --stat'
git config --global alias.sha 'rev-parse'
git config --global alias.shah 'rev-parse HEAD'
git config --global alias.dc 'diff --cached'
git config --global alias.ds 'diff --stat'
git config --global alias.d 'diff'
git config --global alias.stu 'status -uno'
git config --global alias.pod 'push origin --delete'
git config --global alias.rbsign "rebase --exec 'git commit --amend --no-edit -n -S' -i"
git config --global alias.vc 'verify-commit'
git config --global alias.lsi 'ls-files --ignored --exclude-standard --others'
git config --global alias.prom 'pull --rebase origin master'
git config --global alias.from 'fetch origin master'

# OTHER
git config --global core.excludesfile $PWD/.gitignore_global
git config --global core.editor vim
git config --global core.pager less

git config --global rebase.autosquash false
git config --global pager.branch false
git config --global rerere.enabled true

# DO NOT SHOW DIRTY FILE ON ZSH
git config --global oh-my-zsh.hide-dirty 1

git config --global commit.template $PWD/git_commit_template.txt
