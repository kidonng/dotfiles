function bottle -a formula -w "brew bottle" -d "Build and upload Homebrew bottles to GitHub releases"
    set -l info (brew info --json $formula | string trim | string join "")
    set -l tap (string match -r '"tap": "([\w/]+)"' $info)[2]
    set -l ver (string match -r '"installed": \[\{"version": "([\d._]+)"' $info)[2]
    set -l stable (string match -r '"versions": \{"stable": "([\d.]+)"' $info)[2]
    set -l rev (string match -r '"revision": (\d+)' $info)[2]
    set -l repo (string replace / /homebrew- $tap)

    if test "$rev" != 0
        set stable $stable"_"$rev
    end

    if test -z "$ver"
        echo $formula is not installed! >&2
        return 1
    end

    if ! string match -q '*"built_as_bottle": true*' $info
        echo $formula is not built as bottle! >&2
        return 1
    end

    if test "$ver" != "$stable"
        echo Current version "($ver)" of $formula is not the latest "($stable)"! >&2
        return 1
    end

    set -l tag $formula-$ver
    set -l root https://github.com/$repo/releases/download/$tag

    echo Bottling $formula "($ver)" from $tap

    set -l tmp (mktemp -d)
    pushd $tmp

    brew bottle --json --root-url $root $formula
    brew bottle --merge --write *.json

    if test (count *) = 0
        echo Latest version of $formula is already bottled! >&2
        return 1
    end

    set -l repo_path (brew --repo $tap)
    set -l commit (git -C $repo_path rev-parse HEAD)
    git -C $repo_path tag $tag $commit
    git -C $repo_path push --atomic origin HEAD $tag

    rename -- - *.tar.gz
    gh release create -R $repo -n "" $tag *.tar.gz

    popd
    rm -r $tmp
end
