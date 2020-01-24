require 'rubygems'
require 'yaml'

RAILS_ROOT  = '/Users/appfolio/property'

TERMINALS = [{
  'label'   => "[multiplexer]",
  'command' => "cd #{RAILS_ROOT} && export MULTIPLEXER_MAX_REQUESTS=2 MULTIPLEXER_URL=http://127.0.0.1:3000 && bundle exec multiplexer_ctl run",
},{
  'label'   => "[webpack]",
  'command' => "cd #{RAILS_ROOT} && export CIRCLECI=true SINGLE_WEBPACKER_APP_COMPILE=manual_late_fees && node --max_old_space_size=4096 ./node_modules/.bin/webpack --progress --watch --config config/webpack/development.js",
},{
  'label'   => "[rails s]",
  'command' => "cd #{RAILS_ROOT} && bundle exec bin/rails s -p 3000",
},{
  'label'   => "[rails c]",
  'command' => "cd #{RAILS_ROOT} && bundle exec bin/rails c",
},{
  'label'   => "[property bash]",
  'command' => "cd #{RAILS_ROOT}",
},{
  'label'   => "[engine bash]",
  'command' => "cd #{RAILS_ROOT}/engines/accounting_domain",
}]

class ProjectLauncherITerm
  ITERMOCIL_PATHNAME = '/tmp/iTermocil.yml'

  def launch
    puts "Launching project"

    write_itermocil_file(TERMINALS)

    open_new_window
    execute "itermocil --layout #{ITERMOCIL_PATHNAME} --here"
  end

  private

  def open_new_window
    script = <<-APPLESCRIPT
      osascript \\
        -e \"tell application \\\"iTerm\\\"\" \\
          -e \"set newWindow to (create window with default profile)\" \\
          -e \"tell newWindow\" \\
            -e \"set title to \\\"property\\\"\" \\
          -e \"end tell\" \\
        -e \"end tell\" \\
      > /dev/null
    APPLESCRIPT

    execute(script)
  end

  def write_itermocil_file(terminals, filename = ITERMOCIL_PATHNAME)
    File.open(filename, 'w') do |f|
      f.puts('windows:')
      terminals.each do |terminal|
        f.puts("  - name: \"#{terminal['label']}\"")
        f.puts("    root: #{RAILS_ROOT}")
        f.puts("    layout: tiled")
        f.puts("    panes:")
        f.puts("      - #{terminal['command']}")
      end
    end
  end

  def execute(command)
    %x[#{command}]
  end
end

ProjectLauncherITerm.new.launch
