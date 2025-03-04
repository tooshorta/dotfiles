return {
	"nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,
				-- C/C++
				null_ls.builtins.diagnostics.cppcheck,
				null_ls.builtins.formatting.clang_format,
				-- Python
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.mypy,
        -- LateX
        require("none-ls.formatting.latexindent"),
			},
		})

		-- clean up code formatting
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
