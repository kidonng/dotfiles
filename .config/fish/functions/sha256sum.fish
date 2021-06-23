if ! command -sq openssl || ! command -sq perl
    exit
end

function sha256sum -d "Print SHA-256 checksum"
    if isatty stdout
        openssl sha256 $argv
    else
        if isatty
            openssl sha256 $argv | string split -f 2 " "
        else
            openssl sha256
        end | perl -pe "chomp if eof"
    end
end
