function brew_cat -d "brew cat with syntax highlighting" -w "command brew cat"
  argparse -i p/plain -- $argv

  if set -q _flag_plain
    set bat_args -p
  end

  set output (command brew cat $argv)

  if test -n "$output"
    string collect -- $output | command bat -l ruby $bat_args
  end
end
