function ghq-new
    set -l REPONAME $argv

    if test -z "$REPONAME"
        echo 'Repository name must be specified.'
        return
    end

    set -l TMPDIR '/tmp/ghq_new'
    set -l TMPREPODIR "$TMPDIR/$REPONAME"

    mkdir -p "$TMPREPODIR"
    cd "$TMPREPODIR"

    hub init
    hub create

    set -l REPOURL (git remote get-url origin)
    set -l REPOPATH (echo $REPOURL | sed -e 's/^https:\/\///' -e 's/^git@//' -e 's/\.git$//' -e 's/github.com:/github.com\//')
    set -l USER_REPO_NAME (echo $REPOPATH | sed -e 's/^github\.com\///')

    ghq get $USER_REPO_NAME

    cd (ghq root)/$REPOPATH

    rm -rf $TMPREPODIR
end
