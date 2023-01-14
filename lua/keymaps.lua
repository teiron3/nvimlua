local imap = function(k ,v)
	vim.api.nvim_set_keymap("i", k, v, {noremap = true, silent = true}) 
end
local nmap = function(k ,v)
	vim.api.nvim_set_keymap("n", k, v, {noremap = true, silent = true}) 
end
local tmap = function(k ,v)
	vim.api.nvim_set_keymap("t", k, v, {noremap = true, silent = true}) 
end

imap("jj", "<Esc>")
nmap("<Tab><Tab>", "<C-w>w")
nmap("<Tab>b", ":bn<CR>")
tmap("<Tab><Tab>", "<C-\\><C-n><C-w>w")
tmap("<Tab>b", "<C-\\><C-n>:bn<CR>")
