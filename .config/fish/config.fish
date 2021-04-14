status is-interactive || exit

fish_add_path -g /usr/local/sbin
fish_add_path -g ~/.cargo/bin

if command -sq fzf
  set -x FZF_DEFAULT_OPTS --cycle --layout=reverse --height=90% --preview-window=wrap --multi
end

if command -sq less
  set -x LESS --RAW-CONTROL-CHARS --ignore-case --LONG-PROMPT
end

if command -sq nvim
  set -x EDITOR nvim
end

if command -sq starship
  command starship init fish | builtin source
end

if command -sq zoxide
  command zoxide init fish | builtin source
end

