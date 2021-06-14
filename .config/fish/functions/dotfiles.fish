test -z "$XDG_CONFIG_HOME" && set -l XDG_CONFIG_HOME ~/.config
test -z "$dotfiles" && set dotfiles $XDG_CONFIG_HOME/dotfiles
set __dotfiles_command git --git-dir $dotfiles
functions -q __fish_git || source $__fish_data_dir/completions/git.fish

function dotfiles -w "$__dotfiles_command"
    set non_opts (string match -v -- '-*' $argv)
    set cmd $non_opts[1]
    set alias __fish_git_alias_$cmd

    if test "$cmd" = init || test "$$alias" = init
        set -a argv --bare
        if test "$non_opts" = init
            set -a argv $dotfiles
        else
            set -U dotfiles (realpath $non_opts[2])
        end

        if git $argv
            $__dotfiles_command config core.bare false
            $__dotfiles_command config core.worktree $PWD
            $__dotfiles_command config status.showUntrackedFiles no
        else
            return
        end
    else
        $__dotfiles_command $argv
    end
end
