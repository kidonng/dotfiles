ln -s ~/.config/git/config.local{\#\#os.Darwin,}

ln -s ~/.cache ~/Library/Caches

for dir in glow qBittorrent TabNine
    ln -s ~/.config/$dir ~/Library/Preferences/
end

ln -s (brew --prefix)/bin/{yt-dlp,youtube-dl}
