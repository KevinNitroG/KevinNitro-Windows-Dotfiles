function df {
	git --git-dir=$env:USERPROFILE/KevinNitro-Dotfiles/ --work-tree=$env:USERPROFILE $args
}

function dfs {
	df pull
	df add -u
	df commit -m "$(Get-Date -Format 'h:mm tt on d/M/y')"
	df push
}

function dfa {
	df add $args
}
