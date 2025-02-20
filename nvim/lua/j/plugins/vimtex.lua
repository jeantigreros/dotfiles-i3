return {
  {
    'lervag/vimtex',
    config = function()
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_quickfix_mode = 0
      vim.o.conceallevel = 0
      vim.g.tex_conceal = 'abdmg'
      vim.g.vimtex_compiler_latexmk = {
       options = {
          '-pdf', -- generate pdf output
          '-interaction=nonstopmode', -- Non-stop mode for compilation
          '-synctex=1', -- Enable SyncTeX for live preview
        }
      }
    end
  }
} 
