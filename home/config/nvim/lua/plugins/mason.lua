local M = {}

function M.setup()
  require('mason').setup()
  require('mason-lspconfig').setup()
  require('mason-tool-installer').setup({
    ensure_installed = {
      -- LSP
      'ansible-language-server',
      'bash-language-server',
      'csharp-language-server',
      'css-lsp',
      'docker-compose-language-service',
      'dockerfile-language-server',
      'fsautocomplete',
      'html-lsp',
      'json-lsp',
      'lua-language-server',
      'omnisharp',
      'pkgbuild-language-server',
      'pyright',
      'rust-analyzer',
      'tailwindcss-language-server',
      'terraform-ls',
      'texlab',
      'tflint',
      'typescript-language-server',
      'unocss-language-server',
      'vim-language-server',
      'yaml-language-server',

      -- Linter
      'ansible-lint',
      'flake8',
      'markdownlint',
      'shellcheck',
      'tfsec',
      'vint',
      'yamllint',

      -- Formatter
      'autopep8',
      'csharpier',
      'fantomas',
      'isort',
      'prettier',
      'shfmt',
      'stylua',
      'taplo',
      'yamlfmt',
      'yapf',

      -- Debugger
      'netcoredbg',
    },
  })
end

return M
