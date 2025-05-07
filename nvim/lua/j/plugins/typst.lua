  return {  "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,

    config = function()
      vim.api.nvim_create_user_command("WatchAndOpen", function()
        local file = vim.fn.expand("%:p") 
        local pdf_file = vim.fn.expand("%:p:r") .. ".pdf"
        local escaped_file = vim.fn.shellescape(file)
        local escaped_pdf_file = vim.fn.shellescape(pdf_file)
    
        vim.cmd("sp")
        vim.cmd("resize 8")
        vim.cmd("terminal typst watch " .. escaped_file)
        vim.cmd("wincmd h")
        vim.cmd("silent !zathura " .. escaped_pdf_file .." &")
      end, {})
    
      -- Keybindings
      vim.api.nvim_set_keymap("n", "<leader>zw", ":WatchAndOpen<CR>", { noremap = true, silent = true })
    end
  }
