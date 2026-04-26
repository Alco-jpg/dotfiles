return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Git [D]iffview Open' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Git [H]istory for current file' },
  },
  opts = {
    enhanced_diff_hl = true, -- Better highlights
    use_icons = true,
  },
}
