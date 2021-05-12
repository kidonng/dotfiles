function https -w curl
    curl -i https://$argv[1] $argv[2..]
end
