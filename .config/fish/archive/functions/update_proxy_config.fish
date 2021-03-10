function update_proxy_config -a server -d "Update proxy server in various program configs"
  sed -i "s/\(\w\+\.\)\{3\}\w\+/$server/" ~/.gitconfig
  sed -i "s/\(nc -x \)\(\w\+\.\)\{3\}\w\+/\1$server/" ~/.ssh/config
  sed -i "s/\(socks5 \)\(\w\+\.\)\{3\}\w\+/\1$server/" ~/.proxychains/proxychains.conf
end
