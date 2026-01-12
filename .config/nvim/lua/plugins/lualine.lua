return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",
  opts = {
    options = {
      theme = 'nord',
      globalstatus = true,
      component_separators = '',
      section_separators = '',
    },
    sections = {
      lualine_a = {
        {
          function()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
          end,
          icon = '󰉋',
          color = { bg = '#5E81AC', fg = '#ECEFF4' },
        },
      },
      lualine_b = {},
      lualine_c = { { 'branch', icon = '' } },
      lualine_x = { { 'diagnostics', sources = { 'nvim_lsp' } } },
      lualine_y = { 'filetype' },
      lualine_z = {},
    },
  },
}
