function ar
    for param in $argv
        switch $param
            case s
                arc status
            case a
                arc add .
            case u
                arc pull trunk
                arc rebase trunk
            case c
                arc commit --amend --no-edit
            case t
                arc checkout trunk
            case cm
                arc commit
            case pr
                arc pr create
            case p
                arc push -f
            case '*'
                echo "Invalid option: $param"
                _help
        end
    end
end

function _help
    echo "Usage: ar [action]..."
    echo ""
    echo "Actions can be chained."
    echo "Example: ar a c u p "
    echo "(stage all, commit ammend, rebase from trunk, force push)"
    echo ""
    echo "Available actions:"
    echo "  s - status"
    echo "  t - checkout to trunk"
    echo "  a - stage all content"
    echo "  u - pull from trunk"
    echo "  c - commit with ammend"
    echo "  cm - make new commit"
    echo "  p - force push changes"
    echo "  pr - make pr"
end
