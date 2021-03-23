status is-interactive || exit

fish_add_path -g /usr/local/sbin
fish_add_path -g /usr/local/opt/curl/bin
fish_add_path -g ~/.cargo/bin

if command -sq brew
  set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles
end

if command -sq fzf
  set -x FZF_DEFAULT_OPTS --cycle --layout=reverse --height=90% --preview-window=wrap --multi

  if command -sq fd
    set -x FZF_DEFAULT_COMMAND fd
  end
end

if command -sq less
  set -x LESS --RAW-CONTROL-CHARS --ignore-case --LONG-PROMPT
end

if command -sq nvim
  set -x EDITOR nvim
  # set -x DIFFPROG nvim -d
end

if command -sq starship
  command starship init fish | builtin source
end

if command -sq zoxide
  command zoxide init fish | builtin source
end

# set -l iterm_integration ~/.iterm2_shell_integration.fish
# if test -e $iterm_integration
#   source $iterm_integration
# end

