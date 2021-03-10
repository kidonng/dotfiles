function rename
  set old_pattern $argv[1]
  set new_pattern $argv[2]
  set files $argv[3..-1]

  for file in $files
    set new_file (string replace -- $old_pattern $new_pattern $file)
    command mv $file $new_file
  end
end
