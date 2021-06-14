function rename
    set -l old_pattern $argv[1]
    set -l new_pattern $argv[2]
    set -l files $argv[3..]

    for file in $files
        if ! string match -- "*$old_pattern*" $file
            echo rename: (set_color -o)$file(set_color normal) does not match the old pattern >&2
            continue
        end

        set -l new_file (string replace -- $old_pattern $new_pattern $file)
        mv $file $new_file
    end
end
