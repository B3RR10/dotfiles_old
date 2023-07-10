local M = {}

function M.setup()
  require('mason').setup()
  require('mason-lspconfig').setup()
  require('mason-tool-installer').setup({
    ensure_installed = {
      -- LSP
      'bash-language-server',
      'csharp-language-server',
      'css-lsp',
      'dockerfile-language-server',
      'eslint-lsp',
      -- 'fantomas',
      -- 'fsautocomplete',
      'html-lsp',
      'json-lsp',
      'lua-language-server',
      'pyright',
      'rust-analyzer',
      'stylua',
      'tailwindcss-language-server',
      'texlab',
      'typescript-language-server',
      'vim-language-server',
      -- 'vue-language-server',
      'yaml-language-server',
    },
  })
end

return M
