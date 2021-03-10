function copy_sha256sum -a file -d "Copy SHA-256 hash of a file"
  if isatty
    set raw (command shasum -a 256 $file)
  else
    command cat | command shasum -a 256 | read raw
  end

  set hash (string split " " -f 1 $raw)
  echo -n $hash | command pbcopy
  builtin printf "Copied %s$hash%s\n" (builtin set_color -o) (builtin set_color normal)
end
