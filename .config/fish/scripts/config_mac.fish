ln -s ~/.config/git/config.local{\#\#os.Darwin,}

for dir in glow qBittorrent TabNine
    ln -s ~/.config/$dir ~/Library/Preferences/
end

for dir in bottom com.vercel.cli
    ln -s ~/.config/$dir ~/Library/ApplicationSupport/
end

ln -s ~/Library/Caches ~/.cache

# IINA
ln -s (brew --prefix)/bin/{yt-dlp,youtube-dl}
