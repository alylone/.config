-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- lua/config/keymaps.lua
local keymap = vim.keymap.set

-- <leader>rc ("Reload Config") 快捷键，用于快速 source init.lua
-- "n" 代表普通模式 (Normal mode)
-- { desc = "..." } 用于提供描述，会被 which-key 等插件显示
keymap("n", "<leader>rc", "<cmd>source $HOME/.config/nvim/init.lua<cr>", { desc = "Reload Config" })

-- 另一个例子：使用 <leader>q 关闭当前 buffer
keymap("n", "<leader>q", "<cmd>bdelete<cr>", { desc = "Close Buffer" })
