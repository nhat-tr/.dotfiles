-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local signs = require 'gitsigns'
      signs.setup {
        signs = {
          add = { text = '▎' },
          change = { text = '▎' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 700,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 700,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
          -- Options passed to nvim_open_win
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- ╭──────────────────────────────────────────────────────────╮
          -- │ Keymappings                                              │
          -- ╰──────────────────────────────────────────────────────────╯

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              return ']c'
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then
              return '[c'
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map({ 'n', 'v' }, '<leader>ghs', gs.stage_hunk, { desc = 'stage hunk' })
          map({ 'n', 'v' }, '<leader>ghr', gs.reset_hunk, { desc = 'reset hunk' })
          map('n', '<leader>ghS', gs.stage_buffer, { desc = 'stage buffer' })
          map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = 'undo stage' })
          map('n', '<leader>ghR', gs.reset_buffer, { desc = 'reset buffer' })
          map('n', '<leader>ghp', gs.preview_hunk, { desc = 'preview hunk' })
          map('n', '<leader>gm', function()
            gs.blame_line { full = true }
          end, { desc = 'blame line' })
          map('n', '<leader>ghd', gs.diffthis, { desc = 'diff hunk' })
          map('n', '<leader>ght', gs.toggle_deleted, { desc = 'toggle deleted' })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
      }
    end,
    keys = {
      { '<leader>ghd' },
      { '<leader>ghp' },
      { '<leader>ghR' },
      { '<leader>ghr' },
      { '<leader>ghs' },
      { '<leader>ghS' },
      { '<leader>ght' },
      { '<leader>ghu' },
    },
  },

  {
    'ThePrimeagen/git-worktree.nvim',
    lazy = false,
    -- config = function()
    --   require 'nhat.plugins.git.worktree'
    -- end,
    opts = {
      change_directory_command = 'cd', -- default: "cd",
      update_on_change = true, -- default: true,
      update_on_change_command = 'e .', -- default: "e .",
      clearjumps_on_change = true, -- default: true,
      autopush = false, -- default: false,
    },
    keys = {
      { '<Leader>gww', desc = 'worktrees' },
      { '<Leader>gwc', desc = 'create worktree' },
    },
  },

  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitCurrentFile',
      'LazyGitFilterCurrentFile',
      'LazyGitFilter',
    },
    keys = {
      { '<Leader>gg', '<cmd>LazyGit<CR>', desc = 'lazygit' },
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 0.95
    end,
  },
}
