return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
  },
  opts = {
    keymaps = {
      ["q"] = "actions.close",
    },
    view_options = {
      show_hidden = true,
    },
  },
}
