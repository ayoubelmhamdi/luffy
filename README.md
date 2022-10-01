# Luffy
is a **neovim** config without using the `init.lua` or `lua/`

1. [Philosophy](#Philosophy)
2. [Install packer](#install-packer)
3. [available configs](#available-configs)  

## Philosophy 
for me, any configuration need a`init.lua` or `lua/` this is a plugin,
that i should be create a plugin for it

whene i use only the dir called `plugin` and `after`, that help everybody,to
use my files without checking the `dependencies`

## install packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

```lua
return require('packer').startup(function()
use { 'wbthomason/packer.nvim' }
end)
```

## available configs
  - [ ] [treesitter](https://github.com/)  
