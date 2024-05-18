return{
    {
        "hrsh7th/nvim-cmp",
        event = 'InsertEnter',
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                build = "make install_jsregexp",
                dependencies = { 
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require('luasnip.loaders.from_vscode').lazy_load()
                    end
                }
            },
            'hrsh7th/cmp-nvim-lsp',
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            'saadparwaiz1/cmp_luasnip',
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require("cmp")
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')

            vim.opt.completeopt = "menu,menuone,noselect"

            local lspkind = require("lspkind")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-x>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "luasnip" },
                }),

                formatting = {
                    format = lspkind.cmp_format({
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
                },
            })
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end
    },
}
