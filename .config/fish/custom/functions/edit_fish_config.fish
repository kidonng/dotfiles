function edit_fish_config
  if test -z "$EDITOR"
    set EDITOR vi
  end

  command $EDITOR $__fish_config_dir/config.fish
end
