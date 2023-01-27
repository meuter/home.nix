-------------------------------------------------------------------------------
-- telescope
-------------------------------------------------------------------------------
local function search_selected_text()
    vim.cmd([[ noau normal! "vy" ]])
    local selected = string.gsub(vim.fn.getreg("v"), "\n", "")
    require("telescope.builtin").grep_string({ search = selected })
end

vim.keymap.set({"n", "v", "i"}, "<C-t>", "<CMD>Telescope<CR>")
vim.keymap.set({"n", "v", "i"}, "<C-p>", "<CMD>Telescope find_files<CR>")
vim.keymap.set({"n", "v", "i"}, "<C-l>", "<CMD>Telescope live_grep<CR>")
vim.keymap.set({"n", "v", "i"}, "<C-o>", "<CMD>Telescope lsp_document_symbols<CR>")
vim.keymap.set({"n", "v", "i"}, "<C-h>", "<CMD>Telescope help_tags<CR>")
vim.keymap.set({"n", "v", "i"}, "<C-c>", "<CMD>Telescope commands<CR>")
vim.keymap.set({"n", "v", "i"}, "<C-k>", "<CMD>Telescope keymaps<CR>")
vim.keymap.set({"n", "v", "i"}, "<C-s>", "<CMD>Telescope grep_string<CR>")
vim.keymap.set({"v"}, "<C-s>", search_selected_text)

vim.api.nvim_create_user_command("GitHistory", function()
    local previewers = require('telescope.previewers')
    local builtin    = require('telescope.builtin')
    local delta      = previewers.new_termopen_previewer {
        get_command = function(entry)
            return {
                'git',
                '-c', 'core.pager=delta',
                '-c', 'delta.side-by-side=false',
                'diff', entry.value .. '^!', '--',
                entry.current_file
            }
        end
    }
    builtin.git_commits {
        previewer = {
            delta,
            previewers.git_commit_message.new({}),
            previewers.git_commit_diff_as_was.new({}),
        }
    }
end, {})

require("telescope").setup {
    defaults = {
        prompt_prefix = "🔎 ",
        color_devicons = true,
        selection_caret = "❯ ",
        preview = {
            treesitter = true,
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
}
require("telescope").load_extension("fzf")
