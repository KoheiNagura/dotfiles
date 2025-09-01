return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<C-l>", "<cmd>Gitsigns next_hunk<CR>zz", desc = "Next hunk", mode = "n" },
    { "<C-h>", "<cmd>Gitsigns prev_hunk<CR>zz", desc = "Previous hunk", mode = "n" },
  },
  config = true,
}
