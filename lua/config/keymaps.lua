-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- key mappings --
-- 去掉方向键上下左右，全面拥抱hjkl --
-- visural --
vim.keymap.set({ "n", "i" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<Right>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<Down>", "<Nop>")
-- 行移动 --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- normal --
-- 窗口--
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口
-- 切换buffer --
vim.keymap.set("n", "L", ":bnext<CR>")
vim.keymap.set("n", "H", ":bprevious<CR>")
-- tmux --
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

