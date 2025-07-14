-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 关闭相对行号 (LazyVim 默认为 true)
vim.opt.relativenumber = false

-- 将缩进宽度和 Tab 宽度都设置为 4 个空格 (LazyVim 默认为 2)
-- vim.opt.shiftwidth = 4
-- vim.opt.tabstop = 4

-- 禁用注释行自动延续
vim.opt.formatoptions:remove({ "r", "o" })
