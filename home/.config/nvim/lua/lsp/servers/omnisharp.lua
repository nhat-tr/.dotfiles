return function(config, on_attach)
    local pid = vim.fn.getpid()
    local omnisharp_bin = "/Users/nhattran/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp.exe"
    config.python.setup {
       cmd = {"mono", omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
       on_attach = on_attach
    }
end
