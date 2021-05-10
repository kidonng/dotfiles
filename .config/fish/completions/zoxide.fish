complete zoxide -x -n __fish_use_subcommand -a "add import init query remove"
complete zoxide -x -s h -l help -d "Help"
complete zoxide -n "__fish_is_token_n 2" -x -s V -l version -d "Version"

complete zoxide -n "__fish_seen_subcommand_from import" -l merge -d "Merge into existing database"
complete zoxide -n "__fish_seen_subcommand_from import" -l from -d "Application to import from"

complete zoxide -n "__fish_seen_subcommand_from init" -l no-aliases -d "Don't defining any commands"
complete zoxide -n "__fish_seen_subcommand_from init" -l cmd -d "Renames the 'z' command and corresponding aliases"
complete zoxide -n "__fish_seen_subcommand_from init" -l hook -d "Chooses event upon which an entry is added to the database"

complete zoxide -n "__fish_seen_subcommand_from query" -s i -l interactive -d "Use interactive selection"
complete zoxide -n "__fish_seen_subcommand_from query" -s l -l list -d "List all matching directories"
complete zoxide -n "__fish_seen_subcommand_from query" -s s -l score -d "Print score with results"

complete zoxide -n "__fish_seen_subcommand_from remove" -s i -l interactive -d "Use interactive selection"
