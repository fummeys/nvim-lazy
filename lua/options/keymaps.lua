vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk","<ESC>")

keymap.set({"v","n"},"<C-s>", ":w<CR>")
keymap.set("i","<C-s>","<ESC>:w<CR>")

keymap.set("n", "<C-q>", ":q<CR>")

keymap.set("n","<F3>",":nohlsearch<CR>")

keymap.set("n", "<leader>tn", ":tabnew<CR>")
keymap.set("n", "<leader>]", ":tabnext<CR>")
keymap.set("n", "<leader>[", ":tabprevious<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader>so", ":set spell spelllang=en_gb<CR>") --spell check on
keymap.set("n", "<leader>sO", ":set spell nospell<CR>") --spell check on

keymap.set("n", "<A-a>", "<C-a>")
keymap.set("n", "<A-x>", "<C-x>")

keymap.set("x", "<leader>p", '"_dp',{ desc = "paste without copy"})


keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "open NETRW"})
keymap.set("n", "<leader>E", ":Rex<CR>", { desc = "close NETRW"})

keymap.set("n", "<leader>gl", ":LazyGit<CR>", { desc = "LazyGit"})

keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap.set("n", "gr", "<cmd>Lspsaga finder def+ref+imp<CR>", { silent = true })
keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cusor_diagnostics<CR>", { silent = true })

-- TeleScope
keymap.set("n", "<leader>fx", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<CR>", {
    silent = true,
    desc = 'find hidden files'
})

