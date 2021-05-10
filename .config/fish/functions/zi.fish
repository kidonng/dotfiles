command -sq zoxide || exit

function zi
	set dir (zoxide query -i -- $argv) && cd $dir
end
