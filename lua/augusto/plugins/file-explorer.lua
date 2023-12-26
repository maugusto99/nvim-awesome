return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		keys = {
			{ "<leader>fe", "<cmd>Neotree dir=%:p:h position=current<cr>", desc = "File Explorer" },
			{ "<leader>fl", "<cmd>Neotree dir=%:p:h position=left<cr>", desc = "File Explorer" },
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		init = function()
			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = {
			popup_border_style = "rounded",
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			window = {
				position = "current",
				mappings = {
					["<space>"] = "none",
					["Y"] = function(state)
						local node = state.tree:get_node()
						local content = node.path
						-- relative
						-- local content = node.path:gsub(state.path, ""):sub(2)
						vim.fn.setreg('"', content)
						vim.fn.setreg("1", content)
						vim.fn.setreg("+", content)
					end,
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		},
	},
	{
		"vifm/vifm.vim",
		ft = "vifm",
	},
}
