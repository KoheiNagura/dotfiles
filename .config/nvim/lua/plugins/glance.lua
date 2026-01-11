return {
  "dnlhc/glance.nvim",
  event = "LspAttach",
  keys = {
    { "gd", "<cmd>Glance definitions<CR>", desc = "Glance definitions" },
    { "gr", "<cmd>Glance references<CR>", desc = "Glance references" },
    { "gy", "<cmd>Glance type_definitions<CR>", desc = "Glance type definitions" },
    { "gi", "<cmd>Glance implementations<CR>", desc = "Glance implementations" },
  },
  config = true,
}
