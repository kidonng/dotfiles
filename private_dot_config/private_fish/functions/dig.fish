# TUN proxy compat
function dig
    command dig -b (ipconfig getifaddr en0) $argv
end
