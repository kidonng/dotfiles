# Theme-aware Fish shell color config
# Tested with iTerm2 One Dark theme (https://github.com/joshdick/onedark.vim/blob/master/term/One%20Dark.itermcolors)

# Test:
# echo "quote" > redirection;;; error param $operator \x42 # comment
set -U fish_color_command blue -o
set -U fish_color_quote green
set -U fish_color_redirection magenta
set -U fish_color_end cyan
set -U fish_color_error red
set -U fish_color_param yellow
set -U fish_color_comment brblack
set -U fish_color_operator magenta
set -U fish_color_escape cyan
set -U fish_color_autosuggestion brblack

# Test:
# commandline --insert 'set ' && commandline --function complete
set -U fish_pager_color_progress black --background=white
set -U fish_pager_color_prefix --bold
set -U fish_pager_color_description yellow

