return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons'},
    config = function()
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key",
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                    }
                }
            }
        })

        vim.keymap.set('n', '<leader>ff', require("telescope.builtin").find_files, {})
        vim.keymap.set('n', '<leader>fg', require("telescope.builtin").live_grep, {})
        vim.keymap.set('n', '<leader>fs', require("telescope.builtin").grep_string, {})
        vim.keymap.set('n', '<leader>fb', require("telescope.builtin").buffers, {})
        vim.keymap.set('n', '<leader>fh', require("telescope.builtin").help_tags, {})
        vim.keymap.set('n', '<leader>fk', require("telescope.builtin").keymaps, {})
    end,
}
