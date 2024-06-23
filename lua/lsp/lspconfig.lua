return {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neoconf.nvim", "hrsh7th/cmp-nvim-lsp" },

    config = function()
        local nvim_lsp = require('lspconfig')
        local config = require("lspconfig.configs")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        capabilities.offsetEncoding = "utf-8"

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- local opts = { buffer = ev.buf }
                local createopts = function (desc)
                    return {
                        buffer = ev.buf,
                        desc = desc
                    }
                end
                vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, createopts("add_workspace_folder"))
                vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, createopts("remove_workspace_folder"))
                vim.keymap.set("n", "<space>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, createopts("list_workspace_folders"))
                vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, createopts("type_definition"))
                vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, createopts("rename"))
                vim.keymap.set("n", "<space>fm", function()
                    vim.lsp.buf.format({ async = true })
                end, createopts("Format file"))
            end,
        })

        vim.cmd([[ autocmd BufRead,BufNewfile *.conf set filetype=nginx ]])
        vim.cmd([[ autocmd BufRead,BufNewfile *.blade.php set filetype=blade ]])

        config.nginx = {
            default_config = {
                cmd = { "nginx-language-server" },
                filetypes = { "nginx" },
                root_dir = function(fname)
                    return nvim_lsp.util.find_git_ancestor(fname)
                end,
            },
        }

        nvim_lsp.lua_ls.setup({
            capabilities = capabilities
        })

        nvim_lsp.nginx.setup({
            capabilities = capabilities
        })

        nvim_lsp.html.setup({
            capabilities = capabilities,
            filetypes = { "html", "blade" }
        })

        nvim_lsp.cssls.setup({
            capabilities = capabilities,
            settings = {
                css = {
                    validate = true,
                    lint = {
                        unknownAtRules = "ignore"
                    }
                },
                scss = {
                    validate = true,
                    lint = {
                        unknownAtRules = "ignore"
                    }
                },
                less = {
                    validate = true,
                    lint = {
                        unknownAtRules = "ignore"
                    }
                }
            }
        })

        nvim_lsp.tsserver.setup({
            capabilities = capabilities
        })

        nvim_lsp.bashls.setup({
            capabilities = capabilities
        })

        nvim_lsp.dockerls.setup({
            capabilities = capabilities
        })

        nvim_lsp.jsonls.setup({
            capabilities = capabilities
        })

        nvim_lsp.lemminx.setup({
            capabilities = capabilities
        })

        nvim_lsp.yamlls.setup({
            capabilities = capabilities,
            settings = {
                yaml = {
                    schemas = {
                        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                        ["https://json.schemastore.org/pubspec.json"] = "pubspec.yaml",
                        ["https://raw.githubusercontent.com/jesseduffield/lazygit/master/schema/config.json"] = "config.yml",
                    }
                }
            }
        })

        nvim_lsp.sqlls.setup({
            capabilities = capabilities
        })

        nvim_lsp.intelephense.setup({
            capabilities = capabilities
        })

        nvim_lsp.jdtls.setup({
            capabilities = capabilities
        })

        nvim_lsp.tailwindcss.setup({
            capabilities = capabilities
        })

        nvim_lsp.kotlin_language_server.setup({
            capabilities = capabilities
        })
    end,
}
