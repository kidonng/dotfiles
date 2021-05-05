function wsl_host -d "Get Windows host IP address in WSL 2"
  string match -e nameserver < /etc/resolve.conf | string split " " -f 2
end
