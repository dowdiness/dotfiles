source "$HOME/.ghq/github.com/dowdiness/dotfiles/fish/common.fish"

# initialize rbenv
status --is-interactive; and source (rbenv init -|psub)

# initialise nodenv
status --is-interactive; and source (nodenv init -|psub)

# initialize pyenv
if which pyenv-virtualenv-init > /dev/null
        status --is-interactive; and source (pyenv init -|psub)
end

# To install useful key bindings and fuzzy completion:
# (brew --prefix) /opt/fzf/install

# path for postgresql
set -x PGDATA /usr/local/var/postgres/

# path for hub
set -x BROWSER open

# https://github.com/starship/starship init
eval (starship init fish)
