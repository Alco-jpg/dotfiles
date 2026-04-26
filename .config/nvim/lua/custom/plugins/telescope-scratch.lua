return {
  'nvim-telescope/telescope.nvim',
  keys = function()
    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'
    local action_state = require 'telescope.actions.state'

    local scratch_dir = vim.fn.stdpath 'data' .. '/scratch'
    vim.fn.mkdir(scratch_dir, 'p')

    local function scratch_picker()
      local opts = {
        prompt_title = 'Scratch Files',
        cwd = scratch_dir,
        previewer = true,
      }

      opts.attach_mappings = function(prompt_bufnr, map)
        -- Grep inside scratch folder
        local function grep_scratch()
          actions.close(prompt_bufnr)
          builtin.live_grep {
            prompt_title = 'Grep Scratch',
            cwd = scratch_dir,
            previewer = true,
          }
        end

        -- Create a new scratch file
        local function create_scratch()
          actions.close(prompt_bufnr)
          vim.schedule(function()
            local default_name = os.date '%Y-%m-%d_%H-%M-%S' .. '.md'
            vim.ui.input({ prompt = 'New scratch name (e.g. idea.ts, notes.md): ', default = default_name }, function(input)
              if not input or input == '' then
                return
              end
              if not input:match '%.%w+$' then
                input = input .. '.md'
              end
              local path = scratch_dir .. '/' .. input
              vim.fn.mkdir(vim.fn.fnamemodify(path, ':h'), 'p')
              vim.cmd('edit ' .. vim.fn.fnameescape(path))
              if path:match '%.md$' and vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
                local ts = os.date '%Y-%m-%d %H:%M'
                vim.api.nvim_buf_set_lines(0, 0, -1, false, { '# ' .. input, '', '_created: ' .. ts .. '_', '' })
                vim.cmd 'normal! G'
              end
            end)
          end)
        end

        -- Delete the highlighted scratch file
        local function delete_scratch()
          local entry = action_state.get_selected_entry()
          if not entry or not entry.path then
            vim.notify('No file selected to delete', vim.log.levels.WARN)
            return
          end
          local file_path = entry.path
          vim.ui.input({ prompt = 'Delete ' .. vim.fn.fnamemodify(file_path, ':t') .. '? (Y/n): ' }, function(answer)
            if answer and answer:lower() == 'y' or answer == '' then
              vim.fn.delete(file_path)
              vim.notify('Deleted: ' .. file_path)
              -- Refresh the picker
              actions.close(prompt_bufnr)
              vim.schedule(scratch_picker)
            end
          end)
        end

        map('i', '<C-g>', grep_scratch)
        map('n', '<C-g>', grep_scratch)
        map('n', 'S', create_scratch)
        map('i', '<C-s>', create_scratch)
        map('i', '<C-d>', delete_scratch)
        map('n', '<C-d>', delete_scratch)
        return true
      end

      builtin.find_files(opts)
    end

    return {
      { '<leader>n', scratch_picker, desc = 'Scratch: list (Telescope)', silent = true },
    }
  end,
}
