-------------------------------------------------------------------------------
-- misc 
-------------------------------------------------------------------------------
require("nvim-lastplace").setup {}

require("cutlass").setup{
    cut_key = "m", 
    override_del = true
}

require("noice").setup {
    cmdline = { view = "cmdline" },
    lsp = {
        view = "mini",
        hover = { enabled = false },
        signature = { enabled = false },
    },
    messages = { 
        view = "mini",
        view_search = false 
    },
}
