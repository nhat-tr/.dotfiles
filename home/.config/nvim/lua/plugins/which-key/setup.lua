local present, wk = pcall(require, "which-key")
if not present then
  return
end

wk.setup {
  plugins = {
    marks = true,     -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false,   -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
      windows = false,   -- default bindings on <c-w>
      nav = false,       -- misc bindings to work with windows
      z = false,         -- bindings for folds, spelling and others prefixed with z
      g = false,         -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  win = {
    border = EcoVim.ui.float.border or "rounded", -- none, single, double, shadow, rounded
    padding = { 2, 2, 2, 2 },                     -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 4,                    -- spacing between columns
    align = "left",                 -- align columns left, center or right
  },
  show_help = true,                 -- show help message on the command line when the popup is visible
}

-- ignore
wk.add({
  { "<leader><leader>", hidden = true },
  { "<leader>1",        hidden = true },
  { "<leader>2",        hidden = true },
  { "<leader>3",        hidden = true },
  { "<leader>4",        hidden = true },
  { "<leader>5",        hidden = true },
  { "<leader>6",        hidden = true },
  { "<leader>7",        hidden = true },
  { "<leader>8",        hidden = true },
  { "<leader>9",        hidden = true },
})

-- single
wk.add({
  { "<leader>=", "<cmd>vertical resize +5<CR>", desc = "resize +5" },
  { "<leader>-", "<cmd>vertical resize -5<CR>", desc = "resize -5" },
  { "<leader>v", "<C-W>v",                      desc = "split right" },
  { "<leader>V", "<C-W>s",                      desc = "split below" },
  { "<leader>q", desc = "quicklist" },
})

wk.add({
  { "<leader>/",  group = "Ecovim" },
  { "<leader>/s", group = "Session" },
  { "<leader>//", "<cmd>Alpha<CR>",       desc = "open dashboard" },
  { "<leader>/c", "<cmd>e $MYVIMRC<CR>",  desc = "open config" },
  { "<leader>/i", "<cmd>Lazy<CR>",        desc = "manage plugins" },
  { "<leader>/u", "<cmd>Lazy update<CR>", desc = "update plugins" },
})

wk.add({
  { "<leader>a",  group = "Actions",                mode = { "n", "v" } },
  { "<leader>an", "<cmd>set nonumber!<CR>",         desc = "line numbers" },
  { "<leader>ar", "<cmd>set norelativenumber!<CR>", desc = "relative number" },
})

wk.add({
  { "<leader>b",  group = "Buffer" },
  { "<leader>bs", group = "Sort" },
  { "<leader>bc", '<cmd>lua require("utils").closeOtherBuffers()<CR>', desc = "Close but current" },
  { "<leader>bf", "<cmd>bfirst<CR>",                                   desc = "First buffer" },
})

wk.add({
  { "<leader>c",  group = "LSP",                                      mode = { "n", "v" } },
  { "<leader>ca", desc = "code action",                               mode = { "n", "v" } },
  { "<leader>cd", "<cmd>Trouble diagnostics toggle<CR>",              desc = "diagnostics (Trouble)" },
  { "<leader>cD", "<cmd>Telescope diagnostics wrap_results=true<CR>", desc = "workspace diagnostics" },
  { "<leader>cf", desc = "format",                                    mode = { "n", "v" } },
  { "<leader>cl", desc = "line diagnostics" },
  { "<leader>cr", desc = "rename" },
  { "<leader>cR", desc = "structural replace" },
  { "<leader>ct", '<cmd>LspToggleAutoFormat<CR>',                     desc = "toggle format on save" },
})

wk.add({
  { "<leader>d",  group = "Debug" },
  { "<leader>da", desc = "attach" },
  { "<leader>db", desc = "breakpoint" },
  { "<leader>dc", desc = "continue" },
  { "<leader>dC", desc = "close UI" },
  { "<leader>dd", desc = "continue" },
  { "<leader>dh", desc = "visual hover" },
  { "<leader>di", desc = "step into" },
  { "<leader>do", desc = "step over" },
  { "<leader>dO", desc = "step out" },
  { "<leader>dr", desc = "repl" },
  { "<leader>ds", desc = "scopes" },
  { "<leader>dt", desc = "terminate" },
  { "<leader>dU", desc = "open UI" },
  { "<leader>dv", desc = "log variable" },
  { "<leader>dV", desc = "log variable above" },
  { "<leader>dw", desc = "watches" },
})

wk.add({
  { "<leader>g",   group = "Git",                                                         mode = { "n", "v" } },
  { "<leader>ga",  "<cmd>!git add %:p<CR>",                                               desc = 'add current' },
  { "<leader>gA",  "<cmd>!git add .<CR>",                                                 desc = 'add all' },
  { "<leader>gb",  "<cmd>BlameToggle window<CR>",                                         desc = 'blame' },
  { "<leader>gB",  "<cmd>Telescope git_branches<CR>",                                     desc = 'branches' },
  { "<leader>gc",  group = "Conflict" },
  { "<leader>gh",  group = "Hunk" },
  { "<leader>ghr", desc = "reset hunk",                                                   mode = { "v" } },
  { "<leader>ghs", desc = "stage hunk",                                                   mode = { "v" } },
  { "<leader>gi",  "<cmd>Octo issue list<CR>",                                            desc = 'Issues List' },
  { "<leader>gl",  group = "Log" },
  { "<leader>glA", "<cmd>lua require('plugins.telescope.pickers').my_git_commits()<CR>",  desc = 'commits (Telescope)' },
  { "<leader>gla", "<cmd>LazyGitFilter<CR>",                                              desc = 'commits' },
  { "<leader>glC", "<cmd>lua require('plugins.telescope.pickers').my_git_bcommits()<CR>", desc = 'buffer commits (Telescope)' },
  { "<leader>glc", "<cmd>LazyGitFilterCurrentFile<CR>",                                   desc = 'buffer commits' },
  { "<leader>gm",  desc = 'blame line' },
  { "<leader>gp",  "<cmd>Octo pr list<CR>",                                               desc = 'Pull Requests List' },
  { "<leader>gs",  "<cmd>Telescope git_status<CR>",                                       desc = 'telescope status' },
  { "<leader>gw",  group = "Worktree" },
  { "<leader>gww", desc = 'worktrees' },
  { "<leader>gwc", desc = 'create worktree' },
})

wk.add({
  { "<leader>p",  group = "Project" },
  { "<Leader>pf", desc="Find git file", "<CMD>lua require('plugins.telescope.pickers').project_files({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<CR>" },
  { "<Leader>pw", desc="Find word", "<CMD>lua require('telescope.builtin').grep_string({ initial_mode = 'normal' })<CR>" },
  { "<leader>pl", desc="Find git repo cached", "<cmd>lua require'telescope'.extensions.repo.cached_list{file_ignore_patterns={'/%.cache/', '/%.cargo/', '/%.local/', '/%timeshift/', '/usr/', '/srv/', '/%.oh%-my%-zsh', '/Library/', '/%.cocoapods/'}}<CR>" },
  {
    "<Leader>pr",
    "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
    desc = "refactor",
    mode = { "n", "v" }
  },
})

wk.add({
  -- { "<leader>r", group = "Refactor", mode = { "n", "v" } },
})

wk.add({
  { "<leader>s",  group = "Search" },
  { "<leader>sc", "<cmd>Telescope colorscheme<CR>",                                  desc = "color schemes" },
  { "<leader>sd", "<cmd>lua require('plugins.telescope.pickers').edit_neovim()<CR>", desc = "dotfiles" },
  { "<leader>sh", "<cmd>Telescope oldfiles hidden=true<CR>",                         desc = "file history" },
  { "<leader>sH", "<cmd>lua require('plugins.telescope').command_history()<CR>",     desc = "command history" },
  { "<leader>ss", "<cmd>Telescope search_history theme=dropdown<CR>",                desc = "search history" },
  { "<leader>sq", "<cmd>Telescope quickfix<CR>",                                     desc = "quickfix list" },
})

wk.add({
  { "<leader>t",  group = "Table Mode",  mode = { "n", "v" } },
  { "<leader>tm", desc = { "toggle" } },
  { "<leader>tt", desc = { "tableize" }, mode = { "n", "v" } },
})

wk.add({
  { "<leader>s", "<cmd>'<,'>sort<CR>", desc = "sort", mode = { "v" } }
})

local function attach_markdown(bufnr)
  wk.add({
    { "<leader>a",  group = "Actions",                buffer = bufnr },
    { "<leader>am", "<cmd>MarkdownPreviewToggle<CR>", desc = "markdown preview", mode = "n", buffer = bufnr },
  })
end

local function attach_typescript(bufnr)
  wk.add({
    { buffer = bufnr },
    { "<leader>c",   group = "LSP", },
    { "<leader>ce",  "<cmd>TSC<CR>",                         desc = "workspace errors (TSC)" },
    { "<leader>cF",  "<cmd>VtsExec fix_all<CR>",             desc = "fix all" },
    { "<leader>ci",  "<cmd>VtsExec add_missing_imports<CR>", desc = "import all" },
    { "<leader>co",  "<cmd>VtsExec organize_imports<CR>",    desc = "organize imports" },
    { "<leader>cs",  "<cmd>VtsExec source_actions<CR>",      desc = "source actions" },
    { "<leader>cu",  "<cmd>VtsExec remove_unused<CR>",       desc = "remove unused" },
    { "<leader>cV",  "<cmd>VtsExec select_ts_version<CR>",   desc = "select TS version" },
    { "<leader>cF",  "<cmd>VtsExec file_references<CR>",     desc = "file references" },
  })
end

local function attach_npm(bufnr)
  wk.add({
    { buffer = bufnr },
    { "<leader>n",   group = "NPM" },
    { "<leader>nc",  '<cmd>lua require("package-info").change_version()<CR>', desc = "change version" },
    { "<leader>nd",  '<cmd>lua require("package-info").delete()<CR>',         desc = "delete package" },
    { "<leader>nh",  "<cmd>lua require('package-info').hide()<CR>",           desc = "hide" },
    { "<leader>ni",  '<cmd>lua require("package-info").install()<CR>',        desc = "install new package" },
    { "<leader>nr",  '<cmd>lua require("package-info").reinstall()<CR>',      desc = "reinstall dependencies" },
    { "<leader>ns",  '<cmd>lua require("package-info").show()<CR>',           desc = "show" },
    { "<leader>nu",  '<cmd>lua require("package-info").update()<CR>',         desc = "update package" },
  })
end

local function attach_zen(bufnr)
  wk.add({
    { "<leader>z", "<cmd>ZenMode<CR>", buffer = bufnr, desc = "zen", nowait = false, remap = false },
  })
end

local function attach_jest(bufnr)
  wk.add({
    { buffer = bufnr },
    { "<leader>j",   group = "Jest", },
    { "<leader>jf",  "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",   desc = "run current file" },
    { "<leader>ji",  "<cmd>lua require('neotest').summary.toggle()<CR>",              desc = "toggle info panel" },
    { "<leader>jj",  "<cmd>lua require('neotest').run.run()<CR>",                     desc = "run nearest test" },
    { "<leader>jl",  "<cmd>lua require('neotest').run.run_last()<CR>",                desc = "run last test" },
    { "<leader>jo",  "<cmd>lua require('neotest').output.open({ enter = true })<CR>", desc = "open test output" },
    { "<leader>js",  "<cmd>lua require('neotest').run.stop()<CR>",                    desc = "stop" },
  })
end

local function attach_spectre(bufnr)
  wk.add({
    { buffer = bufnr },
    { "<LocalLeader>r", desc = "Replace all" },
    { "<LocalLeader>o", desc = "Show options" },
    { "<LocalLeader>q", desc = "Send all to Quicklist" },
    { "<LocalLeader>v", desc = "Change view mode" },
  })
end

local function attach_nvim_tree(bufnr)
  wk.add({
    { buffer = bufnr },
    { "<leader>=",   "<cmd>NvimTreeResize +5<CR>", desc = "resize +5" },
    { "<leader>-",   "<cmd>NvimTreeResize -5<CR>", desc = "resize +5" },
  })
end

return {
  attach_markdown = attach_markdown,
  attach_typescript = attach_typescript,
  attach_npm = attach_npm,
  attach_zen = attach_zen,
  attach_jest = attach_jest,
  attach_spectre = attach_spectre,
  attach_nvim_tree = attach_nvim_tree,
}
