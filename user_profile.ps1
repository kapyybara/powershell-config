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
Set-Alias open explorer

# Common App
Set-Alias pm 'C:\Users\beo16\AppData\Local\Postman\Postman.exe'
Set-Alias fm 'C:\Users\beo16\AppData\Local\Figma\Figma.exe'
Set-Alias chr 'C:\Program Files\Google\Chrome\Application\chrome.exe'



## Git
function Set-GitCommit { & git commit -m $args }
Set-Alias commit  Set-GitCommit -Force -Option AllScope

function Set-GitAdd { & git add $args }
Set-Alias add  Set-GitAdd -Force -Option AllScope

function Set-GitPush { & git push $args }
Set-Alias push Set-GitPush -Force -Option AllScope

function Set-GitPush { & git push origin mainargs }
Set-Alias pom Set-GitPush -Force -Option AllScope

function Set-GitFetch { & git fetch $args }
Set-Alias fetch Set-GitFetch -Force -Option AllScope

function Set-GitCheckout { & git checkout $args }
Set-Alias check Set-GitFetch -Force -Option AllScope

function Set-GitBranch { & git branch $args }
Set-Alias br Set-GitBranch -Force -Option AllScope

function Get-GitRemote { & git remote -v $args }
Set-Alias remote Get-GitRemote -Force -Option AllScope

function Get-GitPull { & git pull $args }
Set-Alias pull Get-GitPull -Force -Option AllScope

# Ultilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue | 
		Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue 
}
