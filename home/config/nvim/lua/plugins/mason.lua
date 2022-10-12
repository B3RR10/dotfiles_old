local M = {}

function M.setup()
  require('mason').setup()
  require('mason-lspconfig').setup()
  require('mason-tool-installer').setup({
    ensure_installed = {
      -- LSP
      'angular-language-server',
      'bash-language-server',
      'csharp-language-server',
      'css-lsp',
      'dockerfile-language-server',
      'emmet-ls',
      'eslint-lsp',
      'fantomas',
      'fsautocomplete',
      'html-lsp',
      'json-lsp',
      'rust-analyzer',
      'solargraph',
      'lua-language-server',
      'tailwindcss-language-server',
      'texlab',
      'typescript-language-server',
      'vim-language-server',
      'vue-language-server',
      'yaml-language-server',
    },
  })
end

return M
