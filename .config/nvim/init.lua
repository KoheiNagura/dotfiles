vim.loader.enable()

vim.g.mapleader = " "

require("core.options")
require("core.signs")
require("core.lazy")

-- 遅延読み込み後の後処理
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    -- 
  end,
})
