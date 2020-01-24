#!/usr/bin/python
import os

THIS_FILE_PATH = os.path.dirname(os.path.realpath(__file__))

def create_all_sym_links():
  files_to_link = [
    '.vimrc',
    '.ideavimrc'
  ]

  for f in files_to_link:
    src = os.path.join(THIS_FILE_PATH, f)
    dest = os.path.join(os.environ['HOME'], f)

    if os.path.exists(dest):
      print('\tSkipping %s' % (src))
    else:
    print('\tLinking file %s to %s' % (src, dest))
      os.symlink( src, dest )

def link_alias_setup_bashrc():
  bashrc_file = os.path.join(os.environ['HOME'], '.bashrc')
  alias_script = os.path.join(THIS_FILE_PATH, 'alias_setup.sh')
  code_to_insert = 'source %s' % alias_script

  with open(bashrc_file, 'r') as f:
    lines = f.readlines()

  if len(list(filter(lambda x: x.strip() == code_to_insert, lines))) == 0:
    print('\tLinking .bashrc to alias_setup.sh')
    with open(bashrc_file, 'w+') as f:
      for line in lines:
        f.write(line) 
      f.write('\n' + code_to_insert) 
  else:
    print('\tSkipping linking .bashrc to alias_setup.sh')


if __name__ == '__main__':
  function_to_runs = [
    create_all_sym_links,
    link_alias_setup_bashrc
  ]

  for function in function_to_runs:
    print(function.__name__)
    function()

