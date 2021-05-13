function __fzf_preview_file_content
    set bat_args --style numbers --color always
    set mime (file -b --mime-type $argv)

    switch $mime
        case "text/*"
            switch $argv
                case "*.md"
                    glow -s $THEME $argv
                case \*
                    bat $bat_args $argv
            end
        case application/json
            bat $bat_args -l json $argv
        case image/{gif,jpeg,png,svg+xml,webp}
            timg -g (math $COLUMNS - 2)x$LINES --frames 1 $argv
        case application/{msword,vnd.{ms-excel,ms-powerpoint,openxmlformats-officedocument.{presentationml.presentation,spreadsheetml.sheet,wordprocessingml.document}},pdf} image/heic video/{mp4,x-matroska}
            set tmp (mktemp -d)
            qlmanage -t -s (math $COLUMNS x 8) -o $tmp $argv &> /dev/null
            __fzf_preview_file_content $tmp/*
            rm -r $tmp
        case application/{gzip,x-{7z-compressed,bzip2,rar,xar},zip}
            7z l $argv | tail -n +12
        case \*
            echo (file -b $argv) "($mime)"
    end
end
