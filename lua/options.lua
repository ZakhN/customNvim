
vim.opt.relativenumber = true
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)


vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

