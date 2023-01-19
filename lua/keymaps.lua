--vim.g.mapleader = " "
local tablemap = function(tbl)
	for key, value in ipairs(tbl[2]) do
		vim.api.nvim_set_keymap(tbl[1], value[1], value[2], { noremap = true, silent = true })
	end
end

local imodetable = { 'i', {
	{ 'jj', '<Esc>' },
} }
local nmodetable = { 'n', {
	{ "<Tab><Tab>", "<C-w>w" },
	{ "<Tab>b", ":bn<CR>" },
	{ '<Tab>f', '<cmd>lua require("telescope.builtin").find_files()<cr>' },
	{ '<Tab>b', '<cmd>lua require("telescope.builtin").buffers()<cr>' },
	{ '<Tab>g', '<cmd>lua require("telescope.builtin").live_grep()<cr>' },
	{ '<Tab>`', '<cmd>lua require("telescope.builtin").jumplist()<cr>' },
	{ '<Tab>p', '<cmd>lua require("telescope.builtin").registers()<cr>' },
	{ '<Tab>h', '<cmd>lua require("telescope.builtin").help_tags()<cr>' }
} }

local tmodetable = { 't', {
	{ "<Tab><Tab>", "<C-\\><C-n><C-w>w" },
	{ "<Tab>b", "<C-\\><C-n>:bn<CR>" }
} }

tablemap(imodetable)
tablemap(nmodetable)
tablemap(tmodetable)

tablemap({ 'n', {
	{ 'K', '<cmd>lua vim.lsp.buf.hover()<CR>' },
	{ 'gf', '<cmd>lua if vim.lsp.buf.formatting then vim.lsp.buf.formatting() else vim.lsp.buf.format() end<CR>' },
	{ 'gr', '<cmd>lua vim.lsp.buf.references()<CR>' },
	{ 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>' },
	{ 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>' },
	{ 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>' },
	{ 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>' },
	{ 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>' },
	{ 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>' },
	{ 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>' },
	{ 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>' },
	{ 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>' },
} })

vim.cmd([[imap <silent><expr> <C-k> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-k>']])
vim.cmd([[smap <silent><expr> <C-k> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-k>']])
