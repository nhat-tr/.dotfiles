return function()
    g.floaterm_width = 0.9
    g.floaterm_height = 0.9
    map("n", "<C-F11>", ":FloatermToggle<cr>")
    map("t", "<C-F11>", "<c-\\><c-n>:FloatermToggle<cr>")
end
