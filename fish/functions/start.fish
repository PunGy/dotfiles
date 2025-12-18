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
