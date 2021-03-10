set -U fish_greeting

if builtin functions -q plug
    set plugins (plug list -e)

    if builtin contains kidonng/fish-proxy $plugins
        # ALL_PROXY: curl, Homebrew, etc.
        set -U proxy_vars ALL_PROXY
        set -U proxy_launch
    end

    if builtin contains PatrickF1/fzf.fish $plugins
        set -U fzf_preview_dir_cmd exa
    end
end

