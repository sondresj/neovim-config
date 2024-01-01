# Neovim Config

Somewhat based on this guide: https://youtu.be/zHTeCSVAFNY?si=Mh2CgvhISSIFFmEO

## Requirements

- Nerd font: I prefer Jetbrains Mono NerdFont. This enables some of the plugins to use icons
- ripgrep: for fuzzy finding using telescope
- a terminal that supports a full color-space (not just 256-bit).
- neovim (duh)
- git (neovim plugins is based on git repos)

## Lua and Neovim configuration

Neovim looks for your configuration in ~/.config/nvim
Clone this repo into that directory, after starting `nvim` lazy should install the plugins etc.

Lua is like javascript in that `init.lua` is like `index.js`, ie the entrypoint.
in lua, everything `require`'d in `init.lua` will be .lua files inside the `lua` directory.

## Plugins and Lazy

The plugin manager chosen here is Lazy.
Lazy has a convention that allows to structure the plugins and it's configuration to be in separate files.
These must be in the `lua/plugins` directory. Lazy will then load all .lua files in there, and merge the returned tables into one, table of plugins that lazy should intall.

## Coplit

To enable Copilot, you must authenticate it, run `:Copilot auth` and follow the instructions

## TODO:

- Terminal mappings (mvp: in window splits. nth: floating and persistant)

