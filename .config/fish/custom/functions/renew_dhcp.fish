function renew_dhcp -d "Renew macOS DHCP lease"
  command networksetup -setbootp Wi-Fi
  command networksetup -setdhcp Wi-Fi
end
