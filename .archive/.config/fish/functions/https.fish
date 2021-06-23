function https -w curl
    set url (string match -v -- "-*" $argv)[-1]
    set -e argv[(contains -i -- $url $argv)]
    curl -i $argv https://$url
end
