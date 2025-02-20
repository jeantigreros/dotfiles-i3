vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup("j.plugins")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.linebreak = true
vim.opt.spelllang = {'en_us', 'es_es'}

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"html", "markdown","text","tex"},
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_set_keymap('i', '<C-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u', { noremap = true, silent = true})



-- nvim-tree binds 
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- nvim-ale config
 vim.cmd [[
   let g:ale_linters = {
       \ 'typescript': ['ts_ls'],
       \ 'typescriptreact': ['ts_ls'],
       \ }
   let g:ale_fixers = {
       \ 'typescript': ['prettier'],
       \ 'typescriptreact': ['prettier'],
       \ }
   let g:ale_fix_on_save = 1
 ]]

-- telescope binds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- save
vim.keymap.set('n', '<C-s>', ":w<CR>", { noremap = true})

-- astro
local lspconfig = require("lspconfig")
lspconfig.astro.setup({})

-- python run
vim.keymap.set('n', '<leader>p', ':term python3 %<CR>', { noremap = true, silent = true} )

-- rest.nvim config

vim.g.rest_nvim = {
  vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>", { desc = "Run HTTP request" }),
  vim.keymap.set("n", "<leader>rp", "<cmd>Rest run last<CR>", { desc = "Repeat last request" }),
  vim.keymap.set("n", "<leader>rl", "<cmd>Rest log<CR>", { desc = "Show request log" }),
}

-- local replace
vim.keymap.set("n", "<leader>sr", function()
  local old_var = vim.fn.input("Old variable: ")
  local new_var = vim.fn.input("New variable: ")
  if old_var ~= "" and new_var ~= "" then
    vim.cmd(string.format("%%s/%s/%s/g", old_var, new_var))
  end
end, { desc = "Replace variable in file" })


vim.api.nvim_create_autocmd("FileType", {
    pattern = "json",
    callback = function(ev)
        vim.bo[ev.buf].formatprg = "jq"
        print("It's a json file")
    end,
})


vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
