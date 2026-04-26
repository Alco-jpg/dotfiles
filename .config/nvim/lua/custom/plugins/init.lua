-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- a keymap that will with leader + o which will stand for open but then i want to press f and it will open nautilus
  vim.keymap.set('n', '<leader>of', ':silent !nautilus .<CR>', { noremap = true, silent = true }),
}
