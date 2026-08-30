return {
  'ianray9/Superfile.nvim',
  branch = 'path-fix',
  opts = {
    key = false,
  },
  keys = {
    {
      '<leader>ee',
      function()
        require('superfile').open()
      end,
      mode = { 'n', 't' },
      desc = 'Open/Focus Superfile',
      silent = true,
    },
  },
}
