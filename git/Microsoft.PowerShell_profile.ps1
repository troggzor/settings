# Custom Git aliases
Write-Host "Git aliases activated"

function git-pull { git pull }
Set-Alias -Name pl -Value git-pull -Option AllScope -Force

function git-checkout { git checkout $args }
Set-Alias -Name co -Value git-checkout -Option AllScope -Force

function git-checkoutbranch { git checkout -b $args }
Set-ALias -Name cob -Value git-checkoutbranch -Option AllScope -Force

function git-log { git log --color --oneline --pretty=format:'%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(18)%aN%Cred%d %Creset%s' --abbrev-commit --date=relative }
Set-Alias -Name l -Value git-log -Option AllScope -Force

function git-commit { $branch = (git rev-parse --abbrev-ref HEAD); $task = $branch -replace '(.+?)/(.+?)/(\d+)', '#$3'; $args[0] += "`r`n`r`n$task"; git commit -m $args }
Set-Alias -Name c -Value git-commit -Option AllScope -Force

function git-branchlist { 
	if ($args -and $args[0]) {
 		git branch -l | Select-String -pattern $args[0]
	} else {
 		git branch -l 
	}
} 
Set-Alias -Name bl -Value git-branchlist -Option AllScope -Force

function git-status { git status -s }
Set-Alias -Name s -Value git-status -Option AllScope -Force

function git-push { git push -u origin (git rev-parse --abbrev-ref HEAD) }
Set-Alias -Name p -Value git-push -Option AllScope -Force

function git-add { git add $args }
Set-Alias -Name add -Value git-add -Option AllScope -Force

function git-diff { git difftool --diff-filter=M -y }
Set-Alias -Name dt -Value git-diff -Option AllScope -Force

function git-diffcached { git difftool --diff-filter=M -y --cached }
Set-Alias -Name dtc -Value git-diffcached -Option AllScope -Force

# END Custom Git aliases
