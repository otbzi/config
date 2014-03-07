# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

export SVN_EDITOR="vim"
export GOROOT="/usr/local/Cellar/go/1.1"
export PATH=/usr/local/share/npm/bin:$PATH

# Customize to your needs...
alias findpy="find . -name '*.py' | xargs grep --color"
alias findh="find . -name '*.h' | xargs grep --color"
alias findcpp="find . -name '*.cpp' | xargs grep --color"
alias findhtml="find . -name '*.html' | xargs grep --color"
alias findc="find . -name '*.c' | xargs grep --color"
alias findjs="find . -name '*.js' | xargs grep --color"
alias findn="find . -name"

alias b="cd ~/douban"
alias t="cd ~/dev"

alias sa="source ~/douban/s-env/bin/activate"
alias da="source ~/douban/dae/venv/bin/activate"
alias ta="source ~/dev/toe-env/bin/activate"
alias ja="source ~/douban/jaeger/venv/bin/activate"
alias de="deactivate"

alias fili="ssh zengfanyu@fili"
alias dev2="ssh zengfanyu@doubandev2"
alias th="ssh zengfanyu@theoden"
alias re="lein repl"


removeunuseoriginbranch ()
{
    git co master;
    code sync;
    git remote update origin upstream > /dev/null;
    git branch --merged | grep --color=auto -v master | xargs git branch -d;
    git remote prune origin;
    for branch in `git remote show origin | grep tracked | awk '{print $1}'`;
        do
            if [[ -z `git log upstream/master..origin/$branch` ]]; then
                if ! git branch | grep --color=auto -q $branch; then
                    git push origin :$branch;
                fi;
            fi;
        done
}

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
