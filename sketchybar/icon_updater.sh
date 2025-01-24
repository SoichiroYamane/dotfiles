#!/usr/bin/env bash

# if tmp_icons exists, remove it
if [ -d "tmp_icons" ]; then
  echo "Removing existing tmp_icons directory..."
  rm -rf tmp_icons
fi

git clone https://github.com/SoichiroYamane/sketchybar-app-font-bg tmp_icons

cd ./tmp_icons || exit

if pnpm install; then
  echo "done: pnpm install"
else
  echo "pnpm install failed"
fi

if pnpm run build:install; then
  echo "done: pnpm run build:install"
  cd ..
else
  echo "pnpm build:install failed"
  exit 1
fi

# replace ttf
# move ./tmp_icons/public/dist/sketchybar-app-font-bg.ttf to $HOME/Library/Fonts/sketchybar-app-font-bg.ttf
mv ./tmp_icons/public/dist/sketchybar-app-font-bg.ttf "$HOME/Library/Fonts/sketchybar-app-font-bg.ttf"

# replace icon_map.lua
# move ./tmp_icons/public/dist/icon_map.lua to $HOME/.config/sketchybar/helpers/icon_map.lua
mv ./tmp_icons/public/dist/icon_map.lua "$HOME/.config/sketchybar/helpers/icon_map.lua"

# Cleanup: remove the cloned repository folder
rm -rf tmp_icons

echo "Font installed successfully to $HOME/Library/Fonts/sketchybar-app-font-bg.ttf"

brew services restart sketchybar
