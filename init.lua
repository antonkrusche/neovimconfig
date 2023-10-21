local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup('plugins')

require('anton')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'.clangd.setup{
    capabilities = capabilities
}

vim.cmd("let g:everforest_background = 'soft'")
vim.cmd("let g:gruvbox_material_background = 'soft'")
local colorscheme = 'everforest' -- 'everforest, gruvbox-material, catppuccin
require('lualine').setup{
    options = {
        theme = colorscheme, -- gruvbox-material, catppuccin
        sections = {lualine_c = {require('auto-session.lib').current_session_name}}
    }
}

vim.cmd.colorscheme(colorscheme)

vim.api.nvim_set_hl(0, "NeotreeDirectoryIcon", { link = "Directory" })
vim.api.nvim_set_hl(0, "NeotreeRootName", { link = "Directory" })

vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { link = "@error"} )
vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { link = "@type" })
vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { link = "@field" })
vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { link = "@debug" })
vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { link = "@string" })
vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { link = "@attribute" })
vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { link = "@conceal" })