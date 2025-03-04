------ LSP Config ------
return {
	-- Mason
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- Mason and lspconfig connector
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- add ensure installs here
				ensure_installed = { "lua_ls", "harper_ls" },
			})
		end,
	},
	-- Lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")
			-- add lsp here
			lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
			lspconfig.harper_ls.setup({
        capabilities = capabilities
      })
      -- Does not work
      --lspconfig.sourcery.setup({
      --  capabilities = capabilities
      --})
			-- commands
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
