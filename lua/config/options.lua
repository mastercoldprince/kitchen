-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options herek

local option = vim.opt
local buffer = vim.b
local global = vim.g



-- 设置全局主题
-- global.colors_name = "gruvbox"

-- Global Settings --
-- 高亮光标行
option.cursorline = true

-- 文件在外部加载时，重新打开文件
option.autoread = true

-- 显示文件名在终端标题
option.title = true
-- 不懂的配置，
option.swapfile = false
option.backup = false

-- 更新时间
option.updatetime = 50
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.signcolumn = "yes"
-- 持久化撤销历史
option.undofile = true
-- 撤销文件保存路径
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')
-- 加载启用时，当前目录的.vimrc or .exrc
option.exrc = true
-- 警用自动换行
option.wrap = true
-- 自动补全不自动选中
global.completeopt = "menu,menuone,noselect,noinsert"
-- 搜索时高亮
option.hlsearch = true

-- 搜索时忽略大小写
option.ignorecase = true
option.smartcase = false

--配置搜索时自动完成选项
-- option.completeopt = { "menuone", "noselect" }
-- terminal --
-- option.wildmenu = true

-- 行号--
option.number = true
option.relativenumber = true

-- clipboard --
option.clipboard:append("unnamedplus")

-- Buffer Settings --
-- buffer.fileenconding = "utf-8"

-- mouse --
option.mouse = "a"

-- Global Settings --
global.mapleader = " "

-- color --
option.termguicolors = true
option.signcolumn = "yes"

-- status --
-- 设置为false配合插件使用
option.showmode = false

-- split --
option.splitright = true
option.splitbelow = true

-- 设置回退键的行为，允许删除缩进，空格，行首字符
option.backspace = { "indent", "eol", "start" }
-- 自动转行
option.textwidth = 80

-- tabline --
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.shiftround = true
option.autoindent = true
option.smartindent = true
