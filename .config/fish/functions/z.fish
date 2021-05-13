command -sq zoxide || exit

function z
	if test -z "$argv" || test "$argv" = - || test -d "$argv"
		cd $argv
	else
		set dir (zoxide query --exclude $PWD -- $argv) && cd $dir
	end
end
