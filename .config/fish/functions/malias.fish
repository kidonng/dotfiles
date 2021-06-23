test (uname) = Darwin || exit

# https://stackoverflow.com/a/34558042
function malias -a source link
    osascript -e 'tell app "Finder" to make new alias file to POSIX file "'(realpath $source)'" at POSIX file "'(realpath $link)'"'
end
