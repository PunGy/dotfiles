# Setup kitty tabs
function setup-tabs
  set active_tab_id (kitty @ ls | jq -r '.[].tabs[] | select(.is_focused == true) | .id')

  # Iterate over each tab and close those that are not active
  for tab_id in (kitty @ ls | jq -r '.[].tabs[].id')
      if test $tab_id != $active_tab_id
          kitty @ close-tab --match id:$tab_id
      end
  end

  kitty @ set-tab-title "Misc"
  kitty @ launch --type=tab --title "Notes" --cwd "~/Documents/pungy-db" --dont-take-focus
  # consider move make a backround window
  kitty @ launch --type=tab --title "Bot" --cwd "~/Develop/telegram-webcam-bot" --dont-take-focus
  kitty @ launch --type=tab --title "Develop" --dont-take-focus
end
