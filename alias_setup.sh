alias g='noglob git'
alias jsh='find app/assets/javascripts -name "*.js" -exec jshint {} \;'
alias rt='rake test'
alias bi='bundle install -j 4'
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
alias pr='pry-remote'
alias resolr='bundle exec rake solr:create_core solr:reindex'
alias dbm='bundle exec rake db:create db:migrate'
alias dbme='find engines -type d -maxdepth 1 ! -name engines | xargs -I % sh -c "pushd % && RAILS_ENV=test bundle exec rake db:create db:migrate"'
alias dbre='brake db:drop db:create db:migrate'
alias selenium="find test/dummy/test/selenium -name '*test.rb' -exec ruby -Itest {} \;"
alias tl='test_launcher --spring'
alias tld='test_launcher --disable-spring'
alias nt='NODE_ENV=test'
alias lmo='./node_modules/.bin/mocha'
alias lseq='./node_modules/.bin/sequelize'
alias npt='npm test'
alias npd='npm run dist'
alias npti='npm test -- --inspect --debug-brk'
alias ngrep="grep -nr --color --exclude-dir='node_modules' --exclude-dir='.git' --exclude-dir='docs' --exclude='bundle.js'"
alias rr="RAILS_ENV=test bundle exec rspec && bundle exec rubocop"
alias rubo="bundle exec rubocop"
alias rs="RAILS_ENV=test bundle exec rspec --format documentation"
alias srs="RAILS_ENV=test bundle exec spring rspec --format documentation"
alias ddec="export DISABLE_DATABASE_ENVIRONMENT_CHECK=1"
alias insnpt="./node_modules/.bin/mocha --recursive --timeout 10000 --require babel-core/register --require ignore-styles --require ./test/javascript/shim.js --require ./test/javascript/setup.js"
alias inslint="eslint --fix --quiet app/javascript test/javascript"
alias eslf="./node_modules/.bin/eslint --fix"
alias purge_assets='brake assets:clean assets:clobber && g clean -fdX tmp'
alias fs="foreman start"

alias ti="terraform init"
alias tp="terraform plan"
alias ta="terraform apply"

alias rc="bundle exec rails c"
alias pass="bundle exec passenger start --port 3000 --max-pool-size 4 --min-instances 4 --spawn-method direct --nginx-config-template nginx_development.conf.erb"
alias localsearch="SEARCH_APP_API_URL=http://localhost:6311/api"

alias java11="export PATH=\"/usr/local/opt/openjdk@11/bin:$PATH\" JAVA_HOME=/usr/local/Cellar/openjdk@11/11.0.7+10"

alias au="aws_longer role SuperUser"
alias aws_current_user='aws sts get-caller-identity > /tmp/current_user.json && cat /tmp/current_user.json && jq .Arn /tmp/current_user.json | grep -Po "(\d{12})" > /tmp/current_user && grep $(cat /tmp/current_user) ~/.aws/accounts'

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

# spring related commands
alias stest='RAILS_ENV=test bin/spring rails test'
alias estest='SPRING_APPLICATION_ID=property_${PWD##*/}_engine ../../bin/spring rails test'
alias esstop='SPRING_APPLICATION_ID=property_${PWD##*/}_engine ../../bin/spring stop'
alias kills='pkill -f spring'

# work related
alias fullwebpack='bundle exec rake webpacker:npm_dev_install && node --max_old_space_size=4096 ./node_modules/.bin/webpack --progress --config config/webpack/development.js'
alias jumpboxssh="BUNDLE_GEMFILE=$HOME/worksetup_public/find_and_ssh_via_jumpbox/Gemfile bundle exec ruby $HOME/worksetup_public/find_and_ssh_via_jumpbox/jumpbox_ssh_automatic.rb"

# operations on git diff files only
alias gdiff="git diff -r --no-commit-id --name-only --diff-filter=d master | xargs -I % echo \$(git rev-parse --show-toplevel)/%"
alias rubodiff="rubo \$(gdiff)"
alias rsdiff="bundle exec spring rspec \$(gdiff | grep _spec\.rb)"
alias tdiff="gdiff | grep _test\.rb"
alias tldiff="tl \$(tdiff)"
