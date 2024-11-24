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
			nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
			nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

			nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
			nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
			nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

			nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

			-- See `:help K` for why this keymap
			nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("gK", vim.lsp.buf.signature_help, "Signature Documentation")

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
				package_installed = " ",
				package_pending = "󰪡 ",
				package_uninstalled = " ",
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
					ruff = { enabled = true, maxLineLength = 100 },
					yapf = { enabled = false },
					pyflakes = {
						enabled = false,
						maxLineLength = 100,
					},
					mccabe = { enabled = false },
					flake8 = {
						enabled = false,
					},
					pycodestyle = {
						enabled = false,
					},
				},
			},
		},
	}
	-- Pylsp: If are global modules modify
	-- ~/.local/share/nvim/lsp_servers/pylsp/venv/pyvenv.cfg
	-- include-system-site-packages = true

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
			vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost", "TextChanged" }, {
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
					require("conform").format()
				end,
				desc = "Format buffer",
			},
		},
		opts = {
			format = {
				timeout_ms = 3000,
				async = false,
				quiet = false,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				fish = { "fish_indent" },
				python = { "black" },
			},
			formatters = {
				black = {
					prepend_args = { "--line-length", "100" },
				},
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
