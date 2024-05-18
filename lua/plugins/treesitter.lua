return {
    'nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { "c", "lua", "bash", "vimdoc", "diff" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                disable = {"json"},
                additional_vim_regex_highlighting = false,
            },
        }

        require('ufo').setup({
            provider_selector = function(bufnr, filetype, buftype)
                return {'treesitter', 'indent'}
            end
        })
    end,
}
