return {
	-- {
	-- 	"akinsho/toggleterm.nvim",
	-- 	enabled = true,
	-- 	cond = function()
	-- 		return not vim.g.vscode
	-- 	end,
	-- 	config = function()
	-- 		require("toggleterm").setup({
	-- 			shade_terminals = false,
	-- 			hide_numbers = true, -- hide the number column in toggleterm buffers
	-- 			autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
	-- 			start_in_insert = true,
	-- 			insert_mappings = true, -- whether or not the open mapping applies in insert mode
	-- 			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	-- 			persist_size = true,
	-- 			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
	-- 			direction = "float",
	-- 			close_on_exit = true, -- close the terminal window when the process exits
	-- 			shell = "/bin/fish",
	-- 			auto_scroll = true, -- automatically scroll to the bottom on terminal output
	-- 			-- This field is only relevant if direction is set to 'float'
	-- 			float_opts = {
	-- 				border = "rounded",
	-- 			},
	-- 			-- like `size`, width and height can be a number or function which is passed the current terminal
	-- 			winbar = {
	-- 				enabled = false,
	-- 			},
	-- 			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
	-- 			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()"),
	-- 		})
	--
	-- 		-- Send the contents of the current buffer to a terminal buffer in neovim.
	-- 		--
	-- 		-- Args:
	-- 		--   term_bufnr: The buffer number of the terminal buffer to send the contents to.
	-- 		--
	-- 		local terminal = require("toggleterm")
	-- 		local ft_cmds = {
	-- 			python = "python3 " .. vim.fn.expand("%"),
	-- 			matlab = "octave " .. vim.fn.expand("%"),
	-- 		}
	-- 		function _G.set_terminal_keymaps()
	-- 			local opts = { buffer = 0 }
	-- 			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	-- 			vim.keymap.set("t", "<C-w>h", [[<Cmd>wincmd h<CR>]], opts)
	-- 			vim.keymap.set("t", "<C-w>j", [[<Cmd>wincmd j<CR>]], opts)
	-- 			vim.keymap.set("t", "<C-w>k", [[<Cmd>wincmd k<CR>]], opts)
	-- 			vim.keymap.set("t", "<C-w>l", [[<Cmd>wincmd l<CR>]], opts)
	-- 		end
	--
	-- 		vim.keymap.set({ "n", "i", "t" }, "<C-.>", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })
	-- 		vim.keymap.set({ "n", "i", "t" }, "<C-,>", function()
	-- 			terminal.exec(ft_cmds[vim.bo.filetype])
	-- 		end, { noremap = true, silent = true })
	-- 	end,
	-- 	keys = {
	-- 		{ "<C-.>", desc = "Toggle Terminal" },
	-- 		{ "<C-,>", desc = "Execute Buffer" },
	-- 	},
	-- },
	{
		"michaelb/sniprun",
		build = "sh ./install.sh",
		opts = function()
			vim.keymap.set("v", ",", "<Plug>SnipRun", { silent = true })
			vim.keymap.set("n", "<leader>,", "<Plug>SnipRunOperator", { silent = true })
			vim.keymap.set(
				"n",
				"<leader>,,",
				":let b:caret=winsaveview() <CR> | :%SnipRun <CR>| :call winrestview(b:caret) <CR>",
				{ silent = true }
			)
			return {
				selected_interpreters = { "Python3_fifo" },
				repl_enable = { "Python3_fifo" },
				repl_disable = {}, --# disable REPL-like behavior for the given interpreters

				interpreter_options = { --# interpreter-specific options, see doc / :SnipInfo <name>

					--# use the interpreter name as key
					GFM_original = {
						use_on_filetypes = { "markdown.pandoc" }, --# the 'use_on_filetypes' configuration key is
						--# available for every interpreter
					},
					Python3_original = {
						error_truncate = "auto", --# Truncate runtime errors 'long', 'short' or 'auto'
						--# the hint is available for every interpreter
						--# but may not be always respected
					},
				},

				--# you can combo different display modes as desired and with the 'Ok' or 'Err' suffix
				--# to filter only sucessful runs (or errored-out runs respectively)
				display = {
					-- "Classic", --# display results in the command-line  area
					-- "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)

					-- "VirtualText",             --# display results as virtual text
					-- "TempFloatingWindow",      --# display results in a floating window
					-- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
					"Terminal", --# display results in a vertical split
					-- "TerminalWithCode",        --# display results and code history in a vertical split
					-- "NvimNotify",              --# display with the nvim-notify plugin
					-- "Api"                      --# return output to a programming interface
				},

				live_display = { "VirtualTextOk" }, --# display mode used in live_mode

				display_options = {
					terminal_scrollback = vim.o.scrollback, --# change terminal display scrollback lines
					terminal_line_number = false, --# whether show line number in terminal window
					terminal_signcolumn = false, --# whether show signcolumn in terminal window
					terminal_persistence = true, --# always keep the terminal open (true) or close it at every occasion (false)
					terminal_width = 45, --# change the terminal display option width
					notification_timeout = 5, --# timeout for nvim_notify output
				},

				--# You can use the same keys to customize whether a sniprun producing
				--# no output should display nothing or '(no output)'
				show_no_output = {
					"Classic",
					"TempFloatingWindow", --# implies LongTempFloatingWindow, which has no effect on its own
				},

				--# customize highlight groups (setting this overrides colorscheme)

				live_mode_toggle = "off", --# live mode toggle, see Usage - Running for more info

				--# miscellaneous compatibility/adjustement settings
				inline_messages = false, --# boolean toggle for a one-line way to display messages
				--# to workaround sniprun not being able to display anything

				borders = "none", --# display borders around floating windows
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
}
