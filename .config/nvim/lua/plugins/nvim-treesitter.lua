return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "UIEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    highlight = { enable = true },
    auto_install = false,
    ensure_installed = "all",
  },
}
