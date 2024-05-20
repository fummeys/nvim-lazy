return {
    "tpope/vim-dadbod",
    dependencies = {
        {
            "kristijanhusak/vim-dadbod-completion",
            ft = { 'sql', 'mysql', 'plsql'},
            lazy = true,
        },
        "kristijanhusak/vim-dadbod-ui",
    },
    keys = {
        { "<leader>db", ":DBUIToggle<CR>", desc = "open DBUI"}
    }
}
