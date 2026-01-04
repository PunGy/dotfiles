function gr
    for param in $argv
        switch $param
            case s
                git status
            case a
                git add .
            case u
                git pull --rebase=true
            case c
                git commit
            case cf
                git commit --amend --no-edit
            case p
                set -l branch (git branch --show-current)
                git push origin $branch
            case pf
                set -l branch (git branch --show-current)
                git push origin $branch --force
            case '*'
                echo "Invalid option: $param"
                _help
        end
    end
end

function _help
    echo "Usage: gr [option]..."
    echo "  s - status"
    echo "  a - stage all content"
    echo "  u - rebase"
    echo "  c - commit"
    echo "  cf - commit with ammend"
    echo "  p - push changes"
    echo "  pf - force push changes"
end
