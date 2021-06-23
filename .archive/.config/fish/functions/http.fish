function http -w curl
    curl -i http://$argv[1] $argv[2..]
end
