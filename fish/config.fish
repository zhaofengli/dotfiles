# Kanged from
#
# https://github.com/J3RN/dotfiles/blob/master/config.fish
# https://github.com/dideler/dotfiles/blob/master/.config/fish/config.fish
#
# ... and other similar ones

function fish_greeting
	if command -v fortune > /dev/null
		echo -e "\e[3m "(fortune literature riddles)"\e[0m\n"
	end
end

function prepend_path --description 'Prepends a path to PATH if it exists'
	if test -e $argv[1]
		set PATH $argv[1] $PATH
	end
end

function source_if_exists --description 'Sources a script if it exists'
	if test -e $argv[1]
		source $argv[1]
	end
end

alias git hub

set -x GOPATH $HOME/Go

prepend_path /usr/lib/ccache
prepend_path $HOME/.cabal/bin $PATH
prepend_path $HOME/.composer/vendor/bin
prepend_path $HOME/.npm-packages/bin $PATH
prepend_path $HOME/Android/Sdk/platform-tools
prepend_path $HOME/.local/google-cloud-sdk/bin
prepend_path $HOME/.pyenv/bin $PATH
prepend_path $HOME/.local/bin $PATH

abbr l 'ls -t'
abbr la 'ls -a'
abbr ll 'ls -lh'
abbr lla 'ls -lah'

abbr v 'vim'
abbr gd 'git diff'
abbr gds 'git diff --staged'
abbr gc 'git commit'
abbr gcm 'git commit -m'
abbr gca 'git commit -a'
abbr gcam 'git commit -am'
abbr gl 'git log --oneline --decorate'
abbr gg 'git log --graph --date=relative'
abbr ga 'git add'
abbr gap 'git add --patch'
abbr gco 'git checkout'
abbr gcob 'git checkout -b'
abbr gb 'git branch'
abbr gp 'git push'
abbr gpf 'git push -f'
abbr gpl 'git pull --rebase --autostash'
abbr gs 'git status --short --branch'

abbr serve 'php -S localhost:8080'

if command -v pyenv > /dev/null
	status --is-interactive; and source (pyenv init -|psub)
end

source_if_exists $HOME/.config/fish/private.fish
