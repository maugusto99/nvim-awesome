vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })

local diagnostics_options = {
	-- disable virtual text
	virtual_text = false,
	-- show signs
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "none",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(diagnostics_options)

local function lsp_setup_basics()
	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = function(event)
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end
				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

			nmap("gd", function()
				require("trouble").toggle("lsp_definitions")
			end, "[G]oto [D]efinition")
			nmap("gr", function()
				require("trouble").toggle("lsp_references")
			end, "[G]oto [R]eferences")
			nmap("gI", function()
				require("trouble").toggle("lsp_implementations")
			end, "[G]oto [I]mplementation")

			nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
			nmap("<leader>ds", vim.lsp.buf.document_symbol, "[D]ocument [S]ymbols")

			-- See `:help K` for why this keymap
			nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

			-- Lesser used LSP functionality
			nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
			nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
			nmap("<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, "[W]orkspace [L]ist Folders")
		end,
	})
	require("mason").setup({
		ui = {
			border = "none",
			icons = {
				package_installed = "",
				package_pending = "󰪡",
				package_uninstalled = "",
			},
		},
	})

	local servers = {
		lua_ls = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				telemetry = {
					enable = false,
				},
			},
		},
		pylsp = {
			pylsp = {
				plugins = {
					pyflakes = {
						enabled = true,
						maxLineLength = 100,
					},
					mccabe = { enabled = false },
					flake8 = {
						enabled = false,
						maxLineLength = 100,
					},
					pycodestyle = {
						ignore = { "W391" },
						maxLineLength = 100,
						enabled = false,
					},
				},
			},
		},
	}
	--[[ Pylsp: If are global modules modify
-- ~/.local/share/nvim/lsp_servers/pylsp/venv/pyvenv.cfg
-- include-system-site-packages = true
--]]

	require("mason-lspconfig").setup({
		ensure_installed = vim.tbl_keys(servers), -- This extracts all the keys from the servers table
	})

	local lspconfig = require("lspconfig")
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	require("mason-lspconfig").setup_handlers({
		function(server_name)
			lspconfig[server_name].setup({
				capabilities = capabilities,
				settings = servers[server_name],
			})
		end,
	})
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					vim.keymap.set("n", "<leader>m", "<cmd>Mason<cr>"),
				},
			},
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		config = function()
			lsp_setup_basics()
		end,
		event = { "BufReadPre", "BufNewFile" },
	},

	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				sh = { "shellcheck" },
				fish = { "fish" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "TextChanged" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>fo",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
			},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
}
