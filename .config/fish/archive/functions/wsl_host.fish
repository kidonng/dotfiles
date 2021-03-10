function wsl_host -d "Get Windows host IP address in WSL 2"
  command cat /etc/resolve.conf | string match -e nameserver | string split " " -f 2
end
