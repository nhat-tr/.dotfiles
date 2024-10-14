local icons     = EcoVim.icons

local git_icons = {
  added = icons.gitAdd,
  changed = icons.gitChange,
  copied = ">",
  deleted = icons.gitRemove,
  renamed = "➡",
  unmerged = "‡",
  untracked = "?",
}

return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('repo')
      require("telescope").load_extension("git_worktree")
      local actions = require('telescope.actions')

      require('telescope').setup {
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
          },
        },
        extensions = {
          fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      }
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "cljoly/telescope-repo.nvim" },
    },
    cmd = "Telescope",
    keys = {
      { "<C-p>",      "<CMD>lua require('plugins.telescope.pickers').project_files()<CR>" },
      { "<Leader><Leader>",      "<CMD>lua require('plugins.telescope.pickers').project_files()<CR>" },
      { "<S-p>",      "<CMD>lua require('plugins.telescope.multi-rg')()<CR>" },
      { "<Leader>pf", "<CMD>lua require('plugins.telescope.pickers').project_files({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<CR>" },
      { "<Leader>pw", "<CMD>lua require('telescope.builtin').grep_string({ initial_mode = 'normal' })<CR>" },
      { "<Leader>sb", "<CMD>lua require('plugins.telescope.pickers').buffer_search()<CR>",                                                                    { desc = "Buffer Search" } }
    }
  }
}
