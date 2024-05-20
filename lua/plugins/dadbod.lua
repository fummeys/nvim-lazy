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
        { "<leader>db", "<cmd>DBUIToggle", desc = "open DBUI"}
    }
}
