require("packer").startup(function()
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
end)

require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
	local opt = {
		-- -- Function executed when the LSP server startup
		-- on_attach = function(client, bufnr)
		--   local opts = { noremap=true, silent=true }
		--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		--   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
		-- end,
		capabilities = require('cmp_nvim_lsp').default_capabilities(
			vim.lsp.protocol.make_client_capabilities()
		)
	}
	require('lspconfig')[server].setup(opt)
end })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)


local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
		{ name = "vsnip" },
    -- { name = "buffer" },
    -- { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
}),
  experimental = {
    ghost_text = true,
  },
})
