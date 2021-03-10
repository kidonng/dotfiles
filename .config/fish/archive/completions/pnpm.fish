complete -c pnpm -w npm
complete -c pnpm -n __fish_use_subcommand -a import -d "Import from lockfile"
complete -c pnpm -n __fish_use_subcommand -a store -d "Manage pnpm store"
complete -c pnpm -n "__fish_seen_subcommand_from store" -a "add prune status"
