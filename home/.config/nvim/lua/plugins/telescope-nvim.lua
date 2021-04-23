return function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local conf = require("telescope.config").values
    local concat = function(target, new)
        for _, v in pairs(new) do
            table.insert(target, v)
        end
    end
    local vimgrep_arguments = concat(conf.vimgrep_arguments, {"-g", "!{node_modules,.git}"})

    telescope.setup {
        defaults = {mappings = {i = {["<Esc>"] = actions.close, ["<C-u>"] = false}}}
    }

    _G.fuzzy_live_grep = function()
        builtin.grep_string {
            shorten_path = true,
            word_match = "-w",
            only_sort_text = true,
            search = "",
            vimgrep_arguments = vimgrep_arguments
        }
    end

    _G.grep_prompt = function()
        builtin.grep_string {
            vimgrep_arguments = vimgrep_arguments,
            shorten_path = true,
            search = vim.fn.input("grep > ")
        }
    end

    local find_files = function(opts)
        if opts and opts.search_dirs then
            builtin.find_files(opts)
            return
        end

        local is_git_project = pcall(builtin.git_files, opts)
        if not is_git_project then
            builtin.find_files(opts)
        end
    end
    _G.find_files = find_files

    _G.open_telescope = function()
        local open = function(arg)
            vim.g.loaded_netrw = true
            local search_dirs = arg and {arg} or nil
            find_files({search_dirs = search_dirs})
        end

        local args = vim.v.argv
        table.remove(args, 1)
        if vim.tbl_isempty(args) then
            open()
            return
        end

        for _, arg in pairs(args) do
            if vim.fn.isdirectory(arg) == 1 then
                open(arg)
                return
            end
        end
    end

    vim.cmd("command! Files lua find_files()")
    vim.cmd("command! BLines Telescope current_buffer_fuzzy_find")
    vim.cmd("command! History Telescope oldfiles")
    vim.cmd("command! Buffers Telescope buffers")
    vim.cmd("command! Rg lua fuzzy_live_grep()")
    vim.cmd("command! RgPrompt lua grep_prompt()")
    vim.cmd("command! LspRefs Telescope lsp_references")
    vim.cmd("command! LspSym Telescope lsp_workspace_symbols")
    -- unmapped
    vim.cmd("command! BCommits Telescope git_bcommits")
    vim.cmd("command! Commits Telescope git_commits")
    vim.cmd("command! LspAct Telescope lsp_code_actions")

    vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>Files<CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<Leader>rg", "<cmd>Rg<CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<Leader>fG", "<cmd>RgPrompt<CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>Buffers<CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<Leader>fh", "<cmd>History<CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<Leader>l", "<cmd>BLines<CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<Leader>gr", "<cmd>LspRef<CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<Leader>fs", "<cmd>LspSym<CR>", {silent = true})

    vim.api.nvim_set_keymap("n", "<Leader>ga", "<cmd>LspAct<CR>", {silent = true})
end
