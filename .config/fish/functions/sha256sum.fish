function sha256sum -d "Print SHA-256 checksum"
  if isatty stdout
      openssl sha256 $argv
  else
    if test -z "$argv"
      openssl sha256
    else
      openssl sha256 $argv | string split -f 2 " "
    end | tr -d \n
  end
end
