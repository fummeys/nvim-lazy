return {
    {"folke/neodev.nvim"},
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    "christoomey/vim-tmux-navigator",
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async'
        }
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
        config = function()
            require("fidget").setup()
        end
    }
}
