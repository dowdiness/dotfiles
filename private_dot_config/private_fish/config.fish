#view
set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"
set -g theme_display_git_default_branch yes
set -g theme_color_scheme dark

if status is-interactive
    eval (/opt/homebrew/bin/brew shellenv)
    source "$HOME/ghq/github.com/dowdiness/dotfiles/fish/common.fish"
    source "$HOME/ghq/github.com/dowdiness/dotfiles/fish/path.fish"

    ## Launch The Fuck
    thefuck --alias | source
    ## Launch zoxide
    if type -q zoxide
        zoxide init fish | source
    end
    # initialize rbenv
    rbenv init - fish | source

    # initialise nodenv
    nodenv init - fish | source

    # initialize pyenv
    if which pyenv-virtualenv-init > /dev/null
        pyenv init - fish | source
    end

    # initialize jenv
    set PATH $HOME/.jenv/bin $PATH
    jenv init - fish | source

    # To install useful key bindings and fuzzy completion:
    # (brew --prefix) /opt/fzf/install

    # path for postgresql
    set -x PGDATA /usr/local/var/postgres/

    # path for hub
    set -x BROWSER open

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/AntiSatori/google-cloud-sdk/path.fish.inc' ]; . '/Users/AntiSatori/google-cloud-sdk/path.fish.inc'; end
    set -gx VOLTA_HOME "$HOME/.volta"
    set -gx PATH "$VOLTA_HOME/bin" $PATH

    #peco setting
    set fish_plugins theme peco

    function fish_user_key_bindings
        bind \cw peco_select_history
    end

    # https://noknow.info/it/shell_script/tips/curl_ssl_certificate_probrem_60?lang=ja
    set -x CURL_CA_BUNDLE /usr/local/share/curl/cacert.pem
    # ghcup-env
    set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/AntiSatori/.ghcup/bin $PATH
    # https://github.com/starship/starship init
    # eval (starship init fish)
end
