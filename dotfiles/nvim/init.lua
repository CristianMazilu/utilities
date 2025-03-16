-- Set leader key
vim.g.mapleader = " "

-- Basic settings
vim.opt.number = true        -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = "a"          -- Enable mouse support
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.expandtab = true     -- Use spaces instead of tabs
vim.opt.shiftwidth = 4       -- Shift indentation by 4 spaces
vim.opt.tabstop = 4          -- A tab is 4 spaces

-- Keybindings
vim.keymap.set("n", "<leader>w", ":w<CR>")  -- Save with <leader>w
vim.keymap.set("n", "<leader>q", ":q<CR>")  -- Quit with <leader>q

-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load Lazy.nvim
vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")

require("lazy").setup({
  -- Example: Install Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end
  },
})

