local status_ok, lualine = pcall(require,"lualine")
if not status_ok then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    -- component_separators = '|',
    -- section_separators = '',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{
      'filename',
      file_status = true,
      path = 1,
    }
    },
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {
    lualine_a = {'tabs'},
  },
  inactive_winbar = {
    lualine_a = {},
    -- lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
    },
    lualine_z = {
      'filename',
      'filetype'
    }
  },
  extensions = {}
}

