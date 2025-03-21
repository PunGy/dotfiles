# NOTE: pnpm only, change if you use another
# Decide how to start your dev server
# if you have a "start" script in your local package.json - it would use it
# otherwise would try to find "dev" script

function start
    if type -q pnpm and test -f package.json
        set pkg_content (cat package.json)
        if echo $pkg_content | grep -q "\"start\""
            pnpm run start
        else if echo $pkg_content | grep -q "\"dev\""
            pnpm run dev
        else
            echo "I don't know how to start"
        end

    else
        echo "no pnpm or package.json"
    end
end
