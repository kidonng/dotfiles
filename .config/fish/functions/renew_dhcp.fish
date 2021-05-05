function renew_dhcp -d "Renew macOS DHCP lease"
  set networkservice Wi-Fi
  networksetup -setbootp $networkservice
  networksetup -setdhcp $networkservice
end
