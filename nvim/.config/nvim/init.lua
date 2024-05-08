-- Get the home directory
local home = vim.fn.expand('$HOME')

-- Set the path to the plugins.lua file
local plugins_file = home .. '/.config/nvim/plugins.lua'

-- Source the plugins.lua file
vim.cmd('source ' .. plugins_file)

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


-- Set leader key to <Space>
vim.api.nvim_set_keymap('', '<M-Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = 'M-'

-- Switch between panes while holding the leader key
vim.api.nvim_set_keymap('n', '<M-Left>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Down>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Up>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Right>', ':wincmd l<CR>', { noremap = true, silent = true })


-- Arrow keys for normal navigation
vim.api.nvim_set_keymap('n', '<Up>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Right>', { noremap = true, silent = true })

-- Toggle NvimTree
vim.api.nvim_set_keymap('n', '<M-e>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Toggle line numbers
vim.api.nvim_set_keymap('n', '<M-ln', ':set number!<CR>', { noremap = true, silent = true })

-- Key mapping for commenting/uncommenting lines
vim.api.nvim_set_keymap('n', '<Leader>c', ':Commentary<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<Leader>c', ':Commentary<CR>', { noremap = true, silent = true })

-- Close current pane
vim.api.nvim_set_keymap('n', '<M-w>', ':close<CR>', { noremap = true, silent = true })

