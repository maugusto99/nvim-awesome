local augroup = vim.api.nvim_create_augroup
local AugustoGroup = augroup('augusto', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})


autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Delete spaces in the final line
autocmd({"BufWritePre"}, {
    group = AugustoGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

