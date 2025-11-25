# 🚀 nvrush

<p align="center">
  <a href="https://dotfyle.com/nvrush/nvrush">
    <img src="https://dotfyle.com/nvrush/nvrush/badges/plugins?style=for-the-badge&colorA=1e1e2e&colorB=ff79c6" alt="Plugins">
  </a>
  <a href="https://dotfyle.com/nvrush/nvrush">
    <img src="https://dotfyle.com/nvrush/nvrush/badges/leaderkey?style=for-the-badge&colorA=1e1e2e&colorB=8be9fd" alt="Leader Key">
  </a>
  <a href="https://dotfyle.com/nvrush/nvrush">
    <img src="https://dotfyle.com/nvrush/nvrush/badges/plugin-manager?style=for-the-badge&colorA=1e1e2e&colorB=50fa7b" alt="Plugin Manager">
  </a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Neovim-0.10+-ff5555?style=for-the-badge&logo=neovim&logoColor=white&color=282a36&labelColor=282a36" alt="Neovim">
  <img src="https://img.shields.io/badge/Lua-5.1+-8be9fd?style=for-the-badge&logo=lua&logoColor=white&color=282a36&labelColor=282a36" alt="Lua">
  <img src="https://img.shields.io/badge/Lazy.nvim-Plugin_Manager-f1fa8c?style=for-the-badge&logo=neovim&logoColor=282a36&color=282a36&labelColor=282a36" alt="Lazy">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/NvChad-Inspired-ff79c6?style=for-the-badge&logo=neovim&logoColor=white&color=282a36&labelColor=282a36" alt="NvChad">
  <img src="https://img.shields.io/badge/LunarVim-Compatible-8be9fd?style=for-the-badge&logo=vim&logoColor=white&color=282a36&labelColor=282a36" alt="LunarVim">
  <img src="https://img.shields.io/badge/LazyVim-Structure-50fa7b?style=for-the-badge&logo=neovim&logoColor=282a36&color=282a36&labelColor=282a36" alt="LazyVim">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/License-MIT-ffb86c?style=for-the-badge&color=282a36&labelColor=282a36" alt="License">
  <img src="https://img.shields.io/github/stars/nvrush/nvrush?style=for-the-badge&color=ff79c6&labelColor=282a36" alt="Stars">
  <img src="https://img.shields.io/github/forks/nvrush/nvrush?style=for-the-badge&color=8be9fd&labelColor=282a36" alt="Forks">
  <img src="https://img.shields.io/github/issues/nvrush/nvrush?style=for-the-badge&color=50fa7b&labelColor=282a36" alt="Issues">
</p>

<p align="center">
  <i>⚡ A blazingly fast, modern Neovim configuration inspired by NvChad, LunarVim & LazyVim</i>
</p>


[![Dotfyle Stats](https://dotfyle.com/plugins/<nvrush>/<nvrush>/shield)](https://dotfyle.com/plugins/<nvrush>/<nvrush>)
![Screenshot_20251125_072755](https://github.com/user-attachments/assets/87cdf801-daf6-4f82-8ae3-a89199a1566c)
![Screenshot_20251125_071550](https://github.com/user-attachments/assets/9d554a5a-e4ef-42df-b4c8-d32a7ecd9779)
![Screenshot_20251125_072511](https://github.com/user-attachments/assets/775e5efa-9550-4a83-9856-2017843e15d0)
![Screenshot_20251125_072049](https://github.com/user-attachments/assets/69f55bea-2a50-48cd-8699-5224a57803b5)
![Screenshot_20251125_071340](https://github.com/user-attachments/assets/29c00f8f-cb6b-4fc6-9049-10bac8e5ce22)


## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.
 > It may take about 200 MIB data to setup!
 > You may have to reload your color scheme with :colorscheme gruvbox-baby as some themes may look a bit dull on fresh start !

Clone the repository and install the plugins:
```sh
mkdir -p ~/.config/nvrush
cd ~/.config/nvrush
git clone https://github.com/nvrush/nvrush.git .
NVIM_APPNAME=nvrush nvim
```

Make launch easy : 
```sh
# For Bash 
echo "alias nvr='NVIM_APPNAME=nvrush nvim'" >> ~/.bashrc
source ~/.bashrc
# For Zsh:
echo "alias nvr='NVIM_APPNAME=nvrush nvim'" >> ~/.zshrc
source ~/.zshrc
```

Delete with : 

```sh
rm -rf ~/.config/nvrush/
rm -rf ~/.local/share/nvrush/
```

## Plugins
Nvrush is a set of about 88 plugins as of 25 Nov 2025 , it is full of a big wardobe of editor themes which are about 83. This Distro runs with the support of plugin makers. So please do give your lovely plugins a star.
You are free to add your custom plugins & Mason support is also available though not tested.

### bars-and-lines

+ [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)
### code-runner

+ [stevearc/overseer.nvim](https://dotfyle.com/plugins/stevearc/overseer.nvim)
### colorscheme
About 83 Themes !
+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
+ [tiagovla/tokyodark.nvim](https://dotfyle.com/plugins/tiagovla/tokyodark.nvim)
+ [shaunsingh/nord.nvim](https://dotfyle.com/plugins/shaunsingh/nord.nvim)
+ [sainnhe/sonokai](https://dotfyle.com/plugins/sainnhe/sonokai)
+ [savq/melange-nvim](https://dotfyle.com/plugins/savq/melange-nvim)
+ [rmehri01/onenord.nvim](https://dotfyle.com/plugins/rmehri01/onenord.nvim)
+ [EdenEast/nightfox.nvim](https://dotfyle.com/plugins/EdenEast/nightfox.nvim)
+ [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
+ [rebelot/kanagawa.nvim](https://dotfyle.com/plugins/rebelot/kanagawa.nvim)
+ [projekt0n/github-nvim-theme](https://dotfyle.com/plugins/projekt0n/github-nvim-theme)
+ [ellisonleao/gruvbox.nvim](https://dotfyle.com/plugins/ellisonleao/gruvbox.nvim)
+ [rose-pine/neovim](https://dotfyle.com/plugins/rose-pine/neovim)
+ [Mofiqul/vscode.nvim](https://dotfyle.com/plugins/Mofiqul/vscode.nvim)
+ [sainnhe/gruvbox-material](https://dotfyle.com/plugins/sainnhe/gruvbox-material)
+ [olivercederborg/poimandres.nvim](https://dotfyle.com/plugins/olivercederborg/poimandres.nvim)
+ [sainnhe/everforest](https://dotfyle.com/plugins/sainnhe/everforest)
+ [navarasu/onedark.nvim](https://dotfyle.com/plugins/navarasu/onedark.nvim)
### comment

+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### debugging

+ [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
+ [theHamsta/nvim-dap-virtual-text](https://dotfyle.com/plugins/theHamsta/nvim-dap-virtual-text)
### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
### editing-support

+ [debugloop/telescope-undo.nvim](https://dotfyle.com/plugins/debugloop/telescope-undo.nvim)
+ [folke/snacks.nvim](https://dotfyle.com/plugins/folke/snacks.nvim)
+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
### file-explorer

+ [nvim-tree/nvim-tree.lua](https://dotfyle.com/plugins/nvim-tree/nvim-tree.lua)
+ [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)
+ [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)
### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
### fun

+ [MaximilianLloyd/ascii.nvim](https://dotfyle.com/plugins/MaximilianLloyd/ascii.nvim)
### fuzzy-finder

+ [jvgrootveld/telescope-zoxide](https://dotfyle.com/plugins/jvgrootveld/telescope-zoxide)
+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [kdheepak/lazygit.nvim](https://dotfyle.com/plugins/kdheepak/lazygit.nvim)
### icon

+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
+ [echasnovski/mini.icons](https://dotfyle.com/plugins/echasnovski/mini.icons)
### indent

+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
### keybinding

+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
### lsp

+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### marks

+ [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)
### nvim-dev

+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
### plugin-manager
This is main Plugin Manager & is easy to manage: 
+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### project
Workspace is under Devlopment so please do use sessions or Harpoon instead
+ [nvim-telescope/telescope-project.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope-project.nvim)
+ [natecraddock/workspaces.nvim](https://dotfyle.com/plugins/natecraddock/workspaces.nvim)
+ [ahmedkhalf/project.nvim](https://dotfyle.com/plugins/ahmedkhalf/project.nvim)
### scrolling

+ [karb94/neoscroll.nvim](https://dotfyle.com/plugins/karb94/neoscroll.nvim)
### session
The best session plugins : 
+ [stevearc/resession.nvim](https://dotfyle.com/plugins/stevearc/resession.nvim)
+ [rmagatti/auto-session](https://dotfyle.com/plugins/rmagatti/auto-session)
### snippet
The main snippets are from LuaSnip to add snipet di visit ~/.config/nvrush/lua/user/Snippets/
All you have to do is to declare snippets for custom file with the file name say c.json & here syntax are Mostly closest to the VScode json snippets.
+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
### split-and-window

+ [beauwilliams/focus.nvim](https://dotfyle.com/plugins/beauwilliams/focus.nvim)
### startup

+ [nvimdev/dashboard-nvim](https://dotfyle.com/plugins/nvimdev/dashboard-nvim)
+ [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)
### statusline
Best picks for status line: 
+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
+ [rebelot/heirline.nvim](https://dotfyle.com/plugins/rebelot/heirline.nvim)
### syntax
These are fine but better to use Mason !
+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
+ [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)
### tabline
Very beautiful tabs: 
+ [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)
### terminal-integration
Nice working terminal: 
+ [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim)
### utility
Best utility picks : 
+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
+ [echasnovski/mini.nvim](https://dotfyle.com/plugins/echasnovski/mini.nvim)
+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
+ [leath-dub/snipe.nvim](https://dotfyle.com/plugins/leath-dub/snipe.nvim)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
## Language Servers
To add custom langauge servers all you have to do is to visit ~/.config/nvrush/lua/user/config/LspBatch/lsp.lua
Do scroll to the table of langauge servers and add yours just like others are added.
Note We don't provide LSP Servers we only do configure them ! 
To make a servers working pick & download it yourself as per lsp.lua or your custom configs: 
The available configs for lsp-servers are : 
+ clangd
+ cmake
+ gdscript -- You need to stablish your connection yourself as per your system. Do take refrence from Godot 4.5
+ gopls
+ html, css, js
+ lua_ls
+ marksman
+ phpactor
+ taplo
+ vtsls
+ more

Licence : 
This Configured IDE is under MIT license & you are free to use it!
Credits : 
 This readme was generated by [Dotfyle](https://dotfyle.com)
 This is a configured Integrated Devlopment space and runs with the help of plugins created by plugin makers.
 
