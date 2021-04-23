return function()
    require "nvim-treesitter.configs".setup {
        ensure_installed = {
            "javascript",
            "typescript",
            "tsx",
            "lua",
            "json",
            "jsonc",
            "yaml",
            "query",
            "c_sharp",
            "css",
            "html"
        },
        highlight = {
            enable = true, -- false will disable the whole extension
            indent = {enable = true}
        },
        autotag = {enable = true},
        playground = {enable = true}
    }
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
end
