return function(config, on_attach)
    config.typescript.setup {
        filetypes = {"typescript", "javascript", "javascriptreact", "typescriptreact"},
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            local ts_utils = require("nvim-lsp-ts-utils")
            ts_utils.setup {
                enable_formatting = true,
                format_on_save = true
            }
            vim.lsp.buf_request = ts_utils.buf_request;
        end
    }
end
