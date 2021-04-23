for _, mappings in pairs(
    {
        {"n", "Y", "y$"}, -- do Y to yank till the end of the line
        {"n", "<TAB>", ":bn<CR>"},
        {"n", "<S-TAB>", ":bp<CR>"},
        {"n", "<C-s>", ":lua reload()<cr>"}, -- reload config
        -- replace selected
        {"n", "R", ":%s///g<left><left>"},
        {"n", "<leader>cm", ":e ++ff=dos<cr>"},
        {"n", "<leader>cs", ":let @/=''<cr>"},
        {"n", "<Leader>ne", ':e <C-R>=expand("%:p:h") . "/" <CR>'},
        {"i", "{<CR>", "{<CR>}<ESC>O", {noremap = true}}
        -- {"i", "{<TAB>", "{}<ESC>i", {noremap = true}},
        -- {"i", "(<TAB>", "()<ESC>i", {noremap = true}},
        -- {"i", "[<TAB>", "[]<ESC>i", {noremap = true}}
    }
) do
    local mode = mappings[1]
    local key = mappings[2]
    local value = mappings[3]
    local options = mappings[4]
    map(mode, key, value, options)
end

 vim.cmd('inoremap <expr> <TAB> ("\\<C-n>")')
 vim.cmd('inoremap <expr> <S-TAB> ("\\<C-p>")')
