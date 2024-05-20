return{
    "kdheepak/lazygit.nvim",
    {"lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup({
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({']c', bang = true})
                    else
                        gitsigns.nav_hunk('next')
                    end
                end)

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[c', bang = true})
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end)

                -- Actions

                map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "preview_hunk"})
                map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end,{ desc = "blame_line"})
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc= "toggle_current_line_blame"})
                map('n', '<leader>hd', gitsigns.diffthis,{ desc = "diffthis"})

            end
        })
    end
}
}
