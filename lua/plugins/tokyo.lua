return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() 
        require("tokyonight").setup({
            style = "night",
            transparent = true,
            terminal_colors = true,
            styles = {
                comments = { italic = true, fg = "#008000" },
                keywords = { italic = true, fg =require("tokyonight.colors").setup().purple, sp =require("tokyonight.colors").setup().purple },
                functions = { fg =require("tokyonight.colors").setup().yellow, sp =require("tokyonight.colors").setup().orange },
                variables = { fg =require("tokyonight.colors").setup().blue, sp =require("tokyonight.colors").setup().purple },
                sidebars = "transparent",
                floats = "transparent",
            },
            sidebars = { "qf", "help" },
            hide_inactive_statusline = false,
            dim_inactive = true,
            lualine_bold = true,
        })

        vim.cmd[[colorscheme tokyonight]]

        vim.cmd[[:hi LineNr guifg=#ffff4d]]
        vim.cmd[[:hi LineNrAbove guifg=#ffffff]]
        vim.cmd[[:hi LineNrBelow guifg=#ffffff]]
        vim.cmd[[:hi LineNrBelow guifg=#ffffff]]
    end,
}

