-------------------------------------------------------------------------------
-- neo-tree
-------------------------------------------------------------------------------
vim.keymap.set({"n", "v", "i"}, "<C-b>", "<CMD>NeoTreeRevealToggle<CR>")

require("neo-tree").setup {
    close_if_last_window = true,
    popup_border_style = "single",
    enable_diagnostics = false,
    enable_git_status = false,
    window = {
        width = 40,
        mappings = {
            ["<F5>"] = "refresh",
            ["<F2>"] = "rename",
        },
    },
    filesystem = {
        filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
                "node_modules",
            },
            never_show = {
                "__pycache__",
                ".DS_Store",
                "thumbs.db",
                ".git",
            },
        },
        follow_current_file = true,
    },
    git_status = {
        window = {
            position = "float",
        },
    },
}

