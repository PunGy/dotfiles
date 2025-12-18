function ptest
    #pnpm run test:all $argv 2>&1 | grep -v -e Destroyable -e mobx
    pnpm run test:all $argv
end

