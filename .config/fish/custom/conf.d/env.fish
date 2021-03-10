fish_add_path -g /usr/local/sbin

if command -sq brew
  set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles
end

if command -sq less
  set -x LESS -R -i -M
end

if command -sq fzf
  set -x FZF_DEFAULT_OPTS --cycle --layout=reverse --height=90% --preview-window=wrap

  if command -sq fd
    set -x FZF_DEFAULT_COMMAND fd
  end
end

if command -sq nvim
  set -x EDITOR nvim
  # set -x DIFFPROG nvim -d
end

# set -l iterm_integration ~/.iterm2_shell_integration.fish
# if test -e $iterm_integration
#   source $iterm_integration
# end

