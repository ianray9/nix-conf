return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',

    -- config = function()
    --   require('nvim-treesitter').setup()
    --
    --   require('nvim-treesitter').install {
    --     'bash',
    --     'c',
    --     'diff',
    --     'html',
    --     'lua',
    --     'luadoc',
    --     'query',
    --     'vim',
    --     'vimdoc',
    --     'markdown',
    --     'markdown_inline',
    --   }
    --
    --   vim.api.nvim_create_autocmd('FileType', {
    --     pattern = '*',
    --     callback = function(args)
    --       vim.treesitter.start(args.buf)
    --     end,
    --   })
    -- end,
  },
}
