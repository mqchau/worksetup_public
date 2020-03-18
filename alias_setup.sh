alias glgm="bash ~/worksetup/git_log_master.sh"
alias glgmh="bash ~/worksetup/git_log_master.sh HEAD"
alias glg='git log --graph --decorate'
alias g='git'
alias jsh='find app/assets/javascripts -name "*.js" -exec jshint {} \;'
alias rt='rake test'
alias bi='bundle install'
alias guard='rvm 2.3.0 do guard'
alias stp='pushd ~/property; script/start; popd'
alias spp='pushd ~/property; script/stop; popd'
alias stt='pushd ~/src/apm_bundle/apps/tportal; script/start; popd'
alias spt='pushd ~/src/apm_bundle/apps/tportal; script/stop; popd'
alias stm='pushd ~/src/apm_bundle/apps/messenger; script/start; popd'
alias spm='pushd ~/src/apm_bundle/apps/messenger; script/stop; popd'
alias stc='pushd ~/src/credit_card_system/cashier_app; script/start; popd'
alias spc='pushd ~/src/credit_card_system/cashier_app; script/stop; popd'
alias brake='bundle exec rake'
alias rtest='bundle exec ruby -Itest'
alias ret='RAILS_ENV=test'
alias hgrep='history | grep'
alias syncapp='bundle install && brake db:migrate && ret brake db:migrate && npm install'
alias pr='cd `git rev-parse --show-toplevel`; pronto run; cd - > /dev/null;'
alias resolr='bundle exec rake solr:create_core solr:reindex'
alias gco='git checkout'
alias gpo='git pull origin'
alias gfo='git fetch origin'
alias gmo='git merge origin'
alias dbm='bundle exec rake db:migrate'
alias gst='git status'
alias gtemp='git branch -D temp_branch; git branch temp_branch'
alias dbre='brake db:drop db:create db:migrate'
alias grepc='grep --color -n'
alias selenium='find test/dummy/test/selenium -name '*test.rb' -exec ruby -Itest {} \;'
alias tl='test_launcher --spring'
alias tld='test_launcher --disable-spring'
alias nt='NODE_ENV=test'
alias lmo='./node_modules/.bin/mocha'
alias lseq='./node_modules/.bin/sequelize'
alias npt='npm test'
alias npti='npm test -- --inspect --debug-brk'
alias ngrep="grep -nr --color --exclude-dir='node_modules' --exclude-dir='.git' --exclude-dir='docs' --exclude='bundle.js'"
alias rr="RAILS_ENV=test bundle exec rspec && bundle exec rubocop"
alias rubo="bundle exec rubocop"
alias rs="RAILS_ENV=test bundle exec rspec --format documentation"
alias ddec="export DISABLE_DATABASE_ENVIRONMENT_CHECK=1"
alias insnpt="./node_modules/.bin/mocha --recursive --timeout 10000 --require babel-core/register --require ignore-styles --require ./test/javascript/shim.js --require ./test/javascript/setup.js"
alias inslint="eslint --fix --quiet app/javascript test/javascript"
alias gvim="/Applications/MacVim.app/Contents/bin/gvim"
alias eslf="./node_modules/.bin/eslint --fix"
alias purge_assets='brake assets:clean assets:clobber && g clean -fdX tmp'
alias fs="foreman start"

# set up alias for Mac OS only
MacOsRegex='^Darwin'
OS=$(uname -a)
if [[ $OS =~ $MacOsRegex ]]
then
  alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
fi

# old vim vs nvim
alias oldvim='/usr/bin/vim'
alias vim='nvim'
alias vi='nvim'


# some weird flaky errors with git
alias rmgit='rm /Users/appfolio/src/apm_bundle/.git/index.lock'

# docker notary
alias dockernotary="notary -s https://notary.docker.io -d ~/.docker/trust"

# workbench on cloud
alias sshbench='ssh ubuntu@ec2-3-81-202-211.compute-1.amazonaws.com'
