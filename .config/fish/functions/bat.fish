function bat
	set -x XDG_CONFIG_HOME ~/.config
	command bat --theme TokyoNight-$THEME --italic-text always -m .Brewfile:Ruby $argv
end
