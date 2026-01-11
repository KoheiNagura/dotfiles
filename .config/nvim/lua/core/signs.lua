local has_010 = vim.fn.has("nvim-0.10") == 1

local icons = {
  [vim.diagnostic.severity.ERROR] = "", -- error
  [vim.diagnostic.severity.WARN]  = "", -- warning
  [vim.diagnostic.severity.HINT]  = "", -- hint
  [vim.diagnostic.severity.INFO]  = "", -- info
}

if has_010 then
  -- New-style (Neovim 0.10+): configure per-severity sign text directly
  vim.diagnostic.config({
    signs = { text = icons },
    severity_sort = true,
    virtual_text = { prefix = "●" },
  })
else
  -- Fallback for < 0.10: define sign symbols via sign_define
  local name_by_sev = {
    [vim.diagnostic.severity.ERROR] = "Error",
    [vim.diagnostic.severity.WARN]  = "Warn",
    [vim.diagnostic.severity.HINT]  = "Hint",
    [vim.diagnostic.severity.INFO]  = "Info",
  }
  for sev, name in pairs(name_by_sev) do
    local icon = icons[sev]
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
  vim.diagnostic.config({
    signs = true,
    severity_sort = true,
    virtual_text = { prefix = "●" },
  })
end
