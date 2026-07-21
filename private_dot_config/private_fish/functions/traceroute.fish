# TUN proxy compat
function traceroute
    # Exclude options, IP addresses and dotless hostnames
    if set --query argv[-1] && ! string match --regex '^(-.+|[\d.]+|[[:alnum:]:]+)$' --quiet -- $argv[-1]
        set --local resolved (
          dig +short $argv[-1] |
          # Exclude CNAMEs
          string match --invert '*.'
        )[1]

        if test -z "$resolved"
            echo "traceroute: unknown host $argv[-1]"
            return 1
        end

        set argv[-1] $resolved
    end

    command traceroute -i en0 $argv
end
