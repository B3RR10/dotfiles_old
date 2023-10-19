if not require('config').pde.yaml then
  return {}
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, {
          'yaml',
        })
      end
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { 'yaml-language-server', 'yamllint', 'yamlfmt' })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'b0o/SchemaStore.nvim',
    },
    opts = {
      servers = {
        yamlls = {
          settings = {
            schemaStore = {
              enable = false,
              url = '',
            },
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      },
    },
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function(_, opts)
      if type(opts.sources) == 'table' then
        local null_ls = require('null-ls')
        vim.list_extend(opts.sources, {
          null_ls.builtins.formatting.yamlfmt.with({
            extra_args = { '-formatter', 'include_document_start=true,retain_line_breaks=true' },
          }),
          null_ls.builtins.diagnostics.yamllint,
        })
      end
    end,
  },
}
