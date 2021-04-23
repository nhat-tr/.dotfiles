local general_on_attach = require("lsp.on_attach")

local pid = vim.fn.getpid()
local omnisharp_bin = "/Users/nhattran/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp.exe"
require("lspconfig").omnisharp.setup {
    on_attach = general_on_attach,
    cmd = {"mono", omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)}
}

require "lspinstall".setup()

local servers = {"efml", "json", "lua", "typescript", "diagnosticls"}

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
