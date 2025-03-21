# Variables
FISH_PATH = $(HOME)/.config/fish
KITTY_PATH = $(HOME)/.config/kitty
HOME_FILES = .ghci .gitconfig

FISH_FILES = \
    fish_plugins \
    functions/files.fish \
    functions/nv.fish \
    functions/start.fish \
    functions/ptest.fish \
    functions/setup-tabs.fish \
    functions/set-theme.fish

# Phony targets
.PHONY: all sync sync_fish sync_kitty sync_home

# Default target to display a warning if called without specifying a target
all:
	@echo "ERROR: You must specify a target. Available targets:"
	@echo "  make sync         - Copy configs from destinations to local directory"
	@echo "  make install      - Copy configs from local directory back to destinations"
	@exit 1

sync: sync_fish sync_kitty sync_home

# Target to sync fish configurations
sync_fish:
	@echo "Syncing fish configs"
	@$(foreach file, $(FISH_FILES), \
		mkdir -p ./fish/$(dir $(file)); \
		cp $(FISH_PATH)/$(file) ./fish/$(file); \
		echo "Sync $(FISH_PATH)/$(file)"; \
	)

# Target to sync kitty configurations
sync_kitty:
	@echo "Syncing kitty config"
	@mkdir -p ./kitty
	@cp -r $(KITTY_PATH)/* ./kitty/

# Target to sync home directory files
sync_home:
	@echo "Syncing home directory"
	@$(foreach file, $(HOME_FILES), \
		mkdir -p ./home; \
		cp $(HOME)/$(file) ./home/$(file); \
		echo "Sync $(HOME)/$(file)"; \
	)


install: install_fish install_kitty install_home

install_kitty:
	@echo "Installing kitty"
	cp ./kitty/* $(KITTY_PATH)/

install_fish:
	@echo "Installing fish configs"
	@$(foreach file, $(FISH_FILES), \
		cp ./fish/$(file) $(FISH_PATH)/$(file); \
		echo "Install ./fish/$(file)"; \
	)

install_home:
	@echo "Installing home configs"
	@$(foreach file, $(HOME_FILES), \
		cp ./home/$(file) $(HOME)/$(file); \
		echo "Install ./home/$(file)"; \
	)
