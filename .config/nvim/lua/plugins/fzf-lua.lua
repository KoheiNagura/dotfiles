return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<C-p>", function() require("fzf-lua").files() end,    desc = "Find files (fzf)" },
    { "<C-f>", function() require("fzf-lua").live_grep() end, desc = "Live grep (rg)" },
  },
  opts = {
    winopts = {
      height = 0.90,
      width = 0.85,
      border = "rounded",
      fullscreen = false,
    },
    files = {
      -- Prefer fd if available for speed; falls back internally otherwise
      cmd = "fd --type f --hidden --follow --exclude .git",
    },
    grep = {
      rg_opts = table.concat({
        "--hidden",
        "--column",
        "--line-number",
        "--no-heading",
        "--color=always",
        "--smart-case",
        "-g !.git",
      }, " "),
    },
  },
}
