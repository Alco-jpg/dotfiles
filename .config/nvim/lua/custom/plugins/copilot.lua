return {
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    cmd = 'Copilot',
    keys = {
      {
        '<leader>ct',
        function()
          -- 1. Toggle the actual copilot functionality
          require('copilot.command').toggle()

          -- 2. Toggle a manual flag we can check in the statusline
          if vim.g.copilot_status == 'off' then
            vim.g.copilot_status = 'on'
            vim.notify('Copilot Enabled', vim.log.levels.INFO)
          else
            vim.g.copilot_status = 'off'
            vim.notify('Copilot Disabled', vim.log.levels.WARN)
          end

          -- 3. Force the refresh
          vim.cmd 'redrawstatus'
        end,
        desc = 'Toggle Copilot',
      },
    },
    config = function()
      require('copilot').setup {
        panel = { enabled = false },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = '<C-l>', -- accept ghost text (keeps <C-y> for blink)
            dismiss = '<C-]>', -- dismiss suggestion
          },
        },
      }
    end,
  },
}
