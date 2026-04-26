local highlights = {
  Normal = { bg = 'NONE' },
  NormalNC = { bg = 'NONE' },
  NormalFloat = { bg = 'NONE' },
  FloatBorder = { bg = 'NONE' },
  SignColumn = { bg = 'NONE' },
  VertSplit = { bg = 'NONE' },
  StatusLine = { bg = 'NONE' },
  WinSeparator = { bg = 'NONE' },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end
