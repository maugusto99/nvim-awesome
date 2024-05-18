return {
	{
		"michaelb/sniprun",
		build = "sh ./install.sh",
		opts = function()
			return {
				selected_interpreters = { "Python3_fifo" },
				repl_enable = { "Python3_fifo" },

				--# you can combo different display modes as desired and with the 'Ok' or 'Err' suffix
				--# to filter only sucessful runs (or errored-out runs respectively)
				display = {
					-- "Classic", --# display results in the command-line  area
					-- "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)
					-- "VirtualText",             --# display results as virtual text
					-- "TempFloatingWindow",      --# display results in a floating window
					-- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
					"Terminal", --# display results in a vertical split
					-- "TerminalWithCode", --# display results and code history in a vertical split
					-- "NvimNotify",              --# display with the nvim-notify plugin
					-- "Api"                      --# return output to a programming interface
				},

				display_options = {
					terminal_scrollback = vim.o.scrollback, --# change terminal display scrollback lines
					terminal_line_number = false, --# whether show line number in terminal window
					terminal_signcolumn = false, --# whether show signcolumn in terminal window
					terminal_persistence = true, --# always keep the terminal open (true) or close it at every occasion (false)
					-- terminal_width = 45, --# change the terminal display option width
					terminal_height = 10, --# change the terminal display option height (if horizontal)
					notification_timeout = 5, --# timeout for nvim_notify output
					terminal_position = "horizontal",
				},

				borders = "shadow", --# display borders around floating windows
				--# possible values are 'none', 'single', 'double', or 'shadow'
			}
		end,
		keys = {
			{ mode = "v", ",", "<Plug>SnipRun", silent = true, desc = "Run block" },
			{ mode = "n", "<leader>,", "<Plug>SnipRunOperator", silent = true, desc = "Run Operator" },
			{
				mode = "n",
				"<leader>,,",
				":let b:caret=winsaveview() <CR> | :%SnipRun <CR>| :call winrestview(b:caret) <CR>",
				silent = true,
				desc = "Run file",
			},
		},
	},
	{
		"mrjones2014/smart-splits.nvim",
		build = "./kitty/install-kittens.bash",
		opts = function()
			vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
			vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
			vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
			vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
			-- moving between splits
			vim.keymap.set("n", "<CA-h>", require("smart-splits").move_cursor_left)
			vim.keymap.set("n", "<CA-j>", require("smart-splits").move_cursor_down)
			vim.keymap.set("n", "<CA-k>", require("smart-splits").move_cursor_up)
			vim.keymap.set("n", "<CA-l>", require("smart-splits").move_cursor_right)
			vim.keymap.set("n", "<CA-\\>", require("smart-splits").move_cursor_previous)

			-- swapping buffers between windows
			vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
			vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
			vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
			vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)
		end,
	},
}
