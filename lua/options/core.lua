local opt = vim.opt

opt.rnu = true
opt.nu = true

opt.wrap = false
opt.ignorecase = true
opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.scrolloff = 4

opt.iskeyword:append("-")

opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true

vim.cmd([[set cursorline ]])
-- vim.g.skip_ts_context_commentstring_module = true
