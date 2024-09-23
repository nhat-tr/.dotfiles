return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
        indent = {
          char = "▏",
          tab_char = "▏",
        },
        exclude = {
          filetypes = {
            "help",
            "startify",
            "dashboard",
            "lazy",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "text",
          },
          buftypes = {
            "terminal",
            "nofile",
          },
        },
      },
  },
}
