local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return vim.fn["compe#confirm"]()
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t("<Plug>(vsnip-expand-or-jump)")
    else
        return t("<Tab>")
    end
end

return function()
    require "compe".setup {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = "enable",
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = true,
        allow_prefix_unmatch = true,
        source = {
            path = {menu = " "},
            buffer = {menu = " "},
            vsnip = {menu = " "},
            nvim_lsp = {menu = "  "},
            nvim_lua = {menu = " "},
            spell = true,
            calc = true,
            tags = true,
            -- omni = true,
            vim_dadbod_completion = true,
            treesitter = true
        }
    }
    map("i", "<cr>", 'compe#confirm("<cr>")', {silent = true, expr = true})
    -- map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    -- map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
    map("i", "<C-Space>", "compe#complete()", {expr = true, silent = true})

    -- map("i", "<s-cr>", "compe#complete()", {silent = true, expr = true})
end
