local general_on_attach = require("lsp.on_attach")

-- OMNISHARP {{{
local pid = vim.fn.getpid()
local omnisharp_bin = "/Users/nhattran/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp.exe"
require("lspconfig").omnisharp.setup {
    on_attach = general_on_attach,
    cmd = {"mono", omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)}
}
-- OMNISHARP }}}
require "lspinstall".setup()

-- DIAGNOSTIC }}}
local filetypes = {
    typescript = "eslint",
    typescriptreact = "eslint"
}
local linters = {
    eslint = {
        sourceName = "eslint",
        command = "eslint_d",
        rootPatterns = {".eslintrc.js", "package.json"},
        debounce = 100,
        args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
        parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
        },
        securities = {[2] = "error", [1] = "warning"}
    }
}
local formatters = {
    prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
}
local formatFiletypes = {
    typescript = "prettier",
    typescriptreact = "prettier"
}

require "lspconfig"["diagnosticls"].setup {
    on_attach = general_on_attach,
    filetypes = vim.tbl_keys(filetypes),
    init_options = {
        filetypes = filetypes,
        linters = linters,
        formatters = formatters,
        formatFiletypes = formatFiletypes
    }
}
-- DIAGNOSTIC }}}


local servers = {"efm", "json", "lua", "typescript"}

-- local existingServers = require "lspinstall".installed_servers()
-- for _, name in pairs(existingServers) do
--     require "lspinstall".uninstall_server(name)
-- end

-- for _, name in pairs(servers) do
--     require "lspinstall".install_server(name)
-- end

for _, server in pairs(servers) do
    require("lsp.servers." .. server)(require "lspconfig", general_on_attach)
end

require("lsp.commands")()
require("lsp.settings")()
