if not require('config').pde.yaml then
  return {}
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'http', 'json' })
      end
    end,
  },
  {
    'rest-nvim/rest.nvim',
    dependencies = { 'plenary.nvim' },
    commit = '8b62563',
    ft = 'http',
    opts = {},
    config = function(opts)
      require('rest-nvim').setup(opts)

      vim.keymap.set('n', '<Leader>x', '<Plug>RestNvim', { desc = 'Execute request' })
    end,
  },
}
