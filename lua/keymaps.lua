--vim.g.mapleader = " "
local tablemap = function(k ,tbl)
	for key ,value in ipairs(tbl) do
		vim.api.nvim_set_keymap(k, value[1], value[2], {noremap = true, silent = true}) 
	end
end
local imap = function(k ,v)
	vim.api.nvim_set_keymap("i", k, v, {noremap = true, silent = true}) 
end
local nmap = function(k ,v)
	vim.api.nvim_set_keymap("n", k, v, {noremap = true, silent = true}) 
end
local tmap = function(k ,v)
	vim.api.nvim_set_keymap("t", k, v, {noremap = true, silent = true}) 
end
local imodetable ={
	{'jj', '<Esc>'},
}
local nmodetable ={
	{"<Tab><Tab>", "<C-w>w"},
	{"<Tab>b", ":bn<CR>"},
	{'<Tab>f', '<cmd>lua require("telescope.builtin").find_files()<cr>'},
	{'<Tab>b', '<cmd>lua require("telescope.builtin").buffers()<cr>'},
	{'<Tab>h', '<cmd>lua require("telescope.builtin").help_tags()<cr>'}
}
local tmodetable ={
	{"<Tab><Tab>", "<C-\\><C-n><C-w>w"},
	{"<Tab>b", "<C-\\><C-n>:bn<CR>"}
}

tablemap('i', imodetable)
tablemap('n', nmodetable)
tablemap('t', tmodetable)

tablemap('n', {
	{'K',  '<cmd>lua vim.lsp.buf.hover()<CR>'},
	{'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>'},
	{'gr', '<cmd>lua vim.lsp.buf.references()<CR>'},
	{'gd', '<cmd>lua vim.lsp.buf.definition()<CR>'},
	{'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>'},
	{'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>'},
	{'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>'},
	{'gn', '<cmd>lua vim.lsp.buf.rename()<CR>'},
	{'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>'},
	{'ge', '<cmd>lua vim.diagnostic.open_float()<CR>'},
	{'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>'},
	{'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>'},
})
