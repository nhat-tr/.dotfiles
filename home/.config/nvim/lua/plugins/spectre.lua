return {
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    keys = {
      {
        "<Leader>pr",
        "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
        desc = "refactor",
      },
      {
        "<Leader>pr",
        "<cmd>lua require('spectre').open_visual()<CR>",
        mode = "v",
        desc = "refactor",
      },
      {
        "<C-M>f",
        "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
        mode = "n",
        desc = "search on current file",
      }
    }
  },
}
