-- Custom Neo-tree configuration (lazy-loaded)
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },

  cmd = 'Neotree',
  keys = {
    {
      '<leader>e',
      function()
        require('neo-tree.command').execute { toggle = true, dir = vim.fn.getcwd() }
      end,
      desc = 'Explorer (toggle)',
      silent = true,
    },
    {
      '<leader>E',
      function()
        require('neo-tree.command').execute { reveal = true }
      end,
      desc = 'Neo-tree: reveal current file',
      silent = true,
    },
  },

  opts = {
    close_if_last_window = true,
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = false,

    window = {
      position = 'left',
      width = 64,
    },

    filesystem = {
      bind_to_cwd = true,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      hijack_netrw_behavior = 'open_default',
      filtered_items = {
        visible = true,
        hide_dotfiles = true,
        hide_gitignored = true,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',

          -- navigation
          ['<cr>'] = 'open_drop',
          ['o'] = 'open_drop',
          ['l'] = 'open_drop',
          ['h'] = 'close_node',

          -- splits
          ['s'] = 'open_split',
          ['v'] = 'open_vsplit',

          -- file ops
          ['a'] = { 'add', config = { show_path = 'relative' } },
          ['d'] = 'delete',
          ['r'] = 'rename',
        },
      },
    },
  },

  config = function(_, opts)
    local events = require 'neo-tree.events'
    opts.event_handlers = opts.event_handlers or {}

    -- Close tree after opening a file
    table.insert(opts.event_handlers, {
      event = events.FILE_OPENED,
      handler = function(_)
        require('neo-tree.command').execute { action = 'close' }
      end,
    })

    require('neo-tree').setup(opts)
  end,
}
