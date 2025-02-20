return {
  {
    "tpope/vim-fugitive"
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gw", ":Gitsigns toggle_word_diff<CR>, {}")
      vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk_inline<CR>, {}")
    end
  }
}

