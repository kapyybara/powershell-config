# Prompt
Import-Module posh-git
Import-Module oh-my-posh

# Load prompt config 
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'iwku.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# Icon
Import-Module Terminal-Icons

# PSReadlline
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias ll ls 
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias y yarn 
Set-Alias c cat
Set-Alias n nvim 
Set-Alias p pwd 
Set-Alias j z 
Set-Alias open explorer
Set-Alias fuck thefuck 
Set-Alias psql "C:\Program Files\PostgreSQL\14\scripts\runpsql.bat"

# Tree
function Set-Tree { & treee -f --ignore 'node_modules/, .git/, .gitignore' -a $args }
Set-Alias te Set-Tree

# Common App
Set-Alias pm 'C:\Users\beo16\AppData\Local\Postman\Postman.exe'
Set-Alias fm 'C:\Users\beo16\AppData\Local\Figma\Figma.exe'
Set-Alias chr 'C:\Program Files\Google\Chrome\Application\chrome.exe'
Set-Alias mgdb 'C:\Users\beo16\AppData\Local\MongoDBCompass\MongoDBCompass.exe'
Set-Alias zl 'C:\Users\beo16\AppData\Local\Programs\Zalo\Zalo.exe' 
Set-Alias sot 'C:\Users\beo16\AppData\Local\SourceTree\SourceTree.exe' 
Set-Alias notion 'C:\Users\beo16\AppData\Local\Programs\Notion\Notion.exe'

# XXX Web access
# Google search
function Set-GoogleSearch { 
	$search_query =	[String]::Join('+',$args)
	start chrome https://www.google.com/search?q=$search_query
}
Set-Alias google Set-GoogleSearch 
# Youtube search 
function Set-YoutubeSearch { 
	$search_query =	[String]::Join('+',$args)
	start chrome https://www.youtube.com/results?search_query=$search_query
}
Set-Alias ytb Set-YoutubeSearch 

# XXX Web access

# XXX Git
function Set-GitAdd { & git add $args }
Set-Alias gad  Set-GitAdd -Force -Option AllScope

function Set-GitCommit { & git commit -m $args }
Set-Alias gcm  Set-GitCommit -Force -Option AllScope

function Set-GitPush { & git push $args }
Set-Alias gp Set-GitPush -Force -Option AllScope

function Set-GitPushOrigin { & git push origin $args }
Set-Alias gpo Set-GitPushOrigin -Force -Option AllScope

function Set-GitFetch { & git fetch $args }
Set-Alias gf Set-GitFetch -Force -Option AllScope

function Set-GitCheckout { & git checkout $args }
Set-Alias gco Set-GitFetch -Force -Option AllScope

function Set-GitBranch { & git branch $args }
Set-Alias gbr Set-GitBranch -Force -Option AllScope

function Get-GitRemote { & git remote -v $args }
Set-Alias grmt Get-GitRemote -Force -Option AllScope

function Get-GitPull { & git pull $args }
Set-Alias gpl Get-GitPull -Force -Option AllScope
# XXX Git

# Ultilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue | 
		Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue 
}
