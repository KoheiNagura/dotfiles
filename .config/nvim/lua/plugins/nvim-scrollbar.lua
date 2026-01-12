return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "kevinhwang91/nvim-hlslens",
  },
  config = function()
    require("scrollbar").setup({
      show = true,
      show_in_active_only = false,
      handle = {
        blend = 30,
        hide_if_all_visible = false,
      },
      excluded_buftypes = {
        "terminal",
      },
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true,
        search = true,
        handle = true,
      },
    })

    require("scrollbar.handlers.gitsigns").setup()
    require("scrollbar.handlers.search").setup()
  end,
}
