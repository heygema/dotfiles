#!/bin/sh

UNDOTTED="./undotted"

files=(
"$HOME/.vimrc"
"$HOME/.tmux.conf"
"$HOME/.extend.vim"
"$HOME/.config/nvim/static/neovim.cat"
"$HOME/.config/nvim/init.lua"
"$HOME/.config/nvim/lua/v/basic.lua"
"$HOME/.config/nvim/lua/v/conf_dashboard.lua"
"$HOME/.config/nvim/lua/v/packages.lua"
"$HOME/.config/nvim/lua/v/preferences.lua"
"$HOME/.config/nvim/lua/v/keymaps.lua"
"$HOME/.config/nvim/lua/v/my_lsp.lua"
"$HOME/.config/nvim/lua/v/debugger.lua"
"$HOME/.vim/coc-settings.json"
"$HOME/.config/nvim/coc-settings.json"
"$HOME/.zshrc"
"$HOME/.gitconfig"
"$HOME/.config/kitty/kitty.conf"
"$HOME/.config/alacritty/alacritty.yml"
"$HOME/.tmux.conf.local"
)
repo_files=(
"$UNDOTTED/vimrc"
"$UNDOTTED/tmux.conf"
"$UNDOTTED/extend.vim"
"$UNDOTTED/nvim/static/neovim.cat"
"$UNDOTTED/old.init.lua"
"$UNDOTTED/old.nvim/lua/basic.lua"
"$UNDOTTED/old.nvim/lua/conf_dashboard.lua"
"$UNDOTTED/old.nvim/lua/packages.lua"
"$UNDOTTED/old.nvim/lua/preferences.lua"
"$UNDOTTED/old.nvim/lua/keymaps.lua"
"$UNDOTTED/old.nvim/lua/my_lsp.lua"
"$UNDOTTED/old.nvim/lua/debugger.lua"
"$UNDOTTED/coc-settings.vim8.json"
"$UNDOTTED/coc-settings.json"
"$UNDOTTED/zshrc"
"$UNDOTTED/gitconfig"
"$UNDOTTED/kitty.conf"
"$UNDOTTED/alacritty.yml"
"$UNDOTTED/tmux.conf.local"
)


# way 1 
#declare -a configs=(
  #["source"]="$HOME/.vimrc" ["location"]="$UNDOTTED/vimrc"
  #["source"]="$HOME/.tmux.conf" ["location"]="$UNDOTTED/tmux.conf"
  #["source"]="$HOME/.extend.vim" ["location"]="$UNDOTTED/extend.vim"
#)

#for object in "${objects[@]}"; do
  #source="${object["source"]}"
  #location="${object["location"]}"
   #Do something with source and location
#done
#
#

# declare -a configs=(
#   ("$HOME/.vimrc" "$UNDOTTED/vimrc")
# )

# way 2 
#declare -A configs
#configs=(
  #[vimrc]=("$HOME/.vimrc" "$UNDOTTED/vimrc")
  #[tmux_conf]=("$HOME/.tmux.conf" "$UNDOTTED/tmux.conf")
  #[extend_vim]=("$HOME/.extend.vim" "$UNDOTTED/extend.vim")
  #[neovim_cat]=("$HOME/.config/nvim/static/neovim.cat" "$UNDOTTED/nvim/static/neovim.cat")
  #[init_lua]=("$HOME/.config/nvim/init.lua" "$UNDOTTED/init.lua")
  #[basic_lua]=("$HOME/.config/nvim/lua/v/basic.lua" "$UNDOTTED/nvim/lua/basic.lua")
  #[conf_dashboard_lua]=("$HOME/.config/nvim/lua/v/conf_dashboard.lua" "$UNDOTTED/nvim/lua/conf_dashboard.lua")
  #[packages_lua]=("$HOME/.config/nvim/lua/v/packages.lua" "$UNDOTTED/nvim/lua/packages.lua")
  #[preferences_lua]=("$HOME/.config/nvim/lua/v/preferences.lua" "$UNDOTTED/nvim/lua/preferences.lua")
  #[keymaps_lua]=("$HOME/.config/nvim/lua/v/keymaps.lua" "$UNDOTTED/nvim/lua/keymaps.lua")
  #[my_lsp_lua]=("$HOME/.config/nvim/lua/v/my_lsp.lua" "$UNDOTTED/nvim/lua/my_lsp.lua")
  #[debugger_lua]=("$HOME/.config/nvim/lua/v/debugger.lua" "$UNDOTTED/nvim/lua/debugger.lua")
  #[coc_settings_vim8]=("$HOME/.vim/coc-settings.json" "$UNDOTTED/coc-settings.vim8.json")
  #[coc_settings]=("$HOME/.config/nvim/coc-settings.json" "$UNDOTTED/coc-settings.json")
  #[zshrc]=("$HOME/.zshrc" "$UNDOTTED/zshrc")
  #[gitconfig]=("$HOME/.gitconfig" "$UNDOTTED/gitconfig")
  #[kitty_conf]=("$HOME/.config/kitty/kitty.conf" "$UNDOTTED/kitty.conf")
  #[alacritty]=("$HOME/.config/alacritty/alacritty.yml" "$UNDOTTED/alacritty.yml")
  #[tmux_conf_local]=("$HOME/.tmux.conf.local" "$UNDOTTED/tmux.conf.local")
#)

#for config in "${!configs[@]}"; do
  #machine_source="${configs[$config][0]}"
