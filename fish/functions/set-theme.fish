function set-theme
    if test (count $argv) -ne 1
        echo "Usage: set-theme <light|dark>"
        return 1
    end

    switch $argv[1]
        case "light"
            kitty @ set-colors --all --configured ~/.config/kitty/modus-operandi.conf
            set -Ux THEME light
            echo "Switched to 'light' theme (dayfox-theme)"
        case "dark"
            kitty @ set-colors --all --configured ~/.config/kitty/modus-vivendi.conf
            set -Ux THEME dark
            echo "Switched to 'dark' theme (carbonfox-theme)"
        case '*'
            echo "Invalid theme. Available themes: light, dark"
            return 1
    end
end
