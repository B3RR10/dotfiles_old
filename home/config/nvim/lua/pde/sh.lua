if not require('config').pde.sh then
  return {}
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'bash' })
      end
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function(_, opts)
      local nls = require('null-ls')
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        nls.builtins.formatting.shfmt,
        nls.builtins.diagnostics.shellcheck,
      })
    end,
    dependencies = {
      'mason.nvim',
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { 'bash-language-server', 'shellcheck' })
      end,
    },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        bashls = {},
      },
    },
  },
}
