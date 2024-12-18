local o = vim.opt

-- opt.mouse = "a" -- Enable mouse mode
o.autowrite = true -- Enable auto write
o.background = "dark"
o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
o.completeopt = "menu,menuone,noselect"
o.conceallevel = 3 -- Hide * markup for bold and italic
o.confirm = true -- Confirm to save changes before exiting modified buffer
o.cursorline = true -- Enable highlighting of the current line
o.expandtab = true -- Use spaces instead of tabs
o.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " " }
o.foldenable = true
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99
o.foldmethod = "expr"
o.formatoptions = "jcroqlnt" -- tcqj
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep"
o.ignorecase = true -- Ignore case
o.inccommand = "nosplit" -- preview incremental substitute
o.laststatus = 0
o.list = false -- Show some invisible characters (tabs...
o.number = true -- Print line number
o.pumblend = 0 -- Popup blend
o.pumheight = 10 -- Maximum number of entries in a popup
o.relativenumber = true -- Relative line numbers
o.scrolloff = 4 -- Lines of context
o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
o.shiftround = true -- Round indent
o.shiftwidth = 2 -- Size of an indent
o.shortmess:append({ W = true, I = true, c = true })
o.showcmd = false -- Disable show keDisable line wrapy
o.showmode = false -- Dont show mode since we have a statusline
o.sidescrolloff = 8 -- Columns of context
o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
o.smartcase = true -- Don't ignore case with capitals
o.smartindent = true -- Insert indents automatically
o.splitbelow = true -- Put new windows below current
o.splitright = true -- Put new windows right of current
o.tabstop = 2 -- Number of spaces tabs count for
o.termguicolors = true -- True color support
o.timeoutlen = 300
o.undofile = true
o.undolevels = 10000
o.updatetime = 200 -- Save swap file and trigger CursorHold
o.virtualedit = "block"
o.wildmode = "longest:full,full" -- Command-line completion mode
o.winminwidth = 5 -- Minimum window width
o.wrap = false -- Disable line wrap

-- Fix markdown indentation settings
-- vim.g.markdown_recommended_style = 0
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })
