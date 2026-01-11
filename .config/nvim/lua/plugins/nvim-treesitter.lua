-- FileType検出時にtreesitterを自動セットアップ
vim.api.nvim_create_autocmd("FileType", {
  callback = function(event)
    local ok, nvim_treesitter = pcall(require, "nvim-treesitter")
    if not ok then return end

    local filetype = vim.bo[event.buf].filetype
    local language = vim.treesitter.language.get_lang(filetype)
    if not language then return end

    local buffer_number = event.buf

    -- パーサーをインストール（未インストールの場合のみ）
    nvim_treesitter.install({ language }):await(function(error)
      if error or not vim.api.nvim_buf_is_valid(buffer_number) then return end

      -- highlight有効化
      pcall(vim.treesitter.start, buffer_number, language)

      -- indent有効化
      vim.bo[buffer_number].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

      -- fold有効化
      local window_id = vim.fn.bufwinid(buffer_number)
      if window_id ~= -1 then
        vim.wo[window_id].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[window_id].foldmethod = "expr"
        vim.wo[window_id].foldlevel = 99
      end
    end)
  end,
})

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
  },
}
